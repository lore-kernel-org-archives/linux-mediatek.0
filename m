Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DD4C38142
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jan 2023 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+NVaJNsYOcpWsCC0UjHpjZYeJZxBoJYuUyff1fnBSQg=; b=rk0UWUbMeMBQRVCK/j2dTr6prO
	Yo/RoU1I1wt1PHdCXQsbJneiHDu/LoNsF80c+8WEzcTfaLbO+Cc3huvJYV/VgvHzbdcc4e31ySyAd
	LMuJA2Tp5PM/s+TXtBCrtJCYDaKr7jAUXiGOPjOuM0WXAsHYu/OV6O7TJklaa+5qXGT/Rt93fxwF1
	rmefQH2udQ9rIIvgSehh871YZqSewQuIhe+X+q8Zttq/zGBBjjhzCEgW4/hjFv8XgYzi9ndEndCmU
	TBeujJXzrKy2xDMCAf7ESUTYpRGcLcvRzgK6bZE4ru/rLB97QRoki6+1Wk4tl/rJ2F84vVlFUcJv2
	Pp346lLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLhk0-00HXs4-H5; Sat, 28 Jan 2023 09:43:20 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLhjp-00HXpd-IB; Sat, 28 Jan 2023 09:43:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id p26so8390982ejx.13;
        Sat, 28 Jan 2023 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NVaJNsYOcpWsCC0UjHpjZYeJZxBoJYuUyff1fnBSQg=;
        b=Hmy5WkmGohJ9WVaWhgbfQE3weSi/D5Vwi6pPhpNnwzLVnBUQXutrArNwCNWo95bqX8
         all8KFENU+kOTKTA6wgPQfYquikXVlVWsB6Sduae1vJwPXtmgLL/qDF2e4J3iXc25m2J
         RD1qbCE4xSrPAM+SmO2a+R331lOCaxxoSPkuKimHehTC7/SP68n2sCwxrHTZWGzdUMa7
         6OVWpF4+mlj3omOBFGySxeXBOBQYGsQi8ls4yQRAI5uqGigIwoFehmlIMwq+a1bINYsj
         IImX+H/lhY1QVdapPuHHAxeZH2Lstk4mnUJU7VlQaV5FM7HkcMAoOJ0dlQkeoYGoRr1M
         mUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NVaJNsYOcpWsCC0UjHpjZYeJZxBoJYuUyff1fnBSQg=;
        b=Iy3eCT048ub72GJzmxuoTslagYu4M5LwVwdP9c2Yvg3WbNqcbUFcsyLa04WX5rgq0V
         PJaM+QYZwWYVnC2q7TtLI6JIxmw24bPwrvAbgj0uTRu3c8zXuGsWzAthWhrPOlsScahA
         ydAXr56ZxvdgAWlzsljHSQrhZSINmReZriuTheNuQJntFwzZ8RAEkZ1NuGDmJYsLD6Hq
         2LgwDRtq73MFzO3Usn15VKB9DcrEUYz4+B+NFZS4rDAtJ70v0JpnL4HB0UaPSnsj7s6/
         vJK8l1nxsVKq331iwEh1yO7KJq0M7XtxRco6de31MP1jM/j3dgnhz+b93DiIkvGwrMao
         MZ4A==
X-Gm-Message-State: AFqh2kr0q0hxcUrEEQ0x1B4/7MlWtqPwf8sDhb2PS04czJXGMYB8JDHT
	0lnc1/2515KmuYnDSvxEa6g=
X-Google-Smtp-Source: AMrXdXtkqnUY5Sa47hw9T1Zkd5PYap4RHk+CykKfG5lX93Cx6X/b7QG0F9HMIsbJZHdrNIgW0IkdAw==
X-Received: by 2002:a17:907:9118:b0:7c1:22a6:818f with SMTP id p24-20020a170907911800b007c122a6818fmr35050341ejq.25.1674898986863;
        Sat, 28 Jan 2023 01:43:06 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906435000b007b935641971sm3616723ejm.5.2023.01.28.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 01:43:06 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	erkin.bozoglu@xeront.com
Subject: [PATCH net] net: ethernet: mtk_eth_soc: disable hardware DSA untagging for second MAC
Date: Sat, 28 Jan 2023 12:42:32 +0300
Message-Id: <20230128094232.2451947-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_014309_646566_BD18327D 
X-CRM114-Status: GOOD (  15.68  )
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

According to my tests on MT7621AT and MT7623NI SoCs, hardware DSA untagging
won't work on the second MAC. Therefore, disable this feature when the
second MAC of the MT7621 and MT7623 SoCs is being used.

Fixes: 2d7605a72906 ("net: ethernet: mtk_eth_soc: enable hardware DSA untagging")
Link: https://lore.kernel.org/netdev/6249fc14-b38a-c770-36b4-5af6d41c21d3@arinc9.com/
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

Final send which should end up on the list. I tested this with Felix's
upcoming patch series. This fix is still needed on top of it.

https://lore.kernel.org/netdev/20221230073145.53386-1-nbd@nbd.name/

The MTK_GMAC1_TRGMII capability is only on the MT7621 and MT7623 SoCs which
I see this problem on. I'm new to coding so I took an educated guess from
the use of MTK_NETSYS_V2 to disable this feature altogether for MT7986 SoC.

Arınç

---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 801deac58bf7..f1cb1efc94cf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3243,7 +3243,8 @@ static int mtk_open(struct net_device *dev)
 	struct mtk_eth *eth = mac->hw;
 	int i, err;
 
-	if (mtk_uses_dsa(dev) && !eth->prog) {
+	if ((mtk_uses_dsa(dev) && !eth->prog) &&
+	    !(mac->id == 1 && MTK_HAS_CAPS(eth->soc->caps, MTK_GMAC1_TRGMII))) {
 		for (i = 0; i < ARRAY_SIZE(eth->dsa_meta); i++) {
 			struct metadata_dst *md_dst = eth->dsa_meta[i];
 
@@ -3260,7 +3261,8 @@ static int mtk_open(struct net_device *dev)
 		}
 	} else {
 		/* Hardware special tag parsing needs to be disabled if at least
-		 * one MAC does not use DSA.
+		 * one MAC does not use DSA, or the second MAC of the MT7621 and
+		 * MT7623 SoCs is being used.
 		 */
 		u32 val = mtk_r32(eth, MTK_CDMP_IG_CTRL);
 		val &= ~MTK_CDMP_STAG_EN;
-- 
2.37.2


