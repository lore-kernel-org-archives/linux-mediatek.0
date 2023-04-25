Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A6EC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MATvTsgGeOmEQ/GANoUT20RiIWs3kO1MdMdepZzbt0=; b=dx2CubTgwRlTw3
	7xeO9IWjYqH/cMvH3aBj84tHnOfaYyMP9yJfRLlsw06IKkLb1VPSornR4AHnR+Ie8IFzo3RT5t4Vf
	1teSBI+tw8LSW0MLqhSe5Lrmlqf5VgxqOhbg5KRzBOhMNnPm8pyeJN99b+so8cZe70Aaa1iYEShYH
	1h0TbNN198Liw6Nw8/b/72OaIXUSLj4R9CEBAlpg/CsFJr1/bU5htLrwkUPhsClsC4TfASc9pWcZb
	zEp/Ij7HslBD/xW/e4xPZEub5ACDLSTl5S0LhbG37tnRUAv6bkjTtBTTJ8F8XeTjBEogOrAXqGkyu
	1uvLQqvbi+eRaPZu1KTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE5C-000Vgw-0m;
	Tue, 25 Apr 2023 08:31:30 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4L-000V06-0s;
	Tue, 25 Apr 2023 08:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4MATvTsgGeOmEQ/GANoUT20RiIWs3kO1MdMdepZzbt0=; b=VCgtKq2KJH4yEIE0L+Lm3CAdz7
	0j3Jrw4/9UDzPmqYjnVlehIqN9CPNFqrzKXRbk5/J3bd6tk8qlwkNN5PwFwmqEJ3k9PUM+//T24KB
	LHF3XTfFSOXUge8TsR5mt2upGcZlfX0gSNrApfXKTS4iuWCN/YTDy63Nu64Aa+rlID/moKxIXjT+i
	ngpxpUcgP3OQ7vygnGmUZpTaGm8tgnkMvkBNQaED9ULnQiY+6FXlnpWNb01K57G37rdLNU/kXe8Ec
	4DYtxwN1yuA440xqRvY9JHSdUFa1q2jzwiabHJxMU63Sy7RLcsVyVUGPHhfw7JCetH0Opza10/QnN
	qhC8OG8A==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4F-009ZwA-0z;
	Tue, 25 Apr 2023 08:30:34 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-956eacbe651so958824866b.3;
        Tue, 25 Apr 2023 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411427; x=1685003427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MATvTsgGeOmEQ/GANoUT20RiIWs3kO1MdMdepZzbt0=;
        b=bjcPp1ixgcYS0CdsMEKFpoRu5Vl9iYehRJyOq+x3P+aPBuYpVbrBkxhDE60ijZq4Cn
         jsAE6U7+b2vCL4yZJg6hDCZrZkjgZXqD1Fk+FHc30mWrtj31wfLnjVvbNfceZ7xwlOE9
         dcVL9knnSHgtpJFYrObMrkCAWBD0JhQJKWW2VmvOVEg7E7XuL0yCSc6RKFSPmvlVamG+
         ztYFGQInl27UNENF0L6JukJ63mBAw1u1lZE+RxMDKVeZNrVOXIbsAOVAE8t0rpzFF/j+
         CZhTBxMbN5iW0l+3973AX/+j6/Z0WSfZ2qxvPR5aXn/3v7Pfi94NFbkeQbnDROUntJoU
         DLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411427; x=1685003427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MATvTsgGeOmEQ/GANoUT20RiIWs3kO1MdMdepZzbt0=;
        b=h6MaNhyXvfQeBjnV+YOSExbFpyujQRxEe51ngkMPuFNCdTR78b/t2X5cXoJQZoIewD
         nWphXLiFmG5JOG1Kf2jbCBYEw/FYX5TLI0tbz1XITHuhVuKupo3sSbiT4751fzzM4RCR
         MyAS8V9SjuQmqIXsJwXmoE9GYABPcqeY56zlhIcKmmii3CeP9xFeGRdCuu1n6yrrfpQz
         vRhNroywQXbj6rmDbN+uerzGxqj+P5jRONen27J45WlVosDyauUerdhM9ei1gsRubR/s
         6qXpSPSvM4UpQPao7wcvFT3Jdncf3Ut2bmekrWOcV76XxQIG+qxUGkqsrRCQKC3IG9uR
         hjeA==
X-Gm-Message-State: AAQBX9fV0qELwk3evwpO/k/GU0QXx+7/QjQIG6g/6gePuRXZJ7AQ9cEL
	tP7A5asjUBPtS120rKUCesg=
X-Google-Smtp-Source: AKy350Ym3aXZPGeAbGZAmIl+ZSX9R9HZR20W6VN0rTWWg05z4lCRUaNGqdiq7x1Mun7p5ti0Rr6aog==
X-Received: by 2002:a17:906:9bfa:b0:94e:c4b:4d95 with SMTP id de58-20020a1709069bfa00b0094e0c4b4d95mr12322934ejc.69.1682411427432;
        Tue, 25 Apr 2023 01:30:27 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:26 -0700 (PDT)
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
Subject: [PATCH net-next 14/24] net: dsa: mt7530: move enabling port 6 to mt7530_setup_port6()
Date: Tue, 25 Apr 2023 11:29:23 +0300
Message-Id: <20230425082933.84654-15-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_093031_567568_DB249BA2 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Enable port 6 only when port 6 is being used. Update the comment on
mt7530_setup() with a better explanation.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 04a48829465c..980d59170ba2 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,7 +404,11 @@ static int
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal;
+	u32 ncpo1, ssc_delta, trgint, xtal, val;
+
+	val = mt7530_read(priv, MT7530_MHWTRAP);
+	val &= ~MHWTRAP_P6_DIS;
+	mt7530_write(priv, MT7530_MHWTRAP, val);
 
 	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
 
@@ -2224,9 +2228,9 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
 			   RD_TAP_MASK, RD_TAP(16));
 
-	/* Enable port 6 */
+	/* Enable PHY access and operate in manual mode */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
-	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
+	val &= ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-- 
2.37.2


