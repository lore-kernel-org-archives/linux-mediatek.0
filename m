Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43589CCF2DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VS2moVsLFS8R82B6LKNK6mphxLmcNhEidNAZl37HgzY=; b=IUJM3GsXPTJQ+Rn4BziDba+Cq8
	aRzSjGcajyIz9wngqPf3tAzPyqsLbkDDC3/ioIAsd7R87w8aBJ/uoLcbE73onX/Si0si5+yLMEDD+
	0qIHZqCs+d40kT+fpdFkofJPnxBg6ox9IvwA3A2uTaG1yL51xms9j1P9xdqzgSwfKZ1fnCS2Jao4u
	JJ9bJBSnsingSuwQnoggEybt+AgblLt6eb7MOVifK1kgbv9DugrrwVW3/QIAm37IrEMhzRWDsCtnR
	oO9CGGDM49tvri0SxJptL1yoCn3nnzPufsA/xhnQF2buWytIQBbAcFRr0rtJzlSaioWOoCmvNvVVs
	H3YPkE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn6N-00000001qsV-3bca;
	Mon, 19 Jan 2026 11:07:19 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn6L-00000001qqi-0Tqf
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 11:07:18 +0000
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-661097640a8so1758839eaf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 03:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820835; x=1769425635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS2moVsLFS8R82B6LKNK6mphxLmcNhEidNAZl37HgzY=;
        b=meyopiCH+htLgcH3hL62Fv4gIdXaSKKy5kFYTB1A5qgg4ecevU+XhS3rFJF9SCGHMs
         wb1w1jvf2g4vx2T2XJZZzxmvmIyJHxm+gEvRIpyTB+Dgc76dtYbJxT/iktwOAZCij8Xl
         HFzbpkvLPmvJVKtxAITAnYjTMDMEP9G3pkBhDW5uvIQ8lN44XQOOhgaa5lSsZxtT4YWm
         YH6zfPdhZovHwPKaiTaQsNVSiUC41PxikQ0RcxrfU7mLO/yfBu8mNEnjmAo9m9SwZpwE
         k09GD8jU2pOC7BtiNhjjuf2z7hdJlHQkcQAnF2v6YMdf49WdZVd7o8j6h/7U5smUdEo7
         zbxw==
X-Forwarded-Encrypted: i=1; AJvYcCV9PSRmC9P68D7lYeIdrJoVkhNOy0yT79kdqrVCIwRQS7i5f6gLVG1LCmuqtkDfCsP5xZCoTWVOc2rxdvnwEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/WdamVbmD4AXyXjgKUE3auayMfIu5A3U+wzyb+XBj1/9948oZ
	9K4NZGRSguucEqC+6Ar7Jx5v5GwzXc9z1X+dpZgpL+7wQy2FZ1L5OZMm
X-Gm-Gg: AY/fxX5yDTcWxW9I4HCh7GqmczRUm1VA3srvlsJUfcEpsW72jFsW4sgb5QX+VSffBk5
	tAe/WNVire3l2QennFzNQVOg7JkvmOdEg+sGg2S8rIKtqXYzDmVmJN7p0knKblhKpX8Q7d+q3Ud
	W0tokAHvHMcidAtjrFuywNBMt5UyWfn9rIN90iWOHfoU8KLrWaEWMBwI4VHYK7ZI7EQpuwzNOog
	Wxx5UsQY4PPCJwdWlWuaWwUPNAnA7xxg3ERNjm9TcqJd3cUrsq8a+jp8spYLKfL8P/lN+HC/jt1
	V79bb8KNqLl4Z7Mx5j36mVBtoQY9iL7THfUoJXP6TjMvKQbxexWBIR6rddOsPo2Mdg1d7v/+N2/
	xzVZYvvuv5o9OIF7twNFU6PpgSm060NuUCXklaz1FEDi+i/vC10AsKesDdR9Rxum8ZVRHLNHsYH
	IEFtgjOl252PXB
X-Received: by 2002:a05:6820:448b:b0:65f:54b1:a9af with SMTP id 006d021491bc7-661179b6b61mr3226026eaf.42.1768820835533;
        Mon, 19 Jan 2026 03:07:15 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:52::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bda443asm6804809fac.22.2026.01.19.03.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:07:14 -0800 (PST)
Date: Mon, 19 Jan 2026 03:07:12 -0800
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
	Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Bryan Whitehead <bryan.whitehead@microchip.com>, 
	UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Raju Rangoju <Raju.Rangoju@amd.com>, Potnuri Bharat Teja <bharat@chelsio.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/9] net: benet: convert to use
 .get_rx_ring_count
Message-ID: <ziyd3327jr7miqgv2e252w4wpizphomkvxxge6nbjwtg4pyvf4@gvwwi2r7rykl>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
 <20260115-grxring_big_v2-v1-1-b3e1b58bced5@debian.org>
 <20260117181551.0b139ca1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117181551.0b139ca1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_030717_149367_D68301FB 
X-CRM114-Status: GOOD (  12.44  )
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

Hello Jakub,

On Sat, Jan 17, 2026 at 06:15:51PM -0800, Jakub Kicinski wrote:
> On Thu, 15 Jan 2026 06:37:48 -0800 Breno Leitao wrote:
> > -static int be_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
> > -			u32 *rule_locs)
> > -{
> > -	struct be_adapter *adapter = netdev_priv(netdev);
> > -
> > -	if (!be_multi_rxq(adapter)) {
> > -		dev_info(&adapter->pdev->dev,
> > -			 "ethtool::get_rxnfc: RX flow hashing is disabled\n");
> > -		return -EINVAL;
> > -	}
> 
> I think we need to add this check to set_rxfh now. The error coming
> from get_rxnfc/GRXRINGS effectively shielded the driver from set_rxfh
> calls ever happening when there's only 1 ring. Now they will happen.

You are absolutely correct. The ethtool core calls
get_rxnfc(ETHTOOL_GRXRINGS) _before_ allowing RSS configuration via
set_rxfh, and if it fails, ethtool_set_rxfh() will fail as well. And
with the current change, ethtool_set_rxfh() will not fail if the adapter
is not multi-queue.

Thanks for the heads-up. I will send a v2 shortly.
--breno

