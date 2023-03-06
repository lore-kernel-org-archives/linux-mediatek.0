Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60926C64EC4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e9niV0lDM32nqHqYgD5Iv+BIY49mmSBNqShco7CYbZ0=; b=2ycdznQ9D+WlHnOPsLZauVbIFT
	4dycwFuKGX4FOnyk6yAtTSYD21v0DWNVn5Z29d+IW/G6OLL9pq5LcN2xqej0I8ImrL4lduSIgSPUu
	nVnbY1/uvNpTmZkuBol+qFTdq8Oxkc69C78M0wwVCMO/SK7qfcwsGNg1wLF09nCROQAVakWpkfe9e
	FkGZ++FQoNH0sVplTLXFRaMmYdTUjrU7/trWGh0XS0wpA3/nh2zS+R4r0uUYw/YkvrOw/UwlQblTH
	hBfHJz4zqYgJkmfJ56WXufoMEVXksqQY+rrNxutxdyDjL60X/2TktD82Z6bvmdQ1TC898MSInQEVS
	qMxoqoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZDVV-00Dnn9-5Z; Mon, 06 Mar 2023 16:16:13 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZDVQ-00Dnjh-Ln
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 16:16:11 +0000
Received: by mail-ed1-x530.google.com with SMTP id cy23so40741575edb.12
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 08:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678119366;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9niV0lDM32nqHqYgD5Iv+BIY49mmSBNqShco7CYbZ0=;
        b=7l6dijN1SxoxyfdVaf28yN2A4H8PFN9TLFpsI6hPiPiQl2zozrvl2sv+2WzHCSCQpL
         h08Zy2G7uf8A1sp4/NLO6Qj3oCSq4B5rvwH3hdIyMgmqYRLOcsUnpA5ScoycxdHo2eQg
         7AAc9r9HtATADNErnkJ7sZpe+MP6DyqTKAJk/eZLhPyoVV4/Mf5XvvsrGEHHEIRarTmQ
         xrRY24e3Mj+0UaClfTt89hBdKVKE4S0+MkWnMF3qZjKSP56KHUfLnumAhyfJtFdZNTbt
         tgPKBQcJ6SqFHJU57Ode24vvYMhmhj7vBPQEkafD9o/B8jJkoUUGi+WObszt8LDS7Okh
         SKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678119366;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9niV0lDM32nqHqYgD5Iv+BIY49mmSBNqShco7CYbZ0=;
        b=ZksLVyHrTR/a/sYCmbCbIoaOrW6oETo1nGR14U0wjArv4YeuobOeE2Mf80AgLstgBo
         55/m1QaBVrab/G6X6WWL/MkDHxja2nKhcbcZGQZcFY96BXc3V0B/hbc054r2U+eBaH6h
         D78P/X6NCZo6SdmCoNgyB0+QlD23QAAspZgMxpp5vWngCzjXQyq7rgI+U+t4RdzNQmnt
         XEgtIp96XoZ7i0umGq9IU8QXHsgHc4o9IJ0/9FofAgvRMreoJ5HzLNfxUUwokNVlnBQ9
         Ta3C8Zm2Ha57829TK7rYjhDE/5rvXbGzekF5ZJaFSlRfq11zgg5G2GF2/nwRfbHwYKRk
         LSMQ==
X-Gm-Message-State: AO0yUKX1vB7KNa9sH5Y38N/m88af72x5iU3NO4Ha0yj4IqTRgcFGaUk/
	JGWKy0vW9FDjT1rWvD+uIPqbWw==
X-Google-Smtp-Source: AK7set8UJgx+RtN6p8sM/0DeC3tPMU8VJqx5A4m0mRCX7TvoPE1tRwsLeEzWPyNIXYZdIXH4gkDKDQ==
X-Received: by 2002:a17:906:fe07:b0:8b1:7de3:cfaa with SMTP id wy7-20020a170906fe0700b008b17de3cfaamr15805736ejb.3.1678119366668;
        Mon, 06 Mar 2023 08:16:06 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f14-20020a1709067f8e00b008c16025b318sm4725074ejr.155.2023.03.06.08.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 08:16:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 06 Mar 2023 17:15:55 +0100
Subject: [PATCH v2] dt-bindings: display: mediatek: Fix the duplicated fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230306-ccorr-binding-fix-v2-0-4822939a837d@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=4agDtIQ77F9ME6yRsPUjLAJBlnLGzpQX4bZnM0RC0x4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBhHFIaq0Oa2uH87DGmClu+FpsQAsxEPqMLB5HFNL
 i3nTFg2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAYRxQAKCRArRkmdfjHURcHRD/
 9MhoXFudTD4tZBPgh+Gp2RJsoD30POoNUwZRp0mjM/CQzuvWbkSoEKVOfDsjD7vYeM87ZaWl9TsWVe
 qXA2y0Dk0P2KrnThxIOx4SEB3cnKapUKxkD7NeyxQ8x5JttdB98Vs+Ndrm8Le9b1yScoxwskgtnhgH
 AosTF9wPB6SM31tRkr9vsAiznTgv7uhKiCttF9Qq30jdy/nTonScrsWo56HDRRC7EZk/JtS7yYnn9r
 L1DTWPuk+jam1HcwBKWwQR3GZWazffHpuWYlkJ9LrjHmSjqjmNL6eBgXbhjhlVonskoOZmrNoUWlmj
 g+fDofLPIVYkxQFDIjpDHUDtqQzxIHIN7a50vIECNGUdFZsmo7X3kj+51ljXMxsGg8GN2obSwiSfwY
 azGs8OqIV5YOaCSX2eT5Ork2Ysufqo3Cqk8IgHKq5nFwWIDJ44untGuLwOf0m2o9fgePQUWRMIaU0G
 0B0hW0p+G6izKCRfhaWfZ1HglzG8WwpGq51n+TRy3o23OQAXMRKvstdtKSWS5vD0uyh/Mvxu9Mc4zi
 95TNB+K8CDf7GJi16s6r5V8+TGCr6banMuY0yFEfHOPqOVV+2Y7RbOBeIYKshj4qOkpW3xOk5my05i
 YP3VRVJQLGZcMYZyq8ChWV7/CTAyFr1zC9enBdQbzk/j8xO8zweMTd1DnI8Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_081609_014570_9F3460B3 
X-CRM114-Status: UNSURE (   9.48  )
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

The item which have the mediatek,mt8192-disp-ccorr const compatible already
exist above. Remove duplicated fallback.

Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Fix MTK color correction binding

The fallback compatible has been duplicated in the 137272ef1b0f commit.

To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
Changes in v2:
- Fix commit title.
- Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index b04820c95b22..3aaf44719786 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -29,9 +29,6 @@ properties:
           - enum:
               - mediatek,mt8188-disp-ccorr
               - mediatek,mt8195-disp-ccorr
-          - const: mediatek,mt8192-disp-ccorr
-      - items:
-          - enum:
               - mediatek,mt8186-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
 

---
base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
change-id: 20230306-ccorr-binding-fix-718c6d725088

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

