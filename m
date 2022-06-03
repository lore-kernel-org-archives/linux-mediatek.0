Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1qMX+1UxjCIN76ZbVAGmvS4sayHMFqfVi0rmEza0Uok=; b=JGzyglGcgHp95l
	64ve5BUe/WQUwJ3yzNREJSDshPPPcbN/txeQ91REvyOh8lFmVuQx5HGhjp/IFy2SkVkUaalf6NpC3
	rN0S+dGaFpBrCZ0ZSQo9/fA+e7hHtr4dd3viG85+M6bPlVCIKh6Zg7UNbgr2HochWAOOQjDkC7TmN
	mMuaC6aTU7kHJGSNptxg+o9wx1HUMcuV8iGFTaeEt1z26CcQe/bHgWlW4JDzET3VpVNzqMxJ60IPT
	RA6FJFqoSaG86EjG0iwqajhVXHACPUvvLl2kkCXsMesmsthHIzyH2RAebZyAaF2NK6VqAorkkw0To
	aaC+rW8uoOuYpULN+Rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2R3-006bMf-Sx; Fri, 03 Jun 2022 08:13:33 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2Qs-006bJL-7J; Fri, 03 Jun 2022 08:13:23 +0000
Received: by mail-pf1-x436.google.com with SMTP id 187so6668040pfu.9;
        Fri, 03 Jun 2022 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jJndwsNGJ35YpfT/6ZKzsPH00jUacPeRpJYnOHA8axY=;
        b=bCedhaJN+3BeY6a2bO0Sz6Cv+ieP/MqSu7rAmZaMfRV0u23z583tS5kcCsjcjlAbyg
         jW/S0/2riIakoh/gVc3nfWbOy9RS2cS56xFtDgTF4S4IFLoC7XIxBK1qQtDCYr1tFE1r
         Zq9SR8HzQfqaEYKZ1J+maSu0J0YxsMpOeNWqf1j4UxNGvi/NV7CFcxpstn4XHvB1odjN
         Tr3b5SNo1uQ3GhnHixh80GE2mNPrvXzs9MwTKVOLWLKtJ8NPvmQrJQPbHj8nNgVokgaL
         pJbrDWYC5kFIGL1jyWU59WagyhGwEHlOVgEVYQIChRG5/PwDfovy4efBiSR/iLBCmE9o
         X85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jJndwsNGJ35YpfT/6ZKzsPH00jUacPeRpJYnOHA8axY=;
        b=Ob4bAgagRqwfCTLM/ISoI6fRPN6Z8QrXk5SPCbJv6TzwbCm3NzE2pKWLA9nB8U7doR
         jWGWmsjv4/J7rNNnWWQNwEtE8Cm7ShpUJ+cR+XfyJSXFMYtEhxz+qFJQmygXW8kmqEjq
         8GBO/Bc1ZMv2lY5PMQPQdVmqSXHX00mE0IrjqZMM7pbQJcolu7TWbtoTjpY7te1u9zhJ
         2IcQI9L2JyP+R1XnNvaHEroWUtJWCTLnVGkglbbsVXI9T8hNbQcPN5vwtk2SDgYACqdA
         k6kmAUgt9mXgL50kz3qlQB2N3LjEXKLKyFpBHi9gkc7NRGv+M5S1N12M6awCAs6V5YQZ
         pjtQ==
X-Gm-Message-State: AOAM530npkCqnkOFDrXX0jcO1pmvIeVmZAbNsxrcqk/hRuS79pjPLPeN
	5dHsugLXrwwIRdRW2XcEweHOK9hanvCucddJbCs=
X-Google-Smtp-Source: ABdhPJzLhSSgE1fP7Y2/aGP4aExAqPKXsnEkw1E0WB57GnC/qOzY/ZO6hIqB9pDe+P7Zrd5CDEqevw==
X-Received: by 2002:a62:1744:0:b0:51b:ab76:e8c4 with SMTP id 65-20020a621744000000b0051bab76e8c4mr9339294pfx.42.1654243999461;
        Fri, 03 Jun 2022 01:13:19 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id g6-20020a170902c38600b00163de9e9342sm4829424plg.17.2022.06.03.01.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:13:18 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tzung-Bi Shih <tzungbi@google.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
Date: Fri,  3 Jun 2022 12:13:06 +0400
Message-Id: <20220603081308.1332-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_011322_322245_06FD8D38 
X-CRM114-Status: GOOD (  12.67  )
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

Fixes: format:0f83f9296d5c ("ASoC: mediatek: Add machine driver for ALC5650 codec")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
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
