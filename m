Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA23C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYQLBryNBg2V98bbiL4e5M8gxG2GeWbeLo/CFoncenc=; b=xRvp7InQTXQICgbqBg15OsAG7n
	u0iHXaMAU/EyLlCtNIcetJMiQIW12LqJEV+eq4r+NzFgmyBgfo8Jmj1QR9FrlFOwDikW/4QquNayr
	VF/pbgwe3OUgOPm/io2mQFDFkofGMbhWMz0HVGcWX6ywEdc7yNQE8s8ZHyTOo14qf9ApGzxcaAx4r
	dG7S9M3TOkL5mBYezYaEvqEjojKRMoprPysRv1lmYuN0jqz+ZZD+nP+0fnUnp6gPYhkkBnXQ2Rip/
	RRNm1sr/JLaOolBa/KNAQtJQHM4hGU2L3grHURQQ4ANhR101oBW9gwdXOzg8mMxnLnDQdypTrWqmX
	Kgfjn1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow34S-004pBW-Bx; Fri, 18 Nov 2022 15:14:24 +0000
Received: from mail.base45.de ([2001:67c:2050:320::77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow34C-004p2J-Nl; Fri, 18 Nov 2022 15:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PYQLBryNBg2V98bbiL4e5M8gxG2GeWbeLo/CFoncenc=; b=Uvm3QR9uY6MNvHIwv4bkERMGk7
	Z/DfjHBIRgLeuVa7KXDB1VwttGKa9DT8JDsvWd0lbqMEPlz7C1cgYHvKTBthnFenPvJVunBKHBB5a
	0BZ6dGOtT9mg9k6LTNK7DrLVuD2Mb+C6/MFISaouSrhB2++qfXu9QmpvRV+a8zBUT62K/DBq852YK
	+/C266DYZT+gIW45CsnB5b0oknfj2LxYc0PtMlfbwf9byFSZrespOc1aBLjnuWKiocfBlZ33Wjz5p
	Xt0hxBH2BanVBi+qYak7zzj7N7QgFJ6cb6LuDMDO2V9GsBfMiDiRHEhGgqOZ7BaOoNcTzbL8aAsVp
	0UVHdKMg==;
Received: from [145.224.93.132] (helo=javelin)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1ow33k-001vrc-1i; Fri, 18 Nov 2022 15:13:40 +0000
Date: Fri, 18 Nov 2022 15:13:31 +0000
From: Alexander 'lynxis' Couzens <lynxis@fe80.eu>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/6] net: ethernet: mtk_eth_soc: implement
 multi-queue support for per-port queues
Message-ID: <20221118151331.4694574f@javelin>
In-Reply-To: <20221116080734.44013-5-nbd@nbd.name>
References: <20221116080734.44013-1-nbd@nbd.name>
	<20221116080734.44013-5-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_071409_122556_651C644C 
X-CRM114-Status: GOOD (  11.46  )
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

Hi Felix,

On Wed, 16 Nov 2022 09:07:32 +0100
Felix Fietkau <nbd@nbd.name> wrote:

> @@ -614,6 +618,75 @@ static void mtk_mac_link_down(struct phylink_config *config, unsigned int mode,
>  	mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
>  }
>  
> +static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
> +				int speed)
> +{
> +	const struct mtk_soc_data *soc = eth->soc;
> +	u32 ofs, val;
> +
> +	if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA))
> +		return;
> +
> +	val = MTK_QTX_SCH_MIN_RATE_EN |
> +	      /* minimum: 10 Mbps */
> +	      FIELD_PREP(MTK_QTX_SCH_MIN_RATE_MAN, 1) |
> +	      FIELD_PREP(MTK_QTX_SCH_MIN_RATE_EXP, 4) |
> +	      MTK_QTX_SCH_LEAKY_BUCKET_SIZE;
> +	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
> +		val |= MTK_QTX_SCH_LEAKY_BUCKET_EN;
> +
> +	if (IS_ENABLED(CONFIG_SOC_MT7621)) {
> +		switch (speed) {
> +		case SPEED_10:
> +			val |= MTK_QTX_SCH_MAX_RATE_EN |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 2) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> +			break;
> +		case SPEED_100:
> +			val |= MTK_QTX_SCH_MAX_RATE_EN |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 3);
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> +			break;
> +		case SPEED_1000:
> +			val |= MTK_QTX_SCH_MAX_RATE_EN |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 105) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 4) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 10);
> +			break;
> +		default:
> +			break;
> +		}
> +	} else {
> +		switch (speed) {
> +		case SPEED_10:
> +			val |= MTK_QTX_SCH_MAX_RATE_EN |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 4) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> +			break;
> +		case SPEED_100:
> +			val |= MTK_QTX_SCH_MAX_RATE_EN |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> +			break;
> +		case SPEED_1000:
> +			val |= MTK_QTX_SCH_MAX_RATE_EN |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 10) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
> +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 10);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	ofs = MTK_QTX_OFFSET * idx;
> +	mtk_w32(eth, val, soc->reg_map->qdma.qtx_sch + ofs);
> +}
> +
>  static void mtk_mac_link_up(struct phylink_config *config,
>  			    struct phy_device *phy,
>  			    unsigned int mode, phy_interface_t interface,
> @@ -639,6 +712,8 @@ static void mtk_mac_link_up(struct phylink_config *config,


What's happening to 2.5Gbit ports (e.g. on mt7622)? Should be SPEED_2500 also in the switch/case?
E.g. a direct connected 2.5Gbit phy to GMAC0.
Or a mt7622 GMAC0 to mt7531 port 6 and a 2.5Gbit phy to port 5.

