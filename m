Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB44C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 15:37:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C7D206A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 15:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NtwsgZf7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBgky68X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75C7D206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=whbno8rgyH/bslQzvY07Kw8f/MLNbRspuPB9yzzrlaw=; b=NtwsgZf7pNeJ0G
	kVGpY3u1u7UKmT2R/heR6RVzOthRIHIE+91H2SA7KYo4dlaSkrnws1P0oCn+RzO2Gm1Al2bDE7tDY
	CT9hrC7LKl87GxUBH04MNOIJoN5dXs3HeZ72iFratDqCxYad8titkuWEbKCyIY95cE6XbrPazJURk
	9dPnGNUbmsfhunXcscoJkTCTeSyYENuuZqQ2Rv7qsSFiuvLbjvRbZm8JucGleaC/VyOyk6DzOZG98
	f1yj5gRUNYfVE8n55H6iJkytg6gg0QIMoXXjsiXCuR4fX+4+EwS3r4y4IFHESba8hgsyzRDdE+WDN
	c67yN2f4l7rNhgng6nBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYtRn-0003Nr-Gb; Wed, 13 May 2020 15:37:27 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYtRl-0003NH-2X
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 15:37:26 +0000
Received: by mail-pj1-x1042.google.com with SMTP id z15so1945131pjb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2020 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=teVaLV/rr2slg0+EE8xbo9pK+8YB5TTaKHnzrY09DfE=;
 b=QBgky68X2CAvUfLAoG58SWnKsRC6xFLSBnKtqe1hQLrtMoYLr4TR8Dj7nfwQEO4UAB
 h4vnfEjCbPq5cNiKe58Y5Vj4DVYTYobOf4YerhAuiXRV8OHS0SeYIO38I7KNjoD2spoR
 CZLYX1sLHl56OZCZ9xwedg74wjnZBLrAFip3kR2s01LXCChHTy3RY+tkgPniFxYxb9Me
 e4aXpOwAdb3M+5llZ6eO94xQqR5pcNM5ATxeS44b9DlyW3pQUhdUv6F3HRakiCgX/zi2
 XOrDTj04XaWqC/UWsqGSwceT3NIa9XozmZgXenLPiaviRh5tNiQ2YaosBPkhoPyXAwri
 r4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=teVaLV/rr2slg0+EE8xbo9pK+8YB5TTaKHnzrY09DfE=;
 b=CPT7gbtUF0TcxXDD+ODE9Fkgs44dEURL8i81Ltbm+iIdNQKm/cKbxGKcQfmAX7NDbW
 ZMDTEs8MkXlKJQugIKYtmeYG6wH/WS+TzWRxb4UhtJtMggK8t0jKtTIQ3pMrO1mTz9Ea
 rSCVY39g0r6x34JkNpKQRfdaqsXP10JfXCTN2cmy2UCOtOwLeFRLTYE1EmZyo0IPRf73
 nUsXKVv887MYBLWRYGtJN4vZrRMdIGhSvyH6lhwKtHiv80pIsGoi5Szy0mrTz1yUk+rv
 w9N1AsBF9eq0+0vUQki8v7MEtR0OPtm67j6bD02ceWgTsKlksUh9ULvqjZfrs0I7oi0b
 SXsw==
X-Gm-Message-State: AGi0PubV9Q0/xMWEdt9jjzP3tSJi6X8CfC5SSishe8Jvn4RvWsgKZzOY
 AyqnLUFa20WW6D8hvccL1ks=
X-Google-Smtp-Source: APiQypJ3HbUlQmpqmlmjUyLbRSwbSw0eGc0fMQFI2WHl7yRl0sxIRbSlR+4TVJ01O9zuQXKYZCgzBQ==
X-Received: by 2002:a17:90a:cb8c:: with SMTP id
 a12mr35397540pju.153.1589384244328; 
 Wed, 13 May 2020 08:37:24 -0700 (PDT)
Received: from P65xSA.lan ([2402:f000:1:1501::3b2a:1e89])
 by smtp.gmail.com with ESMTPSA id bj6sm11254816pjb.47.2020.05.13.08.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 08:37:23 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next] net: dsa: mt7530: set CPU port to fallback mode
Date: Wed, 13 May 2020 23:37:17 +0800
Message-Id: <20200513153717.15599-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_083725_141023_21208498 
X-CRM114-Status: GOOD (  11.19  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 riddlariddla@hotmail.com, Paul Fertser <fercerpav@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, Stijn Segers <foss@volatilesystems.org>,
 Szabolcs Hubai <szab.hu@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Tom James <tj17@me.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently, setting a bridge's self PVID to other value and deleting
the default VID 1 renders untagged ports of that VLAN unable to talk to
the CPU port:

	bridge vlan add dev br0 vid 2 pvid untagged self
	bridge vlan del dev br0 vid 1 self
	bridge vlan add dev sw0p0 vid 2 pvid untagged
	bridge vlan del dev sw0p0 vid 1
	# br0 cannot send untagged frames out of sw0p0 anymore

That is because the CPU port is set to security mode and its PVID is
still 1, and untagged frames are dropped due to VLAN member violation.

Set the CPU port to fallback mode so untagged frames can pass through.

Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 11 ++++++++---
 drivers/net/dsa/mt7530.h |  6 ++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5c444cd722bd..a063d914c23f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -810,10 +810,15 @@ mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
 		   PCR_MATRIX_MASK, PCR_MATRIX(MT7530_ALL_MEMBERS));
 
 	/* Trapped into security mode allows packet forwarding through VLAN
-	 * table lookup.
+	 * table lookup. CPU port is set to fallback mode to let untagged
+	 * frames pass through.
 	 */
-	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
-		   MT7530_PORT_SECURITY_MODE);
+	if (dsa_is_cpu_port(ds, port))
+		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+			   MT7530_PORT_FALLBACK_MODE);
+	else
+		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+			   MT7530_PORT_SECURITY_MODE);
 
 	/* Set the port as a user port which is to be able to recognize VID
 	 * from incoming packets before fetching entry within the VLAN table.
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 979bb6374678..d45eb7540703 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -152,6 +152,12 @@ enum mt7530_port_mode {
 	/* Port Matrix Mode: Frames are forwarded by the PCR_MATRIX members. */
 	MT7530_PORT_MATRIX_MODE = PORT_VLAN(0),
 
+	/* Fallback Mode: Forward received frames with ingress ports that do
+	 * not belong to the VLAN member. Frames whose VID is not listed on
+	 * the VLAN table are forwarded by the PCR_MATRIX members.
+	 */
+	MT7530_PORT_FALLBACK_MODE = PORT_VLAN(1),
+
 	/* Security Mode: Discard any frame due to ingress membership
 	 * violation or VID missed on the VLAN table.
 	 */
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
