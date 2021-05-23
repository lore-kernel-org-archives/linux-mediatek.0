Return-Path: <SRS0=uBnB=KS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0D0C4707A
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 May 2021 14:52:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F81B6115C
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 May 2021 14:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F81B6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ea6MzIC8OVHy5hzlsHDw/p++PsKoQgpX4lvLdE5BDxE=; b=c3ZqpZTDy6gDMO+LU1Xe5nP7p1
	K2eQ+IXO3vZwuZ3qgBF0+WH+5IvPgrBP4NnGWY4vlMLMaBx5i3oTtnkmDSiLNZ5SXcHzIwFGVEM5W
	Fotm4GGnFioplKnQLEqqRvNhPbtF8Hu0LDAY7V3gAEPk2xCWQGEuDv7bObH1QWytWTYiWLaFQlNoD
	SAqM4T2aIFws2EOQ9cKyv4qIeZUO6+fOEv8Dw8R6ib9K39f+yICF0V3gsyIfybbds3kyWkLl42a3q
	4mDL+A68x9Kgze64OOOu6lBB5eQHB7AzQ7VKhJVCH1Tw7QLf+xVl4jx4wQvCAM2yszZ2iMT/5V+K8
	5vs+WOTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkpSj-004WO5-TX; Sun, 23 May 2021 14:52:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkpSY-004WMs-98; Sun, 23 May 2021 14:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=cMgWw8H94zaKjk8GXFY761R3LLW2Itjl1Ts+vcO3J8Y=; b=D1E7h9HroQWYB8WhfYDI1lREii
 kM1vlN/25a+x3xREzhsqVIUuXYMXawK+bXhtwNzBR3XE22lPCcdMF6Xiuf+dQ+Z0dYCUGChrWZWvy
 RpfmDByBz1opRkS83ycXjCzhensOPaNbCS03vIFci651RLIqXDXdeqyER2sTM1cfgPmgH3b1nxWzN
 7i9dbG7DStPwX55NveiD5YJuenDJz8EzUz647UN38iOkDtEwTcCpb6lo+/Ui6SjEOONfnpqK72OIO
 lunNAzYT14sX8orcL9TeBMOO894dksrPeQYnGL+9ziS8yezv0tMnOsW8ECw3e1jdHE1uXtEA8RdTf
 whtyTppQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkpSV-000TFR-Ls; Sun, 23 May 2021 14:52:05 +0000
Received: by mail-pj1-x1034.google.com with SMTP id q6so13402212pjj.2;
 Sun, 23 May 2021 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cMgWw8H94zaKjk8GXFY761R3LLW2Itjl1Ts+vcO3J8Y=;
 b=IuJ7jSdTq9izzIC9GytSEI1vhjnoseiJ1X38y/N3ptq0Pchy0Y77p/4F7Mf42Z+cIz
 uLbeJg3V0kSX8rt5ERZ5f3XbjxWac635QGosDiV7ykdscs+9dVXduTvaSf+vPHqc8+Bw
 LHSh2M1wlfFGoTVF5JFFWiOKD/7K58X+3BStiOFs+KkcUobp7/3DhyPVFXERwTKbPg/8
 yMr46uD/GX8q2PdyxiVoFVB4XcTOEnFaGZdoftrlscsyNzNgVWW1PuFnIOI7U5LGi4kb
 cpQ6L9TeEi56YtKXPPqZT5gsz1nzhndS0gIVVtH6fWz4I1C+u9RoxxoawGtyAXXKWyTQ
 OtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cMgWw8H94zaKjk8GXFY761R3LLW2Itjl1Ts+vcO3J8Y=;
 b=tZKevcOj6phKQjGsD5uhg6KtqD3mN9OCqAw7qnvy2Nb2nBoC11RpXyAjgdyoagzTfW
 Vw8ixGuam5Ua73/5t4S8eCjM8moV48ITPEjMyvBtWl1KiFRYNra9HAJFVujAOy/WTDge
 iNemx4YEz3300uwXaImVicSt10sooJvYIoMzWlfADDlneGGixeJXDnwL+avJNO/LRFE5
 MOV7lFkkc7insTUbVCCUJYjdCsheebkOSQ/lm6kLoeXSsdRGqE4C/gqo28B5lwfUDcHy
 Kn3ZHzv2yW3s+cOo5OmE1kQj1uJAORRChFP8N1H0F6Vs1tx3lHwwCpSEZiNUUdshkR7x
 3I4g==
X-Gm-Message-State: AOAM531XRUx6bqp0aA6QVOhVQHTZ5vr2DIxdiAl7ocGNXGZTB5klUcAc
 BePScyJxpqrQGkxaoQ1Sl/Q=
X-Google-Smtp-Source: ABdhPJybLP1mV9+33vVAgjPQUIQlLl7AtQ0vGUrCqm+RWoO5g8Zhu7DYAoz+kmbO/MQUiYVtBmCx3g==
X-Received: by 2002:a17:90a:a604:: with SMTP id
 c4mr20766432pjq.81.1621781522684; 
 Sun, 23 May 2021 07:52:02 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id o10sm9237271pgv.28.2021.05.23.07.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 07:52:02 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH net v2] net: dsa: mt7530: fix VLAN traffic leaks
Date: Sun, 23 May 2021 22:51:54 +0800
Message-Id: <20210523145154.655325-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210523144809.655056-1-dqfext@gmail.com>
References: <20210523144809.655056-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_075203_738504_23AC237A 
X-CRM114-Status: GOOD (  13.79  )
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

PCR_MATRIX field was set to all 1's when VLAN filtering is enabled, but
was not reset when it is disabled, which may cause traffic leaks:

	ip link add br0 type bridge vlan_filtering 1
	ip link add br1 type bridge vlan_filtering 1
	ip link set swp0 master br0
	ip link set swp1 master br1
	ip link set br0 type bridge vlan_filtering 0
	ip link set br1 type bridge vlan_filtering 0
	# traffic in br0 and br1 will start leaking to each other

As port_bridge_{add,del} have set up PCR_MATRIX properly, remove the
PCR_MATRIX write from mt7530_port_set_vlan_aware.

Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
v1 -> v2: Fix typo in commit message

 drivers/net/dsa/mt7530.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index db838343fb05..93136f7e69f5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1273,14 +1273,6 @@ mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
 {
 	struct mt7530_priv *priv = ds->priv;
 
-	/* The real fabric path would be decided on the membership in the
-	 * entry of VLAN table. PCR_MATRIX set up here with ALL_MEMBERS
-	 * means potential VLAN can be consisting of certain subset of all
-	 * ports.
-	 */
-	mt7530_rmw(priv, MT7530_PCR_P(port),
-		   PCR_MATRIX_MASK, PCR_MATRIX(MT7530_ALL_MEMBERS));
-
 	/* Trapped into security mode allows packet forwarding through VLAN
 	 * table lookup. CPU port is set to fallback mode to let untagged
 	 * frames pass through.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
