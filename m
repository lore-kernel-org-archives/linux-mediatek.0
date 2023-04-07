Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6741EC77B6C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrhVwFwdiy8PafsiMhkpCPuLOjFFrIY15KiQQTf11aU=; b=ArQrdT4apXs3x5
	eQ+QgneGDFnP0pyt5BRouhe9HbaZsqFE+NeMvyllzLx1OMQH5z7RwB/PW5wRE11wR6ME7BpIPLFmT
	xqnqtHKcJXcMSws228a5AFD1XtbnxOIruzq0XIwzN6vy2ntlQCXC3Xysphmx37vg2jAGz5C27xEK2
	rcgGmn0ZoZYMSKbMJlr2+ayHgDGiw6aF/B/4XOj1pyCzZaKZOCzgvJ5Pasedons3kvUW/bguHlZtB
	IEHhgD/1Crhg/zb5ANl9qyQkZhqcMYaGPqdyHxlR5IyDWuwm4atsmwygfockRdi/MA781TuSrO4Sk
	JevpccQMCXk+38u1mU5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmRb-00AOMK-23;
	Fri, 07 Apr 2023 13:47:59 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmR8-00ANkv-17;
	Fri, 07 Apr 2023 13:47:35 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54c17fa9ae8so76379007b3.5;
        Fri, 07 Apr 2023 06:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrhVwFwdiy8PafsiMhkpCPuLOjFFrIY15KiQQTf11aU=;
        b=AlfANMoRb9wyGOVs2RriQZW0B3V9w9QT6cgDWHACfUH0Gc99k6HjBBOrTrCQ7H/Sup
         FtVlxudRvwdw/8k9ZgBfiAUVUHDajsYWyZHM+rraiJfNu0IZZN+WozE4dO2haxVzG1qD
         HTfmzxe0S8jLZET6Mz5Bi+an889FlHW0Oc8S3zSYeJWnCzvNbYj7m/DNuVNy9JBoU0GS
         3BM+NpMu+nS7jz/vCRfIu+B3JD1diEYGtS9f2awXFNXCpzDHVdbpMyJgUw8aVjURRJRy
         f5vfcCFcSeYMIboIWtoJ8TOume8J0AV27BRfZbR6ttBQcdF77r6vA/8i7Dtlh4/R2w2M
         xQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrhVwFwdiy8PafsiMhkpCPuLOjFFrIY15KiQQTf11aU=;
        b=nNPdA6XkbjQNghVsTy9wqXChDEK8MI7rsW+qXw0vv2zFonXshi9zvWEnw0vYvGpSv2
         QtB9ulRaEhBfVqC4hlwxqWq6hE3iKE//W9tli6BTatol4Vjf0krQXorLx4dThRzcNe/h
         iKakyguIgn0z7AgbzU13SOSVMKM8lfJUrz/sUY8EdsfS831gYo0dwpxDVBrys3hiTVVr
         CWGZmQsEyarG56Z8rgDLx1GOILFWPtFGkRgBnalUsrd6KmPEe3pTpYVLv3eyqbr4rtSj
         NC4ptFlQLXpRezWLE689XOJKa8w9F4TfbJyCs2A7UVmV88k/HMiBAC6zunuxflQM2Wjj
         2eNg==
X-Gm-Message-State: AAQBX9dhBsYnFTkWqPBVI0vKI5iJC4keC0tnkxhTWESCgZzSKRbvHFev
	vCMx5HNPuHPaqCj6YR4jlHs=
X-Google-Smtp-Source: AKy350ZRgyDFHukSn+0MW323t7p6FhxtWniWWbqWmcv8+P6ybWeXqdm/ISnIxoPizJaso4aprmfGhQ==
X-Received: by 2002:a81:9444:0:b0:546:3229:cc04 with SMTP id l65-20020a819444000000b005463229cc04mr2012517ywg.52.1680875249739;
        Fri, 07 Apr 2023 06:47:29 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:47:29 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 12/14] net: dsa: mt7530: move lowering port 5 RGMII driving to mt7530_setup()
Date: Fri,  7 Apr 2023 16:46:24 +0300
Message-Id: <20230407134626.47928-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064730_743805_936307A7 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Move lowering Tx driving of rgmii on port 5 to right before lowering of Tx
driving of trgmii on port 6 on mt7530_setup().

This way, the switch should consume less power regardless of port 5 being
used.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 384e601b2ecd..6fbbdcb5987f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -956,10 +956,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* P5 RGMII TX Clock Control: delay x */
 		mt7530_write(priv, MT7530_P5RGMIITXCR,
 			     CSR_RGMII_TXC_CFG(0x10 + tx_delay));
-
-		/* reduce P5 RGMII Tx driving, 8mA */
-		mt7530_write(priv, MT7530_IO_DRV_CR,
-			     P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
 	}
 
 	mt7530_write(priv, MT7530_MHWTRAP, val);
@@ -2227,6 +2223,10 @@ mt7530_setup(struct dsa_switch *ds)
 
 	mt7530_pll_setup(priv);
 
+	/* Lower P5 RGMII Tx driving, 8mA */
+	mt7530_write(priv, MT7530_IO_DRV_CR,
+			P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
+
 	/* Lower Tx driving for TRGMII path */
 	for (i = 0; i < NUM_TRGMII_CTRL; i++)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
-- 
2.37.2


