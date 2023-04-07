Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BA5C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 12:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLHvO2FfplQIRzVomYcprC2rvpDUKXpOVap/nUAtaf4=; b=yecSSF8mtOLyGbmms5kfUKyEea
	w949TNsQCGMvTwjmBkPjKFcP7gtfGImcrhUUQs3muKA80wHCSVqc3Q/E38T6H1fvka3IzQ03w2Lef
	daXWTfu2BVlQYek1k+bBAAS10gj45U9+O2QRHWbky5HsjYNar+FP9f33ey1oc1hRGkq+5kWFwFEnD
	eojh8vAF1Gy5qXYeH5pAtYv2V+i1r8cDycoytLiwMNH8B6yUHomi1Lfl+Flnnyyk1UhJANurQTuHy
	5NDatw6rUYGmifG5BXzyzGWBPuHLemhdZDEbwv3e+RomCVV8KV5zaMq0IfPNvUV+LOQjmF2qz2wZg
	ULrO2TwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklYS-00ACtD-2f;
	Fri, 07 Apr 2023 12:51:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklY2-00ACal-2E;
	Fri, 07 Apr 2023 12:50:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id p34so23987693wms.3;
        Fri, 07 Apr 2023 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680871832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLHvO2FfplQIRzVomYcprC2rvpDUKXpOVap/nUAtaf4=;
        b=XQt55Q3+7ebyW5LUhFMC4lVpV49B6vOtP6SDdNgq+QoR4bIsNLEE0/us9p504H8vt1
         6avl8+8a1S3mTOdAkKbRBIPD/FO7E8HGngWPeKV3/x71qGasONJNQeeUL8mtqqNFRkCp
         SyKTTFgOaaZC20DTNFiltuszp2fZnmNtrFYUxS8aesPH7tP5F16h++VQxtxNKyb6Xcel
         RcsKQh+n+03VWbtQGKzzQNyCVZJQmd7garR9MEju6xX/51d4pF7fJfPPQkhmILDv8TFO
         8GZQPNQnICnpTK5bWFhs0oXkzvJX6aeGljhXaC2MygC45km4gKlUEJuEeKTx0q/Ynw/F
         KPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680871832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLHvO2FfplQIRzVomYcprC2rvpDUKXpOVap/nUAtaf4=;
        b=mSVPfaiesV8fHxEPZHr9/vg76csQ5yPrCwCLHSgegGqUo2QWYDDUvF7uYaa6Crtohv
         wHo3P5EleG6PLql8pBmoza/MIFi6fXs5yk9TxwuB7b9d2DXqw2AbLJ5WZr+Pv8Hd/oyr
         vZnT/Z21TAmplDXYCaLJkMff5ls0iMlTk3QSrt9fwmF/NRw3FCf197nx71SCvuwXta2x
         3OjBkcEpR7HsakiHhxlaLm6aDBgQ/Vw1EexAvHinlIQWk2+rYU0Z/Ljxa15mcKg4Fubt
         cl9Gmx8s//5AC0LHNFlV8LHA6HtiPf3dkB2i3SuCovv9/Ytgd/ezmZUO5uxaobP5+qqZ
         EN+w==
X-Gm-Message-State: AAQBX9dROfgb6z7l+OtDdvYKXKZJL8UR3/LxzDlYT8J9gRqdC2keurxh
	Ttza+C6fsG+DnDX4wyQnZcw=
X-Google-Smtp-Source: AKy350YtsYxuyrbQ3Bd05zHmURZtqmHFghRDkFAgzc2WJ+jhxRWD4RZIe1RArSGHTemJx6ZplJl6SQ==
X-Received: by 2002:a1c:6a1a:0:b0:3eb:383c:1870 with SMTP id f26-20020a1c6a1a000000b003eb383c1870mr1353860wmc.11.1680871831686;
        Fri, 07 Apr 2023 05:50:31 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b003f0652084b8sm8176596wms.20.2023.04.07.05.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:50:31 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 7/7] dt-bindings: net: dsa: mediatek,mt7530: allow mediatek,mcm on MT7531
Date: Fri,  7 Apr 2023 15:50:09 +0300
Message-Id: <20230407125008.42474-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407125008.42474-1-arinc.unal@arinc9.com>
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055034_820323_77808830 
X-CRM114-Status: GOOD (  10.84  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Allow mediatek,mcm on MT7531. There's code specific to MT7531 that checks
if the switch is part of an MCM.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 3b85063d5b5a..71ae431c61d1 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -304,7 +304,6 @@ allOf:
       $ref: "#/$defs/mt7531-dsa-port"
       properties:
         gpio-controller: false
-        mediatek,mcm: false
 
   - if:
       properties:
-- 
2.37.2


