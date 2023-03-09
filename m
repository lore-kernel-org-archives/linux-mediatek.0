Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE70C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5tFAYryPkgwX1r7/qPOO99uZEKbGLFSC5Llqip43Ss=; b=I2KgUZa6M/Ak12lUTgcTuQOUJ7
	pW4ZEGyjcMg0qSGqbnNXHT3kYeVNE2QXFNqpYN6FUEEkXxrLVMscGXBEgxxOESYEtwbgTSmUMhD/K
	ht5v2tDwljjp5WeD3LdjgmIZY9Avqv+KC+vxOd/56q3gWrVeg8BvgMey44mJNkI5MSNss1HOZ8Ey1
	Qqyy5Tm6triZ4cfQy6/akKQffcUGd+yjJHXJlUJUOw9O3EFFBmsJPLuuVR7XxKf+Kr1EddvX9KSy9
	yWcaZ147cat+ES0FrqSovXM2J/yY8xtJ4nvBHmDYVs5GwlpOyL/Rx0Zexs7+Q9rcAk2Hs4ELNgFqm
	tXTxCljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHD9-00AV6d-6W; Thu, 09 Mar 2023 14:25:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAc-00ATih-GE
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id az36so1274514wmb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5tFAYryPkgwX1r7/qPOO99uZEKbGLFSC5Llqip43Ss=;
        b=xZRhsWgnHZETMZ+7hMlLILnjcF5D1pWv9VWo1MiheTHaxEOGXQClDa5lVA2PrIl+SK
         pA0DaVcgXXFtZixVwbV6JSEhgDLG+j9XJggKbCyuExzvkp3G9U7H55cU18ZVKvEWGY9A
         ZFrKljmbuGiGxAa8nCltIeCdO/4YvCwDYcd9uS01cKMuW5SJrrWa1+ezopl/TtrY1Za/
         GSGszlpxFMTel1nFRPuW/42AVU4GkLqKfeWP+NPQuPDVF+AGPugR3h6OKsdK2r+kbXEs
         49HbAkdCx8O/1kc5/o0eW/6Zc8NRO38gfIuXbQ+Uf6iqBjL35ugX0w/xAHE6ben9KgHC
         v8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5tFAYryPkgwX1r7/qPOO99uZEKbGLFSC5Llqip43Ss=;
        b=5KHldUd3Ck1d6gchMC9n6Vc9STaVuqJ6jSYZZZEu+m6Q5z/rYlNuV65RKagUv5wd+Q
         mqZ/1DZ13kzTtUtV8lg/kM0vf7EkOZWAIF17gv/WFP4b8hLHmXuyle7xoHDtKILVadF8
         oIcU8wM6eQP8owHRfNgEw3cojySX22XoBAP1qV+la6md3g+PUFDkNiBqDNF4qhAYQsiR
         1v3v4RzSPb8nWhm+XTsn6pWIOyU0k4dm6A6favxt0W/tCjSUFylhvmrwm844c0pxkc2U
         XTSYYGpdnwtIDWphAO+I1RB4kjjqd58sKza2TdLne5J0XG3lhGCytxzre/bkkYTidmdF
         j46w==
X-Gm-Message-State: AO0yUKXAN46V500o4oqLjiNjruv5bpvx21tVfamUxHYh+kBWZ3K48eod
	X7pTbKmpET+GaPaP5UkHWvYCrw==
X-Google-Smtp-Source: AK7set/9aDqDnERz+HDQ19uwAGDde4zAOHPr/7EAcg/27Xne8kcfT7S+MbZ6P7q2aic45APWmADp3Q==
X-Received: by 2002:a05:600c:3c89:b0:3eb:38e6:f659 with SMTP id bg9-20020a05600c3c8900b003eb38e6f659mr19551678wmb.15.1678371781168;
        Thu, 09 Mar 2023 06:23:01 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:00 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:53 +0100
Subject: [PATCH 04/21] dt-bindings: display: mediatek: dither: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-4-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=941; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=p9WnbjzFY0umwLZFv0SgtilScjmilWuJtI0Fz5hWU+4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+eRNBAwvwm908UaJder4B/sytamsEVnOqizHk
 xhBbxq6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURYJFEA
 DE19EKGUky9naHlydmvw+XzI7X1WyVlGGorfLqUc3pVinntzlz+XfphHhqWgS1/507xbZ+QmHAwoxi
 FmfoUcAfYPlONd/O5tqb4kb2iqbsmyb26kINAUcZynHLObEcWEpTNJCTaBDK4b3o0BDkcsiWs+JOji
 uZV0IXQ/ac1pDnS4+bhIpvHFvcaMsjLGQqAu5PRZUvHE+JR7bCAaV8C3VFb1VanL8tvkXBLNteNK3D
 abp2LStp4gVUi/3hYsd0ZrHGS0J7Gb/eUb9vuYbu8nH/JVdHgRTdn6QXsMYlIa+IU/gBSKetyevjrF
 Zbm/4tOqva28VQ8eltnzj8Y2A4jEk26viKQ07hgQtwL/UWqX5jatmZKkB8c8UcG+vQotNuxObJoFVq
 i6e0ciblMdhn7lJGu2maX2gCzGbSbTXiFhLqjln6YFk0kI3mrqp3VdukR9elQVPpr8dOGE7voPs+Dp
 q17eTddsAV744xShy6+dfYbbmyJFf8hFKZeoozFTu8wHiJJTfyHbpzFGMs9YCv9EH3Jq6cVrUaop7Z
 jx/SyJ9ZyQNL/04hvHOHs6pdCc9rWKCIEyjD6TQpaTYbI5FkWS65jMkKh4euvKcFq9hs4cHahOq4gc
 6A0hzj67tC1VBr11pymGNPIrp90wXmZhIMzYtg+X4hmB5cXs/YtcS3SveOIw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062302_574497_BE8FF185 
X-CRM114-Status: UNSURE (   8.70  )
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

Display Dither for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 8ad8187c02d1..a7706cd65675 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt8186-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
b4 0.10.1

