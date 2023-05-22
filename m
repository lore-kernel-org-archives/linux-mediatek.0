Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1A7C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BR4WaMfs6beJCKcHWOQHHYOIrYTJQ7SOSyqfSGCZK48=; b=z5EaEu6waRmPEB
	puWmEAliDhkH09zh6yrU6rSRvtuXLD5kRP3F3I48LJmrtR2j2vSGiXEWLzFXFa2wsdeYmharJ5C+k
	Pu7u3M+zwZgHEVgN3B4DTH6+4+5nNplTTpPBke8xDmaxGkrhsX4VfBeensseI2ugXzcmynKE424Eg
	9hHEX+VI/qRzAFpk4bO36y6aea2i7U3y/edEEuOsQPiHdF51sgyJPPzS7rzHBZQfUT032qNw1kclX
	hmJiZ/HYfewwYPwkai8uH9iP/P2THw+hjwyX9vYodieyHSyzYD4x3sLes3QkucUUbQNWyIuDbEFpq
	oNcDtCIU3KLyVmqlyFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Tw-006QPN-0n;
	Mon, 22 May 2023 12:17:44 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TL-006PZw-2i;
	Mon, 22 May 2023 12:17:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-95fde138693so719508166b.0;
        Mon, 22 May 2023 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757827; x=1687349827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BR4WaMfs6beJCKcHWOQHHYOIrYTJQ7SOSyqfSGCZK48=;
        b=nwiwhL23+3X1oPllcBS1eFqvx6YOW0qrnjo6coLOpG+/Db0N6PmxOO20Bgw4/Ko7jC
         NNQFp+/ri7bHwwBz1/mJDxdeV7ipq02QonFCuub9e8XWjjowcJenASuiwMeUCw7AmKBq
         ZTd7O2Nbd9X1aRA1nGMwka7Cu/XaR7hXZxF4WzI+1gTuK3kFppDxa5C+QUxNnmp8L49h
         ZRJepRgXz5UXIkIh9T2ToZJIfwb5dZYtSxMf994Xd1X2OO6S6XpTcyUS7S7P1o5LreyU
         Nv87UeNeTA4S9RSGc5qa8+EULyB46WbQOvE5VuO5jQuqp7gNlsRVEegDRBiChqB+ds3h
         IhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757827; x=1687349827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BR4WaMfs6beJCKcHWOQHHYOIrYTJQ7SOSyqfSGCZK48=;
        b=ECZtvzK2RxzKSFS6meLn2Wm6P8YmCoGqH+03U9uGHXAb5sbDXNxDh2X9ukI4bz5vZL
         twbcQTb2Vrmdc9nUafHVwXVyGy4X1ZXwVNKzJekuEHm073Wz5QgSP0NaRlAvmc0iYfWd
         jlFBPon7e5/ZkdWq5hqrXPjPWv671bW+9CSEKUGKXa2+DVeANs+AIynNo3bJYoMrT8mv
         YX6ZqQtPIDirJ/5NSrdLIs0mxf7DEAXLxKc4PYfNyUABoeBUdmm2m36fW1LT4TxePJw3
         nTlEjOR6z7ybXwG2gHEVodl2wwehc4917Tosv7sm25KVF09NZLvTdTwFNOI2l1YhejbK
         6iug==
X-Gm-Message-State: AC+VfDxWYtFxXpiRwhRI+Enc+dznY0Fvevsu2+xyDUZaR2dyXmPQ0sZ+
	KU5HCEPt6jHWk0hC8ZJiGV4=
X-Google-Smtp-Source: ACHHUZ56qzah9yxHVqSw1YLNAtp+w9qL77H/bmaw8t3TgdQHUL42y3kfN0W7hPVk5MauUttl9OVMrA==
X-Received: by 2002:a17:907:7211:b0:96f:8afc:b310 with SMTP id dr17-20020a170907721100b0096f8afcb310mr6981274ejc.3.1684757827140;
        Mon, 22 May 2023 05:17:07 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:17:06 -0700 (PDT)
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
Subject: [PATCH net-next 27/30] net: dsa: mt7530: introduce BPDU trapping for MT7530 switch
Date: Mon, 22 May 2023 15:15:29 +0300
Message-Id: <20230522121532.86610-28-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051707_926325_72692DCB 
X-CRM114-Status: GOOD (  10.52  )
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

The MT753X switches are capable of trapping certain frames. Introduce
trapping BPDUs to the CPU port for the MT7530 switch.

BPDUs will be trapped to the numerically smallest CPU port which is affine
to the DSA conduit interface that is set up. The BPDUs won't necessarily be
trapped to the CPU port the user port, which these BPDUs are received from,
is affine to.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index cd16911fcb01..2fb4b0bc6335 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2223,6 +2223,10 @@ mt7530_setup(struct dsa_switch *ds)
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
+	/* Trap BPDUs to the CPU port */
+	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
+		   MT753X_BPDU_CPU_ONLY);
+
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
-- 
2.39.2


