Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1E1C07548
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBe2GE1Ns23L7ppqjpsb3sSwKzt7kudkfa/lIN5/uv0=; b=cETxnXt8rCj21mO234F80O61vT
	0SlJMjsaeLnQE1LKZWOPtY/9t4k/Sw9wx4YaCdTpZv8AiMmBPiFJm9cekVKc/F3j2jQoFIbi4Z/87
	hIiNr6QPU8Cm7LS7Mbrn0XBU8MTYfLjNMppWvmt8rFeyp8qUYyYDzdQzQTWGRShce7Hph5YZDmDws
	EigB3dzR5Ao/zS2El7R97JzK9dpTbTNorZJoTjEy2OHuNk9gMgbXSnQih3OshYvxNdsnpewOK9R50
	lyh2nlGQ1iuEXHlDb0V4/ZxfF7kvJCEXN4iEt8xn6G8/h0LXk0ZZw3EZrEf01wHWI9heLlZSzvVMF
	TjqWLoSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ben-000GZe-0Z;
	Wed, 15 Nov 2023 08:53:57 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Bek-000GXW-2p
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 08:53:56 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c1acc1fa98so504698a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 00:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700038432; x=1700643232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBe2GE1Ns23L7ppqjpsb3sSwKzt7kudkfa/lIN5/uv0=;
        b=Tut06isGW4uNZIiRYUgI7gD0CnQLTqtYR/4spqV5E0vqTeJwM13iGmGsRlpLoeSNuA
         jM290jr7mYVHPRkRZpFznj1mstLIlVNNrybVprVTq/1DhH0oy76XGAnAX8Sz8s5M7VmU
         c2HeaPTI1yTn96CldLT8j/9ot6ncgOUeWgOsEZNM9p6qGpZOORx8KSQd6UKjnUqrzOBW
         sH1hATglTP5+dwUq4q4IZn9BZtv/Vj7S7Oc7tUFet2s1h6oM7+As3IXl+uqIF1mlk43O
         P/YlLj+/YE+nkO8xb+0leWR/e1tnHQOyZzBI9UMRSyo9fMqY3rB1zFz4BlLGAmeDGRQI
         fl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700038432; x=1700643232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBe2GE1Ns23L7ppqjpsb3sSwKzt7kudkfa/lIN5/uv0=;
        b=ije14fY3HZpdlsQrqLAPY3nug00G0dYPEklo78+LQT706x9fJRQaIAVLGsNjDHqcBl
         y8oGALr1HHo56uzrcAEYoR1qwp0JLxNvtStpLP9WljggSNYMOqKe/OR51z1M27y2jPgn
         AAhsoMTnSgBpKrBrWefP7Ai4TaXPMlveOaNFLMFkbvXYrRl2C5bAavMwAQmdMelmqSJM
         MjuxopfdrSX3wGqMGczLXcjbeVXDyG3sLKQZAroVufO9BR9q0ErjfSNLLVQVjL1dYQ60
         Sa3q8eN3dwuO06rBLlXZ4uPN/MDL6sdSvXj56GBpgb99sx/FcWqPWtXOF9XI5LLjKG3s
         LtJA==
X-Gm-Message-State: AOJu0YyWTg1OkMtwJxjH+EEEem1qJlRnc3mHaKXJwFloNunobf6t9En1
	iWk3Jq1xcQ4cWefiR0xB1WSv2Q==
X-Google-Smtp-Source: AGHT+IH2HaVEcL0jbCmHvh0JmE3Uk04Bm9RqXrPbOfAcFecUs7h2lI2q05PCPcLk4qTNItHrZGfgwg==
X-Received: by 2002:a17:90a:6081:b0:280:a4a1:5d03 with SMTP id z1-20020a17090a608100b00280a4a15d03mr7360432pji.4.1700038431937;
        Wed, 15 Nov 2023 00:53:51 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id z2-20020a17090ad78200b002794fe14cabsm8331449pju.12.2023.11.15.00.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 00:53:51 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v4 3/3] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
Date: Wed, 15 Nov 2023 16:53:29 +0800
Message-Id: <20231115085329.541764-4-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com>
References: <20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_005354_913490_A9D1D876 
X-CRM114-Status: GOOD (  11.61  )
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

Enable support for dual MAX98390 amplifiers on the mt8188-rt5682s board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index e994faa3556b..917640939621 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1549,7 +1549,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 
 static struct mt8188_card_data mt8188_rt5682s_card = {
 	.name = "mt8188_rt5682s",
-	.quirk = RT5682S_HS_PRESENT,
+	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
 };
 
 static struct mt8188_card_data mt8188_es8326_card = {
-- 
2.25.1


