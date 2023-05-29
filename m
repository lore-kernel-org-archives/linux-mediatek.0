Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F1FC77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=telyeAKdwo8lnoUKAmP+74qLgfYo7FAmVRnOD3rnVlA=; b=UnPspiC2B/1kGp6d4FNtB3svnJ
	gj1vp9cdVqhO1705PxFAgOCtq6RT468akHAioPrAITjyTXUabHCbIggSUiNTBBUQg35CfoXelvwos
	ANykXa8RFevHQ6DLmV+AQRwWsha51Zx8gnmf+kpD0SijCUXikCo+EThVcPhHcHOCAjWJ5ZaPBcXF7
	Ht/ZfJF82Yw3imRxC5380xQ9Fmix31ve8F2XWufANGloj/JBFOBA/UrHDHKikz5TXZNXFXmFKsreM
	nbZu2+xlebXvJ7SeIH8WE2/XfF2HEE5Ns4MqpSztnwe1+c8YyTztZWYk5ncK0DV11nPLroKz5yBv6
	rUGXg16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3e2r-00Ao1G-08;
	Mon, 29 May 2023 14:40:25 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3e2p-00Ao0H-0h
	for linux-mediatek@bombadil.infradead.org;
	Mon, 29 May 2023 14:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=telyeAKdwo8lnoUKAmP+74qLgfYo7FAmVRnOD3rnVlA=; b=A4zw+TNr6xO12yorH91InoS8e5
	pOhDS9e+LAlutpdYIGDQJjlMZGn2vfVEtTznXRSYYYGQkoV4IzALeEogii20uKYob2008UCRGjSXG
	De3wVVDySIHN+BXFW/LtX0RlzRp2UuTS0wQ3LdnwcWHwq8HV5LODZ6FS3+oz36lbsWddmWRo2IfTH
	/UMr3KoGYamipLesN3wUxPQb7/kMZ7pZku+Ylxba67mKO2uuMGj1sM4MUUywIJdWhdjLpR5xnR4Xn
	njXXRmsKym8wxC/7NNB6T2SML2LxguxH1sZHDLQObacRiyp2ZzVeC3B2mRi0Curntq4pVglLT6Myk
	sAuNk8kw==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dzN-00BueB-2C
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 14:36:52 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso2253367a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685371008; x=1687963008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=telyeAKdwo8lnoUKAmP+74qLgfYo7FAmVRnOD3rnVlA=;
        b=3QfEh8YT8VlS0OUoEUSTFqi+WztJAYkk4PhkEglwIH04qFEanNcPwOOPmCHJ/1lDt/
         yVqGExXRre1c1nr96wxJP7QnC4JprkZWqeQ/BtThg4TKlroQmiOxv+A+O6yueYTaQWhz
         7sLhSdW9avkV3hB82XpYzgZLK7b8O6gmYyEgU92a/RfFuwlymQgoluWFq2jBEGvGBisj
         kTOHOhRtav6y4SNBrQweLvEkORs3EZBvdATLVMBHuHW+iMoPqDWSR19jxiIPjeK9uNCk
         O4a0rhlExDisIvCEYiVQmeypKwJ1F2bvaABfy3THAitdx3yRpCG7r+rDD+MYgZCbfqIq
         fwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685371008; x=1687963008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=telyeAKdwo8lnoUKAmP+74qLgfYo7FAmVRnOD3rnVlA=;
        b=NRKOseNgIUjnT+rd6WQZcBHlt7KA3wwzc7Vn3CbgA+q9LPcTIrynwocqFv05Xr8w+j
         RF9C+e9XUFwbBbxCf81t/1R0grNoQE1XvhHwh6P+NWwqdJHfv9H81BPzw6ivi0ZsvZcd
         zkjXHgAel54GmO1H442xMElBxa/IEWJ4kzbXqih0Fdm+/jTpCxPhqmSxuE7JDQEx/NyH
         rjPTP49cwytt2mlNM0U/PiBSkc9YUoz9w4RHZ4DYb7/1ny/nwvLrci4NEer/XtO4wOB0
         IpaMFuAuEVi3zYD+82rT+JIkqOJrxCmqVnOSa8lK3UjGREoWBhppcLRxRQ+lNt0uzrm/
         iSSA==
X-Gm-Message-State: AC+VfDxb5li+h8BP3/3AbDphh6Se8266If5Q+Ai1HCefAZ0sw5MPSLSi
	uZVerREvi8IT04FcCjejcFEEzQ==
X-Google-Smtp-Source: ACHHUZ4QgZFbnnhdPEGrQaTJdIUZ1I3VKBbk9dR2dNCddcnlogHxJeDuEb3qF8lU0zYWvc3pVjZAYA==
X-Received: by 2002:a17:907:7f0b:b0:96f:e080:4f56 with SMTP id qf11-20020a1709077f0b00b0096fe0804f56mr10191410ejc.31.1685371008553;
        Mon, 29 May 2023 07:36:48 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id le8-20020a170907170800b0096f803afbe3sm5993654ejc.66.2023.05.29.07.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 07:36:48 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 29 May 2023 16:31:04 +0200
Subject: [PATCH v4 7/8] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v4-7-687f09a06dd9@baylibre.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
In-Reply-To: <20220919-v4-0-687f09a06dd9@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 mac.shen@mediatek.com, stuart.lee@mediatek.com, 
 Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_153649_878414_880855AA 
X-CRM114-Status: UNSURE (   8.50  )
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

Add dt-binding documentation of dpi for MediaTek MT8195 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index d976380801e3..cabe4031729a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -25,6 +25,7 @@ properties:
       - mediatek,mt8186-dpi
       - mediatek,mt8188-dp-intf
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpi
       - mediatek,mt8195-dp-intf
 
   reg:

-- 
2.40.0


