Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15081C04FF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlEeWD9RdnsW9I9f2pYuDWO+bMLMc/qQZCTcLBo8+zE=; b=lxp387K+UiQDjr0suN4gfvQnWo
	Uu5efVlHLgTKMg3kmwLFk20g7ZbO75hpMINt2gE4yu490gk6lwsLVoi+3Ap5s6DDEa+MCZE9NFByK
	//k4uknu3b7wKZX1afTeByUEMSC5pkfPNIgS4fW0AvBa4BLjRJWuDLFJoQN3Lp/LUDz4zTGz7LNAJ
	/sA654f8Esnf3XRwJp6sIKTP3GLM8OSrKlY4BhkI4dsODi3I72iaIO/zOtVy4MGmy+WWs6Q3mNjmv
	UIdAE+PaZA8z33JEdnBvaXc8KmX4xeDo6JOPKLC+xN/rJ1+UDEydNPdJtI2gMuH081j39m71bNtUG
	dbV7IPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl8h-0000000CrN9-0vf3;
	Tue, 16 Apr 2024 15:54:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7m-0000000CqhC-2P1c
	for linux-mediatek@bombadil.infradead.org;
	Tue, 16 Apr 2024 15:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SlEeWD9RdnsW9I9f2pYuDWO+bMLMc/qQZCTcLBo8+zE=; b=FLbC1h+TVQbzIWOad5E2TxJhrm
	TByBM1+AjCLN3SozccMI8X7Xd6OpWDquL3ImfY2HLcRCkRb86Q+Ut6Ot5EJxGJSMOSR3VEqqXU5Ou
	BlXrlFHCOVaU4VHLRHxMsGbgjocFfhdcr6ysMoVhZb/Wv3KejuDS44ZmEI1txEjbEPsBH0E6ea9u6
	C7wlJX9yD3v+UmdQsTYLnzZOFwrKNfx9erkgrm511AFWNpxHImCfFY4uBgjlyP6DRjM38KldYJ3xF
	TAzJdjJfjQm01JKAK7y3yPmSchXdIsO20yz/QXiD+hoheKjhdxKWpiryqHdEWda/2H2vQ1IyV6keh
	8Qf77mnQ==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7i-0000000B8ZZ-3nbi
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:33 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso584532466b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282809; x=1713887609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlEeWD9RdnsW9I9f2pYuDWO+bMLMc/qQZCTcLBo8+zE=;
        b=Hz4CwV9jrOHSJv7vt07d8jJ/GxwwGnYAC50EiHm5qg8egT43RzMPWKoZ202I1sEvzJ
         NbIFCDebTtq/s3zs6pUu6jZWG2PrN9jcEOqugx/frkneq0DlQkDbVj3YGK3Y7UKpL0wv
         jHhfBbWQTfclNC0WpiuaPp5z5+CvMSMiCjoFv4KFTo+vrUihJMybIlIcXQk5NTlow5bP
         KdvDE6Vhf8gTyC0ezZh9ltVrzhV9K10rppNID0H5Zs4TnTKADBuQ7vAhygQccXFhKVCa
         5MeRkk9PCVAbXn+2zSovofW+Qo0Asq0/WnIiS5Cwm/9vGOtGjiBlr2ywT/7SRVhgc3xM
         yL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282809; x=1713887609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlEeWD9RdnsW9I9f2pYuDWO+bMLMc/qQZCTcLBo8+zE=;
        b=ceUR3n4s5shse0y3mnHScG9fJn2jTsEXnUm+4w8UngaudJjlvPiPizhrIgVv5m/tqC
         IVHF+IsCcgnip3mXbwWCMWGKp/y5yHU9MkMCTm5fUD8W+jKfOSmVNtumeZFtQta7HxMb
         5ylLRXw8KscBQhmnSxtYIouSgzGv7EnjVsbvYwxJf9h/r9eN8K9t//TPP8qUeTn0r9v6
         c9YaHqIvEW+CzGzvok0jXtNL3XUZw6gzEjGYjpyFxF5upaPY8dp0cIIiXTxA9JAa4/2z
         FuISsZ/wr74eQYCV2DdgtECmfpZcqOmpsg8y1F8Hvk4CL2YkPvTXzUL359sNdyVhQMQW
         iEvA==
X-Forwarded-Encrypted: i=1; AJvYcCUpWEArieCDtEIsFK9Ow50IOCV/GNO28IGGo1fwxGV+JlI4b+rTqW6gKDTNsUBdDUaShWm3XTN1D9RjiSYcMnCjcrUnXopQZD5J319krMpDmt5v
X-Gm-Message-State: AOJu0Yy0Rx/q4/tCw0jBZxKq1XZs7lTagqHE0iTQl6tDN0D6SXHtzSD8
	CqJrwe3qulykmrUzoWBuz+LXrjeYtPTwEMAUyBV4Wuk45JvIz2hOfsMPIYTChas=
X-Google-Smtp-Source: AGHT+IGMWP9H9D4wzeHmwqDmsjpmBqo8fF0N4Tb8Pg/HmubZGeYeU7yYfzmd9JEPX/7zZD0PHDYCpQ==
X-Received: by 2002:a17:907:7295:b0:a46:bfe2:521f with SMTP id dt21-20020a170907729500b00a46bfe2521fmr11781457ejc.24.1713282809191;
        Tue, 16 Apr 2024 08:53:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:28 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:08 +0200
Subject: [PATCH v2 07/18] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-7-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=851; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YWP6Shg60EA2OeIESWvWTK3n/fUHPgAwJXUBa6PIbUc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qJwFj8bEMicWa1Bd+Yv6HZMqP10hORk70wmm9
 Ht3VxpOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURcT2EA
 CQ9k4lzES7KrQb47lreloJoMbPkvR8BDltlnR9VGr1Y3rPz/eF0yVklAOkRZkQgmivBuogIC2/FMW3
 3Mqpb2eIx+lAQ10nRe+izPrsgV1mRX2WnDQa2lRtyzHLhBLPg45ZHYCDvB8qAoFfKbc8ynT/rnsZAV
 9wGHe8w/DqyrVOfNu1M9wmJ5h46WJbQme2Ou+kGRWQZsDi+IbixOTgy7LzkMzkrf4eSrPjH2uyn1gt
 4H3ioqP4qOoXM+As4EGwF4x53sUiArvvyEW2D4M283Ozf+n3x7q4H/Bei+yc+Ip//Xja5v8l+2uFXy
 r9LTcfa4vMDDM7xAYZkKKTf3vy4HvrJbJKnD7T4itpL0ZD865d2dJM+ZvOaEXGke0eeQFYGLMccBpP
 n7NWDxz88lZZEjYrx/0nGR+fQmfjFRlknZJ2eFFwfIKvUtiBf0yKsNAL7/5k5yQx0KxtB8saq829hK
 mQUjGL4ZKGe/dGV7OMR1QRcFKKRMHBya93+5TrmW+D49qOGVGvzmiPysmJiOxXhySbyUsQsBDdrPme
 xdG/CnNLMBc5VEpKF/wVF9/dZgrURBCwWJCRySXAAptdcd52ED6yYKjjNlsF8zpdi5veP+b22s2owS
 hLBf9RV7LIM56p4qEDNzzg7TXLX/CEHbXzR9GdetcCOZ9n8wi/QYDGrF8BMg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_165331_348117_4CABFF16 
X-CRM114-Status: UNSURE (   8.36  )
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

Add dt-binding documentation of dpi for MediaTek MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index e126486e8eac..ebb61bc4eab7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8188-dp-intf
           - mediatek,mt8192-dpi
           - mediatek,mt8195-dp-intf
+          - mediatek,mt8365-dpi
       - items:
           - enum:
               - mediatek,mt6795-dpi

-- 
2.25.1


