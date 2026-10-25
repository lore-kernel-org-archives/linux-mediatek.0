Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5945E606A338
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Oct 2026 05:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TqiBk6Nx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HvY48u6p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=; b=TqiBk6NxQVkkic
	T0iLncGv5clRaU9NAhZY/g0pBlCsStFZAZSGhEyJt7m6Ka+7XnOVf9VMvjGGo56h9NP4BaJl/FrE1
	ufpKRkSmE2P2L8cggjqu7wegdnAIwNA602voba7eK5Y2S8jE9vm20xGcdm8lHj5Frmd+2LM5xUk4Y
	mV9TcuyC7Bi5sLDyA1Fy1mLZkOwzN+kMZcfAm6s9Z8utyqgrMnAIyp9j7gfO3x8xSKbvGhfCunmWC
	ioIbv3Q0ylUhYx/WduYpxR/ckPpyD/KyuQJPdIQKq0pbdRKONJLeo8OJVXdHylwJCmVBvOOh8u3uJ
	fS2Dut8cc/SyFiqN4V/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqch-00000000keF-0CNj;
	Sun, 25 Oct 2026 05:18:23 +0000
Received: from mail-yx2-x09.google.com ([2607:f8b0:4864:41::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqca-00000000kaL-1w7Y
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Oct 2026 05:18:18 +0000
Received: by mail-yx2-x09.google.com with SMTP id 956f58d0204a3-679b4ca950fso1216121d50.1
        for <linux-mediatek@lists.infradead.org>; Sat, 24 Oct 2026 22:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905495; x=1793510295; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
        b=HvY48u6pT2SFum+8LAuRNXwQs8txG7nhEyRQd3miitj8B1gAV2xmGzXts5PyV2TG6W
         To3L1/U5P/WnskRNKuTfMD2+3ta75e2OBmssCftQ8dj/0chBq4BetngbdTK3XyacE/qX
         Sa3nEjVyjFwlFyjuaEaG+CFEnUPwrw5edrc3HaxfGxabNHqrkybfyG2FKoj5insD0yP+
         bDMlyAeQdJvlypy/GbyFajzvbJko3XL64SR297FbMvWF7lDU/95npNgbAp1boBXvoHR/
         bt1J9zlpHa5u5Ory8YZp6EFNmeKq9U+iHcl1Wu37+hwZksGOtdNBM56Rz89r9f+Jawgh
         7f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905495; x=1793510295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ao0LzEZOUNstisYoUSRpO7xtRQdZ2FfSYO9nengEgWU=;
        b=0Qtrn5lBTVOw4xwx53Bx60D7LL8urYFwIsSeb3Fu8Q+jaTAe2VO6zj/ksmazYlOwAr
         Q0mt70qFBlwI2gFRoJXRRbzNU+NZQ9W8uAJq65vwV4Y2gmHxu7IDtV+IE0pypvd6ShAM
         AmKfqjVTy8LtyqxRCecU22ARHtHC3ffZaYw15ElT41U19MTjoK6OtErPupGv/GGwM9Os
         4eGYass+rBtAwrp9Cwxn2oWo4FFJziShD1ENNH3TRnwLg738zJgAQd2dpF2IjYo+6NMF
         2K61r7lcE9i2OIFdEaUkQnyjpehXeqcglVIkMcO+3hrAsiK7T0Z5qF+76VCBRoYcBSGv
         qjzw==
X-Forwarded-Encrypted: i=1; AKwUvByXI+lw2LsIf47ITKqW5z+RbCrgwR/CwQOiHCbJRdU2I2rJnBrjATSpYrx0EBE1Kf3wXY7jD+phlfNNjSF5KA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIhUYhquIox8dvrgi88Jf4Az8tKDUTwVmMXFkoFr05SqopJaEIF
	ClRjKOKyCoaHyEsv6CoPFi26kCt5RNF3BzUls5yiBuEslRut5lgClCbv
X-Gm-Gg: AYBFou0gl33A+Vlu9wL/EXJeu7BOwAafV9FshMkIbmd2KOSwrAMsFb+Pjsc2ceJDFIj
	sK95Em4yz2EwcbEzBVP+9K//nVLwsV0KwXW8t3W3Ndl+7sj27P/EIdNrCAcOOwN2MBpEoewW/bh
	FGMO4hRZKT2pnM3Bh5pjKhd34XvnDkNtwIE+nZJGb0uMIlI1Zms7ygL/2W3r7/maPJ6gtHBxx0j
	u7mhs/QBSHES959P/tyBYl0+yej+e9JiEIk+zBqxCXt2BS/N7lC2LXKUSc2Z1oapH3GDZQ37jF5
	Hmd2LNdQFBmiUuhb74cIMuh61UFhLiPpsmVIFC8DRLAo+YVPJZTT/Eh7jrj3tIXUK6tstz6ePH1
	m3zvOPrH1/zhoFX1NLCp8iInbN0+mfE7GUzJbZS7N6ZBm8LFcncqKuegi9GvMZ8AVh8ukrQR0Ni
	YYxpNPd4mEo6Y/j3sKhpP7Ypl18JkgOtJQ0nk9Rej5yEGZWesd51ghFXSxm7LGl95WCCdGqSHTI
	SJDprCnE62aO4ZlpQPbIvk427UxiMdKPrnXJZOzUtOcFQ==
X-Received: by 2002:a05:690c:c4f9:b0:8a0:e27e:8e75 with SMTP id 00721157ae682-8b166c6f987mr22449797b3.82.1792905495289;
        Sat, 24 Oct 2026 22:18:15 -0700 (PDT)
Received: from [192.168.1.91] ([2600:1702:894b:4a00::12])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d605sm16477797b3.5.2026.10.24.22.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:18:14 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 25 Oct 2026 00:18:08 -0500
Subject: [PATCH v5 1/2] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-1-5c3c7a5a1851@gmail.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
In-Reply-To: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792905489; l=2798;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=JdiGQh0KVm70DbIkS0pQKFBLtV68drIsj5z75XBPwxA=;
 b=YQht8FlXebiSXOai3WM/zuvpDL9fEatxuBpgvv5MqOVMjp8xIC+PbWFLP4Kp0ZyoptsaARv3W
 OS3S7UU/Wv5DKYeQ8hVE8LNFldXHmNwewYh+zNK82rW2cP6MJ9/KpZd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_221816_545208_86AAE2B4 
X-CRM114-Status: GOOD (  13.59  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
and battery temperature measurements. It is not register compatible with
mt6359: a conversion is requested by writing a channel number to a select
field and pulsing an edge triggered start bit rather than by setting the
channel's bit in a request register, and the results live elsewhere.
It therefore gets its own compatible rather than a fallback.

Add the binding and the header naming the channels a consumer puts in
io-channels. The battery channel is named for the input it measures,
ISENSE, which is what mt6323-auxadc calls the same input.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
 MAINTAINERS                                                      | 6 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index c2f7387e4bfc..2847bd5d5bc4 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6359-auxadc
           - mediatek,mt6363-auxadc
           - mediatek,mt6373-auxadc
+          - mediatek,mt6397-auxadc
       - items:
           - enum:
               - mediatek,mt6365-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index 02426f316faa..b5417c02eb01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16780,6 +16780,12 @@ M:	Roman Vivchar <rva333@protonmail.com>
 S:	Maintained
 F:	drivers/nvmem/mt6323-efuse.c
 
+MEDIATEK MT6397 PMIC AUXADC DRIVER
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
new file mode 100644
index 000000000000..b696c1cb5ebe
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6397_AUXADC_H
+
+#define MT6397_AUXADC_ISENSE		0
+#define MT6397_AUXADC_BAT_TEMP		1
+
+#endif

-- 
2.55.0


