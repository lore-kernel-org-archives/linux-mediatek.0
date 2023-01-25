Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4594C27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCD+Tet020QcCYVXiaAHhZ6T43mxf9NGXvGcAhM5Bko=; b=goH8a/fb6/21gf33joI5JmBv8v
	z04nHwXP5zu9tYpdp6r+AaFzBg7lc7edueMhDY0UeJwpb/ewQdsZ5D5b1wn+bNyEBgojNvepQ7pxO
	0Rj1OpFMCyC9sD+OK4T0+IJhkuVNswzPCbVDXI1dOah0kqt7MnOtPxEfNPI8ou3wCMxrP5kGDlcx+
	sFj/iioSojiVzOVtgWxNfeJJjkbgB7vcFxYMInejcpgKXTmZDSGPL0NX43AKQ/+O3dpV/w3NPytBo
	fCfM6fMETpiYRQZltmiyI7Ry0aLBzfTZju15WPnzE3DjPhOi0IzT7X5gcgBjwCqSQ0rij0JQ7Z9k0
	eAGYf+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcUX-006kVM-E6; Wed, 25 Jan 2023 09:54:53 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcQu-006j2M-7Y
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 09:51:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q5so11778798wrv.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 01:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCD+Tet020QcCYVXiaAHhZ6T43mxf9NGXvGcAhM5Bko=;
        b=evdFUzWQ1Z6fmorAAHX/2rx1JsI1ucqR/2YMkGAAzJFPBQG40c0oaoquu3sfWeDTD9
         3bbW4b1CwJW2ZtdWk1rskgF9jbFqKw3nADhOCTcIMfnjYXu6ZIy189AvlcMMHgvDfJzY
         9afQYjTJqO9rdAxD9pEToliDpS2q7owdH91h9+JBz1LbNAll9s6Hgdia7e+DWdO+w3y4
         Sa0NSD8NOfnnL+oK/62NjEgHOpuCEJCGAlnK5JxTKv14/TerzMWhOLbvVwhYti7mQztX
         CFEwt9AP2Kw+GhKwzuBAxI734uWRGbh4f9+9kYKnBVb02juwMrhdxeOFZh5DSK7RuYiZ
         KJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCD+Tet020QcCYVXiaAHhZ6T43mxf9NGXvGcAhM5Bko=;
        b=xAxWkC37I8/gPPfyAkLHAk3/+vfekTkUTnmYbDXJ/xND24AaQDAhEaOYHRYgq9HuKs
         HVzAs8Onxoc7Vmal0x3jau9zLSYu1JgZyIbjNuSBpBW7gI8eilYmnAof7aNCINNxbV/J
         +k6qZ/CWdwAn89nMG7Jx/17SWxkgyFcsOn006DMz9mir6HZ4UriMOkpI/k/3f9bRP1ox
         pBqIFjGuU/WAiEttsgCOtZkRdLWtWyMU1A9jYxjjWX8Jae5kOFe6DOM+Sa8v0O849ZpT
         oz8xXnd8NYhZPqqGoi0eZ6rahZX4QThr9AcKGZUiezPDXXhJZbuKpMX6kiM0NqVxPQTe
         sJFw==
X-Gm-Message-State: AFqh2kp2Q6fupmdeAbStDjXu9mt41kVgN6My2kkWDsqBNEMKXldajnTt
	BR0t0Kl0HKEH9t/PBOZeBo1Etw==
X-Google-Smtp-Source: AMrXdXtW4LbC59RXC+dBFm0EBBki8tu4RWZohenwoLSN2vVO4YuGlip37uSG6yoG1MbxuFzynf8qPw==
X-Received: by 2002:a05:6000:1e18:b0:2bc:846a:8ead with SMTP id bj24-20020a0560001e1800b002bc846a8eadmr29665011wrb.37.1674640266621;
        Wed, 25 Jan 2023 01:51:06 -0800 (PST)
Received: from [127.0.1.1] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.googlemail.com with ESMTPSA id j26-20020a5d453a000000b002bdf3809f59sm3955072wra.38.2023.01.25.01.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:51:06 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 25 Jan 2023 10:50:33 +0100
Subject:  [PATCH v8 5/5] thermal: mediatek: try again if first temp read is bogus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-up-i350-thermal-bringup-v8-5-23e8fbb08837@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Michael Kao <michael.kao@mediatek.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674640259; l=905;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=SvQ8R3apCWGsjdAHgfNQVmNogbxTjihw270BNNJBqk0=;
 b=pkHFI5a45MlA9rGXHv3vKkA9DV+cFpeLSRC2m5W4FWHIP47gcqAI0gZg8YNrfVLt5u+BTkZkthhA
 AcisRwV0A8EpqInMTUpFXoe4B4+xb7FfJNqyqIZ9hzAgaCL0DM3w
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_015108_385350_CCF8D2A0 
X-CRM114-Status: GOOD (  12.18  )
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

In mtk_thermal_bank_temperature, return -EAGAIN instead of 0
on the first read of sensor that often are bogus values.

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mtk_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index b8e06f6c7c42..e7be450cd40a 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -736,7 +736,7 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 		 * not immediately shut down.
 		 */
 		if (temp > 200000)
-			temp = 0;
+			temp = -EAGAIN;
 
 		if (temp > max)
 			max = temp;

-- 
2.39.1

