Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DC3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V27S5KvL1K2vWz8itNvO9k+w4B1SxfR+kJPCaUnFWDU=; b=EspNMfw3E38Si63TNBLGFXTm+j
	JHv9ljd/WYasN1pt62s2HhiXYeoQVHPnkxtS0PqYdVo/zu7uYWxfCKWe6j5AuZGoR0LupPSnG4gC0
	H54OY4DHdAQ5hQCQ0d6o8HyO9f2m4uOYtprEOz/7JAQwdomdvs8cs63iywEdj499PRPbs/PY+RFtN
	KAQ3vuJ69uQp5WoAvjIDDhUMIXU1ztJwS5ys6t64fV+77OkcV2JNGv6+h1Vn0PjvDPerRiHWIheVC
	7ESXwYkdLSdXrxzm9Yc57qS0/2oB7KIaJ74ZrjSHEr6BDJxHZxBd4mbENztBu7fki/iC/be7VVT7k
	ILXSPJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHI9-00AXWQ-FT; Thu, 09 Mar 2023 14:30:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAn-00AThh-Eb
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso3746616wmb.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V27S5KvL1K2vWz8itNvO9k+w4B1SxfR+kJPCaUnFWDU=;
        b=330zcWuQ1eI0pJTDza3EkL27nNS6CiD3tAro858PFxmg4oIgpsFYyO5TYUdnzrkOzH
         ALl7GKmyWtJZOlh5t+2Tzuqa1admlGD7PvhfF40lGwmwlkzvi8abQES7Xx79Lzxf5jq1
         f+L/ciiLoYzniNS1+FAh5dt+mvCN7ncjNiv7yO/KBDZZ0E6cWyVvsIU44GGgqRR39WIH
         0FPunCr3WfT3mQNjFimeRf0wnylgGKonXSvS+SoyeKrqPrD1rpQZxNYgTKlsRm6Tu/aM
         2u/2dayRPPdDp5DG8LZYTM26csKitL4sSy7wJ+blX2oYL/jU/lBHT+H7zVfOd7HrfSkH
         CYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V27S5KvL1K2vWz8itNvO9k+w4B1SxfR+kJPCaUnFWDU=;
        b=dh0ReHFkeD9tAGguR3EL3L+W/sGRtrzOZ5vBIc/NjG5D7D8JSZKW8aj1RkaP5K9omu
         LJWfJbbyrKrDIlW8sTUuFOCueMLpTDLzpz3ZhhDCYXA8MchjMuushPLK5sbv+ux104Zs
         +auZ2cBSwZ8hNMlDZJcbClWAqO3IYtW2VPDj45NajwDo9eG08vjz1kqtFYlhD859tX69
         IMqvcFWcRQ+JA4PwnvxYgCoTyu6Uqon0wy8KdKjnK0Er9VNykNgrrHAYLnIqPq0N6w1s
         KBrKt9yqk9Ex+as52MKAmmKYdS9LdMXA+JIMBlrJFlHlYXicU4gOQsx1/ZkEDT82YotX
         aN7A==
X-Gm-Message-State: AO0yUKW3yk9AlHxbw937SG5kxWVoYF1Gmj15MRRlqwgj3jTX6vrf3NXr
	iH6baRY2OhNEPjfzXCn2s9qJQg==
X-Google-Smtp-Source: AK7set+ozYT3+VYr7fmgCHW+FD3/4xEoCNIdmOuH3nx6ozTZLs0TLqzYcERfLzlv8Ia7Ap+cejAasw==
X-Received: by 2002:a05:600c:a08:b0:3eb:5d17:8ddc with SMTP id z8-20020a05600c0a0800b003eb5d178ddcmr20488578wmp.18.1678371792947;
        Thu, 09 Mar 2023 06:23:12 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:12 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:03 +0100
Subject: [PATCH 14/21] dt-bindings: soc: mediatek: specify which compatible requires
 clocks property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-14-45cbc68e188b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=0/sDiX4LVPAp/ORjzlykWzmFkIUKPbZkKZgeehvSSS8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+S568lIEHHFVVzT7AxgJIhu0UcOZErtd2a/WI
 ARzoBjmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURVHND/
 4lG+29rGq6SrgR2EsMecuTDpP5JQLgec8RtkNNvpDmwff13asS+8EIp6zntOA6EGx0ZFTGsqgKbUal
 UhO3PDb+5GAGF+fR4h/vVo/9dBzgaJfeC2laY1LPKjf0rVzb0L9eSKgg1cBfxk0NVkkNKUY+5QX1Wo
 bG7EOr1CxaEyILqv6BcMkwACgB5xr73uvlVgu3UyH97fMWLE4H5kyPKG5k/B6VBojkLs4jmxkBZ+hF
 yxVSoe1fdWj9ZtLApW5i6oXVlxagBxLVdCDpnl8a4KclUKWitJ1Zh1jvOxl8ENBNNSs1K4EY5cK/EM
 idnI5RODT4ekUztJ96mpwtDfyf3CW5Gkq7OvK+T1QBkHKi7cxWdcrZJVqWas4Q14XURvyDPUAxcSww
 f2/JdoL4vWHgb4tfRZHhLE66D7eiFhSymurDqyYEbfpXSkkYuQOEuBQZ26odiVVdzneGByZ7f2Ns+4
 k0XGdQrs52QjZCHMPw9WJd5KZQy/Am2lFfJmurSQxF9wqX48Nnk2SIyd6S5h31dJTHGaic9C9eg/0g
 R8bVL0thuPclglLeth2ubZsJNqjXExMyvHBikkW93V2aqrqK30V44ngsGb/7ObMI0w1lvfTIUtzEaU
 JoB370ECUdcNd8xj3j0aGnlbiUlBn+xfhOZKQB7N759wWIjJPfO5wd97qVKw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062313_569987_27AE5F4D 
X-CRM114-Status: GOOD (  10.64  )
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

According to the mtk-mutex.c driver and the SoC DTS, the clock isn't
required to work properly for some of MTK SoC. Improve the clock
requirement by adding a condition which is function to the compatible.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/soc/mediatek/mediatek,mutex.yaml        | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 9241e5fc7cff..ca0ca549257d 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -69,12 +69,30 @@ properties:
       4 arguments defined in this property. Each GCE subsys id is mapping to
       a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2701-disp-mutex
+              - mediatek,mt2712-disp-mutex
+              - mediatek,mt6795-disp-mutex
+              - mediatek,mt8173-disp-mutex
+              - mediatek,mt8186-disp-mutex
+              - mediatek,mt8186-mdp3-mutex
+              - mediatek,mt8192-disp-mutex
+              - mediatek,mt8195-disp-mutex
+    then:
+      required:
+        - clocks
+
+
 required:
   - compatible
   - reg
   - interrupts
   - power-domains
-  - clocks
 
 additionalProperties: false
 

-- 
b4 0.10.1

