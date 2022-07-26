Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D0AC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDEPpnFfFeQNRb6h6qaD2GBuBJjRD788qOFTnSwzmr8=; b=1CTcOPJtSVyXtJdtfjFSlZ6SI0
	HRc7rp6yRZS3WsdigOfCplh3ZliUy4y1O3MeaApJmzR/vr0y1oNi2/vRV/4I94BSaicFfRdanQ9P8
	ZsadkQqfpP1K7fEY8M6XLpKi/j9m4GYoaKy/iU6/7AwOw+C6e0yh2dj69+nD+DhNHX3sHnrx53Hfl
	YRYX13vGIrOJhG5n8WN2xbJEP9S4XPOnTS1BAC0237hrUgw+nNdZj/w3GO7M6LbwSyG8mMwSL+/6E
	RS7EV7xbs1tmnvdPk4faGFajlVxNheTpRWrRWwrQl3V8b7aVBngby5pIbb5z0NaAKYOADQc3wRZfP
	juqLz4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK7C-00H8oq-V8; Tue, 26 Jul 2022 12:56:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK6x-00H8ba-Qs
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 12:56:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id h9so20069717wrm.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:cc;
        bh=CDEPpnFfFeQNRb6h6qaD2GBuBJjRD788qOFTnSwzmr8=;
        b=FlHwpR/BGdgeA1Qo4EPCLGZN9pJSYx3Shj8vGvPfjgcvjNQGVL50PDnnpy/7cfmHHC
         W/dUzWuhGJmzIjpmlXsRbdpsBFivMx4GbzsXMA3Dlo22lTILBBElionRNVHKILNRfgQ1
         0PoOv+/1cKxGPYQe1NG9r4B0V/F+1NOUsGej+RnyQ4JzvvWCZJE1isN/yWhM3paK/yF6
         9Dml/P6kNoPbaTA69UFHrKxZlQqihJelbV1q2/l5KKv6fsI+sLdtmcXZ+F82bF0/drpN
         7tfND2OUcC0bTi5J6lW5oMGiEdlVignPik5jBiFK9wMpEUCy5q69zBavlMiDANCUBGk4
         JRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:cc;
        bh=CDEPpnFfFeQNRb6h6qaD2GBuBJjRD788qOFTnSwzmr8=;
        b=yxYY35TAGatWgaQz7+e43ejhnRUfjEwqyosx7ko9XdDdJvm6DeF/rYsOAZhRy43ypM
         w2ksn+cgZZEPPzfDqgfD+EA2k0g3qH6qDHyJvRnlM8fHwpqgCTkhES2PhTrcQxwEBUvY
         wFqV28sM1R7Ye+2ugTDhty7fTM36u0SzCM9TcMH9Irh+sUzBO0FKR2ScqG1H9gPoFqW7
         UvtM4bC0p8TwkcCKf/DbdHTRaTdLuSaFpuOy/e9YBATM2D5hkNSa1pQL5ahTEx92w+9q
         R761rsJTHpe+Zk+1mThN/FdJXkijTkLvJWjwOdGeU1cet2ugyQHQanoArfKbX7uD+8Hq
         ocpQ==
X-Gm-Message-State: AJIora9OkiT49v7bWGkuJZHMTxt3cJBItf15LquIwcEkXKh+Cnczzn9J
	0m0ZACqWRJoML3onzgHwX04A1g==
X-Google-Smtp-Source: AGRyM1sLSFIrbCMWof8a52ULbmaqJoWBEBO19cwgtC1nBgI86bN7MgA7Xp4VETkGqmgn11gRmyyQaA==
X-Received: by 2002:adf:fd8f:0:b0:21e:bcb4:f731 with SMTP id d15-20020adffd8f000000b0021ebcb4f731mr199816wrr.537.1658840190488;
        Tue, 26 Jul 2022 05:56:30 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:30 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Tue, 26 Jul 2022 14:56:07 +0200
Subject: [PATCH v2 2/7] dt-bindings: mediatek,mt6779-keypad: use
 unevaluatedProperties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v2-2-6d42c357cb76@baylibre.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_055631_928329_01BF1F34 
X-CRM114-Status: UNSURE (   5.72  )
X-CRM114-Notice: Please train this message.
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

writing-bindings.rst states:
> - If schema includes other schema (e.g. /schemas/i2c/i2c-controller.yaml) use
>   "unevaluatedProperties:false". In other cases, usually use
>   "additionalProperties:false".

All 3 properties from matrix-keymap.yaml are valid for the MediaTek keypad:
* keypad,num-rows and keypad,num-cols configure the KP_SEL register
* linux,keymap represents the (at most) 8x8 hardware matrix

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 03ebd2665d07..ca8ae40a73f7 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -56,7 +56,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
b4 0.10.0-dev-78725

