Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9FDC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 10:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJQF6B48bWMLgZHfM1G8M4Eezq84VJ5GFh0l6i+/i3c=; b=ekO5J9odbZw51uS24N8dgaD399
	Bz1QKPvStlmvRC3zMyw/8UUFShTpspNc6nkl2naUMqARF3PoPwizO+4Main5dy7q6n93J93mLr2kE
	10kgMVd4RGPC/BpTqGWxFvzzAhnUJ7QWjTSZyXu+KKNizqt12aLHRTpp9eColcqn7gszRMWRRnDZF
	8b7qkOvT6YtnV7MSmzxGjfWme+RAxYQQ6ZfOZ54BVfDt9O9RiCjRiMnTCg/qwoCRaoIXDP/T9suq2
	6oaJuexTbqZvNb8P6F8k6t2f9krLVI7RFGuUKbkKZALW6Zj04J6U9tDwXWCVFobF5DYLq0LebLqkP
	qT+4/8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQns1-00CAKA-Al; Wed, 24 Aug 2022 10:44:25 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQnrU-00CA4p-8M; Wed, 24 Aug 2022 10:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661337809; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=drSpAOhQHvP2XQ283IG0/66J14vu863PTEJYSlw9l2+4RMjvoqPai/DvtrFpMBC1p+xvo9t9Yq/pZLUSXGZNJ1mrDLd45W7IEa3whV6YLoymAcUg5+kFDtSZSCcUPkNfYyaiXfk7xAGQA/u95s9GL4h9yaUvYufjpFuxy1YNwtY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661337809; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=MJQF6B48bWMLgZHfM1G8M4Eezq84VJ5GFh0l6i+/i3c=; 
	b=cqto/XblXwhWuUhpVjxwwIG/1xcKRt56v81VARxfO7SxYaApakaQomsi2Rx9+sfiuW41+gyTHDtpuE8imAxJ5P1yniJDZIA7fROcttVELUTikXwRzINkXoRglu6/Alai/IG81Pfhm4OxNr4iGfyu/vxapuAGxl7dSg8D2vRfxLk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661337809;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=MJQF6B48bWMLgZHfM1G8M4Eezq84VJ5GFh0l6i+/i3c=;
	b=PRz1liU5KgMaAThF/TK76OT8t0K6/oP6q8b2Q2a76IjOwdMCbWCEP00l9oi87iSO
	unB8yBvqugIFAwAWum9ec7LRure7r8FWo4/tG7c93O7iSfEprstNGoRNk1VTj+qaHRu
	HjYd4us6Ve7URc4jQdR3Sc2lFVpP7NjKGuh0+efM=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661337807259354.28517080079007; Wed, 24 Aug 2022 03:43:27 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v5 2/7] dt-bindings: net: dsa: mediatek,mt7530: fix description of mediatek,mcm
Date: Wed, 24 Aug 2022 13:40:35 +0300
Message-Id: <20220824104040.17527-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824104040.17527-1-arinc.unal@arinc9.com>
References: <20220824104040.17527-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_034352_373058_2983AC0C 
X-CRM114-Status: GOOD (  10.72  )
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

Fix the description of mediatek,mcm. mediatek,mcm is not used on MT7623NI.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 4dc85a1cdfb5..d5f167e6c990 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -107,9 +107,8 @@ properties:
   mediatek,mcm:
     type: boolean
     description:
-      if defined, indicates that either MT7530 is the part on multi-chip
-      module belong to MT7623A has or the remotely standalone chip as the
-      function MT7623N reference board provided for.
+      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
+      switch is a part of the multi-chip module.
 
   reset-gpios:
     maxItems: 1
-- 
2.34.1


