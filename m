Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC8DC43219
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxlrZWPFCrFQp2sHfL4Kx3y4fi4AGKGpCjaVKusjlG8=; b=W7Fut0wFfPemv7BbKdoGnpfxfj
	ir7IIENQTzRQDDxdFAKxcRLAgJZGMXCWQYJNumG95yQEmSGhgSbN42MDih0spOjfnAkySYhqBCY/L
	1tfxElhjm+lEPz9NPykno08lQ++aiC2JILtE8EmcR9uwQ0pessN1n0p7ydKo9YuDesRnLivtp1Poy
	SaQVjYd7Iz5aTlvAcjALVeXiNaEXyMVzzqIvh3Rq415v3BfjPc/FW+SBIeeRZ9VtledwP77E6Niou
	Q18IrxQZkdpPtDEenIGxeACySiRU+1CKSqu7NUJomp0wCjHpVzI5bUMptQ+9B7V1S9puzO0LIwKNK
	m293CyqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyauc-0000Wx-7A; Fri, 25 Nov 2022 15:46:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZlq-00H4o4-BY
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 14:33:39 +0000
Received: by mail-lf1-x132.google.com with SMTP id bp15so7126767lfb.13
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 06:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxlrZWPFCrFQp2sHfL4Kx3y4fi4AGKGpCjaVKusjlG8=;
        b=u7zDvcN/YwdQwwUSi++0dMjhKMK7C+JAG4gCC3LTftZyocaB4/tBX8OuIK8pEBmMWK
         +R+vLtA2DjkxmMHwu8qJ/iUP1dopSN2EHgs/NmFaa35vOendIogkE2GvTl2BSWVdWqNT
         4EwTNrA9FiRrg8kwLJpy6/c1eDtbjMecDgvlFtscL14SHQ0AeTImj6LN2DVdQYavSahG
         4NdQT9Fk2DDiySd1HHQ7aURbfutRqz/kmTI0Y3DphBVE1TflCqj6e/zpON8vroqRoCjE
         b+8s7C6LNM66Y3GwfaqF2S9H7JU02n8BgHgXkFIztErUy7oxtcGcf4AWcJHzo5UJEJCM
         hPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxlrZWPFCrFQp2sHfL4Kx3y4fi4AGKGpCjaVKusjlG8=;
        b=oQfRtzEDULbOK0g1yq1V3a8Al3HjxFxXSClAA8ASs6NPbnHX4JdIQyUZOZNqBdleVJ
         zLnpph3xT2vd136WqvaF0c5q0CWswc4ovcnN/XqUsGyW+KSevS++08AIWLJTuOe03zXI
         t39wSzqNYiJQfnug0ysO1pIUH6L09gteCtmRLySZJGmu7N6rmQcda2IfTQvQXHPTXSrF
         2GSv1eZXZuC/eCUuiBymqbT4Bbz8bj2WS+1Lp1QcahrpOHvYEU9usp96GJcV+X8JfBpn
         pZ+RSWGp07kl/sBx2X5W98K1M230HKOVk6c2IXuosLIX4XLp+qYwz2clql/FQ1c0Q+Hc
         uwpA==
X-Gm-Message-State: ANoB5pnPbGuKyezzfjhyD4MWCSGTYexBeMEc4QfOM/mJBkyYabsR45Ec
	DC7tJnVxa8TYVv/pabrIcpAu3Q==
X-Google-Smtp-Source: AA0mqf4CLFbynW8Xkv7G/S3W3bwEKgJFc7U0ncZcpC6avjkTBUEFmbGof8INlOched8bha1V/SKsXQ==
X-Received: by 2002:a05:6512:2989:b0:4b1:753b:e677 with SMTP id du9-20020a056512298900b004b1753be677mr12245606lfb.407.1669386815560;
        Fri, 25 Nov 2022 06:33:35 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b002798ab42fffsm312966ljn.129.2022.11.25.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 06:33:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Nikita Travkin <nikitos.tr@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrew Davis <afd@ti.com>,
	Gene Chen <gene_chen@richtek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	- NeilBrown <neilb@suse.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] dt-bindings: leds: lp55xx: allow label
Date: Fri, 25 Nov 2022 15:33:29 +0100
Message-Id: <20221125143331.473981-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125143331.473981-1-krzysztof.kozlowski@linaro.org>
References: <20221125143331.473981-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_063338_493679_07A0BE80 
X-CRM114-Status: UNSURE (   9.81  )
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

The Linux driver and at least one upstream board use 'label' property:

  qcom/msm8996-xiaomi-gemini.dtb: lp5562@30: 'label' does not match any of the regexes: '^led@[0-8]$', '^multi-led@[0-8]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index 7ec676e53851..dfaa957eee74 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -48,6 +48,8 @@ properties:
     description: |
       GPIO attached to the chip's enable pin
 
+  label: true
+
   pwr-sel:
     $ref: /schemas/types.yaml#/definitions/uint8
     description: |
-- 
2.34.1


