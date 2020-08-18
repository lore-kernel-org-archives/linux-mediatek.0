Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80597C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:25:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D2D20786
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:25:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1XbG+dh5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bfy7L3DO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48D2D20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vlraHsEMGNUyMWchcEEnO+NukyUWNj96rsQKtPwyCLg=; b=1XbG+dh5VU6hVP9mBmD96wm5v
	k57SlTH87bXEPwaiuwPHnXrHbmxfCYLiKofK9fhhsOJNPjuuHn6+YOgMpQtClxtnkE6mkRhPCcuRz
	3MKIwGjz8lt53f96omZ3ccVvkacwljly+WCr0b5iC+SPTIM6TQ0lNthr5y7tgEjeO2lOcOMMwPmuw
	Oi0+WtT319eUs0BsURhIO3IS1oxiblqmUcHEH2mro7eG8OsRrtZRF1/teLIkmriSG0zlShcBcg21H
	Vi+fYnm5i65oSHpfS6awLvMbHbGVTMEcrNE7CeocJEdp/SyG08Fp8mh4qwgHq7a4lyeMNC/xeLcu6
	bGH2fHQsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7vzQ-0005SC-Km; Tue, 18 Aug 2020 07:25:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7vzO-0005P3-7t
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 07:24:59 +0000
X-UUID: 18f0256ed554435b80a372f6f7a0dfbd-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CFlnd0+R5J44EHcLRuNKecydHJE56Rdw6NgXCJMSKEs=; 
 b=bfy7L3DOZs3D0QwGtzFCSubNqofNvfx70MBeQrGCHyy9PapvehtihZIFUDP0AeU7nQslVjOBZuUj7nHTSIZneCkvrKb6AY5d/vGguZucsMv/P8yqTL+K/ZLFH1JNDqXhXGH+0lXT5F0RXHLNEEwRUNWHEq7XmPXUUk320m9X25Q=;
X-UUID: 18f0256ed554435b80a372f6f7a0dfbd-20200817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1643918705; Mon, 17 Aug 2020 23:14:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 00:14:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 15:14:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Aug 2020 15:14:35 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH net-next v2 2/7] net: dsa: mt7530: support full-duplex gigabit
 only
Date: Tue, 18 Aug 2020 15:14:07 +0800
Message-ID: <56f9cfec4d337c57e1cb1ea512a2fb404004757a.1597729692.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1597729692.git.landen.chao@mediatek.com>
References: <cover.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_032458_435013_04EF328D 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: devicetree@vger.kernel.org, dqfext@gmail.com, frank-w@public-files.de,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, linux-mediatek@lists.infradead.org,
 Landen Chao <landen.chao@mediatek.com>, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove 1000baseT_Half to advertise correct hardware capability in
phylink_validate() callback function.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8dcb8a49ab67..0fd50798aa42 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1501,7 +1501,7 @@ static void mt7530_phylink_validate(struct dsa_switch *ds, int port,
 		phylink_set(mask, 100baseT_Full);
 
 		if (state->interface != PHY_INTERFACE_MODE_MII) {
-			phylink_set(mask, 1000baseT_Half);
+			/* MT7530 and MT7531 only support 1G full-duplex. */
 			phylink_set(mask, 1000baseT_Full);
 			if (port == 5)
 				phylink_set(mask, 1000baseX_Full);
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
