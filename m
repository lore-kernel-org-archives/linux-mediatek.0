Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3982C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4rd2qMk0FSrQt9Tp0ZdFh0cgNgJW8TRDOygBl1e4h8=; b=wnVyCep8ya7iEcahb7Y6eH8Eex
	kV6Ll9oHKZRL+lQeRzo78C1qS5aQEIkjZrhpe7LVguu8IRTS93vctppS3VgU7X/FgD1TxuZhPXHZr
	RN7lpBL0OwLii8vlikjH3cW66bi688sv291L0OnG/ijyOWunFGmO0iXlcDFRCCYYxuJKIqbgEJk7f
	PNPkkeTwY2JuRpYLvWmOOoDvyada3ZcBhLLachsGf67AlbvmOdOWRT/LL514+qO6ha+9/h+WEb0vl
	LiX0iKzGHknL90+AtreEsppL8MbphvhGWIh9mzcWBhsdweDRTdm02jjSCYmwlIrfxYFMYTy7vlmET
	FSvNnvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK7b-00H98X-R2; Tue, 26 Jul 2022 12:57:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK6z-00H8cT-Dq
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 12:56:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id k12so2299297wrm.13
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:cc;
        bh=x4rd2qMk0FSrQt9Tp0ZdFh0cgNgJW8TRDOygBl1e4h8=;
        b=jBV9Ngo00RRoTUt2Xj5EYf/dE7L2U6bM74cr7SdwSryF4TUdRF1/eYGJr24ZvLjOlb
         QUskTKO7LRHcn+sdJZ3dlJOAPsmTAXCxNky0QjNdgrMFQVB8KsdPEn7STZTnADd3SMVe
         IrLjc8eCQ+ATkshZj9pm9LJ6QNSyxhQE0ilkKiYgTZIb7HXL77wkLY6VsxGiwzI84BRj
         UlTUnPpGrnYPhK00P1ysdWbDxJSvNJ9hjxZI8R3s4fiA17U7Hyy40oNHdeULJbX7f5XQ
         k99JyD9NV+/jcOZO4DrWF4XY0lLGnWCNXIXNdgwq4W6To6zT/djTDwRuLP4BRTJWPsu5
         ai1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:cc;
        bh=x4rd2qMk0FSrQt9Tp0ZdFh0cgNgJW8TRDOygBl1e4h8=;
        b=haBH3Tbfk3DGu+N3KjqpoOfMKvNVz6fjGLFf73JHQnIZUpzXNMcpWxy0ajZlNU/b5l
         RTyd3fGz1076nE0d7Teg17ug5AITRfSAeZse2SDx1/hh29dsL0kkD6YU5byJa4GhKx1w
         LUI6xNZsnI6WHCo4fdRyL7M1zCPk+GP3NTNbGBEucQgbcFSnpQgBIGqsXQZ+0zTQxfBQ
         Yrib5ZQxhzK6RgUVISbPjulQIve3pdFaNO6Is3cZi/cvcDtoMCYAHE1oKefJRSLyU6w5
         cvwBd9XXIF+uC8PXkL61WZ8M6lGxAV3KtQ0kotIBuMeKif8WXnyVBENSvb2xRcpQWbEz
         qHyg==
X-Gm-Message-State: AJIora9lA1Ot6m4u7D5yy2Vp3giahzcbGcGd0jZZH9RicCig/zb+bmH8
	bNic48ki0r1Yo/4R5sdpOEwyqA==
X-Google-Smtp-Source: AGRyM1uKvnBcknnv711COXWaOOlOVb5UPvyj/NuyjcwMG8AesFqGx+UzkQqX5RP1klFJxFLrocFwFA==
X-Received: by 2002:adf:ef8d:0:b0:21e:a5e3:35af with SMTP id d13-20020adfef8d000000b0021ea5e335afmr2009077wro.671.1658840191473;
        Tue, 26 Jul 2022 05:56:31 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:31 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Tue, 26 Jul 2022 14:56:08 +0200
Subject: [PATCH v2 3/7] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,keys-per-group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v2-3-6d42c357cb76@baylibre.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_055633_516591_0F3C8D5B 
X-CRM114-Status: UNSURE (   6.40  )
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

The MediaTek keypad has 2 modes of detecting key events:
* single key: each (row, column) can detect one key
* double key: each (row, column) is a group of 2 keys

With double key, two keys are physically wired to one (row, column) pin.
These keys are in the same "group".

Multiple keys in the same group reduces the number of pins which
minimizes cost.

Add a keys-per-group property to describe this.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index ca8ae40a73f7..387d0448ff77 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -49,6 +49,12 @@ properties:
     maximum: 256
     default: 16
 
+  mediatek,keys-per-group:
+    description: each (row, column) group has multiple keys
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 1
+    maximum: 2
+
 required:
   - compatible
   - reg

-- 
b4 0.10.0-dev-78725

