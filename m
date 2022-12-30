Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A03EC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfeRotrp1Ll7p/3+WkiKddMs1C2KJcYE/vOG7XZHhQs=; b=MIeAmBRh20P/GOKaRluqzXjrPr
	7f8amBHmKu+Dclj74/AJz8G5Zs42zc32AXo8sR9OzdMpcbB64Iai8seNP+ketosg6zYdd02PxfwGc
	q/6MGnVLZpguGjBdYrNeDo5wZKHx7CyRV+bxw783OHrKyW5ndG2qX2gH7IZMmcoj+zSrUg2kTxzYa
	rgckj4lR1v8uqKguVW9ek7GHYaCKVQbQChji9LmLSk0AdoVPP82/jlVazcQ0Vavxpe5zNPG8dNrCO
	CiBBxr9dRxwe1wnyeIz8KRlfDMJyR90axlCgGTO6gtTydoF3qEfb4K6rPdl/tUSguv/6SpGS4E+Ae
	unOnR5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBF4h-009Iib-G9; Fri, 30 Dec 2022 13:05:27 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBEwD-009CEi-Fl; Fri, 30 Dec 2022 12:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rfeRotrp1Ll7p/3+WkiKddMs1C2KJcYE/vOG7XZHhQs=; b=T668s895y4nf0A36CJRhoHbwo6
	0sRkHu7gBU71tqtlbz+mMibrY03UypFmOHISF5gftk2uy8GRGZS2S/8Lf81HAivxHGHjSJKS/kHt+
	suefMSGQqkp0s99Aqf4ib9Nrb4HffXUgEoHaT5G3MfQ5RddzCyWSC2h63XZnMOL24GNQ=;
Received: from p200300daa720fc00fd7bb9014adaf597.dip0.t-ipconnect.de ([2003:da:a720:fc00:fd7b:b901:4ada:f597] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pBEvw-00Chzj-Pz; Fri, 30 Dec 2022 13:56:24 +0100
Message-ID: <82821d48-9259-9508-cc80-fc07f4d3ba14@nbd.name>
Date: Fri, 30 Dec 2022 13:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Aw: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop generic
 vlan rx offload, only use DSA untagging
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221230073145.53386-1-nbd@nbd.name>
 <20221230073145.53386-4-nbd@nbd.name>
 <trinity-a07d48f4-11cf-4a24-a797-03ad4b1150d9-1672400818371@3c-app-gmx-bap18>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <trinity-a07d48f4-11cf-4a24-a797-03ad4b1150d9-1672400818371@3c-app-gmx-bap18>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_045646_620878_5021E1C1 
X-CRM114-Status: GOOD (  13.57  )
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

On 30.12.22 12:46, Frank Wunderlich wrote:
> Hi,
> 
> v2 or v3 seems to break vlan on mt7986 over eth0 (mt7531 switch). v1 was working on next from end of November. But my rebased tree with v1 on 6.2-rc1 has same issue, so something after next 2711 was added which break vlan over mt7531.
> 
> Directly over eth1 it works (was not working before).
> 
> if i made no mistake there is still something wrong.
> 
> btw. mt7622/r64 can also use second gmac (over vlan aware bridge with aux-port of switch to wan-port) it is only not default in mainline. But maybe this should not be used as decision for dropping "dsa-tag" (wrongly vlan-tag).
> 
> regards Frank
Thanks for reporting.
Please try this patch on top of the series:
---
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3218,10 +3218,8 @@ static int mtk_open(struct net_device *dev)
  	phylink_start(mac->phylink);
  	netif_tx_start_all_queues(dev);
  
-	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
-		return 0;
-
-	if (mtk_uses_dsa(dev) && !eth->prog) {
+	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2) &&
+	    mtk_uses_dsa(dev) && !eth->prog) {
  		for (i = 0; i < ARRAY_SIZE(eth->dsa_meta); i++) {
  			struct metadata_dst *md_dst = eth->dsa_meta[i];
  
@@ -3244,10 +3242,6 @@ static int mtk_open(struct net_device *dev)
  		val &= ~MTK_CDMP_STAG_EN;
  		mtk_w32(eth, val, MTK_CDMP_IG_CTRL);
  
-		val = mtk_r32(eth, MTK_CDMQ_IG_CTRL);
-		val &= ~MTK_CDMQ_STAG_EN;
-		mtk_w32(eth, val, MTK_CDMQ_IG_CTRL);
-
  		mtk_w32(eth, 0, MTK_CDMP_EG_CTRL);
  	}
  


