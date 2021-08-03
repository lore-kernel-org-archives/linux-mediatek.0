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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1165CC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C35DC61100
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C35DC61100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8VZshXv9Sq+NCV9ey3VmXlOBGYQ4nJ5PI+hHsZkIxI=; b=rv1NkGBXa5thu8
	YZaSAlwEhqmcfHurNb5WOpZ2WduYJrbWNQk4/utcugXEjzx4+GCpfg1q1VE9atdx4pYzoRk41OSZL
	d7sPHBvyu3yFagfoFG+ArYopkVGSa9cicktZn1q5Lze/kpZ0iHztgGiRw+aheoN3yDpgIh7rVusOj
	jCL6WVTXmaw24dVGyMap+OHpaE9K7v5Sr0Vnl/iuceShMdCoYmzQjOjdYgbnH1lWg/vr0tvo4LMI7
	xRspOb2jyB6KJ6OYilNPS80YvIdnnnhGIFlwak5w1KAdlfklf8KCzC9qivOX60NHy8RMrhqTYyu9A
	zPwykcgu1awWgMq4+fAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAwvA-003WvE-0l; Tue, 03 Aug 2021 16:05:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAwuL-003WVM-0L; Tue, 03 Aug 2021 16:04:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id q2so24273085plr.11;
 Tue, 03 Aug 2021 09:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8uiSeD2OkBp9zNpUDtNBLvudtMpehXughyaF6cE7kWE=;
 b=HI/RNgsTbqZEYCiV99s2NdnzjSSL+jfEFNFwt9FPZJ+Ru6ksZeQK6DBubeeiqi8Nul
 RmjCDvqRoFbmQfnMP5QlNwwFCceSlVwmwDF45xDsL5gR77eoei+zQMAFwg8umjkmZ7Hp
 zb4gX8VrzX0VQ1V8m1tnb0+3e10Nyt7N5WxyY8RzdQZFBtg0HMFSYKA6JRaP30Xx0VKU
 ZhYFitTn78WccAQOmO9Bp/vm4B1nspHMVV2m19O2sKs6Vn5sOuYoI3o0D3YuPrxGA0Tw
 6MR2MQUmgaBq63GbpLiDQFYCEFxWj05lL12rhWQVKFz1cbvbieAg0cn+0rHw1RZE73AG
 3hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8uiSeD2OkBp9zNpUDtNBLvudtMpehXughyaF6cE7kWE=;
 b=O/VDcN8FPzCa7X3h1zZkV1YXn1tdF2TLnEqF3yGYM/OPY0/535flfHzaMAyQFY5pIl
 Ga34YUzVqyT+Qy+lSEXul2qrUTgov3gILIYDyR9MUj6Lf3ZResPZ88WUQRGynoNzYHuV
 F2VMjHAJTPgF070kSbAgk1MNbeWkB1cjbB9szSkNVp/w3FqvUKNrV9bGcCVSS+ZjHl94
 71qqgez8JNFZiXS+7aIvyUZwQ/KHe3tO5yW3AMlU328rTdVV3WLbkpfbYzJz9wrJgjnr
 CjcIMNoi4qVaA4JbiGfQo+0wHe+/g2ZRbyxYBVin8TvGbgMRPzHtBVUQvvYxb0BDdgpE
 j9Ng==
X-Gm-Message-State: AOAM530z2nbfHcYfWWZ55VRos/AP4LEQ97zJbnXlo+P7ze93nzSwEkix
 kd0RxdLJnAcs8e7o3nqjO7M=
X-Google-Smtp-Source: ABdhPJw+fGGwGF0JHyEBaBOf/DvOOVRTxWlUrlvdTntEmvDFQ41cynm/vgr3kcX399C4DfTcv1ip5A==
X-Received: by 2002:a17:90b:344d:: with SMTP id
 lj13mr4940643pjb.24.1628006683927; 
 Tue, 03 Aug 2021 09:04:43 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id y6sm14390653pjr.48.2021.08.03.09.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:04:43 -0700 (PDT)
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
Subject: [PATCH net-next v2 4/4] net: dsa: mt7530: always install FDB entries
 with IVL and FID 1
Date: Wed,  4 Aug 2021 00:04:04 +0800
Message-Id: <20210803160405.3025624-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803160405.3025624-1-dqfext@gmail.com>
References: <20210803160405.3025624-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_090445_095971_8FD9BB3A 
X-CRM114-Status: GOOD (  15.14  )
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
v1 -> v2: use FID enum instead of hardcoding.

 drivers/net/dsa/mt7530.c | 4 ++--
 drivers/net/dsa/mt7530.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9b39ccd9dd4c..385e169080d9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -366,8 +366,8 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 	int i;
 
 	reg[1] |= vid & CVID_MASK;
-	if (vid > 1)
-		reg[1] |= ATA2_IVL;
+	reg[1] |= ATA2_IVL;
+	reg[1] |= ATA2_FID(FID_BRIDGED);
 	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
 	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
 	/* STATIC_ENT indicate that entry is static wouldn't
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 5b70ccef9459..4a91d80f51bb 100644
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
