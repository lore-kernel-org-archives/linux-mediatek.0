Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8F3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkrh5PmCKY97yVWMrE2rxg0O6ScEmnhgtHgZ694XhHo=; b=HM/jAxP+mBHLur
	y31txQqlP+XJxGBavcTCRFqICNPCn+TCg+geMGMvBtSLQ22SBk8lrP5r0wwAB0R4jAzXie3ZbNvIZ
	3XtmlXSDAmRPUurc+p91x+S4ceHHaZaYze8g+LFdexbkyOE2XMzBhWUXpO4sWauwL0IfZK/jFSRUH
	08aq/xv5Kzeoc7fQeAzg8bv62tFfmXTEqM/LdiL3ORD/LtrT0eYH25LBFLEfglnjl/RXp1XN1Bq3a
	xjd23+zbjVM/o5uzDUwK5wjJSrVna2/XPCX2PkJ07VDPFDynHpkdHJKX7xIXZfN+2RNmKV1YvFQGU
	EZcuxKI8uHCcEvkGNGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu3C-00DUJw-Dc; Wed, 22 Feb 2023 18:41:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2I-00DTk5-ME; Wed, 22 Feb 2023 18:40:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id l1so8476506wry.10;
        Wed, 22 Feb 2023 10:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkrh5PmCKY97yVWMrE2rxg0O6ScEmnhgtHgZ694XhHo=;
        b=pl//qR2xGMfXRxwoPgmQOuAtveiqYg+PzSqwy/kO2G9BIgMD8EbSE1BIA+jaSQGadd
         tHou+DQnlJnpXsUgKZsJ/suRzx4U2wmWUVNopvLbYafjMidYDP8T4Mqw6bjiL8vbh2ua
         nsHtXy38P6lQJtcYJRq01Zcn6iWcNEexz1QF7dq68XKbvCy+tXN3tSZ3vS7tlfOOtQdw
         o8Aq5tCQxPLAT5q85jBocgKiIEPd6ZoRlSjIwRY3OzA/nrHY7djDYOUrsPCn9h6rK6FC
         kDnT/mNC7yOJRNOuc8Ym2L+V5JVAqN2vTc8+uVydneNgyhjM2/9PhP9z15qo195q5/ry
         TXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkrh5PmCKY97yVWMrE2rxg0O6ScEmnhgtHgZ694XhHo=;
        b=45Oow/RwU9xl8Y9X/DeD8IxeJsgaULBxvdZYrG2dxWLIJ/HvlJWyZ+8wmH5vC2/i2m
         TZHPJsj/grJZU4PpgkhEm7Q9gIig67kMlb59zxvyzkVN9/sahn71m4JfEMRATRmu68ac
         uRTRo6+UfXa8jVDhuH2pGZBZzIj3EjpUzBkcR8RJxr2/siYbCyu983Kz+P4wBGK2oicZ
         ILuQoTFjDemS6UryXm6h9A7b29ce+yifvwGhT4L1VQeHKByDeFlIIHcL6IIt6LZz3Okw
         VfvhQdm9JBscMvCu+Cm9LO90IAXT1TGWn9639DSqKww/Z4gp/8jic0N7nxOmdMdWA7mV
         kBYA==
X-Gm-Message-State: AO0yUKU85iw8j1+4Zm1m9DJWU1sb+jGMnnHBFKZT9VbGMx96YAIPKCnp
	uRw0IqW1LBWpnVj7/pTgXvo=
X-Google-Smtp-Source: AK7set/++D2xBRox8aFcmSpjULrFCbdHcRtHW2lgb8/1HHdLRWC8O09ROG+CaPS9xdSF25M9R4+yvA==
X-Received: by 2002:a05:6000:1284:b0:2c3:f026:9085 with SMTP id f4-20020a056000128400b002c3f0269085mr8394442wrx.13.1677091210888;
        Wed, 22 Feb 2023 10:40:10 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:10 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 03/16] pinctrl: ralink: rt305x: add compatible string for every SoC
Date: Wed, 22 Feb 2023 21:39:19 +0300
Message-Id: <20230222183932.33267-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104014_769275_8C9C4DF7 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add a compatible string for every SoC, or SoCs that use the same pinmux
data. This ensures that the pin muxing information of every SoC, or a set
of SoCs that use the same pinmux data can be properly documented.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/pinctrl/ralink/pinctrl-rt305x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/ralink/pinctrl-rt305x.c
index ca62997e716c..a112a83085ea 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt305x.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt305x.c
@@ -118,6 +118,8 @@ static int rt305x_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt305x_pinctrl_match[] = {
 	{ .compatible = "mediatek,rt305x-pinctrl" },
+	{ .compatible = "mediatek,rt3352-pinctrl" },
+	{ .compatible = "mediatek,rt5350-pinctrl" },
 	{ .compatible = "ralink,rt305x-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
-- 
2.37.2


