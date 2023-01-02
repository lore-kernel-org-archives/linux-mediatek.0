Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1500C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlDqIjsLXTsLOVaB8vd3OkA5S2UoaPdLtsIDpj43x2c=; b=mjUBbIox0saJ9dh1m+w7rqudHZ
	H4dAsvPHHRD6B3wcAPE7tH2U6QR3uLr2bt3+t8yESD/z1b+89gq4caPN21vINjSG1TkNbMyUO9gWy
	rRrrOOzFIctmu2Xkm9A0Md4W8jCWi0VBXm37wT8Z2YmoEQDyQNSldJ2v5dVpV6hQt0br0GaeZPzEE
	k39WiSMYY2pD03UOui1ZHkOcrHhlp/j2qOl+osrvDJ01CCojrQ6PBb64UQ0U7ktbKRcZRMIhtHuhZ
	kPbdmZHNslmCGj/9YsXEI2AIlrvmPDa0IIBmVui4XHXydRfpOlOFbaB3aLGWpbOxYTe1dzNU0Do2J
	x/NOKmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNOg-00Cct8-Do; Mon, 02 Jan 2023 16:10:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNKU-00Cb6z-Ad
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 16:06:31 +0000
Received: by mail-wr1-x430.google.com with SMTP id d17so6932625wrs.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 08:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlDqIjsLXTsLOVaB8vd3OkA5S2UoaPdLtsIDpj43x2c=;
        b=DYBB+eO5TJw810S2GfO4VDKyg09GvKexUGZ5EShT5lsQarhuAX5y810FMN6+PQKZtt
         f25CBQ33/Oe/HGJ8hluE4/26J3mk/wXhSVoGwBqoEcG49cBdtQQ1/X0v2o53RlCwNc0x
         fEo60GQDFHQ9YQi4XkAN1h85B+2XRqWJXUaqhocDl6l6uqWj4LBbD2MoZtzuNwI5Sy1m
         atbsUh47G8VXLb2m4O+FkIma1KraSz2xiwGz8kRXEqlwRusjyCod8oKG0QxX9SUu5/JH
         AnWRcouBMuTqjZUA1gNYiiIRhLA8Bz32TgO2if/FG829FULxFyi/hPXit5b1UhG/6pUF
         I7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlDqIjsLXTsLOVaB8vd3OkA5S2UoaPdLtsIDpj43x2c=;
        b=dZhGu2FjjlFUodIAhqS5fmbte7+V6QqhHIUkSGwUhRtWOhyK2OPdyn6nx+mn+WM/D/
         HM7YIixZi0D5rvRIHpz2iScws/E5BP/dq/WfUat1/ZaUDPhHVkO2FPw62hQZUXnAyk82
         cPhPnOiO4mxCG+LR248+mxgTnEiB+YXqeuClEdSC2tJUdIe5JCkQGw/wxlNrGCqvC3aV
         JIwOSXyLoUm2Yn4MVWWEkOHEiDAzMntZbHmoG42u/h008yQNPdsLmLSwtErIkCiBK1IZ
         TIV/ycEcnkgNaWi8f8IEoBmKyHGBFja4KQRpaEiNz5+grayGPq1gSWYKWvbKjqs8jpn0
         pR/A==
X-Gm-Message-State: AFqh2kpLFqVRUmI62jwkUL55cIQF4X2uRDZ7rYF6Cz+ukCi+iftmNylO
	avy3oNIzydEGGE1QClzY1v29xA==
X-Google-Smtp-Source: AMrXdXtpGdYxEH97hoopGDFiS2NRpY9XAurXyiQcxxBvFbsJM6oJ3LxD9eaF4TJFljPxdyl2RXIvCQ==
X-Received: by 2002:a05:6000:1f14:b0:242:5a34:fb7b with SMTP id bv20-20020a0560001f1400b002425a34fb7bmr25842859wrb.70.1672675584145;
        Mon, 02 Jan 2023 08:06:24 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t5-20020a5d49c5000000b0028cf987d944sm11868020wrs.33.2023.01.02.08.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 08:06:23 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 02 Jan 2023 17:06:02 +0100
Subject: [PATCH v8 1/6] dt-bindings: input: mtk-pmic-keys: add binding for MT6357
 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v8-1-560caaafee53@baylibre.com>
References: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Tianping Fang <tianping.fang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fabien Parent <fabien.parent@linaro.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen Zhong <chen.zhong@mediatek.com>,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-rtc@vger.kernel.org, linux-leds@vger.kernel.org,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=acIU37N8P1oQiEeAFVfuuIgjK7XT7A/zFtqy1fGJDhM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjswD8/dmSbDHXT0RPN/nBYhd5ARuFoEmUA2rEl4oh
 l6sU6ieJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY7MA/AAKCRArRkmdfjHURdB8D/
 4rcsQLX8aNJdUgxyojMErzvCfM9FymMgsIZSBiIjIM0Gf4DsAuCQDVLUpuhSA931Mkd7z9STLcyKxE
 t2D5p13JdGitxfTdFVvunXRokM3IxF+i3lP3yX1LT5+wNXjcdD6yh/H5BzAS6yncncuiyTXMW09Qh/
 s22ByxFif6nNybNM64cJTcg3TF1wRyODDN+Dyf/cNw+XPSzlhs42NY8VEzzRrTtc0XPlInSWm5veuP
 VyaezR067LxlNe5Er0io+4jeDKWLDz7FbQ2SV51GN6Jt8xwWa6KbhlS0S/8QREs13F1cIZKnQzbB+G
 fdqQXfippFvt3IVl6dht4j66HD3x3YSp8JbKsNEMjQSKLNAdT8rqvvJedaaiUICE3B9K9/sKAlYNy7
 FKyiZwI3YlPYi+fdICAJ/p7EQllFU1x4RHhJ7G6HKxcHSbb6wLQPvJ+mtNefVW/8V3m12cX0gEna5p
 KhYCy+mZLKoXUv0OjapoEZme06jfwGHXiWuViyhHApOn3T4f5n0qoCgSvE66bwoHH8AnIKFfjNUAmn
 mrRkeHWN+wzS2/NEqc1vUh8bRaWeRmGmzqWOri+wZ2rgpv6XOsnCYLaLToN6wLZAtnF4eQ0eQhdZph
 jd2+RYrLepsIOxD5PJ18bzzNOBL7DYEn+ZGbs/msNLR1VOYUeKYUUkrjOBvg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_080626_492427_6C2D5E9E 
X-CRM114-Status: GOOD (  10.03  )
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

Add binding documentation for the PMIC keys on MT6357.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 2f72ec418415..037c3ae9f1c3 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -26,6 +26,7 @@ properties:
     enum:
       - mediatek,mt6323-keys
       - mediatek,mt6331-keys
+      - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6397-keys
 

-- 
b4 0.10.1

