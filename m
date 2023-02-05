Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9137AC636CD
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Feb 2023 17:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DphQeSQZJvbNuRjNugbdilolmsiVVgBCD0pCY3YPQUo=; b=EEZQ79acSxS5ZWvXes5QhQp6IH
	JEsH+06HtGOx/gpa8fl29bmqy2yA7sP6Q4Z0TPMiDEwAzyYcGc0crXs2+/FXXROW+DAo8VdaxpWIK
	08NVoQv9XGzyA44U3WLqJPvJ+FygSuBpjh7+pZPd2IN/ra4qJf0jJXemYhVt2WCpvPUeu+Il//tuq
	0IVxitj/gB3TxXrZ2JxiFhOejr15FMjg+YQRyyVkxsSIyfZ4FSoy/zTAoBuyTs4ZMODu+gE6bOxRW
	RUCLhhbrEenrl55I5n+M+i7KOPbULeaw5njPmT7DxTacArC7LpdkOYxK0/knmdK/3+RGhsz873+vj
	Zyv8xfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOjDX-006doE-AP; Sun, 05 Feb 2023 17:54:19 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOjDN-006dmM-CO; Sun, 05 Feb 2023 17:54:10 +0000
Received: by mail-ej1-x630.google.com with SMTP id me3so28286858ejb.7;
        Sun, 05 Feb 2023 09:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DphQeSQZJvbNuRjNugbdilolmsiVVgBCD0pCY3YPQUo=;
        b=UqhO8kaPxSnFzaZS6O47he52FqNrXKdSoC1htl4GMBQaXY5E6GnAN7O4oSN1Zm0lr/
         fMCozRC/4M5dRoDVcK3zX9tURfoyPns8HL013E7awa7U3GHtulQdhVhyO8oUTNHKvP4w
         NEYM4i1qHVNm9VgDM3lRcgwOXfqcb2feH4oxKWhyZTbOu3MjZFMwKCGBcKHP3I/z0Aj3
         EJ6Px1gI0bBBTY60jNOurte7EmzfPqlKnG8xJivWjyaLNt27PSv4A6HYDFsMjpyqBtCt
         0D1LgiE0F7aQUVfq44r4wIQwDUXoCcDBXkT9z0fMkTwNTn4PHlGNF0VqISbReH1IHASQ
         55Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DphQeSQZJvbNuRjNugbdilolmsiVVgBCD0pCY3YPQUo=;
        b=RZYvNgE5+ixhU//RrPzoOKRXXYwN3Ni2t2VTekSuMzbx+XLIjsJv6JQ5tAp+G97eGb
         PGv7cLhk34/fTBM0K1AIvuMbUg91M1fnVdBcFaqHiHlRi4WHREKqyKCq7z4GOlSq2xb0
         pBw5EYNdJrnyy0gWYuq/zFmH/M5N2wsegK+J15Ay71DNHMi64ZIlcrOsnQKOViDBdwhw
         lx3QSDKvkBJPnWxSnkPEKIClBWcWZkdAZTLESQrBUs1xBpcQb3EMbbfbwH6uVoG5jda+
         qs43uDgN68c+x5RZdX3bFFDE2zb7kmlMNyMrCrQqiU3gU9LEexTjycLRITPSicrO3ONV
         LesQ==
X-Gm-Message-State: AO0yUKXLjicqOUCqeKDgIYrk12eCAYToMh+VJM9+ZRCced+kc1t8hun2
	qGPzVg330ggRFt8Rf/n/hu8=
X-Google-Smtp-Source: AK7set8R/RpjHz1I9LQp3quAaOb1owfTrxZiV8lwCubfnBO+9DbUGf0wEYJXGGpUazVE7qs12pdI4g==
X-Received: by 2002:a17:906:6d42:b0:87a:daee:70b8 with SMTP id a2-20020a1709066d4200b0087adaee70b8mr14567604ejt.24.1675619646272;
        Sun, 05 Feb 2023 09:54:06 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906248d00b0087a9f699effsm4423118ejb.173.2023.02.05.09.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 09:54:05 -0800 (PST)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Richard van Schagen <richard@routerhints.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	erkin.bozoglu@xeront.com
Subject: [PATCH net] net: ethernet: mtk_eth_soc: enable special tag when any MAC uses DSA
Date: Sun,  5 Feb 2023 20:53:31 +0300
Message-Id: <20230205175331.511332-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_095409_466592_7429B5A7 
X-CRM114-Status: GOOD (  15.06  )
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

The special tag is only enabled when the first MAC uses DSA. However, it
must be enabled when any MAC uses DSA. Change the check accordingly.

This fixes hardware DSA untagging not working on the second MAC of the
MT7621 and MT7623 SoCs, and likely other SoCs too. Therefore, remove the
check that disables hardware DSA untagging for the second MAC of the MT7621
and MT7623 SoCs.

Fixes: a1f47752fd62 ("net: ethernet: mtk_eth_soc: disable hardware DSA untagging for second MAC")
Co-developed-by: Richard van Schagen <richard@routerhints.com>
Signed-off-by: Richard van Schagen <richard@routerhints.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f1cb1efc94cf..b5b99f417c86 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3177,7 +3177,7 @@ static void mtk_gdm_config(struct mtk_eth *eth, u32 config)
 
 		val |= config;
 
-		if (!i && eth->netdev[0] && netdev_uses_dsa(eth->netdev[0]))
+		if (eth->netdev[i] && netdev_uses_dsa(eth->netdev[i]))
 			val |= MTK_GDMA_SPECIAL_TAG;
 
 		mtk_w32(eth, val, MTK_GDMA_FWD_CFG(i));
@@ -3243,8 +3243,7 @@ static int mtk_open(struct net_device *dev)
 	struct mtk_eth *eth = mac->hw;
 	int i, err;
 
-	if ((mtk_uses_dsa(dev) && !eth->prog) &&
-	    !(mac->id == 1 && MTK_HAS_CAPS(eth->soc->caps, MTK_GMAC1_TRGMII))) {
+	if (mtk_uses_dsa(dev) && !eth->prog) {
 		for (i = 0; i < ARRAY_SIZE(eth->dsa_meta); i++) {
 			struct metadata_dst *md_dst = eth->dsa_meta[i];
 
@@ -3261,8 +3260,7 @@ static int mtk_open(struct net_device *dev)
 		}
 	} else {
 		/* Hardware special tag parsing needs to be disabled if at least
-		 * one MAC does not use DSA, or the second MAC of the MT7621 and
-		 * MT7623 SoCs is being used.
+		 * one MAC does not use DSA.
 		 */
 		u32 val = mtk_r32(eth, MTK_CDMP_IG_CTRL);
 		val &= ~MTK_CDMP_STAG_EN;
-- 
2.37.2


