Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652A7C83F17
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bFb9hgKzTMP601cCw3goVXhMY7NWgY0C8KJIgbPa3E0=; b=aOAIWAJ40McirPWqi1rMVjyOn5
	yZGyDtHGgZnfBX9YtFXOLp2dHb9rGrBid954Th2lD8eKRft0cPO0TeoyC69MFWgp7EpOGLVC5nTce
	De2FZlI0536NNSqDCiuOlVwJD+JNbj3+1meglLEeci8A5fOA6QTBcM/Qiiah6X5LoJEgA6vapNw88
	Jnc6GyFhgP7ra0jd9S9ekgIwtPDrtamiY0xr5GoVQSGZ1c/rXi9IwcnmPbMamgjsefolI5lWfvyxX
	XmC+WCigItTblf7L1F8pO9vklHZKIk6CY97ZNEyEe6jHAJR5qNZbCBOnoABl6scFJxZIHFY9TAmT0
	hR3Y1mKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmRY-0000000CrMJ-1W79;
	Fri, 18 Jul 2025 14:52:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclIP-0000000CiBB-3ohY;
	Fri, 18 Jul 2025 13:38:43 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752845920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bFb9hgKzTMP601cCw3goVXhMY7NWgY0C8KJIgbPa3E0=;
	b=PgW/SjyEIHljhqgsyaqAg20rXZB3bu5FCgMDMYc/5+Dhol1HbKAmEWbJC49TmF12Dhmez3
	J2QNTIVOqMWt9j0sjDLxjT/DIHeuf/46fCR4BoO9mNmEoWqzd2zhzz6s/3AaXLblJ+VlJO
	EFNvLbXoqYrJivq7wFCKDCNcSBr5JdtwSSqMcgDanQeD/wb86zIvwiTJGmi7XPd1fpYPTj
	RaZBhFeVxdCSLp+sgEdr9C2Iq/ePpRv5X8MEZg1hLTv9a1IJQ1H9r9eTeD6xwvUSB/Nj2s
	80c6JvRpP/q9v/uYV98uy2gMddEeG0zVd7IG7NOq53B/rTpELa8jAIZLneXbvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752845920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bFb9hgKzTMP601cCw3goVXhMY7NWgY0C8KJIgbPa3E0=;
	b=1V6YYmrGrpjidrZWbbohdQbIxZk7qe2w6+tTBuOuB+/FIshO6L9SHJV9TZbfF1Boc9fWN/
	siNJv7ve9UJQYnBQ==
Date: Fri, 18 Jul 2025 15:38:29 +0200
Subject: [PATCH] media: platform: mtk-mdp3: don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250718-restricted-pointers-mtk-mdp3-v1-1-c7ddaa0612ea@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAFROemgC/x3MSwqEMAwA0KtI1gZaP1jmKoOL0kYNYi1JGQbEu
 1tcvs27QEmYFD7NBUI/Vj5ThW0bCJtPKyHHauhMN5rJOhTSIhwKRcwnp0KieJQdj5h7nIIbvTe
 DsS5ALbLQwv+3/873/QAfkq38bgAAAA==
X-Change-ID: 20250718-restricted-pointers-mtk-mdp3-7c85aa04018c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752845919; l=2403;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9210zyTPxXhk1SZc/Ce11Ssu8IbxLLufUcb2Hm7DMQk=;
 b=e9H2sK0SBL5qA1YNFt8iM1tqKdDRhaPu0etUU6rVdENmEVlojk7ZR+ekDb4uWuTWQM8M0CHSI
 s6LLqFlZ/C0DC7kflJZrqwklQ3M18JzQlPMefePkzRdpHWji2u6/bED
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_063842_089893_EAEAEA93 
X-CRM114-Status: GOOD (  11.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8de2c8e4d333a8f92684f1590a3dd0d13bdadcc6..6559d72d5d4278071bcec0c5c9be398d1639ba5c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -282,7 +282,7 @@ static int mdp_probe(struct platform_device *pdev)
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-	dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
+	dev_dbg(&pdev->dev, "MDP rproc_handle: %p", mdp->rproc_handle);
 
 	mutex_init(&mdp->vpu_lock);
 	mutex_init(&mdp->m2m_lock);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index da3a892ad867eedb4898509da8790981475e9a62..fae3e1ad2df758a50bd175479dbaf7a9eb859222 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -221,7 +221,7 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 	}
 
 	dev_dbg(&mdp->pdev->dev,
-		"VPU param:%pK pa:%pad sz:%zx, work:%pK pa:%pad sz:%zx, config:%pK pa:%pad sz:%zx",
+		"VPU param:%p pa:%pad sz:%zx, work:%p pa:%pad sz:%zx, config:%p pa:%pad sz:%zx",
 		vpu->param, &vpu->param_addr, vpu->param_size,
 		vpu->work, &vpu->work_addr, vpu->work_size,
 		vpu->config, &vpu->config_addr, vpu->config_size);

---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250718-restricted-pointers-mtk-mdp3-7c85aa04018c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


