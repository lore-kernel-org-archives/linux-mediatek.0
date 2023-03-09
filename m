Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFB3C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEWU70w2MhwOSDCiluJ5jAZTA7oYz0fVwDWXSQuba3I=; b=CJ7C4mO9PBczOZEdqIiZ5gUxmh
	ittaoTZ+7zfO/WvKfxOoy9gH1H1OD6D9NVM3AIHYVyD8igRMpUgQsXUwj9T1Rep3XJZFmFPLXWsSM
	gOncOu7087WNOeC6Ci+4ws0uh02mHaPSk4JCdvXmolLoc1nWf31oc4RFEQlYd7HxpgC5TPv6xsvMN
	ILBs2Oc7QGEfc9jFP04C+eXYIQZvugmtxQ+WzB9bRK2ahHPsnqmqcLgfY3i7VV4OYbeT5n3Rq+m5N
	ZA0CGT7X7BO6jamAwBzpvcGE0meHM93/WUiVPFpQIvQKqODpqcoztpn6hIMGvbkyoob7mBvu58EgZ
	yuyajsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHb6-00Afwp-1T; Thu, 09 Mar 2023 14:50:24 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHWd-00Ae13-HH
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 14:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LEWU70w2MhwOSDCiluJ5jAZTA7oYz0fVwDWXSQuba3I=; b=LIgZUgKMHKs6JL0W30F0G/bKkc
	owMxq7NxhkJorlPDzDdj+QQewC8nEEUeXdvGO+O97AjJgUPoJkU6fJmb2lntEbt6FkesQBu9VJA8O
	WOFJWwq3tOIOlW4wmtQGMuIZyN0+F/Wu0KCPTz0jlf2f5SYgfawThiF0Fgsxu0gkaFB5RC4QbfC9q
	TWwSSkn0ilO8/qBrJYri/sBjhqHkpzqVj9l/1rLNdk51Fy4b8gFx+44PG/5fJxO50O786HffiaEN7
	DKqyDefHRoBzbHkQVoP3QtbBgpgfVVsMMbmaXn4nuFVfU4q2rlhZAdNDpgDLuKWZtu4EDPvVWNLjC
	VTReDMjg==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paHAq-0008XY-1p
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 14:23:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id j3so1270800wms.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEWU70w2MhwOSDCiluJ5jAZTA7oYz0fVwDWXSQuba3I=;
        b=Uy9GmSnzmwC8W2IQth4jvzJVz4DF8aIBvb1NDx8cQp1Ve2zLzT8bOKFqLx+YxOjXt1
         cQFx5XrS7WwY8coUggeH8EGv8ydWk88riWIo4r3Gze1NjYXUQhX2jl4Ux5DeEpUZzVph
         +C6VLB+DAcYcxpcJeGEfZcan3vTUk3jw8yUNWr6fhCLz+rGkyOT3f5ecdKbDXbtZT9Gn
         80qpXiLU+aGPdAPwXU8f7VBku4H1EisWk9tJN3ssm1m7VfxpKIpAbZGjOMOX9uWiRtCf
         K3wijJSfKx/SKddo5lieR4EJ+RpsnvVOklyUp3pDR/NS3maet6wEjXWrv4Y1w0zJ+4lz
         c6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEWU70w2MhwOSDCiluJ5jAZTA7oYz0fVwDWXSQuba3I=;
        b=LX8thOIoDq5RsPZ/wVy3s1yrnpjJ3na2Bg3ne/EPAgAlw8v+SzeNkuAZvUPo1irNOn
         S8gp6eEhrUZeBEyEMdPQwcBzEMSWCDiGbtDDhtU2FvvsT+qC8S5WOL1Txx6OFiqEOL+7
         Oz+4WOD8MO5oibi+9gVbMqmfGEA+Na8fB5scBrqtOZPx0G0XzHFv3/QtXtVCPGK5pzuF
         HZCki+bmukLjo8g8BRk/BA0DRsRBnVNBsXewFzLBZ8/mrI3R/P+EBsCBCnPKLUCbEMpQ
         xdQJFEEHS6v/PAv7x7yz0yGV1uUfaYSvIhE87Q1S4uF9o2IBDbU6yk9dXn9ws5MG6LPE
         BGgQ==
X-Gm-Message-State: AO0yUKWo1T1ec6OQ/1HpnQJbOD38/bZNu+QjISf9cpPUe22cypL2O80Y
	BGXunFGIud4CGDw8XGE/T4mh0A==
X-Google-Smtp-Source: AK7set8PuvmkXWL+wpIKlle+LrJGYew2mgPn5qNgfXuV9WIQ5mVxYy9ir/mXx1rwJ2BDwYo88r9NxQ==
X-Received: by 2002:a05:600c:4e92:b0:3e2:5c3:bcfc with SMTP id f18-20020a05600c4e9200b003e205c3bcfcmr20314611wmq.18.1678371794145;
        Thu, 09 Mar 2023 06:23:14 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:13 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:04 +0100
Subject: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-15-45cbc68e188b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=u3hjgpLNyq3fO/ZOqA0QoZtYSn63eOyCvnFXS09oJ2o=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+IgHy0ePxrcf/vmepoKgZe4MirijpQmR5gftR
 LJkifzKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZW8D/
 4sDyGRtvesianVRgQMTi2XL9jhn8BlDK0xSC5oALNwkWT/4J0u0odLvyrWRWjdPnQTkAAaYi3NiEuw
 Iz6JvqNM3uisoI++joMSoeB3Ul834EbIRaQnHdUX/pzl8IHQaQHZYPmMKQwBGlge3cVI9Kbdw1ulHL
 PDW8JHzkAZo6D5vbki5sMTe14J+m1by+SQcPAc+Er0xkZZIN53bI7/bOSqJf9fzVfOxWTx+CsZLUgo
 zFgSLg7XBf64OSETjMBXvB7QIvWSU8UveRGIvHzbCFxDr1/Ps7WbrPfvClqmIxOgymXaFnhKN1Vinw
 GHOQgWF+IFIL6Ns4RCq7D7nEnRT0Ed829LLoEg19BPVe6fe8Km+cr16QerYBlWAxBgN2nuazTy2+Ig
 E88HbSybqrfiEvOnUtMaTOqofvDZ1JHudxw+MYdgHmiNiRn1Z3P+Iwnr7IrEmoz153kJdJfmmiWMDE
 00fXsXX+cXZ4VXXbTKYdxaNGfSrw/hAH8Ln1iRo3rk6KqYiQwYAXZWysb+1idgQ13oUvWIEfWfDEt+
 35j6SYoPDMR/PEtKR7zokgwtc1GGNY7j+rDv/I5ZFplyHpnaaxEiYOnlIyVxBzIEE4933UTefedLAa
 DpOu5gQX726EX6wBi+MllBBCeg7wiN8gj6weycq9ujj994l6p41Gl9Psbnkw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142316_922023_352979C4 
X-CRM114-Status: UNSURE (   8.38  )
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

Add compatible for the MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index ca0ca549257d..931d66893dff 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -34,6 +34,7 @@ properties:
       - mediatek,mt8186-mdp3-mutex
       - mediatek,mt8192-disp-mutex
       - mediatek,mt8195-disp-mutex
+      - mediatek,mt8365-disp-mutex
 
   reg:
     maxItems: 1

-- 
b4 0.10.1

