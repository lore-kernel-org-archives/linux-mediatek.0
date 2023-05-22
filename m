Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47E7C7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=of7dhH8J3ho1PfuXe76W3u3tJHukqwcuraQIJQcYN60=; b=AmmOMQjupUFH/h
	5noy5pDLrDjRKmnr3JVF/dbcg8e37Ia85+YLU8oLfO4l10T/J1QmwXBQCZ0ljwlIH7n+Rk48+W4q3
	Sr0mGW5WfsSlCjAgo311ccB6gMc+fKOrdk27tE/14N94OYbE0Nwbkc8r5JMTlLJLWtMjJO6huA8cP
	Z8OpEy0gsmXrvsYVjMWEwHj0W07/o70/MowfCn+LrludgXHCFRoP/jVmhLU7BDGYuSQ020w67wbpn
	6A5vzEtkqoKoto67+1Lv2ZH0jI0Gas/ILFlMJmy7H0eL98VCJ5B/lLLKeS+bTvsFD++S3/75gfx1D
	9e+jbog2zc2EZ2rd2R9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14po-006WK5-2U;
	Mon, 22 May 2023 12:40:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14pi-006WHL-2K;
	Mon, 22 May 2023 12:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=of7dhH8J3ho1PfuXe76W3u3tJHukqwcuraQIJQcYN60=; b=eD0dbjpJnF7mEa7m6ikF+9FU2e
	4q2wlZuJUfoJzZ2zZcmOAKvXfgKnXjEaRjWnYZQu2S5nYZBchrRKrFLvvOSqO7G0nsx40sbZSSFD4
	vZY5EGqeciSKnyNMjQxiyzafNTPa7w0FvYjBo5Y71eOiYb4ahfwIc5fvinJDYrttFkxC+aatXKnsJ
	H01zh4Qsj4ghqsi3O3lsAw1xUqroXZ+4TOTHgTqvQ4+dpL576LAB4tMSH5TdSq9eRiKOJlg0y9ZoY
	jI14NgDQLMOgiac/CKLHjBr2mcrRwp4AQpYFjyUO30flb/MOx1C0L88s/XCaBvX/tYyAfRIxqPbSk
	F09dRj3Q==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Sh-0021m6-0m;
	Mon, 22 May 2023 12:16:28 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-96f6a9131fdso487364066b.1;
        Mon, 22 May 2023 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757785; x=1687349785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of7dhH8J3ho1PfuXe76W3u3tJHukqwcuraQIJQcYN60=;
        b=qWTaVgWkUzAJ06YY3hTPNp7zErtB8/KIq1sA0UBFKANHLaNi9kTWG+Iexjhx7sRc7T
         CUf0F+oRPCaTCziA8nv9p8qnq6S4K24BbLoTxpLz7Y1Z0XoRJmOkAUwHZy+2qDaIqbMd
         mIse49HGrVml3HYhG4vcUKquF4PmGXv7Fi7QEpUx/SvXtNIaYpNQiatHJYY+o7N4A8Ss
         zx2vZKFl88Z7svGALWMdOnDStY+Rl6aupg/ESSpiYsi9SUg2Q6mXgNIYnm0CG186vd/9
         CmhaR795SFKc8ntDNgXSJRdiQ6JJJW8BhviqYiMFe7E8IK13/+pRazkfFYUeqV+BlgRz
         m2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757785; x=1687349785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=of7dhH8J3ho1PfuXe76W3u3tJHukqwcuraQIJQcYN60=;
        b=V/92BCnC50Ncxzj6hNqFqK3HH0aSdM5LQnSAqWLq7LwNFMHq+QUMO0HLTc5s2jGzyf
         oKdJ4ep4FXvbggW7hzGqFCAU5DErz6/nEM/f03sEwgqwc5CfHqwnzJWFjUhCOt38EE32
         33w/QNnyczJV4Fh4H155ZOrg/tduQCVxg6JsZ0uJdLh31SdRG7g0fm7Lj6LNgjnah/Gy
         ABvTvz44YYlYZJ2ivBG09JHwHqyPRFZes+jMxpjfTMKpNlO4w/DvHLkybP4TemODSoHS
         wO3ABSNyRTnxIC7IgzxicnvXuKGzG2YbqYHvPxx8YvkD5GTkm7m2a2tKxKdQ+JF5b3oL
         zMzQ==
X-Gm-Message-State: AC+VfDx8T83uQI+RUSVYphfuRHlqA6CJD6Ptq/QUomadegQWC1RPwSKh
	fYDc+Nu8u0SOt5AjYtk8CxQ=
X-Google-Smtp-Source: ACHHUZ5iPQRvAzfYeHS21dOJr4kXanM4mzWwkMni0MAf/pp0FexpqhAICo6YCIZpRsHeEJUcw9e59Q==
X-Received: by 2002:a17:906:5d08:b0:961:8570:4589 with SMTP id g8-20020a1709065d0800b0096185704589mr11089592ejt.30.1684757784983;
        Mon, 22 May 2023 05:16:24 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:24 -0700 (PDT)
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
Subject: [PATCH net-next 13/30] net: dsa: mt7530: move enabling port 6 to mt7530_setup_port6()
Date: Mon, 22 May 2023 15:15:15 +0300
Message-Id: <20230522121532.86610-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_131627_321556_0EB230B4 
X-CRM114-Status: GOOD (  12.36  )
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

Enable port 6 only when port 6 is being used. Update the comment on
mt7530_setup() with a better explanation. Do not set MHWTRAP_MANUAL on
mt7530_setup_port5() as it's already done on mt7530_setup() beforehand.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index fa48273269c4..47b89193d4cc 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -406,6 +406,8 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, xtal;
 
+	mt7530_clear(priv, MT7530_MHWTRAP, MHWTRAP_P6_DIS);
+
 	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
 
 	switch (interface) {
@@ -897,7 +899,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 
-	val |= MHWTRAP_MANUAL | MHWTRAP_P5_MAC_SEL | MHWTRAP_P5_DIS;
+	val |= MHWTRAP_P5_MAC_SEL | MHWTRAP_P5_DIS;
 	val &= ~MHWTRAP_P5_RGMII_MODE & ~MHWTRAP_PHY0_SEL;
 
 	switch (priv->p5_intf_sel) {
@@ -2221,9 +2223,11 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
 			   RD_TAP_MASK, RD_TAP(16));
 
-	/* Enable port 6 */
+	/* Directly access the PHY registers via C_MDC/C_MDIO. The bit that
+	 * enables modifying the hardware trap must be set for this.
+	 */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
-	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
+	val &= ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-- 
2.39.2


