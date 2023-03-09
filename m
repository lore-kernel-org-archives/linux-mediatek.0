Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65BAC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HGXP3dztTrnQjlCCkBVLINYyzIjFA5vv4MQlPWgtfA=; b=OxuTLl3fy0XoYq6kfJy02TCebN
	OuSg+dATjOA1dCmdEBOtbiSRkU7hpfCH4uLMxxm3I590ScxaoA7cDTks8hYRKrNkmWXJamymXXSaG
	fmoOAD9ZfMvRPSkJYiBxjYe/IZm7CQkMeZML/yNiyr+iOV6hV1Hev/FgwXBA1W5wmQ4fAUIguW8a4
	78exAWfo8f4+3RGie5O4ZokbqzZ/k3qsMG6J4I391xC2Yw8BNfWLZ+HgOdfJwixuwqbp7vGIXhT2Q
	mo0GIZmP/IrmwhdaEIaBqHLzahvKcx6cIQxDBe8Z02IjwvdHLYr/22tyEqtLg5aLNp+sgfTycDnmb
	TX7zyEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHD6-00AV4P-3N; Thu, 09 Mar 2023 14:25:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAa-00ATgT-Af
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so1333456wmi.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HGXP3dztTrnQjlCCkBVLINYyzIjFA5vv4MQlPWgtfA=;
        b=034QB5Y0+lS6JX3VHLfCbMLKOw3Puj5QP3kkG18+a5j6LclHoFYu2AHV73XtlQ+cCL
         c7XuzGEgBa+5eZQeEexsCKVioxq9q+GLiLVasXwe/8wQzOQeIh2VEeWunv4wsEOfBz9I
         o0Q3fnV7MxT/wF2oN5Ve2OWgX0WnQQAvYpZlNp5sU2v5quTXjiU4F6r4MPg/BGueIEZX
         nB9NaCsfiPvXH6kYatW4bzYYo4JnIsu6uHIm7d+HFB3Utms0AdnCKZjUSGr9/OR++vNE
         3AZG6Z/fbPokdTAhRQ31wXQteokZZ3SWIGAWGMacyKjk9dwla5dYpfMu6xPBzDKY3zO3
         VSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HGXP3dztTrnQjlCCkBVLINYyzIjFA5vv4MQlPWgtfA=;
        b=MBfzsWm24e/g7TB3bql7n8GxCDBvg7195at/khGKWYXpsxZFQAU1oJWslOedmlhdBU
         rHV5HrO9t1ztxkYVCQeg6Uj37v90cbPwR6VKm4JzaiQ6zlrlBPLdxsbyWdRPRq5wZzQ1
         wgxMjK1sJ7BzosvfigzM2tdbkedhRirnm475uiXrqcmkWgaNvSfQAxF+vC0XWXqi2wsn
         phVc1XmniU99tBK8Ss/IOURupXHeMkLaCzX8euYnmlKQbHDrZ6cGWg5HNoALW2Ozkx97
         stqs8+PWMk1AXOAl0GEZ7ZPGqLuPwRuCojVwytP2a6QG4lO5iX39QjkVBUc9JfCwdd3x
         1Z7A==
X-Gm-Message-State: AO0yUKXm7clvM94JI9RkSu7VEDk1qtbE7BNqEdIl2aBd9/3S+WHU6TnT
	ob3J65RqMW0looW48saEnXC1qg==
X-Google-Smtp-Source: AK7set8LBA7kJVWdMBXxuiElbjEob4ABHNs0P+w6UX/yyJGPqOclYqM6FVkDJEJjKe4T4cCEx6FFYA==
X-Received: by 2002:a05:600c:444c:b0:3eb:39e2:915b with SMTP id v12-20020a05600c444c00b003eb39e2915bmr19673513wmn.31.1678371778461;
        Thu, 09 Mar 2023 06:22:58 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:22:58 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:51 +0100
Subject: [PATCH 02/21] dt-bindings: display: mediatek: ccorr: add binding for MT8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-2-45cbc68e188b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=C7jd7hPJyNNK65umqiaqv8dPlJYkmQJemWR+tpy2or0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+0ew6YaHQB5gxrKawL2Go78SiMBY25/zTN4Z2
 MRX1zaSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURTHeD/
 0ZAamMi7T+h2vz6GHOVNWgosBIBUISGisRUy+7NzqleA2E6NBx5WeM7D27F1qOLovxDYPlTo4MPfqD
 KpDgQTVD6HUqmO6GbVpUYpOxLUCRIJ4R2I3LzqJeopB2Q644bdO6i59E5JxsBLYqx+BHEKbusVVbqW
 6VIvz9g1Jh7/oHqCuCxH/wM7Jl1cDjLB4e7xxH+ikBLfP7/4Ut4d9krtxEZthCLCyW5nBeIoCApaak
 ixzLu6XsWhGP6Ochs++nUaJ1+H+8JiS0bygnM4F/JyVQo/NY/Xx1SwNrt8UPBoDzMEOeqGkH2VtPg7
 JQtWf0HqXftZbe2FCLvTfPVsn6hwJTXvJZuKIymeMu6eSDiq/hd2v3HbcTzLlZ7k+10ejDi/2fD2my
 OytIuUhmihdhn7FXT+OFr4ZLE7TgeVXJBwqrALhdDqm3Qo5keCG5juCY4xOIYeJ8flcRRYngzqVLJl
 CFVkOAQCJeAuZ1XG2/LuZv/sGWCCDdEiA7jf+1Uo2rJE86KgTkgAK5Qi0MwdXY2KiwFmk8SQXZapgh
 HIUej/Ux3FH2LrmRsqWWzp6TULX/lR8raDTk/nHbLQgr476hOBDzn63rVuvVXBicZSdy31VRO2SdSE
 2vR/2pqUG1VVmOizx3ImOzJI/esDslVyHIyYLiYZB0cpztNZQd7jmdh2l6Lw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062300_409752_ABB200D5 
X-CRM114-Status: UNSURE (   8.80  )
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

Display Color Correction for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 63fb02014a56..fc999e614718 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr
+              - mediatek,mt8365-disp-ccorr
           - const: mediatek,mt8183-disp-ccorr
 
   reg:

-- 
b4 0.10.1

