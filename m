Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF501C4320E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C7F6056C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75C7F6056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dQzoaXXdMDYMHN1OsFrpTq3YdbzeRUJKgwJUyd4j6jg=; b=hOduS83g6B/Ru4
	beCbghv7XxsJ0GAYmIOJn39zaCsmmNIZCU9e7gq0AUivZQe82aNlBh8Er/XVKK9EihfHikiUIZ4ig
	AYwWNhZbplIgKOwLXDt1hl9ImIv+mwZiBtnAUoJJffg9cKm4kiG50DPdTFolKOZdwAIXBNBiXZGXn
	p5NJX4BMowVwB9f0AOcAFIAkDc1sXnWrdyavgW/OA9OfPAnuHGOLim1wmPjp+hirfbRNvQnPaWPFF
	fh6mSnO0bUqe0gs2vKCKByygzOxMhaReWs0eCAI7LzqmkXpcaYDvQoEEn9jSCNVduUx901DnZTLxa
	bLMml9oRcfQTcQdW10JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDky7-006Spz-D8; Wed, 11 Aug 2021 09:56:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDksx-006Qrj-Iu; Wed, 11 Aug 2021 09:51:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id l11so1946029plk.6;
 Wed, 11 Aug 2021 02:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yfHklEjyVi0y+D9Q59Efd19/lK1Au76MfVqK/YYAw3w=;
 b=XlizxdegGChhgE9pvc1tXR0HauVwKnoNvrOgyr1hg5QGzCS1Xko59TMF+7HgYTCBkr
 f/KvF4ijJ6/19OPNn7gsdShJrdIjly0QW52BSb8+S5rY464qk17ejMF9cZ3sjRhKcDKR
 XwPB7W0C0rKqlk8lLClWs05Rihz/TZ6BggXleBKi60MKJqwv5XJLC5z4riwzDzvzdHnC
 JvMJpJyLgNyr56BP8sHcun2V+X2Wlyb8j0YFzupn8lA2QeYLUnyh7JUuEchVmyoxMe8f
 tVsYxF2LCIEAuZzaQnaBQqoLhdfJ0Jwy0mtbDy7PBTpNGLVnHAdXY4u2oel+84JMu+ce
 iDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yfHklEjyVi0y+D9Q59Efd19/lK1Au76MfVqK/YYAw3w=;
 b=beeOhMcOLxZDpRkuaUxj/2L0duOo2DipocxoNW1RvkFnFvAnxmFKtHLNGJzS15XLdj
 Vt3U+MM/UXaJouInut/ouYccPdRxH+kZ83xf09xLM7oOAZ5tTc15CRkdD5TNDyuAYHXO
 LEI6St3p3//qF1wOzhZQ5a165Ov5/93mGZd7GTb/F5j3HPxm99Z+qgUAv3DLpvG/lyi6
 lehL1WCxjYZxKHhfZ/dgt9fL/y2QQhHkQQSQWKxcSk4NrJ6ArOjQWBHmsro4Farj7QED
 wNIYpPGh+h1xPyjzu2g5GgdnCQE3BKRaUl5ejfKrAlq7K9IvlSGKt9lMHvFkRB47JTl1
 wzDQ==
X-Gm-Message-State: AOAM531lGcVy258iIJtjxVPt4UFeO8cNuo5y0wmwJy6wYXv+BkInrxb4
 yPvA2hR0hcmQRCpx0UaIVcs=
X-Google-Smtp-Source: ABdhPJwaEw3SWt45M/YhnzJ5ndLJ5GVSKuftH9DwwoBOMkP0IR7KqL5Xph22uT1EEw6SE9e2ohkbOg==
X-Received: by 2002:a63:4f54:: with SMTP id p20mr64577pgl.437.1628675453594;
 Wed, 11 Aug 2021 02:50:53 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id w82sm2472502pff.112.2021.08.11.02.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:50:52 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org (open list:MEDIATEK SWITCH DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: dsa: mt7530: fix VLAN traffic leaks again
Date: Wed, 11 Aug 2021 17:50:43 +0800
Message-Id: <20210811095043.1700061-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_025055_754075_FF3C910C 
X-CRM114-Status: GOOD (  14.11  )
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

When a port leaves a VLAN-aware bridge, the current code does not clear
other ports' matrix field bit. If the bridge is later set to VLAN-unaware
mode, traffic in the bridge may leak to that port.

Remove the VLAN filtering check in mt7530_port_bridge_leave.

Fixes: 474a2ddaa192 ("net: dsa: mt7530: fix VLAN traffic leaks")
Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 53e6150e95b6..77e0205e4e59 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1315,11 +1315,8 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 		/* Remove this port from the port matrix of the other ports
 		 * in the same bridge. If the port is disabled, port matrix
 		 * is kept and not being setup until the port becomes enabled.
-		 * And the other port's port matrix cannot be broken when the
-		 * other port is still a VLAN-aware port.
 		 */
-		if (dsa_is_user_port(ds, i) && i != port &&
-		   !dsa_port_is_vlan_filtering(dsa_to_port(ds, i))) {
+		if (dsa_is_user_port(ds, i) && i != port) {
 			if (dsa_to_port(ds, i)->bridge_dev != bridge)
 				continue;
 			if (priv->ports[i].enable)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
