Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FBCC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 01:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DluvA8nTnzf/xofArynYdkv9W1c4RsYObyGmy30CGd0=; b=lgvFW5SWeeY+hqnzm0jRWJ+Wdh
	gfocScTXgTU3DT3r0PL4JLobjc2+8urboS7XrmWGGELrQVTCMyW/vX7QE2hu5DZ9MlL1KPGrPavsU
	91NB7SoJrpW/x05rA4xzYNRfnbyIvNBgHYfNKqKJTpLhE0Q2eMHRCCmzIgCQEaAkHEQkIXrdfwD0o
	p4if4EFKV2pv9dANbO1wsVlqs12/EM6RW7JR7GBcugB2iEf5LgSEj94hLTIE4tXms6l+EuwOGojcD
	Cp4HoWIZA9jvajtoPFMsBt/K3RsYIxyKx+HOGFQeTxoOtsx8s23JohOFI9pZ7N6iXVaRGyaVSinj8
	b0u76jmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHmC-001nTF-P7; Tue, 22 Nov 2022 01:08:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHlx-001nJz-FV
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 01:08:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id n21so32312278ejb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 17:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DluvA8nTnzf/xofArynYdkv9W1c4RsYObyGmy30CGd0=;
        b=odpFpCw5aHWfS+pOQs4yWZQ5jGoFsNm1SxAmKBOYgGnF80lSJTac93dQPGzxjY4eF2
         FA59KdnuY3aY71rJ7sPgucxZ1iCCrlI2CdQCHQdS/9UJ6GF/AvGZEB0yiV1nLDGeLXld
         64SZO5Ps0gOHJoWh0aaSfPsEgrRc9Kq37lCKPhtdxWwiXGUGpXAeJCdsZlXFMMCX5/BU
         py0VbF67K6EiiaYw1UgKZgPfhjUOkvh2KoKj3Ai/YYuBwH7vuUMPinf4jOPdAwNDbfwg
         VAPQ8tk9dba7xiAiEAywXPbB1eGVCc0gQKnfYqMhEU1/QE8LdRiZdI5boTvdZnSw3INe
         Nk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DluvA8nTnzf/xofArynYdkv9W1c4RsYObyGmy30CGd0=;
        b=kGg3D+rJJhh6kmVyEkS1lrlGkrjggvNfsWoS/8Hi2DQyaT48ziUYTb9u8uQOdQq/db
         XbZWEVeTjb/K8t0VOTpoPm3BzozsVgTUeYfGIrwiTk6zBQ/KDkEng+T5JQOvbPS6kps1
         nL5sRLdFrv6bOKuCTFXFTfDutqjTIqkX4CY0haRpRZVdWbWRHAZsDP99Mr1WeuwQ+YdI
         sYEN/7HlCZ4YkZf27ucDRkfmEpX9iRterY+hP3Fzc5QlBUmBVKKQpdfYDYTPXPsdjqNK
         lI/Iau+3OV/N7OPclF2Zxv4p3CujUe6NjFbF/91SVU30ozRWmsCJaTPTQBbtFmnE0IcR
         i5Nw==
X-Gm-Message-State: ANoB5pmFfg9ycDn5vWDvVjYDuTar9TAdmxy7xY4f1t7rRRZmqviDYdSV
	60/WWAmWpOTrZh+ET9gNjln6Aw==
X-Google-Smtp-Source: AA0mqf68LT1nby+adF0ovbjDlH26Pq2EQGd6MYppzkQjHPVpfeEgxIrxpdLea9WAWiFKcu3RwSWFWg==
X-Received: by 2002:a17:906:a291:b0:782:9b27:94aa with SMTP id i17-20020a170906a29100b007829b2794aamr16869217ejz.542.1669079291383;
        Mon, 21 Nov 2022 17:08:11 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 17:08:11 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v2 4/7] dt-bindings: pinctrl: st,stm32: Deprecate pins-are-numbered
Date: Tue, 22 Nov 2022 02:07:50 +0100
Message-Id: <20221122010753.3126828-5-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_170825_598460_E598E73F 
X-CRM114-Status: UNSURE (   8.35  )
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

Deprecate the pins-are-numbered property

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml      | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 9d59208d83c18..eeb29b4ad4d1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -34,7 +34,9 @@ properties:
     const: 1
 
   ranges: true
-  pins-are-numbered: true
+  pins-are-numbered:
+    $ref: /schemas/types.yaml#/definitions/flag
+    deprecated: true
   hwlocks: true
 
   interrupts:
@@ -206,7 +208,6 @@ required:
   - '#address-cells'
   - '#size-cells'
   - ranges
-  - pins-are-numbered
 
 additionalProperties: false
 
@@ -220,7 +221,6 @@ examples:
               #size-cells = <1>;
               compatible = "st,stm32f429-pinctrl";
               ranges = <0 0x40020000 0x3000>;
-              pins-are-numbered;
 
               gpioa: gpio@0 {
                       gpio-controller;
@@ -238,7 +238,6 @@ examples:
               #size-cells = <1>;
               compatible = "st,stm32f429-pinctrl";
               ranges = <0 0x50020000 0x3000>;
-              pins-are-numbered;
 
               gpiob: gpio@1000 {
                       gpio-controller;
-- 
2.38.1


