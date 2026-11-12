Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D98606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 02:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R9YsBno2;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IcvOhHkq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kVpUQkMwZfIP9qRjz990+OsHZvfaXMOvnj2vL1S7urw=; b=R9YsBno21JqVWN
	4mFpq7UynNZik5nCwDm++1XZIlgIXog4ITfAozq1seiQQRUmUR5jn8/wNQd/tHV3U32w7UWGCBW+r
	mIAnd+xSZ5IcI2ND1LUnW/y/dlLYG4bQmc/N9yU8O1EPbu0Pz39VRFMgXLcKfJKMO2+4acLyg0XZN
	oOnf682+iT0TIiLRz0YFdjDeefJsWAuVjNTcxC+nXF/MGVHWsZ2CzsnR3lVWhzHvwtmXynxo0lM5x
	vPT/F3ZXmINPatC2iwQO3vZ9ZGC0ByIbBQIwbu3Z9YFfvdF6LKLUOrcKC7a3DUisHQdMowM9bSH1j
	5FEdeiPHBT/Ndwg3ALQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUI-00000008VTg-3YZt;
	Thu, 12 Nov 2026 02:24:30 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUG-00000008VRX-0hzm
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 02:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kV
	pUQkMwZfIP9qRjz990+OsHZvfaXMOvnj2vL1S7urw=; b=IcvOhHkqrN6BsABjtt
	AiAtewhOKiwYtdsc4HfeG9WBfT5gNdX1MlGDmXpc67mnZkaNmzZKmgSFzqCZf1hx
	zT+xm4SW5I+OG4BTn8tNAtcdtdqeKa4Tabi57Sr0vZNQ/Ie2bphq/ipVbIp0sl7s
	laQlfKs6c84CNEEpl+6StvDuM=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXj+5GI_VqPgXEGg--.53291S5;
	Thu, 12 Nov 2026 10:24:12 +0800 (CST)
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
Subject: [PATCH v3 3/5] PCI: tegra264: Use pcie_get_link_speed()
Date: Thu, 12 Nov 2026 10:24:03 +0800
Message-ID: <20261112022405.1230200-4-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112022405.1230200-1-18255117159@163.com>
References: <20261112022405.1230200-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXj+5GI_VqPgXEGg--.53291S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4UCF4ftF1xtF1kuw1kAFb_yoW8Gr4kpF
	W3J3yIyF48XrW5uFW7Wa15Z3WYvFn8AFWUJ3sIg3s7ZF9rJrWDWa4YyrWftFWakwsFvr15
	JF1YqF1Fka1avrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zKFAl9UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wzzl2r1I0wf-gAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_182428_540583_DF825429 
X-CRM114-Status: UNSURE (   8.90  )
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


