Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC51C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 13:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76AC960F8F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 13:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76AC960F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xfl8ojbZ71okjEv4k3AGTf7A1lSgvQUVIF34JVaubDs=; b=XG9Zo8kA+8Twfr
	JAqjp/K2RY5eJpN7Fz2yEep8lyTmslpAo5ryna4foFDAFablVJKJtN53OcxuqAO2AGWpp5c+IjZUO
	eYbcLsYHG8dTb0pEeUOQ4OUUsUvQcvbFHIn83SfUoHXxaVqMyhyYXMtO3vgutoIQ8JnDYERfDFlpE
	XR6F9XLsYj8/FydS0HDblthA1DO31LflFufWK9/ix7qptO+P1XIdWFGP1zGkUFjD3gBmaECU60yH0
	Tl+711tey/a555QkTX9ZRr+g7q0H7uGqucNTva2W4QaekCWFk1W/P7bRHWJheQ5uts/eoScXVfTCX
	5Z+CCj6sRZGbM+jeWVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAu5I-002q07-Gn; Tue, 03 Aug 2021 13:03:52 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtj5-002hVY-R3; Tue, 03 Aug 2021 12:40:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so4466466pji.5; 
 Tue, 03 Aug 2021 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7Kn6QXEQelFeTJ7+s8dsrUhrZSrqjRMDTa6894wxts=;
 b=BvH79tKxT+NJ46lxOpJ274QfCECXsRyYzb2ZSo1cZj+WIVl03lsEbe9ERzMM0qz978
 dJuZx6U0MV27iFEllkqn5XGMgtEYcyQhGUiqU1M8I6SqqAuYfSrI+TRQnpziyRJNVhhV
 Wp4O20eq8LfUYXWHIaNvopHWaZsFURti6KuVJmJoSrkF+bpvVpv9yGiUg54YLTMfLnR+
 qVXxKLXUG4Msr3wMowoGKN8SlIrrfoS6VtO50LHf/iN1tUEn5/QA6Hk4VDcf8LUvecl6
 PI/Mwimzj40c6bFOqckTw8McfFMMDSSEIf/FAVaMrVXNvlIy64n8tS4dkezRsl1lc5on
 QGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7Kn6QXEQelFeTJ7+s8dsrUhrZSrqjRMDTa6894wxts=;
 b=L9/YvHPBXWPOvtixVJzKBxLU82gbwcYs0BAZF8hYgpUuiEs4ger5ookfW5/1lkQ2Xn
 NorOYOEI8PaQwAGZev1TQn8vUP2rBh9pl3izU9gES5yBwgunweVT0b2EUKBQdbKB3ani
 05CTaK8pESTtuICDarK/euFXklTdaAqO6wUBlp0tEsri0qFSfFc/XklF17l09YZhIEzI
 3NZLOAfZCVGRaQK6ImUchNANOJiAqqGMRjNaLkZ5jfXsVsHNCAwtaTlPSC7yI20y2aSC
 c24ymM9j1oxjGMDjbl5Q6AJ5bgxOxu9PZq6IPuRvWlh5ekIQkIPidc+cJbLGZ6KmWBam
 LCrg==
X-Gm-Message-State: AOAM530+ELhAipq0mqMwSTvb4eB7I3HgvWCeGjFckBmF7G9VmKidRp2P
 N6PVuDoSw5F/VhSHKkKVb0E=
X-Google-Smtp-Source: ABdhPJxp9gFg7/j3CDtrOHNrsfB9FqVBSArVmrXgyH3SowyPhAc2Fu3mBv6qHFQ34Iwgo+eYhe7SHA==
X-Received: by 2002:a17:902:7b8b:b029:12b:8d3e:70e7 with SMTP id
 w11-20020a1709027b8bb029012b8d3e70e7mr18389531pll.76.1627994455018; 
 Tue, 03 Aug 2021 05:40:55 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g25sm15747499pfk.138.2021.08.03.05.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:40:54 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Eric Woudstra <ericwouds@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 4/4] net: dsa: mt7530: always install FDB entries
 with IVL and FID 1
Date: Tue,  3 Aug 2021 20:40:22 +0800
Message-Id: <20210803124022.2912298-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803124022.2912298-1-dqfext@gmail.com>
References: <20210803124022.2912298-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_054055_942921_DDA24F96 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit 7e777021780e ("mt7530 mt7530_fdb_write only set ivl
bit vid larger than 1").

Before this series, the default value of all ports' PVID is 1, which is
copied into the FDB entry, even if the ports are VLAN unaware. So
`bridge fdb show` will show entries like `dev swp0 vlan 1 self` even on
a VLAN-unaware bridge.

The blamed commit does not solve that issue completely, instead it may
cause a new issue that FDB is inaccessible in a VLAN-aware bridge with
PVID 1.

This series sets PVID to 0 on VLAN-unaware ports, so `bridge fdb show`
will no longer print `vlan 1` on VLAN-unaware bridges, and that special
case in fdb_write is not required anymore.

Set FDB entries' filter ID to 1 to match the VLAN table.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
RFC -> v1: Detailed commit message. Also set FDB entries' FID to 1.

 drivers/net/dsa/mt7530.c | 4 ++--
 drivers/net/dsa/mt7530.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8d84d7ddad38..ac2b45e472bd 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -366,8 +366,8 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 	int i;
 
 	reg[1] |= vid & CVID_MASK;
-	if (vid > 1)
-		reg[1] |= ATA2_IVL;
+	reg[1] |= ATA2_IVL;
+	reg[1] |= ATA2_FID(1);
 	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
 	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
 	/* STATIC_ENT indicate that entry is static wouldn't
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 53b7bb1f5368..73b0e0eb8f2f 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -80,6 +80,7 @@ enum mt753x_bpdu_port_fw {
 #define  STATIC_ENT			3
 #define MT7530_ATA2			0x78
 #define  ATA2_IVL			BIT(15)
+#define  ATA2_FID(x)			(((x) & 0x7) << 12)
 
 /* Register for address table write data */
 #define MT7530_ATWD			0x7c
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
