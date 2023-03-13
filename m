Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AEAC7618B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnURxZI1suPSaEDTpxd+ifaQ2eMQxg73RycWrn38PLc=; b=jnqssv4cjjhkbO
	EacHkZ6T9gtnfSACGCUguact3fHhs4Mx13Nk4n+2g7PquYHb43+i45lqM7dhqGL1SlnqQbcSBhwvx
	6Wb56tDc5nW3ay+nIzCu5zn22cXL6DWWjv6dBQH5tZYPn71xsyvGWBp5/j/scQDAt+6TU+LoCqM4o
	CB2OivDY6mKEfgZZGQDJbYwb1P2uhRIW1KdjoGeQdI63tVqtP4pf+jH6Ao6qphCIg3G9znIuqwcy3
	F7DOLwRVr5clA6zs0SgqYdIRDSzYHIp/hkmaTVISzk1ttj5NrVCaCWAz9m4akQIHZfcolo5rNTR0f
	FWrOKlzvHhHU/V4JZ8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpH9-007ko7-G0; Mon, 13 Mar 2023 21:00:11 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpGv-007kgm-ED; Mon, 13 Mar 2023 20:59:58 +0000
Received: by mail-ed1-x531.google.com with SMTP id r15so26820056edq.11;
        Mon, 13 Mar 2023 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnURxZI1suPSaEDTpxd+ifaQ2eMQxg73RycWrn38PLc=;
        b=ROqj4HpX4GZbhTwBtrTm+VNh+b0mGK6CoPCop2a0aq1XCIB3dmizqbQchDDclQYfZd
         PTsEu8FiYXk1vFgRwIUnBIDxgxMAwUtBq/VyiKObIN+Te21n7AmkktWHP+foHUl6xI72
         ZXt7MZYqcnC2fxXGrcvZYNbFwRcFvEURz9NEXYqgr4A9ybLRjlj8vhUYP5fIFgnzquzL
         x5n0nqGuGdyOY9SrbvzjUPNmAMFa+IX9f0NQ3c6tdBQSS7RRJmstIf/mSxTZeQfT5DbJ
         laP/IuaJUTTJiv9He0yiy72ZITg78/81MWk339ShDsfV/LjOl0s+6M1VPBUfPXwEaQMQ
         nEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnURxZI1suPSaEDTpxd+ifaQ2eMQxg73RycWrn38PLc=;
        b=REoy7sTapPq8xympUyuo6kycDEswdTRop+O1gVR/+g7kGfdyTsCAMHw+oK3lV28Wxp
         Avo+1NRZVOlev/FOXisKhjIAcqHA+qGxzEP4ldImBse2txNiJV+2PJPCh/7qPpASP+qc
         DjJNhJ0tKX42uY4ETF4+623CGxgW4ZfkfhESobt+IpbT4EloPhSacCblUEPaCCZcN60c
         2B2Z+2hPM0XPCqLzwJf8tt90RY03/ZntkHsKv5KiNJwK7BPon7unPProJlzcK0ucBBe6
         DbItjiCbuOyzHYugdYtoNcQNdfQlcUDagh6OWBu/bC0KfvD9nt0iC5hXiCbQdtRU3SRU
         OoYA==
X-Gm-Message-State: AO0yUKXG5S/ny3MYPP6diEH/hC8TFANNrn25VAkNiSsgEEw5eu7tXQrW
	Icbhvsye/wnL0Dmwobul/zs=
X-Google-Smtp-Source: AK7set/pTlKtqFd49Y6pzTSIMLlQjQGqARoRT9dpDQvpprkqeDE7e0q00LSgv/KNRfZbi5ibVUeHNg==
X-Received: by 2002:a17:906:b214:b0:922:cb10:ad06 with SMTP id p20-20020a170906b21400b00922cb10ad06mr7733015ejz.43.1678741194795;
        Mon, 13 Mar 2023 13:59:54 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.13.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 13:59:54 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 01/21] pinctrl: ralink: reintroduce ralink,rt2880-pinmux compatible string
Date: Mon, 13 Mar 2023 23:59:01 +0300
Message-Id: <20230313205921.35342-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_135957_544432_9A4D921F 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There have been stable releases with the ralink,rt2880-pinmux compatible
string included. Having it removed breaks the ABI. Reintroduce it.

Fixes: e5981cd46183 ("pinctrl: ralink: add new compatible strings for each pinctrl subdriver")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
 drivers/pinctrl/ralink/pinctrl-mt7621.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt305x.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt3883.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-mt7620.c b/drivers/pinctrl/ralink/pinctrl-mt7620.c
index 4e8d26bb3430..06b86c726839 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7620.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7620.c
@@ -372,6 +372,7 @@ static int mt7620_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id mt7620_pinctrl_match[] = {
 	{ .compatible = "ralink,mt7620-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt7620_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-mt7621.c b/drivers/pinctrl/ralink/pinctrl-mt7621.c
index eddc0ba6d468..fb5824922e78 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7621.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7621.c
@@ -97,6 +97,7 @@ static int mt7621_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id mt7621_pinctrl_match[] = {
 	{ .compatible = "ralink,mt7621-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt7621_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 3e2f1aaaf095..d7a65fcc7755 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -41,6 +41,7 @@ static int rt2880_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt2880_pinctrl_match[] = {
 	{ .compatible = "ralink,rt2880-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt2880_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/ralink/pinctrl-rt305x.c
index bdaee5ce1ee0..f6092c64383e 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt305x.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt305x.c
@@ -118,6 +118,7 @@ static int rt305x_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt305x_pinctrl_match[] = {
 	{ .compatible = "ralink,rt305x-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt305x_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt3883.c b/drivers/pinctrl/ralink/pinctrl-rt3883.c
index 392208662355..5f766d76bafa 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt3883.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt3883.c
@@ -88,6 +88,7 @@ static int rt3883_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt3883_pinctrl_match[] = {
 	{ .compatible = "ralink,rt3883-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt3883_pinctrl_match);
-- 
2.37.2


