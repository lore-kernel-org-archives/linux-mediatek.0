Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F0DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 12:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VZK/oG0G2NuDkN3Zt9Gzw1YbRQao+w/pvv7GC7syMzY=; b=GBmqFUYPgVcw4y9B6Ju999/JH+
	2g2sPjjgeVC8i8qnvpwerGsFqwe5GZQmD7nLL041WDp/R+pJuQx/He6oAJhvAQvizZXVlt5LlaEot
	chRZ1mxCWzBHzWIKa23D3K3I1RiEbUrrhzRT41Vt5KycRpVcXDtbdARWhjRBlGEnL9nNghIwJ4bm0
	Pshcpy/FNi7qBjP/D+INY6bkHNpdXDS8Sh6y3ENQFJfwDqWk54F+E8rb1637b41ZwXFbCkY2Wz+Cv
	wHh0xVQuubCRGOureVCQQA6nKlFiJUahvRF3Y9MPNvzV/oRKO6+wpILdh7uBO318sTYfPMYEx32WO
	IddcYldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Mfr-00GJG5-QA; Wed, 30 Nov 2022 12:58:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Mfo-00GJEr-MG
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 12:58:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id ud5so41131454ejc.4
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Nov 2022 04:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VZK/oG0G2NuDkN3Zt9Gzw1YbRQao+w/pvv7GC7syMzY=;
        b=cax1DoaooXKpn0DF2NXjX+cZUNFQzeHQsCF3ZlsrPv1mureGxgy8+ADefVUXNM9uIW
         CKdRCuZ1qiDSLkuA/mpqLbMJT48eBQA4KsmIXG17gTWU82KIzEJXH3n38mFc6HfFhK5+
         ril5KOr3MFDTFh3dl6cvFxSrNY3+19bKzJ7HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZK/oG0G2NuDkN3Zt9Gzw1YbRQao+w/pvv7GC7syMzY=;
        b=BngDz8M6T0ULvhpHBc9ur0La1kVaUKPkT2C9VO96uYF63PyqTkAlI3rkyMxCARE00O
         o3b866AVC82P6uLMZOaGZoh2dnhdZ6QrPMuhmjaJ+yLRTI0/0mXto/Fm4/4qHLdchAic
         zTxcr8FTslHn0++gPI9BCqgu8XGYOEMxKh7ZbCwWrfsQCeIwkp9y/yW6XS7K0Js1xrsY
         XnfCF+/t3/919g6oLz9CClFqS9A0/8yxXuG4UsLcgG16Dpv5bAEaD/6N8i2/++cZkgXI
         5mKkG2B3uMCL6xatewbzoiplZt6Q3RibfD0+dyF5vaO9K4d2YT+LS0YLp8SUH1+fnZH5
         C3+g==
X-Gm-Message-State: ANoB5pmVsghYSGwbdNZSGCFfLnhhvCAA45ll6olDuUOdvpT3OC9ITsAt
	yroMLAji5SnOPrrQJRS6qB01W5kIbJmLoz2e
X-Google-Smtp-Source: AA0mqf7o7/gIBBokSQZ3QX/bREXblDhig+YjdUuH56LgZKXBvfJV2rnrsfAhMcMRbMa/ZSeYTImISQ==
X-Received: by 2002:a17:906:dfc1:b0:78d:894d:e123 with SMTP id jt1-20020a170906dfc100b0078d894de123mr1246435ejc.112.1669813126359;
        Wed, 30 Nov 2022 04:58:46 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:29cf:b72a:5a9b:a4aa])
        by smtp.gmail.com with ESMTPSA id j10-20020a50ed0a000000b0046892e493dcsm619872eds.26.2022.11.30.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:58:46 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Nov 2022 13:58:22 +0100
Subject: [PATCH v3] mailbox: mtk-cmdq: Do not request irq until we are ready
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221125-mtk-mailbox-v3-0-c4b635052b65@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Ricardo Ribalda <ribalda@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=JaMGeOMpmAXuv3OKor0whCcN0kyMhzBZsPq/TlDMCd0=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjh1N1HmjWa3ZkM+ohfEpYfD/yTFRjgkqcXvs7TAbz
 iHD9waiJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4dTdQAKCRDRN9E+zzrEiNVbD/
 997bPhkM4Tp0Vm9eaTCHZ8XZDPLNvOrVogWdgK/ByjYWNQ4137QEZwgW+YLN7LCGEm6Z5ByeTACf0+
 3dSNgK+4ftYeEsYPIEzOVSVkfK+bWMz4H/y4/OrzicCKQOJTXsO9r47SmwYHLLM/7YL09pdpuGxAIG
 7Aa2DYVQ8cQy0WctP5qFfZ7W6iGXFdZKRtTSCX2eHGwb6iPjCXAc1l+INxVyF8URkCIHF3zIF3zTL+
 3uyntHRoTPECk+hDVXm+htEE/l40MiVxoR6+/BH2YzMOJK4n0h8nhU4zTwok1Vkt5x8q9SpJsOnZFA
 nn3LauNEQJSHpUwhac+Y04QnL1FZCg6nhGOxLGtleSNrc3wDuLtHI0oMMx82SvGI7gH4FQgaP9yQte
 fvEClF21UVBxwTm0ZwEJG779oWAFitYo1NhkZOL2UN9/PytWLjI+NA8rj0bJVP+FNrvcQuMivvUbAv
 Xo6N5hFPbfCetD0jkRt0UGQ/FylvHNNzURWVIamvdZCuUTZUHcRQmojrT8EFSQKTprna5Q5HVYELKz
 LG/ze+fwSOUyskGXYl4KLaNvEjB7qZ/Q7t2YRAG1GnhHdZIlTEVrsiYL+e9OwA6eUSSvF+gxqAsqBx
 GaoDFXUS7nA3mDn7Joo3MvwEqbtrdjczM91St6Jt3JqhzuRpChFdNKAbrdYA==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_045849_239894_D8F51212 
X-CRM114-Status: GOOD (  15.14  )
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

If the system comes from kexec() the peripheral might trigger an IRQ
befoe we are ready for it. Triggering a crash due to an access to
invalid memory.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
Changes in v3:
- Rebase on top of https://patchwork.kernel.org/project/linux-mediatek/patch/20221102100736.37815-1-angelogioacchino.delregno@collabora.com/
- Link to v2: https://lore.kernel.org/r/20221125-mtk-mailbox-v2-0-886f70c7173c@chromium.org

Changes in v2:
- I have managed to repro a different panic. Moving the irq enabling to the very end of probe.
- Link to v1: https://lore.kernel.org/r/20221125-mtk-mailbox-v1-0-2e3ee120850c@chromium.org
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a460ee26eb11..b18d47ea13a0 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -569,12 +569,6 @@ static int cmdq_probe(struct platform_device *pdev)
 	}
 
 	cmdq->irq_mask = GENMASK(cmdq->pdata->thread_nr - 1, 0);
-	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
-			       "mtk_cmdq", cmdq);
-	if (err < 0) {
-		dev_err(dev, "failed to register ISR (%d)\n", err);
-		return err;
-	}
 
 	dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
 		dev, cmdq->base, cmdq->irq);
@@ -641,6 +635,13 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	cmdq_init(cmdq);
 
+	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
+			       "mtk_cmdq", cmdq);
+	if (err < 0) {
+		dev_err(dev, "failed to register ISR (%d)\n", err);
+		return err;
+	}
+
 	return 0;
 }
 

---
base-commit: 1642107db81361b4339643eb90af4839e2cf229f
change-id: 20221125-mtk-mailbox-ba6cbd1d91b6

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

