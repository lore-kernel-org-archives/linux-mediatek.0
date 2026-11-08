Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E0606A320
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JUldy2IN;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Bef4cjIF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kVpUQkMwZfIP9qRjz990+OsHZvfaXMOvnj2vL1S7urw=; b=JUldy2IND6nICG
	rVu91UL8JfkttwbKEQXJIRC3ljR7Qk2I5gpGZU39etMXhb32L1oqKKRWEK9VvuR38Iwd3OwzIaWXZ
	2yCc38+EpS+gonWWSBp+1UhPn96xuDObkdu2QR202Mo0k7IdqMeBKvK7Yv+rRZb8Nc2CysJX7TWyW
	Plo0APM809Z1PmwwZ/ajY6UFKzMxRC5uMe+FqMnYTgr8NYmk2fQJdQBLHsYPksGFdOKOojUDXKtkj
	tIV1gLOuhlWoiJNYL2d14yej8tgs1WywPMWPpdJX6KDwYA/q8VWWfqzKLMjkFL5ig4vxO51tXx6Mq
	n/1zJeDTC3xUweTOaK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOe-0000000FvBf-1K3c;
	Sun, 08 Nov 2026 09:41:08 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOa-0000000Fv7H-2YU3
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 09:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kV
	pUQkMwZfIP9qRjz990+OsHZvfaXMOvnj2vL1S7urw=; b=Bef4cjIFKf5eOJNVmS
	Pno0ImnXznFHAnnLInN7wt5rcJB3+174hujwd1dRlQWU0WHn5bayrqHV+VPPzuTz
	EvMVLXK9vT97RbEewB/yBO0sKinEXJ/VicxWsEshYZpjJhNggWzhoRgypulJWWFS
	NzSq1GyJpS2jyhvuadYDxiz5Y=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXz8OTQ_BquUg4GA--.62891S5;
	Sun, 08 Nov 2026 17:40:40 +0800 (CST)
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
Subject: [PATCH v2 3/5] PCI: tegra264: Use pcie_get_link_speed()
Date: Sun,  8 Nov 2026 17:40:32 +0800
Message-ID: <20261108094034.679945-4-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108094034.679945-1-18255117159@163.com>
References: <20261108094034.679945-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXz8OTQ_BquUg4GA--.62891S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4UCF4ftF1xtF1kuw1kAFb_yoW8Gr4kpF
	W3J3yIyF48XrW5uFW7Wa15Z3WYvFn8AFWUJ3sIg3s7ZF9rJrWDWa4YyrWftFWakwsFvr15
	JF1YqF1Fka1avrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zKFAl9UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xnNcWrwQ5nwPAAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_014105_049890_C0BF4833 
X-CRM114-Status: UNSURE (   8.89  )
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

Tegra264 was added after pcie_get_link_speed() was introduced and still
indexes pcie_link_speed[] directly.  Convert it to the helper so it does
not depend on the array being exported and cannot go out of bounds on
invalid speed values.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-tegra264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-tegra264.c b/drivers/pci/controller/pcie-tegra264.c
index c97576ab4a31..711b66287681 100644
--- a/drivers/pci/controller/pcie-tegra264.c
+++ b/drivers/pci/controller/pcie-tegra264.c
@@ -126,7 +126,7 @@ static void tegra264_pcie_icc_set(struct tegra264_pcie *pcie)
 		width = FIELD_GET(PCI_EXP_LNKCAP_MLW, value);
 	}
 
-	value = Mbps_to_icc(width * PCIE_SPEED2MBS_ENC(pcie_link_speed[speed]));
+	value = Mbps_to_icc(width * PCIE_SPEED2MBS_ENC(pcie_get_link_speed(speed)));
 
 	/*
 	 * We don't want to error out here because a boot-critical device
@@ -266,8 +266,8 @@ static bool tegra264_pcie_link_up(struct tegra264_pcie *pcie,
 
 	if (value & PCI_EXP_LNKSTA_DLLLA) {
 		if (speed)
-			*speed = pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS,
-							   value)];
+			*speed = pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKSTA_CLS,
+							       value));
 
 		return true;
 	}
-- 
2.43.0


