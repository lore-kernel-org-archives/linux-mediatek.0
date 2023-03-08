Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC1AC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JuDmDmY4IV0QLoJ1ArzJ4ijcazQ7ZD0u2S2wBUytaV4=; b=Dl6yNcDebm2rpdywsnXtiUUfM3
	QJcoCp7C3GzYkqKrGZWaOaIZ8dGGSXNFhX36KbZtQ+MN3evrjOaaUCMReTGghj+HeW43be03i9ylZ
	3ftO1drnY2vzKa3tJvA9IIG2c6WSH2ob6g+UX2cpIxZHeRaQ+CioUUDmgQRPYoE/5YaA9Bkvn4pzw
	L8I/X7Hnx/a1uFT0xkJiE16fR928ogwfoblCU4VxlRSi5v5JNtzYB62WPIYt7OPYym8maQ9vZ8rEq
	S9+Y45hBx8ZWLhFVWk6rLcm4PICezbGhQPZtb5R7lbOJwpn5HN12FVlUHjnc0/6g5gQ+e8vM93W9U
	XzE3YRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtZs-0055fi-0T; Wed, 08 Mar 2023 13:11:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtVu-0053QP-2l; Wed, 08 Mar 2023 13:07:27 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bx12so15278454wrb.11;
        Wed, 08 Mar 2023 05:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678280844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JuDmDmY4IV0QLoJ1ArzJ4ijcazQ7ZD0u2S2wBUytaV4=;
        b=Dkuy4VDXieLUfg8wLyjcvVyTG3cxdXmVVcyqAjQzY2ESFnznZGMWvTKoAogOrf1tZO
         7xFIAbyFOk3M03a449PZz9nPzsMnohAks1WHPKOutMHa6yvON9XXqpZkhtj4mhjSDvHT
         qGr9G2v6GtndN9sStm89LaOEeRN8glr2KZYlqUVRc8DjKLZa1zJ5g0dZtwMq4vZ3aHaV
         tNSz8ouiBbvLnReajtgAptfEXBDdlO3tj46vruxT+vCOb/mu5wwLW29zEdvmVRTdd3kZ
         MGBHUv0ZH1sPVkbN+1wH0xCoPsT7v52aAFl9QHEMPSUWsnAq1Ooz0/j7KlSuLQucpvjM
         EWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuDmDmY4IV0QLoJ1ArzJ4ijcazQ7ZD0u2S2wBUytaV4=;
        b=5IZ7og8A6JsDAS0P5fWWHirVHajUcV+IOa36TQe3BjfKq4yRsfjq0rEFxa6OJ0xB8H
         ZT4Yr435EkNFzgNHZTMwvlq7mWR5NOXASwrKwJQdv+/yaNBeVsjJYKXcJ/LKEJlk6lGi
         /Y6YS7wPxzDbYxtlz/Pa0Ngz+lxpd9SSCRyZhubeiC3OjyuydB4V66PniXtR8LFCN8PW
         6RLEm+B6klC5PCssSvFUk9wMntFfbIPaP8vZRFDj7+6iCcgbssrEFE31kxd7Fsil7U09
         rkt5yFY4fJBWze6GJ0ln9jdoiNHsrlNiH7MMKkBvgx7UJ/pN/U3X+tfvRSQkHRF9E5yU
         JuBQ==
X-Gm-Message-State: AO0yUKWQAhrE//R2PHCRAHK4+ql69cnPVgExdjCrNztwFiyX9BgnVegZ
	8nSHPvDkH1sdN5upCL2BzH8=
X-Google-Smtp-Source: AK7set/96yytF4lJdh5dq0MUq0uqJPsADOci+FXLCWrgSJ+F8EsYh8DcDuDj9WyArHHVFVjqlneYOA==
X-Received: by 2002:adf:eac7:0:b0:2c7:161e:702f with SMTP id o7-20020adfeac7000000b002c7161e702fmr12307060wrn.47.1678280843674;
        Wed, 08 Mar 2023 05:07:23 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d40c3000000b002ce37d2464csm11461328wrq.83.2023.03.08.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 05:07:23 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 net 1/2] net: dsa: mt7530: remove now incorrect comment regarding port 5
Date: Wed,  8 Mar 2023 16:07:14 +0300
Message-Id: <20230308130714.77397-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_050726_165634_D0CC48B8 
X-CRM114-Status: GOOD (  11.90  )
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

Remove now incorrect comment regarding port 5 as GMAC5. This is supposed to
be supported since commit 38f790a80560 ("net: dsa: mt7530: Add support for
port 5") under mt7530_setup_port5().

Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a508402c4ecb..b1a79460df0e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2201,7 +2201,7 @@ mt7530_setup(struct dsa_switch *ds)
 
 	mt7530_pll_setup(priv);
 
-	/* Enable Port 6 only; P5 as GMAC5 which currently is not supported */
+	/* Enable port 6 */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
-- 
2.37.2


