Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983CA606BBA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 20:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eudcZnz7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EItI03EO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EndSbXDsC0y1ohJLGeRrBlrjI2WFQTAdaGmEEeAXUf8=; b=eudcZnz7x2Fce1
	ZXR4H2+5wX7AEzJYY9DccS7reu4AZ2M7dLt834nQSJd6VmBwc+5tqq9t4a+qc2cYrhWhGWmrmTz1r
	dvRd4PC+iSvqIiJQs8EUvLbWIhjNrb94eCWawZBTt8gabXmNkcaMoJSRSnlLgzR54KW475ex6Gf80
	rTL1KiTNmhcNpicgQWDBD4mqoMA2MypoRCzaUUWuXSDmpsT/hBDGsD99eKMdSQs0VWM0niUuub1HE
	kMp6Ubpp7kfVivIxL2/PO5Ri1qZS1im0uMtOIJbNqQL2P3SbOfsfmatioOu2BtFIJakY2vWdTNyKA
	d29LiCFtD+pVFwg1T0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU93U-0000000DPds-1KFu;
	Thu, 19 Nov 2026 20:48:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU93Q-0000000DPbH-0jJV;
	Thu, 19 Nov 2026 20:48:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B882609F5;
	Thu, 19 Nov 2026 20:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1988F1F000C0;
	Thu, 19 Nov 2026 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121303;
	bh=EndSbXDsC0y1ohJLGeRrBlrjI2WFQTAdaGmEEeAXUf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EItI03EOLoaZUJBsGnIempT8JfESUSibqtx3QFNiORQYCOtFwBKn3cIOmHem25V2G
	 ioqYDVHI4Spy+O37sYF6fl5immdCW9nggS8BzQzsg7gLbmfTd/UR5zQmWGHAC3iEJW
	 DVGP8ThBAFdQEV0KmT4HrC3bgvh2lVoEzEu+akT1bWF+hsNixqG+28ff/SYbkMtzVV
	 545QugZgLpja1i3aW72iJn/TD5JNZvKZcBK2SskNsu38NEp4fPiawaL36i1aTljOT5
	 RHWwoN3wPOXLxo/oKoJyduO5YY09RWL2wq4TMhsetSEpKU0D+l89E9Kq0netIxGBK/
	 XtNO+3wawbKJQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maoguang Meng <maoguang.meng@mediatek.com>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>,
	Nicolas Boichat <drinkcat@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 4/6] pinctrl: mediatek: Guard against NULL eint in mtk_eint_do_suspend() and mtk_eint_do_resume()
Date: Thu, 19 Nov 2026 20:47:19 +0000
Message-ID: <20261119204748.2558209-5-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119204748.2558209-1-lee@kernel.org>
References: <20261119204748.2558209-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_paris_pinctrl_probe() treats mtk_build_eint() failure as non-fatal,
logging a warning and completing probe with hw->eint left as NULL
whenever EINT initialisation is skipped or fails.  However, the system
sleep callbacks pass pctl->eint unconditionally to
mtk_eint_do_suspend() and mtk_eint_do_resume(), both of which
dereference eint without checking for NULL.

Return 0 early from mtk_eint_do_suspend() and mtk_eint_do_resume() when
eint is NULL.

Fixes: 5c0904488a20 ("pinctrl: mediatek: Add pm_ops to pinctrl-paris")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2:
 - New patch, avoiding a NULL dereference on suspend/resume when EINT
   setup fails (Sashiko)

 drivers/pinctrl/mediatek/mtk-eint.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 827231dc0d24..ca47a416c666 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -427,6 +427,9 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 
 int mtk_eint_do_suspend(struct mtk_eint *eint)
 {
+	if (!eint)
+		return 0;
+
 	mtk_eint_chip_write_mask(eint, eint->wake_mask);
 
 	return 0;
@@ -435,6 +438,9 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
 
 int mtk_eint_do_resume(struct mtk_eint *eint)
 {
+	if (!eint)
+		return 0;
+
 	mtk_eint_chip_write_mask(eint, eint->cur_mask);
 
 	return 0;
-- 
2.56.1.750.gf70dc682cf-goog


