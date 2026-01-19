Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4B9D29C27
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eej85NiVPLP+u56kRUQxyZBmDKCIPKgy3FhLQoE5YEc=; b=3lYKAQRYFNq9G/QPFgi/kb/04q
	YiyR5/sm6SnlRVQyan6zWsnqtgMDUTz69TIp7mq91K/yy5dY+3Ls5OYAlV0WzhJ9izAkEmYhXjyof
	JhT6SCQXUujW1oe0rDT/mqLA0fEXegg4mA71Eijg/L/9AsZZLGJbU9NA0qyUjHoUmtWGM9iNUCGYJ
	2a7ttUECG1pcARt0pD3Qusri1MhFu4wybJP7tMXHq82vgewkrR2CfffVvguWTrOkm74jK4gl/rcrM
	zsc2Ql8Y9bmzD34e4DQCmxYJrcMEK49/iud/evP9deEXjX+mJuIt5pKlIIdzkJtSNEoW5l+2qOL2H
	2ADiFj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhp0c-000000028Tm-0Skb;
	Mon, 19 Jan 2026 13:09:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhp0Z-000000028TD-1VEz;
	Mon, 19 Jan 2026 13:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768828168; x=1800364168;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gwTDCSKqc8LSu9yPNc5jngp7QL67XyPXB2CAD6UZF+E=;
  b=1gBccfa51xObCrsv3dfhrU4R+wiXFQrOc8rRgH0CQCv0SseN8lEU7UM7
   o2tRaJCHwvdTnqJiRNMNJnXR+5E30mowGA56qgrrLMP85Z8wcH7c0NFwE
   ru5jo9ZEwqeELMk7P7CcvNEBywXTCEyjW4jl9sN7j0Qz5RtP/uD53u0TS
   jgcFSJAYdu8aHqahgXhkJxvKntSO/xyzN6vI96+TsdiL8/hChJu4Ko9Sp
   Ft+KYu7adzp/uPgjae/8KdxAe75mOa0ooWV7Glj5RyrIUqnHGeanQOoqq
   1kBe2iBgCdLr3HN4TIJPZNM0/6GNw4UeYPcztAX7RgR1C30slDu1INnBm
   g==;
X-CSE-ConnectionGUID: MCMdS/2MS9W3q5v2vYq8nw==
X-CSE-MsgGUID: ohbf7MsMRqSUEgskF7U23Q==
X-IronPort-AV: E=Sophos;i="6.21,238,1763449200"; 
   d="scan'208";a="283467428"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jan 2026 06:09:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 19 Jan 2026 06:08:10 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 19 Jan 2026 06:08:04 -0700
Message-ID: <402feb92-104b-4fe0-b223-a85afd60d084@microchip.com>
Date: Mon, 19 Jan 2026 14:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 8/9] net: macb: convert to use .get_rx_ring_count
To: Breno Leitao <leitao@debian.org>, Ajit Khaparde
	<ajit.khaparde@broadcom.com>, Sriharsha Basavapatna
	<sriharsha.basavapatna@broadcom.com>, Somnath Kotur
	<somnath.kotur@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau
	<nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Shay
 Agroskin" <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>,
	"David Arinzon" <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>,
	"Bryan Whitehead" <bryan.whitehead@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>, Potnuri Bharat Teja
	<bharat@chelsio.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, Jiawen Wu
	<jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
 <20260115-grxring_big_v2-v1-8-b3e1b58bced5@debian.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260115-grxring_big_v2-v1-8-b3e1b58bced5@debian.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_050927_447943_A2B6FF23 
X-CRM114-Status: GOOD (  17.01  )
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

On 15/01/2026 at 15:37, Breno Leitao wrote:
> Use the newly introduced .get_rx_ring_count ethtool ops callback instead
> of handling ETHTOOL_GRXRINGS directly in .get_rxnfc().
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 2d5f3eb09530..8135c5c2a51a 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -3850,6 +3850,13 @@ static int gem_get_all_flow_entries(struct net_device *netdev,
>          return 0;
>   }
> 
> +static u32 gem_get_rx_ring_count(struct net_device *netdev)
> +{
> +       struct macb *bp = netdev_priv(netdev);
> +
> +       return bp->num_queues;
> +}
> +
>   static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
>                  u32 *rule_locs)
>   {
> @@ -3857,9 +3864,6 @@ static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
>          int ret = 0;
> 
>          switch (cmd->cmd) {
> -       case ETHTOOL_GRXRINGS:
> -               cmd->data = bp->num_queues;
> -               break;
>          case ETHTOOL_GRXCLSRLCNT:
>                  cmd->rule_cnt = bp->rx_fs_list.count;
>                  break;
> @@ -3941,6 +3945,7 @@ static const struct ethtool_ops gem_ethtool_ops = {
>          .set_ringparam          = macb_set_ringparam,
>          .get_rxnfc                      = gem_get_rxnfc,
>          .set_rxnfc                      = gem_set_rxnfc,
> +       .get_rx_ring_count              = gem_get_rx_ring_count,
>   };
> 
>   static int macb_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
> 
> --
> 2.47.3
> 


