Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72B8C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mlHKVT/vuP/iWwPCRN81lk23vSH/Qkc5OkBWL/O57bg=; b=f9xb/wqbvRgRH5
	TGRkl7S/cNxKyAW2YKaFbE7gQB98DqzbM5aCdLVCP0s7Ih83/soJHAZr9zC1zCwSBJnABVAtVrwc8
	k0ewg3VDUDF/EcsQIwSUP/iv3MDOtf9wvHDs+uFF3ZQpw/XuCdLXsge+W5c6Kk2b4lpvh8Chx6N5M
	uDiqpc4ojTVP2+nAaEY//MkEpN4ymYP6ZmKbC5p5MT2DCLoU6ovt6dsRvyRT+VJM15tozefy94j1w
	NY86TeFsELsr90PoUYTbYGFTUUv1TX0FqkmEYiBmFOHkXoNAJFqHuJXZw/mZvd2GF/rABaLglKyF3
	oUiAMXKzxQ5xvQLe3GWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx6dx-007TCJ-6f; Fri, 03 Jun 2022 12:43:09 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx6dl-007TAS-Au; Fri, 03 Jun 2022 12:42:58 +0000
Received: by mail-pg1-x52d.google.com with SMTP id e66so7117794pgc.8;
        Fri, 03 Jun 2022 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCaeN99qbe80XdllZmNt/NTUfNqd3MU7NsYrWBRHqB8=;
        b=buW7IdY3iqfdV6Y6qR7TYjHvNuMvA/L04H0R8YSMDhiClFymdVYWGX8PmytWGvqRxh
         FOhWxuHje/Jlz6IoOzONeQaXPpN2OLDgyHokkR6JrZC94wWxXvaVQTIHnbw0oOX3bOBJ
         o82+3Iy/EtwXNT2MraVUNLfAyO3D/+DFTDiO1kq0lD1Lkylufvdn/Ze2kfaoynZmHJwI
         8Th8yW3GWOeE3s/f0D+uH7C5WB6Kdhq76q/f8XTbJc3w4jj3aTtKy4oc+5TLENSp4Ocv
         GtuMF1vcGj13EZEPNCpl5iJ7uysZn6ExNB9pXJqf1qwmyYAvAsZjxu5eQqlSu0KAnvRl
         7Bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCaeN99qbe80XdllZmNt/NTUfNqd3MU7NsYrWBRHqB8=;
        b=D5Bs3N47JUrTiGCFV6EgT2H1ZfxzPF1/MutfSq8gqp4GMkoB5hvDSVQ/aCv1o9y3q+
         W/9tJBa0hKsnoANLEKZdNr7HbJDVFnxzH7sw0jRvxATNlBYBLmLipFVprSa2sZsp0/9c
         fmSxN4NWc7naCF4OsJWHkSBOW6FIQCcFNpzBsQU9+tY0aXYXLB4DduCpk7TNP9NjOphA
         ND0Z0ZsU5D9CeZ2dnm/DaGT9FryKnLU8wKvmaj3MbQJvDSOescreEaYJ/AvAMcqdzEwq
         lmlfxLM2CR7aMwrmDu+cmFUIMPdqCqz3YpygZfZYpHeKReIQKN2Hu8BmyqC2UCGYrk38
         H0Rw==
X-Gm-Message-State: AOAM531k1kovNV4o96cnLk0hU3WsxcdsKUWCAluPrqZdeGnUv+smW2XN
	iTiVm6JYm35Hu0cMswNNBoc=
X-Google-Smtp-Source: ABdhPJxtjqcZQQnfkaDUcq0d4BxEe41StW6Nl7kFFyr+bh4ai1NO4S9DbH8MfP9DcPew/6oFyFwHRw==
X-Received: by 2002:aa7:8008:0:b0:51a:cae3:7563 with SMTP id j8-20020aa78008000000b0051acae37563mr33507197pfi.16.1654260175367;
        Fri, 03 Jun 2022 05:42:55 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id v22-20020a17090ad59600b001e281acb2f1sm5079719pju.57.2022.06.03.05.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:42:54 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tzung-Bi Shih <tzungbi@google.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	PC Liao <pc.liao@mediatek.com>,
	Nicolas Boichat <drinkcat@chromium.org>,
	Koro Chen <koro.chen@mediatek.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
Date: Fri,  3 Jun 2022 16:42:41 +0400
Message-Id: <20220603124243.31358-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_054257_433368_1A0949F0 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Fix refcount leak in some error paths.

Fixes: 0f83f9296d5c ("ASoC: mediatek: Add machine driver for ALC5650 codec")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
- update fixes tag.
v1 Link: https://lore.kernel.org/r/20220603081308.1332-1-linmq006@gmail.com
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index d1c94acb4516..e05f2b0231fe 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -280,7 +280,8 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 	if (!mt8173_rt5650_dais[DAI_LINK_CODEC_I2S].codecs[0].of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	mt8173_rt5650_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node =
 		mt8173_rt5650_dais[DAI_LINK_CODEC_I2S].codecs[0].of_node;
@@ -293,7 +294,7 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"%s codec_capture_dai name fail %d\n",
 				__func__, ret);
-			return ret;
+			goto put_platform_node;
 		}
 		mt8173_rt5650_dais[DAI_LINK_CODEC_I2S].codecs[1].dai_name =
 			codec_capture_dai;
@@ -315,12 +316,14 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 	if (!mt8173_rt5650_dais[DAI_LINK_HDMI_I2S].codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
+put_platform_node:
 	of_node_put(platform_node);
 	return ret;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
