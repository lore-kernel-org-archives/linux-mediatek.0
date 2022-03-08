Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4D6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCO4qyr+zC5bAtAMGpOrT/0JAraOCvAz2Pz8e2gKxeg=; b=qFoizgCQIgPzQf
	b9Ed5N4Se0HYN72sq9HigZlpqLy7RdNaFRtzEtAKmD1V31jOcTbisQQTrMqKZGP6u13mB0J1l4dUb
	CH0rFE0X32Qm7+RZ1fZKcRP8tNjTwzksFSm9XJ3HA1rLb6sVUn9sQaTzdt1m5SOjOArqZCfl5Fsy2
	I1QuK4XWJrAJNS95gXE7Kx7bltsDquMbgM1b2fZ8x6HahqXv5ejpYc33NpEVg8JOuhwyXp6tPQPGV
	330XPAOuxguohd42N/jTZkrpUch6rRdO4zc/kBfvMP/mUZj+RgE5z/VoqaQgW1HDhUGkPJ3J56nC1
	YX51C0qVqZEnDM+qOd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWwH-003nma-Uu; Tue, 08 Mar 2022 10:19:33 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnD-003k5V-Ec
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:12 +0000
Received: by mail-pj1-x1031.google.com with SMTP id cx5so16724399pjb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mkHtiSV2mMzHIze/I73DmsEuzqXgbxwstSY7Z96a90=;
 b=MqSUVQddC79+cfbGd7rJlWaOGFHsKsVv3nxuDEb0d5t14RJm8RgxTNucAJmbCr/HNO
 aUoOwngfmNE0aHCLm/b7tOtkxPjhGIov5/taNy/0m8E6Jkm4+4R7zGhk6AAp83OyYTXo
 oghpwvy5LQLRP29YCov4efQTYND6/zUAVpnhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mkHtiSV2mMzHIze/I73DmsEuzqXgbxwstSY7Z96a90=;
 b=poxDvin30gAq39kge/ZWcGYASIR1RwjbNcSdRP4HOSERk4AJHlOxdhVzJy0Xqy2rH2
 4vxCJE0H+z0sZaeEzRGM+9WDOq3b3okHgHF2pQCzGylU6Knyvo9hzTdhMph/DzSE9969
 fm6TWEZuWh8toOCszQJUcoe7poTna1o/Xqbf5acxzsN51XGYShRlI1xxSP7Q8+PKkVCd
 hNJBc+Oo8TU/eOGNzgrrbEfsKHV8EUyoTOnj3xDmpqIVBtwOE4salUlu+bPSSZ7cxp6M
 EviN+J6n43nswx69P6g9/lJbM9JO7SlO+QzIqUfc2HQduajcE5stjpYfutlHLO9Ih4Sg
 uSXg==
X-Gm-Message-State: AOAM532XRg96roOqK0i4TJpPV46k9Pj8hlhAPe2rryDi6wqUnLeM2CYS
 p9A/kwCFMM9E/vVI8vM630+OKQ==
X-Google-Smtp-Source: ABdhPJyFRJs7+lYwOkpKY/+oHApZBU4Bq8/m6MYCzudRdQ6PI/A8Wr1FevXk8zt3kT4tAZVslfcZzw==
X-Received: by 2002:a17:902:db0d:b0:14f:b047:8d22 with SMTP id
 m13-20020a170902db0d00b0014fb0478d22mr16271484plx.90.1646734210921; 
 Tue, 08 Mar 2022 02:10:10 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:10 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 03/11] pinctrl: mediatek: paris: Fix "argument" argument
 type for mtk_pinconf_get()
Date: Tue,  8 Mar 2022 18:09:48 +0800
Message-Id: <20220308100956.2750295-4-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021011_561146_0AA79447 
X-CRM114-Status: GOOD (  11.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For mtk_pinconf_get(), the "argument" argument is typically returned by
pinconf_to_config_argument(), which holds the value for a given pinconf
parameter. It certainly should not have the type of "enum pin_config_param",
which describes the type of the pinconf parameter itself.

Change the type to u32, which matches the return type of
pinconf_to_config_argument().

Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 7037560ecda9..c668191933a0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -184,8 +184,7 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 }
 
 static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
-			   enum pin_config_param param,
-			   enum pin_config_param arg)
+			   enum pin_config_param param, u32 arg)
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
