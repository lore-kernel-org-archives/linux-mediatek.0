Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95765C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQqnkWpbbaS2vb+KWbLHEgGJa35COvg0f6M4mKs8LZA=; b=bLbvjDaKZ9GYcZhddk45ATciZ8
	prGq0d+9GS17VIxlKxhtmpZgEf0Fkd1nlleTdpqUXwLdAhkKbk1O2ar2tc4ifIBpoOKV7sRHfzDHh
	aV7Nr7gEHCQRKAkejZmz+Qo38UbjEIp55cTg/30CzsblYXbC4iP53RKPlDkEIIKG5KZ9keDHu3RGE
	iY3AVQpLzOv0FUGR0ydRVRR20EVeeBFuG75PyKQV4+hVoRO86Je+whMSIibwb3LPzs7zssQjB+5b2
	mgxAjMyoVS3Tkt3gIBiZyN1TVnNBkCaZ2d8BYbi+MEr6K7nXsOLjwSlO8hJ3kOfawHBT3inb2PnAH
	C7lZx1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0U-0074vI-8N; Wed, 20 Jul 2022 14:48:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0F-0074h5-B3
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 14:48:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id u5so3417757wrm.4
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:to:cc;
        bh=CQqnkWpbbaS2vb+KWbLHEgGJa35COvg0f6M4mKs8LZA=;
        b=gM4/9BiXFiOOF1pc8rgeisC4TUSBONj/s9Sy2t01T6VAZqA0lBUcN3sRDHFYbZtOI6
         fPmNsPEJ99S3Xd0i+4MxIwLP5upJaJfO9xo8gZuMcpnlDLuIz1SraiwzqYZDA8OcCPB0
         7ZrIqTKhUJwbVIgRP+eHTW+mKi90Rke39pJ+cvi96yAS1ymoDAexRKFyNVLl2qSyWXpg
         hXdJtfEzbiPVk3uYcg+8IGhNTtPgNFv6wotdrb/3sYMTJ3tjSrWC5Ej/UN0o16ah9Pto
         M0IDd6ZuZmpMsLe/MKChPecYegGtL3KV4ugh9UxiL0g3mH1AJ1Gv17vZzYAkKPQ5+obJ
         tNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:to:cc;
        bh=CQqnkWpbbaS2vb+KWbLHEgGJa35COvg0f6M4mKs8LZA=;
        b=Qsf5qYkAzVKgQTHYMId+BJAjz+CJWr8oDIfurrU4WvddhQCHkNonmME+AtI2k0d8kw
         OYHRkL8gVUIuj/uE5O+2EHFjZKLCJvcfDbfoEnqbCNACtJEUP1KfzhRz7CAJXqW4H7+w
         1ordUxRyVrxCXdrEDAHLC6wB1jcqf+BFbdf+h17immcISf8txwk+7cq6LuZUeDo9ebE+
         XH/egIJ473Ggp9xwVJYzjWv0P5EzhBKdAK35NjgwF7bRQ2Yg6gVdywMUkKVVEsVthg10
         dUqZjjBbwGdrEo8Jpz/t98CkG9RpHnB1444oR/3hk9l1VYHWmkhfJXcmv2cBnryI/iTA
         nrBQ==
X-Gm-Message-State: AJIora8E6pYMOqGkl3jS2/JricbRahNZh3kGcYYELeDGxmIQfCRhEsgW
	mnObA5uIYcFirmaH7OgsUdJ/2A==
X-Google-Smtp-Source: AGRyM1vSS3WWayKFuKSqLFjnoDRL0BND5b5er92x5l1u2SV4uA4ZpHgfX/joTCI73kGMN0viOyARJQ==
X-Received: by 2002:adf:e911:0:b0:21e:3a7b:495c with SMTP id f17-20020adfe911000000b0021e3a7b495cmr6677995wrm.388.1658328520469;
        Wed, 20 Jul 2022 07:48:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb19:85e6:1900:c639:22f8:bed9:44dd])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm3321121wmq.7.2022.07.20.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:48:40 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 20 Jul 2022 16:48:38 +0200
Subject: [PATCH v1 2/6] dt-bindings: mediatek,mt6779-keypad: use
 unevaluatedProperties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v1-2-ef9fc29dbff4@baylibre.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0-dev-54fef
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_074843_635077_51EF2C35 
X-CRM114-Status: UNSURE (   5.23  )
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

mt6779-keypad includes matrix-keymap.yaml so replace additionalProperties:false
by unevaluatedProperties:false.

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
b4 0.10.0-dev-54fef

