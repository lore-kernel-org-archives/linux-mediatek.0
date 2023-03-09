Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941CEC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lE1bZPp7KRJkG065jA7BrjRq0e2c3UVRIFLdkJvreXg=; b=ombvU1IShVUJFN4lXdSQTAtYJ4
	k46yTBEUtdVMGpU3DIWinW6mn8WzJFbQurk06vrTlkiciN5KBIk0ey0vvPL/0J9cqL2MAT/+DHBma
	CQWZwAnySMGD0H46Kfx7/YGeZTfdO9CwV3hiDRgJ/XbgjDUjewlqcjMMwvZMwqEtA8UjpeQD5p+f7
	i5de4ypj1JDniaDiY7hh2EKde+N2L4n5ytY79VOi4HOvlOXc3wgcEXFlKIkkvOpA/Y62l/sxdvqsN
	UDlWvgFLQgMqMiJASlFvHQAnAZt/3oUVMlL/ASJWNERXWck6DyT64bp/Y5rzANxT9R36HBg+lFWb1
	lSX9syiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHd1-00Agqt-5C; Thu, 09 Mar 2023 14:52:23 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHWx-00Ae9w-NS
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 14:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lE1bZPp7KRJkG065jA7BrjRq0e2c3UVRIFLdkJvreXg=; b=LkhF47bhMpZUAyNjVqzXg6OHIS
	+7sDiJSa0UdaVkGoQPqSlIz+WyZwTiwrshrItqLFts32HF5yEaP8idQHvVfQUqCI1xQ5/g5oWP1sN
	YWTHQQXVTce3nVGo7LJEx3gK53nJkdvlwdDUm2VESPzPEkMg1V0XD1v3R/ABX7PwtFcpYga+0EJse
	xlLj5WmZnAg1aMNr8ImiWLILQ08YLTLOM2998CgFww94ZsaMhKPqaTH7INuRKOw3AimKJaEnb4HY7
	edAVUu3lXsh+CnL7tzEQQ4YxioURGmCLIfD15uMObhig42HRXN4GntKcFN5zuJd/jQLsieBPCn/Eb
	gveHr/jQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paHAl-0008Vc-1B
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 14:23:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso3715071wmi.4
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE1bZPp7KRJkG065jA7BrjRq0e2c3UVRIFLdkJvreXg=;
        b=e3wRyPCxCTCbhqioIV84fwTJJWN1NAlFg9iXSquWHMB+55KKB4KLqzARSuOjj8DPMQ
         N8be9sHKY0/KWVtlU7to5JigikApJnETiCwDE4KDojZ7aLJ/9UPVd9zcLpYHBgOaSvRl
         8J+Xfw0FSp2HyMaVrMNbUMvVWlWEWwr4O5/Jc3wCXyOB7wCF1+s6eOAnraLRo8C2+EKS
         Cnszz064QmUgyYI3/hdj7izmvQpmwpSmx3n6Wsv/n2F/PCU1kvqL7T8v0Wc5vUwFtXAD
         G8++H809aE7XHRhumpMOl+4O+8YF22/f+3sCSvo2ZH7MRyoWfolCvwXxeZRpo46tBkLA
         vBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lE1bZPp7KRJkG065jA7BrjRq0e2c3UVRIFLdkJvreXg=;
        b=Xp3nmozf7PZLkr6MPM8sw6ggPusWt1B3hAY3a06qpKYawGQ0PgyyGpjfi7jL6xM7mG
         lIibrN+2X9FIe2k75vQEOV89gECepgYRHNPDxbc6mwfdkcERWFWRcgP9fg4B7RgVH9IR
         mDziBpDr3b7ijcfSoJiP/9nVvrEOiengi0kMMH7Uk2ziFSx3P0mOEDT/iQUGFh+wfYEn
         Lh9UjYf89b9yS/GvJM6+6gpeO6xGovTQA5IaglLqK6NEBgdFa9m4lQmevuvw5F+usvtX
         FEf/sm6CThf1RiklKo56j8SnVwrAsioMZCzjRUiwVvyEcf788OzyMWaTkSXrMprOLe4e
         OH7g==
X-Gm-Message-State: AO0yUKXQJg3tJFZXcG8/+NU6drPGuuqvMzmtSZ+dXPhs69A4UGimZZhI
	Ni+UQahP6as2bfzsv8dVbCUy9g==
X-Google-Smtp-Source: AK7set/01szVVaeiIC4yN1x9Gpt/mNzvTYlHq94dchpbp1MYvvz4Fq2/M/RreXzcMvHUi3XBWN1Yhg==
X-Received: by 2002:a05:600c:3c9c:b0:3ea:bc08:b63e with SMTP id bg28-20020a05600c3c9c00b003eabc08b63emr19961784wmb.2.1678371789194;
        Thu, 09 Mar 2023 06:23:09 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:08 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:00 +0100
Subject: [PATCH 11/21] dt-bindings: display: pannel: add startek kd070fhfid015
 binding documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-11-45cbc68e188b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ZIT7zMlD8Ybmnc0MAE48dSiLfIIrFPqxzQFOQLpl7hE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+G0qVP9OBtyeMgMvHIxMf6oq0XMUO3rJqXik3
 LjvSat6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZfED/
 414WwVYTAUFUxJE4CwHKrWcmoCVewOA/dd32LBGVdTz8vaKpH+2d1a5N9ovuTY4GW3H8kjpVJORADx
 4Xmkf/2xqpoSp2G1tnQjX7gpPaiW1qEJmk0ItcAcOfzItflGiFnbiiYaVvZi6uigXBr77DusoqtZ2e
 2d7TuAG86s+vZrISj3CfXsnZY6GOwMBoIz++ha8QV1WUuXMOE53gUBKUt8VSakC9Tj1HYP4L3UBox8
 G2MrlJr/2NjismzZdJ1UEThjH3/kp9qZMJKNNDkimfX21jxvr6owH+AiEMBIM8bC3W6KAfidyapQn8
 XzaXRfinr5+s/OPzcMvcJJhJwuZjsEpb1OQRZ5JSElVpYzvEwnvJ+6ZZC0XpgX721HbW3zE8UUMpSP
 JSFkEn5NCpZ0FAbhlcKPn6yH0mzb5VO5I9n9PLHamCgcjmpBB3UZ+GKK7BbC5+14TZk4XUYM1S8UlQ
 JPa6sj8/2jjLZWZDPvHGTgXyZcYf3kbHU+/HphFNdWttWktnm3y8MXF5oUdWXieUsGzEkrLokGPp24
 RmmcS/f5beFeHXDKvVrBW00w7qJst/aHHOCXlUowrBgYy0cAHPBXdEX4sC7IKiwqb2GQbfs7+bUWMz
 H/TVDMy4mN1ewwGa0HahS+2c91dONKmtyyo/WEvhj3C/5kMC6yCiAXSWI7bA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142311_606073_1807009E 
X-CRM114-Status: GOOD (  10.59  )
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

The Startek KD070FHFID015 is a 7-inch TFT LCD display with a resolution
of 1024 x 600 pixels.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../display/panel/startek,kd070fhfid015.yaml       | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
new file mode 100644
index 000000000000..5fde552838e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/startek,kd070fhfid015.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Startek Electronic Technology Co. kd070fhfid015 7 inch TFT LCD panel
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: startek,kd070fhfid015
+
+  dcdc-gpios: true
+
+  height-mm:
+    const: 119
+
+  iovcc-supply:
+    description: Reference to the regulator powering the panel IO pins.
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  pinctrl-0: true
+
+  pinctrl-names: true
+
+  port: true
+
+  power-supply: true
+
+  width-mm:
+    const: 178
+
+additionalProperties: false
+
+required:
+  - compatible
+  - dcdc-gpios
+  - iovcc-supply
+  - reg
+  - reset-gpios
+  - port
+  - power-supply
+
+...

-- 
b4 0.10.1

