Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5AA606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 02:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MxvQb1X6;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aEY7Yzpg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B75XeCji0Hq4KB2ucqYdo8KpN0Fb8I/YrmcRagsu6Ms=; b=MxvQb1X6Ip7tXB
	9D0h+JtIgeCMg6KqsFI/cYpyM6hrMrkV41lqtljt+63ii/dScERyY/MoDxUljOxFzrbsXMsFGQ1Vb
	rc3wp+nB3tG2mU8DbkXospJlfMGzTR5q6Xgs+6D0qFWKTO7wx+AWDom+kkvwVaUbtLz1GTPk4/5KW
	kKCEgWPHKcQqILrl0WDPI0/trd3F/+h4ho0jSSk6pFLgkJ2kmDMJMLcSvIZzeNTOXgLE5hl6g2E0B
	Vpkp+dZ6g985OfF9H6ODg2EREO/Q0t+9+NoylDS5PBFQ7m/yNgysWUUZCvAeLKS6FRn2/VHdpREh5
	BaUG0xiajzPjZjUM2LHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUL-00000008VVF-0bLV;
	Thu, 12 Nov 2026 02:24:33 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUG-00000008VRr-0rI3
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 02:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=B7
	5XeCji0Hq4KB2ucqYdo8KpN0Fb8I/YrmcRagsu6Ms=; b=aEY7YzpgLMktlL9Ka/
	rDcyD/NJMczXVnAL4o54+U1RCtEVcRQ+kEyos8gax9Kpcukr5MZh96R5XLZXo+lh
	lGicryKbtxanOAfe7sbYcm5lrPuvXu05XSTfr1TAOOIlWBrsZxlt/AYtuKUdv87L
	MaW5Zk2bkCFfrvobKQWKLNFu0=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXj+5GI_VqPgXEGg--.53291S6;
	Thu, 12 Nov 2026 10:24:13 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	thierry.reding@kernel.org,
	ryder.lee@mediatek.com,
	jonathanh@nvidia.com
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v3 4/5] PCI: mediatek: Use pcie_get_link_speed()
Date: Thu, 12 Nov 2026 10:24:04 +0800
Message-ID: <20261112022405.1230200-5-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112022405.1230200-1-18255117159@163.com>
References: <20261112022405.1230200-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXj+5GI_VqPgXEGg--.53291S6
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWxGF4kKF17urW3uw43GFg_yoWfKFbE9w
	nrtF4UJr4UGryfGw1YyFyFvr9ava4fWr10vayFqF1aya48u3s5Zr9agFWqqF9rGr4xXFy2
	yr90kF4xCFyUCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRihL05UUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6w3zl2r1I00gPAAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_182428_638362_2E5DBB31 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MediaTek was added after pcie_get_link_speed() was introduced and still
indexes pcie_link_speed[] directly.  Convert it to the helper so it does
not depend on the array being exported and cannot go out of bounds on
invalid speed values.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 3a3e91cd0c21..ffde365c987f 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -888,7 +888,7 @@ static int mtk_pcie_retrain(struct device *dev, struct pci_host_bridge *host)
 		speed = lnksta & PCI_EXP_LNKSTA_CLS;
 
 		pci_info(rp, "link retrained, speed %s\n",
-			 pci_speed_string(pcie_link_speed[speed]));
+			 pci_speed_string(pcie_get_link_speed(speed)));
 
 	}
 
-- 
2.43.0


