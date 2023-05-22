Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB78C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SG7TaztQuB5xH4PvogAkuq91yKarYjtMle5JWo2W3pY=; b=j0TQduOYXjsuht
	eKXhujSYaL6NpTUBMRaWtpm9fCvvpYhqistIRv/f0lifMiIbT+0Jc2NYFi7skYW0MjlQfddrouB3/
	yDsEmesn0yx7gceUc/G5X5twHllsW/ezNdrfhPY0FCdUlKRr4omRqkauVD50F3bBaUptM8tP5gCIl
	JPvESXxERUuIJbesV/4grO2ylmDVJ2jEBH7XF4yvE0olZ5cCtkApp4xBS5HMMpNnez8ttn/amas8X
	X2Q8LqLqloydwhTpiRQ4kh6JHm8+/2axnxHPYgt0Yq4w9m0q07R8r1a33VAkvELpQtmXGZoe6Csb/
	gHX0E24ID1ie01huqMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14qV-006Wb3-2q;
	Mon, 22 May 2023 12:41:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14qU-006Wa2-1S;
	Mon, 22 May 2023 12:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SG7TaztQuB5xH4PvogAkuq91yKarYjtMle5JWo2W3pY=; b=p5kbBIB0Jq6kDd0lebrPNlYtDT
	+WuftNE2cpxTJH9kJiF0+6jpQla4vdyGuzEB9zcbbG+ZTwisGSj3hprDPIVIDBjI/i7mEGWq0UwKx
	c6Y1m5bfgMPYvwT9mfCmvIOU5ihKuP/JCdvK1Dd0GBx3KoQrSMcdqUYTmC/Svlg6NrtRciD34lGbf
	OiusTO10/uLmzOO3+/CpwnmFUkELmoZmVAOtzr54MVHyVRO65S336ouCtHA9/iMQhBqRJuoYIFMFV
	ScUj07Jvv2In/AgrU9y9wPVLnk/ILNRL/qjcFGTny1T69O1ijZemYqNdlEMXyeNAQZIQwn3PBmIts
	m8ZxjHFQ==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TU-0021o8-2q;
	Mon, 22 May 2023 12:17:18 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-96fdc081cb3so173023966b.2;
        Mon, 22 May 2023 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757836; x=1687349836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG7TaztQuB5xH4PvogAkuq91yKarYjtMle5JWo2W3pY=;
        b=EO7b3IAzP1SXc9MmJGIcSSe7861+cIi3CHEghbiJcKaGzWX+L98AMOPbdutsRySWL5
         EJrXsEovtZWyh9eA1nnQk0qsqqPN1J3Xuw8I6LdGVAXKfjyBlTmJEgH6zVShFDGmpRZn
         XkOx+uWN50aPNXztlw8xmKqXj0XhEju7M2jefqZiSvvu0iLYoZD26BzrDluKb95vmhLp
         amdPqR5k6kucItLpP2MP+QGqJGz2lNC5A5f2rUs3pnyPLRVqsXU7wOZJaaUNBSUK9MPw
         PQXBHyWWhrTJ7AMsZx/eAJT4OWw4BPQ9X8ZSt38Dr66aw+A/LIAmG4Jv72WN0UNf7d0G
         Mk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757836; x=1687349836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG7TaztQuB5xH4PvogAkuq91yKarYjtMle5JWo2W3pY=;
        b=hp5gF87T1SMoFE5tyI/gNAIXabYPbM3O1LirzF24jQvT9ApoBTyirFZw+Gy8SdwfbY
         UGSbFla5yFMfkEXYynz1LyaRdjrJUQ8jxtzmQXRF7Zb64WliR5ihWhDTX+h8srgSclqE
         PHAsam5biJ6eLPn7uiH8NTCLrl8xj85PwUUMicbOCunkzGYGOPg7n5b5h74pXHweOPLu
         9N7gYunZAUJD8utGY2VXows3cWFJ9Nrzxph5n3a99KDJY/duHmRTy2BB9oJaeqAEr7TN
         Gax/9mVEawT0KEweHkxIkA7e3NAmVe9/30uEMC+DdmxCZoNrDB4MSuy2iw8cf9a1V1DA
         Sa7A==
X-Gm-Message-State: AC+VfDysefyF+g1PtWDg7T2dk98ABDHnGHmzxuaDj7fCocqXlLdrM1lJ
	Tvxtisub7ES2g8GiFGJKMks=
X-Google-Smtp-Source: ACHHUZ6ILsyx6GlzQ/rNkEbarGHyNFwGSGGr3EMybRgtPQv7aSowIU1Ar1v0dmHaogkEZpVZCkAldw==
X-Received: by 2002:a17:907:3f1c:b0:96f:c46f:d8fa with SMTP id hq28-20020a1709073f1c00b0096fc46fd8famr4292186ejc.1.1684757836353;
        Mon, 22 May 2023 05:17:16 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:17:15 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 30/30] MAINTAINERS: add me as maintainer of MEDIATEK SWITCH DRIVER
Date: Mon, 22 May 2023 15:15:32 +0300
Message-Id: <20230522121532.86610-31-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_131717_219187_662FB724 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add me as a maintainer of the MediaTek MT7530 DSA subdriver.

List maintainers in alphabetical order by first name.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e2fd64c2ebdc..51e8d30651a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13254,10 +13254,11 @@ F:	drivers/memory/mtk-smi.c
 F:	include/soc/mediatek/smi.h
 
 MEDIATEK SWITCH DRIVER
-M:	Sean Wang <sean.wang@mediatek.com>
+M:	Arınç ÜNAL <arinc.unal@arinc9.com>
+M:	Daniel Golle <daniel@makrotopia.org>
 M:	Landen Chao <Landen.Chao@mediatek.com>
 M:	DENG Qingfang <dqfext@gmail.com>
-M:	Daniel Golle <daniel@makrotopia.org>
+M:	Sean Wang <sean.wang@mediatek.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/dsa/mt7530-mdio.c
-- 
2.39.2


