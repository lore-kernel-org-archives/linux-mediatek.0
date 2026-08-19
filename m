Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A503C5DF86
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXqFLwJuyV+JjqMhVzWBsHgdtBjtcPrrFop7DOTcoKs=; b=DbmonaumyFrbOTFKQpk2dwf3JY
	1KC25eAHXLFWm7rph8sBX/gbyT8b6RG5jm8zmON2A1EYbeqkq01bbQNomYp7OeM4mgqkE7KyJDfFY
	MYkFEgJbhdDbxg+zFhSRHZ6cXrJbz5uTfw9Eov3s3UuYmczcqMMAWPEI1et7Ekng0aUAS2k8RlUOw
	pPhj+GW+x6UDB44iH1LNk+dAzjML6mcwoo6m1ObA6EemI38Ck4HWm6OjVe0eZTpB8J+zY9CdCBp5A
	Cr33wMLUuFremb/Yh52c5WTZsnA/Sud7/1+p9jYZjpslYChiBjy4u0B/V+oaqH4N0/YiIL2kNb6FU
	5zEiDQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO6-00000009VoN-3sYb;
	Wed, 19 Aug 2026 10:19:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO0-00000009VkD-0wwv
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:09 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso631974a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134747; x=1787739547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXqFLwJuyV+JjqMhVzWBsHgdtBjtcPrrFop7DOTcoKs=;
        b=XAY3caflU+l/QCU16f9On3BOyUEICNlzZOZnmGjG9kPR6jEbnePvVe9Vs6tRCFDQK3
         cDoG86tYqeC5rmRApUODbA0uhH5WlwNGzENau9EgBaSBSvrlfDDFW+yFxJT1eE1qpB77
         rHTj4lUrwTPEtfQH9CNnDBpwyHn8nERu8dfZBxgXX+wmqPgF7W3vAd1lL3w7blLIbRx6
         bkJC9Tv2+jEM9Q81V1mYhwHnyOwNVa8O5aJ0QUV4T3LO4wqt6niALrHLUX2RyyijUfmm
         w+QlXJYt8PJgW54VwVlQlB3Brb6fi7OnqdQJbcZUTcudbRhmWUwRXAQme2z6eKEbNL6f
         B7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134747; x=1787739547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IXqFLwJuyV+JjqMhVzWBsHgdtBjtcPrrFop7DOTcoKs=;
        b=lpYLesUi1CL2cJJX/Uxj1arjuumUthVp2kKbbascaBCamew0+adY+WwMP1AznXFaLh
         g5Hvdm9tUh+1NWZ4nRY19VPPK5fMW/Qw7cKLaMRofQKvfYiOfrSQMBmcQ3DdMbrqmzpp
         tJIWJjdwTcPQ5MF/30g98kuRWugcl6i4ryj5g+hYo5HsN0lomgGV98lBoUWh3ngLc06p
         uxe+RJjmMnQQSJ/Lz+UwV3F06Y728HRCrt9VY8FDXVfXQIqaJeF4ZK4TDAh3ZF2cevDU
         vYKoR9RgC1e6NJSvg9I/z9PT1uKLdpK/oDDTVdOy9PRvU9itC34eGrdLy4V6fwi09avO
         eDbg==
X-Forwarded-Encrypted: i=1; AHgh+RqK/iCtoltG62IFS3gCINg/3WpyelUPSL44Zme1j5Bm7bQvnJAfIfcM/myowGdAjq9C2vZpJvffTa3yT8PqKw==@lists.infradead.org
X-Gm-Message-State: AFuF++mzLoRKIZadVvn0GRMrC6GIbQ0gxBObnd3tJup8rIdaJpbuCuCC
	ZOxtloazWauP1pOIoao34QS+xf0xZMpVHTgRZspJCnfbkGUxF7wNW/qO
X-Gm-Gg: AR+sD10w63bUVTnzSIKV5W33kbBNgqC+coTi8gAyNjAA5ZRWXvtjWuAnjHGnbUxsFpy
	CHTkEADRZRsWi9j4TVoi1vsyAy2IaudJ6a2gwrdlg7TZTFSqf14R8/5QEZeJETWxHipnHBDU1rq
	zM6ldghJGat2ufUREZw8awskqjScvY8JLe0FrtKjOyCOKh0UgKPh+1FFxAn81ylzMq+cdpWGwfU
	eZhAZAHTfEGAroPRDszZCBIHvqyI35J3k9wPHbVcu+CownIb0e17C62yGGNy1hNUJFFzt6qHLul
	ET1mEF4s3Gogr4bRBvax6zu6n4JYjaTKiSITF8+yRkATrzLDQZZy+gE1VGtMiCSsduS6Mk4ITC1
	dXyp30s8B8uykZLBa3+sX/dWDCi8U2UcP7T4o8U39by2YHIH71CWzUAVpCDZiposT/g8DCpkOSk
	wAOBjVTRwWC0hsZP072GcVky/SwEmw9vmrIqC8G5l7daTvRw8Xn8zzhbEabenYK9sOd/di3jl70
	Os+4zIhHo5WkI2Wogi71ugBb5j4iucFrCy8gX9ELv0aDsbpX6KMLXNy4MLgk1b9KyzXXin0171G
	n1+f
X-Received: by 2002:a17:90a:f94f:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39580840397mr7076830a91.2.1787134747355;
        Wed, 19 Aug 2026 03:19:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Wed, 19 Aug 2026 17:18:47 +0700
Message-ID: <20260819101849.68010-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101849.68010-1-phucduc.bui@gmail.com>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031908_547776_5AAE82E2 
X-CRM114-Status: GOOD (  11.55  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8183_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8183_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8183_apll*_enable() fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..260c27016cc0 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -382,7 +382,12 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret) {
+		dev_err(afe->dev, "%s apll1_mux_setting fail %d\n",
+			__func__, ret);
+		goto ERR_APLL1_MUX_SETTING;
+	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -411,6 +416,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+ERR_APLL1_MUX_SETTING:
 	return ret;
 }
 
@@ -436,7 +443,12 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret) {
+		dev_err(afe->dev, "%s apll2_mux_setting fail %d\n",
+			__func__, ret);
+		goto ERR_APLL2_MUX_SETTING;
+	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -465,6 +477,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+ERR_APLL2_MUX_SETTING:
 	return ret;
 }
 
-- 
2.43.0


