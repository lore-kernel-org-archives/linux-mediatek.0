Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756B4C77B6F
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT2R/N8DSjvq3gCY4oulVlTU0UqMGHgaoluEuUjzZCA=; b=jc4QsywS8D8X9OT7s2kKdT/LsE
	6LIxlJgBKZfeGkTKPjRqEZs/ZEUyvBMBMfEeAkjn5JIsM+6Di/CJhcApwEb2ROsPSiqPHzgij4876
	ngA/oDD7M0W6SWDk86ou1HNihXS1/6/w3mQ0USafthK7f2wEWVMrU+v9boXZoJ5mJ1cmceJonkDXQ
	7Se3zb7pbEKWLJ80DBNJJe+g1qZhUfx69QI2JezWRwzIQykdsLeAlYi3ROMQTA+peb/rKUDWBQPEw
	bfd9TvMdh+pgKun/1QCy+UT5Ipx68li8SthHe/wBPy2n5soUlaElo5SyORe20a6Ip33BigzAZf1M5
	SxD8J3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklYD-00ACiv-39;
	Fri, 07 Apr 2023 12:50:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklXz-00ACZC-0f;
	Fri, 07 Apr 2023 12:50:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id m8so13080026wmq.5;
        Fri, 07 Apr 2023 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680871830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT2R/N8DSjvq3gCY4oulVlTU0UqMGHgaoluEuUjzZCA=;
        b=HWigBAGSs7yP+Us6sjpXun72uAtox3ewvDqYb32bkrgH8/iGinnU7rqUJ18vtGP7BF
         VTX7nZRKTUkPz3fm79umRlUTPBk8lSX0BfAWoh8Qns4HoP0JdQRW60q7jp3i8+SX0KNh
         tUEGjqmiuBSE2EkzQpGaqPK/qrShmVHHIAFwGvDaueuzAx+RF8MkmT/0TpPOdJTR9ivn
         u9NYwKyDc0l5oXljz6jV1EyTKXf6QYv56is/tz9gQi2KvhgelvRLXBHUfvnQR9xQUMTI
         8vmyZwUHtwtYywvHATxJXmnzXW5TNZ97jFFeMfmkQqpHsYY3s3YOCCOkw5hSnVfZ+EaY
         uNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680871830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PT2R/N8DSjvq3gCY4oulVlTU0UqMGHgaoluEuUjzZCA=;
        b=2v59bzylfUWWq0TactT94vKmi8GEPmIEgb98U42PjCuK4sRovF8cBphPQIcI/kByth
         45SRGgnnLSFZTdY1nvITJ92bdrXLm5caxG58FtKcekeS5d+U63RdqF+9Dj9pBbbXNfh1
         zzkzBJUm/15kaGq3jTDdEe2U+MLLEXqEoXo6A01Sm5bkkQlRwAw7CVGrmBWJ0YDo0fs5
         tRiIc/NBK79s02Im428d+XirbsXUtwy9Z7PmP1DIRTZRrdZ1gonGFavPCJ0+54SlP1iY
         zP7fvWEPAyv6TU1G4XIj3mwLZIkxNVBOOl6EFqfYFiVzCLxNVqqphnMbFDoZE8MCHqs4
         48/A==
X-Gm-Message-State: AAQBX9cBaigVDU1gLKnjqcpt4kOQ27ThwtGmiF9lAJe3ec46+ZdVlxQj
	sYZ2AxFsWrDTkchdkm7rQcQ=
X-Google-Smtp-Source: AKy350ZUvz2opaO63plSTQkaRGo/We03Acro9SeWKsVWVPci5sBss3eVrvBEdbUYYJH3O/X/VUGEJg==
X-Received: by 2002:a05:600c:3649:b0:3eb:39e7:3607 with SMTP id y9-20020a05600c364900b003eb39e73607mr1565229wmq.4.1680871829627;
        Fri, 07 Apr 2023 05:50:29 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b003f0652084b8sm8176596wms.20.2023.04.07.05.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:50:29 -0700 (PDT)
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
Subject: [PATCH v2 6/7] dt-bindings: net: dsa: mediatek,mt7530: disallow core-supply and io-supply
Date: Fri,  7 Apr 2023 15:50:08 +0300
Message-Id: <20230407125008.42474-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407125008.42474-1-arinc.unal@arinc9.com>
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055031_251554_63A26AC9 
X-CRM114-Status: GOOD (  10.46  )
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

The core-supply and io-supply properties are used only on hardware that
uses the mediatek,mt7530 compatible string. Set them to false if the
compatible string is not mediatek,mt7530.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index b5db0f50aa59..3b85063d5b5a 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -291,6 +291,10 @@ allOf:
       required:
         - core-supply
         - io-supply
+    else:
+      properties:
+        core-supply: false
+        io-supply: false
 
   - if:
       properties:
-- 
2.37.2


