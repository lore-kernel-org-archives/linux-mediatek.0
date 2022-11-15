Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93287C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 04:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhLFlyx+HwJ1ZM4Lgtghsv3nWTmtK87TqidUEKXNRv0=; b=bvc9cAhAZUrZlvIetGs+J5SZe5
	OVKfOUstfZW3F+KVJNhza+hMVA9OfXOPriqvce/1ZPZmYvP9sFlyLYfL6hKD/cNFAb3TzE5q8AEHO
	uPUN7nJXStpithQT6h3qHw5/t/HDTqrxjH7wPn5j0sDlJycEzUXmSTiogMz+1PgODaeXMTomJjDQu
	OXhdgnf72sKKd7c+nqdYL4AtpJmgGAAHisWDkJZ3Z84nLzXu9Ae88Jt4TvhFHz8pLcWrC8y5+mQXt
	Ew7gyH1DUO+62vRyC8SJf7s+xxcww+EfiKr2gZ3azN/oqmeaq3tNRBmho0oBastxriWCYOBNhy7Of
	IM7D359A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oun7w-007MVV-7m; Tue, 15 Nov 2022 04:00:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5p-006yJq-Te
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id f5so32933710ejc.5
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhLFlyx+HwJ1ZM4Lgtghsv3nWTmtK87TqidUEKXNRv0=;
        b=mwiE5YmA64m7c9RqpS46cGxcmWS3abT7KJjEHko54IFdBQzl2rDTmvWMNjmpZYQPMx
         +e7PSOkqjf3gsQ/OYibbL7V3OHS3HVIdBXxkZxY12kpV2gyMHIsU5YYAwQwWbth/EBmo
         k9/V5mOgogsH5yeo2SizHPHCID58H5PD+jTQ1sopX2I3iCupyDUUsU04QKb4LDLj9pDJ
         atK77+jCvg/GeeLNFHAb/5GLnr9wTVBd539NB61eMhOHArYpGYeNE/Wuz4MhKv06gimQ
         xXo1M8la1v4Xynsd4snlm5cHjKQZFmSIdBRJz8bDkaCL+8bnBhWGKvK1qBYIEJXHweji
         V5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhLFlyx+HwJ1ZM4Lgtghsv3nWTmtK87TqidUEKXNRv0=;
        b=j61ucDTW2KCJb2CiQQ0sDv9Yjmxoy4Oj+mDt7ChNlZ1EHRmeNBhEjYNo4pFpFWLF9s
         adpeAVMow5kWR289M6rZQsHBVlb3fbCBJUudQj+ni1VrVRWcRY6aznma61Iu7TYuMQwr
         1x55O0r8E6DY2sBPyZ5TYSytiAdy6Pv5URVdlqnvTnwgA7/xJFw8pniV5S2wEtlM7w5s
         xSbKAyYHBIJqg98AWIlLENZN6TTK+dUPp/RqeewknHaG4Vl3sVhKTFXLH92hiHzRI6M1
         0rqTUpGWfCWihO7mVr32MNxbyQOI74pnBudVnpi29h/HGFTwMwBINHPTIQIQHS/ulnGb
         s8hw==
X-Gm-Message-State: ANoB5plMLvXBu76M6kb9tVw2D9sldpvl649wOehxi1eG/hFtqMc7udsB
	6k945tfGvtqDkly1+/cryec9F0phaaeSCcPQ
X-Google-Smtp-Source: AA0mqf5JivAi2ZF9ol363qK+7ytfa4atR05s5ByGG1JukcRFiWfAhIL4BTILOtnHOK4xhIOEg7JA5Q==
X-Received: by 2002:a17:906:814:b0:78e:ebd:bf96 with SMTP id e20-20020a170906081400b0078e0ebdbf96mr12315635ejd.625.1668480871620;
        Mon, 14 Nov 2022 18:54:31 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:31 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 03/15] dt-bindings: iio: adc: mediatek: add MT8365 SoC bindings
Date: Tue, 15 Nov 2022 03:54:09 +0100
Message-Id: <20221115025421.59847-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185433_958124_4B017CA6 
X-CRM114-Status: UNSURE (   8.23  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding for the ADC present in MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index 7f79a06e76f59..ed582c6e7ea9c 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt8188-auxadc
               - mediatek,mt8195-auxadc
               - mediatek,mt8516-auxadc
+              - mediatek,mt8365-auxadc
           - const: mediatek,mt8173-auxadc
 
   reg:
-- 
2.38.1


