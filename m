Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E88EC636D7
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yAD1DxvAYMRKEHrkkSuKbgeC08TTOx9gNI3h2o70G54=; b=t/tha6eqwj4k4ojStQecY/3MD5
	IilF/yNPkSR/VZG6lgsAzX93xUHJxbODqzqRW9iXS8y0omE+RyRGwI/D75m4buftNeXaPCKvX1Asv
	jHDxgnvb9AC12w2mucZCkJ5mC4B8hnqOG/eaurh7820gJ9BF0fP/mmVKzIEixTLFLrR0of4vORJ4A
	MXMy/B7vGbjzmaRdVVGyTSzvHi5OCVceuMFUocL1cSf5LDbyOOL8qL7sXA0ntDat+j6CDgr6eoTD2
	jU+9ry3wekdddEblLmpn6oMFXcn1Nh0hU1CBosgcsbHztQ8H/gf2PHwnfT3yGpOx9n70NPoSaCMNC
	laeQkO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTHaF-00GZML-S7; Sat, 18 Feb 2023 07:24:35 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTHa5-00GZKU-M7; Sat, 18 Feb 2023 07:24:27 +0000
Received: by mail-ed1-x52a.google.com with SMTP id ec30so827721edb.10;
        Fri, 17 Feb 2023 23:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yAD1DxvAYMRKEHrkkSuKbgeC08TTOx9gNI3h2o70G54=;
        b=R0RlR19heuvvC52611xkEkfa8RQ5ZjtJsn9GwQWeN/fzEEEf8jW5GDKSQUlIarCyIO
         cpT4PS1qOXQhUmbucngge08OiXT2rM6F9SWhKtBMVUrJFowwcTYe53+dosEBpIf21kpx
         1xtw7CRM7uD6WAyfR6H9WgzIpxXWZfh5Qlla2DmADPOKAy93T9tszBtABHgxeXDb/xw/
         ehTe9+PjY2Y+DjK7r3Dk/oNKfJXLfQca1QaQ5qOqdjdrSAZHbCm9mwO8ELbc7CD2ku1o
         tvcIfXzghxWWDGotSqEpg3k500FeiJAi9+BMtM7Tmx5TVeIs/R4WZxRVHS5k0mS9JwOz
         /jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAD1DxvAYMRKEHrkkSuKbgeC08TTOx9gNI3h2o70G54=;
        b=KRpuS9OtSDDrCtgytbTycvgnBgYP7Bt6BruEAXREnZzOIbQ0VLMm+bc08mdRoKIZDO
         pVvRdNKs/m6uwQwcPCdg0RhhDCaUMsxQ6/4PgqMc4P4YU7J82OLL88thyKNi0SRxjimh
         ANuapuG7MTvP5tnMBnPJ2FOxvDXlr9/g/qKU6F00yEKjPj1bIYq/hzCOLuY2/df25hnn
         NdI4MopkZowZN1mrTXwgV51Gx+7iuYErxv/GNbzOqRh8SBB3iFt8e/aPe7DOdjQpf4XF
         0cXaxeVSbJRCVJP3o8i30yTqssPAsnpTJh8simMs7DxKqOQX+WmcWr5g3y0OmriX3//B
         PDoQ==
X-Gm-Message-State: AO0yUKW/xjOVTOKOMkPYgNQrE4sCqpOtVukXjKa2HTDLquuY0rXJIl7d
	UD5v1IQ0H++oAZ7Mwd6wK4o=
X-Google-Smtp-Source: AK7set8XPgEIrp2vK5mCbMOHZUOzh1DHe8UKj5u++Uf314ibQLpn6ofnSQjkMsbCj8yiPfIows8UkQ==
X-Received: by 2002:aa7:d552:0:b0:4ad:5950:3f49 with SMTP id u18-20020aa7d552000000b004ad59503f49mr7842961edr.7.1676705060321;
        Fri, 17 Feb 2023 23:24:20 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id k7-20020a50ce47000000b004acb38eea1csm3179536edj.28.2023.02.17.23.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 23:24:19 -0800 (PST)
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
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	erkin.bozoglu@xeront.com
Subject: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: change some descriptions to literal
Date: Sat, 18 Feb 2023 10:23:48 +0300
Message-Id: <20230218072348.13089-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_232425_761212_25A4A798 
X-CRM114-Status: GOOD (  13.86  )
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

The line endings must be preserved on gpio-controller, io-supply, and
reset-gpios properties to look proper when the YAML file is parsed.

Currently it's interpreted as a single line when parsed. Change the style
of the description of these properties to literal style to preserve the
line endings.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 449ee0735012..5ae9cd8f99a2 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -93,7 +93,7 @@ properties:
 
   gpio-controller:
     type: boolean
-    description:
+    description: |
       If defined, LED controller of the MT7530 switch will run on GPIO mode.
 
       There are 15 controllable pins.
@@ -112,7 +112,7 @@ properties:
     maxItems: 1
 
   io-supply:
-    description:
+    description: |
       Phandle to the regulator node necessary for the I/O power.
       See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
       details for the regulator setup on these boards.
@@ -124,7 +124,7 @@ properties:
       switch is a part of the multi-chip module.
 
   reset-gpios:
-    description:
+    description: |
       GPIO to reset the switch. Use this if mediatek,mcm is not used.
       This property is optional because some boards share the reset line with
       other components which makes it impossible to probe the switch if the
-- 
2.37.2


