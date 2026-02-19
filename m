Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E828E9A02C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MdudKsxJgB33L76Fge1pTGodtda68bmO9AGfbuk2GE=; b=VM3Wm0zRmgE0vINzSH3j4pFUmm
	/plh0aU+fsWe3wkEfIawwcLZt0R8kdB5kQuje/oq+SiMuznvbSaKEch9El/xcNcwwm+vfJ9gjpRLg
	e3ZAdqiNCH6We9sH9Rv2oUrEAA6kRFglnqXt2Ln4MDjKla55xBw4m50U9pSiwVEm7fLqiJu7fM9EQ
	AQ2q64WLydQrgOpEvOyo6s7IXmfX/b8R9y4U8ZMXuI7oj4oJ4d6YVI0TquGjB2+f6MM8lVofdxvPK
	OTwLljtfu4eQ2rwenqnzT7vHhrFOZIojWXpCMfVx96hvuzwyewsl1JWVUNWd4gwilKZAFHUN8+TBR
	srhfW5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5b-0000000AebJ-1TTt;
	Thu, 19 Feb 2026 00:40:19 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5Y-0000000AeZu-3Fxc
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:17 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40f20af93aaso167494fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461616; x=1772066416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4MdudKsxJgB33L76Fge1pTGodtda68bmO9AGfbuk2GE=;
        b=WqyMzYu769AyPZOk0/EHNWP9QJy2KR4sPpA2mKd6Z+huQkDw1XAoWGHhKTeXvc2Pjp
         N+bv7SSe0Y4eM6IbAKNjbbOwn1ZZJXGL9ihMW6mVp4h407KCMvnq8q5Lu9k72jKUybhg
         6hTNqCau20oJfS27vanmi/1Ah7+z6B5DmyrdEkjS0qgrlWEJk9o/p+WSyIFn2gNdJ+t4
         g/ntKczm82Q1Dj1+vaUMjlrJFN9zDdKTlM/2z7fZRiDWs5T2tldlOzJP1NXvj2i4VLrs
         4g/r31wFEnLLJJkvjeyvWn+cK4T7VJxmQWtuGxSyJXSpZaW6AjhC5duFZ/bdsjtzhaWT
         x2ig==
X-Forwarded-Encrypted: i=1; AJvYcCVyiHhZhUgr0IxcltOecJ71FDzA40voJus6kCV+GPqAWXivaI35qKsej8mzwiLyBrfiieElb/IUxfSoFe/lTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs5OvQ45pFg5+2chAlxo7DAdFGWW5ie4VUY3X+5N1TkNWO4qSO
	oHBlMebSQZlyJ2+8mW/Yib8kjcaV540t3ezMTE5EPsncyTN5Mpd275DL
X-Gm-Gg: AZuq6aKWqItfizEUH9DF/mHKB6Ci639D0nKIO+x23Nfa73LNDYBZfb1u+G3DM/iFFim
	0zOgRlRzw87N7kbtAh0Wui/iF+Pi4KikrTu45oZiXDmLMjsMa6FQAHCvwGZvPx/gxQLbNwCyGgQ
	E1PQQCEtG8eto4OkSx7/u2chN4Ia/3ShDdUKPhvPeZwPoNRQhWZB22k2jPEE7kQvpR1YstByVWm
	Zk7RIF8UCSJqXejLopK3xuH7auNIP9x1JwKeM9rogS2GOyc4nRvgFIW8+mIsQm3topomE2yXXBc
	GV8X/jbxKpMFqNqTOG/lBDwB7VsWMRh2vsQlE/KkDHt7PP8Eekj4zZm7wgk7u7fb03rYhF4O+m8
	khcmLTGnrZFrrE8te82+27jaDoeQWACuGNtjxtpsDPMvdiXcr9XI9/da++KvSPcOYwyWdpkatNG
	ohIiXy9xQ1ecEtJj7Z55VOiTuNFx5ktUxI2S1CMS5U1dq2qPY=
X-Received: by 2002:a05:6820:883:b0:679:8a1f:99f1 with SMTP id 006d021491bc7-6798a1f9b05mr5268000eaf.82.1771461615994;
        Wed, 18 Feb 2026 16:40:15 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:14 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Xiong Huang <xiong.huang@mediatek.com>
Subject: [PATCH 03/11] wifi: mt76: mt7921: handle MT7902 irq_map quirk with mutable copy
Date: Wed, 18 Feb 2026 18:39:59 -0600
Message-ID: <20260219004007.19733-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164016_817175_D7BB4FB0 
X-CRM114-Status: GOOD (  10.27  )
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

From: Sean Wang <sean.wang@mediatek.com>

MT7902 PCIe requires a different wm2_complete_mask value, so introduce a
mutable per-device copy of the default irq_map and override the field
only for this chip. Other devices continue using the shared const
template.

This is a prerequisite patch before enabling MT7902 PCIe support.

Co-developed-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 65c7fe671137..5f857a21f362 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -327,6 +327,20 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	dev->hif_ops = &mt7921_pcie_ops;
 	dev->irq_map = &irq_map;
 	mt76_mmio_init(&dev->mt76, regs);
+
+	if (id->device == 0x7902) {
+		struct mt792x_irq_map *map;
+
+		/* MT7902 needs a mutable copy because wm2_complete_mask differs */
+		map = devm_kmemdup(&pdev->dev, &irq_map,
+				   sizeof(irq_map), GFP_KERNEL);
+		if (!map)
+			return -ENOMEM;
+
+		map->rx.wm2_complete_mask = 0;
+		dev->irq_map = map;
+	}
+
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
 
 	dev->phy.dev = dev;
-- 
2.43.0


