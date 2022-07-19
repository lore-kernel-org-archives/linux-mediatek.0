Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F122DC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWTPEQzptxXk3lrvWDrClDt6+96mfbGWSUz4hZOfrrY=; b=Xc6bArxAYn/ZzUaRugMFT7bpL3
	cM7+xU2l/aRe1rGi/wlVpOa5f8+mnpOk5qc58nEw7qlFQohyulAiXFPOZUQax9ow5IhetNmuUfe37
	9VGzO3DB7gojHx8iMYYhXQRwDeo6e+7uoIBDxeJefeughvwmjVcYpqJu1BhyHAC/Qds7IYMkm4LXP
	jGkBnEcTaY3uMs6jOJQV4kAw+T3PJ1yR6XOpselOyaTV7iJvbgjah7qKHcyBnAx2z62uui7FXG9vD
	8DERAoFqUkKygIdtpOSTWpeKgJs7CxBW9QghxPc7HKPr/FWGFeDLjEBr1HVdSb61/qQoZ+WrlmQCC
	b7x2drUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnjw-009RGf-Ga; Tue, 19 Jul 2022 13:58:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnjt-009RD2-73
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 13:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658239096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zWTPEQzptxXk3lrvWDrClDt6+96mfbGWSUz4hZOfrrY=;
	b=Y+suca6O4Ub2NUSHOLMaQ6nTHQtSaS9iDOOgyUs7y1X4fOxMdZcR1Vb0IZMrcn9i3rjmR8
	2hp+h98ln3o3nQPt576H+11BYWjDrMXNCcE6tOEdo55P9vF1xxtfKO82UxyQ09ffBxZxQR
	IeqO87HwV3796PbQtDmOvBav7tXuYag=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-adxlLpyNPN6ABibRgGN_mw-1; Tue, 19 Jul 2022 09:58:15 -0400
X-MC-Unique: adxlLpyNPN6ABibRgGN_mw-1
Received: by mail-wr1-f69.google.com with SMTP id m2-20020adfc582000000b0021e28acded7so827354wrg.13
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 06:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zWTPEQzptxXk3lrvWDrClDt6+96mfbGWSUz4hZOfrrY=;
        b=v9F5J+SKB2FKeO31JwczmDvD6tFSpYu5yIBeCrkUe8nvBc+nB+ijFLiwgVASZ0npUD
         2nJdlcacWpRJW23PHim4SmF0bZaoAvMhYSlJwzw526FsIZTFkTD7RzUYqjWLefmeHjtG
         uZmGST6r9xtKBnAFZjkbDTwJ90mmis9up5+54CUEqyqWsjj6zWeLVBMSXw+xPEfV3k8U
         YQLQzOheI+OtIL5ptv/LIRTNtm8TSVPuP6KDicGH9t9h9HUWIamJWhhn+j0nuJvW6GqC
         L9cij+GzghQqnwZXZ/8TuH6E/CjQZh1k7nBjTz3XJKMaSWeWfyRBfHNUlxu/25PWNivt
         jRGw==
X-Gm-Message-State: AJIora9TwLq/zbYYrFP0CG5zIvx7bUeaejGBWJJ48TtswijHzDJ+9fbZ
	GIXzXm/EvXkUNNYJUgVyVU/+B+seocyAUL5FRj8CI/riXvMerYY3ZQ0zyFSdNd/43k/XkgKlcYE
	79zkz755L8HAKGDqJTlmB7z66aR8ZrOps
X-Received: by 2002:adf:f28b:0:b0:21e:3161:7129 with SMTP id k11-20020adff28b000000b0021e31617129mr3195228wro.438.1658239093843;
        Tue, 19 Jul 2022 06:58:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tt9EGYGYdDvsVKBkypPQ/oLxWulwLmQlcLonoOdkkZWIXnOaJo77fXBw3t9U4bq27bu53V5w==
X-Received: by 2002:adf:f28b:0:b0:21e:3161:7129 with SMTP id k11-20020adff28b000000b0021e31617129mr3195203wro.438.1658239093547;
        Tue, 19 Jul 2022 06:58:13 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-104-164.dyn.eolo.it. [146.241.104.164])
        by smtp.gmail.com with ESMTPSA id f7-20020adffcc7000000b0021e463e4017sm148945wrs.55.2022.07.19.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 06:58:13 -0700 (PDT)
Message-ID: <d432c897a8eef451bdd65cfdf5b1da0d866a9a5b.camel@redhat.com>
Subject: Re: [PATCH v3 net-next 5/5] net: ethernet: mtk_eth_soc: add support
 for page_pool_get_stats
From: Paolo Abeni <pabeni@redhat.com>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 nbd@nbd.name,  john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com,  davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, ilias.apalodimas@linaro.org, 
 jbrouer@redhat.com
Date: Tue, 19 Jul 2022 15:58:11 +0200
In-Reply-To: <YtaE/KJDNOqkvLml@localhost.localdomain>
References: <cover.1657956652.git.lorenzo@kernel.org>
	 <8592ada26b28995d038ef67f15c145b6cebf4165.1657956652.git.lorenzo@kernel.org>
	 <43ff0071f0ce4b958f27427acebcf2c6ace52ba0.camel@redhat.com>
	 <YtaE/KJDNOqkvLml@localhost.localdomain>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_065817_359194_8FC09483 
X-CRM114-Status: GOOD (  28.84  )
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

On Tue, 2022-07-19 at 12:18 +0200, Lorenzo Bianconi wrote:
> > On Sat, 2022-07-16 at 09:34 +0200, Lorenzo Bianconi wrote:
> > > Introduce support for the page_pool stats API into mtk_eth_soc
> > > driver.
> > > Report page_pool stats through ethtool.
> > > 
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  drivers/net/ethernet/mediatek/Kconfig       |  1 +
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 40
> > > +++++++++++++++++++--
> > >  2 files changed, 38 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/mediatek/Kconfig
> > > b/drivers/net/ethernet/mediatek/Kconfig
> > > index d2422c7b31b0..97374fb3ee79 100644
> > > --- a/drivers/net/ethernet/mediatek/Kconfig
> > > +++ b/drivers/net/ethernet/mediatek/Kconfig
> > > @@ -18,6 +18,7 @@ config NET_MEDIATEK_SOC
> > >  	select PHYLINK
> > >  	select DIMLIB
> > >  	select PAGE_POOL
> > > +	select PAGE_POOL_STATS
> > >  	help
> > >  	  This driver supports the gigabit ethernet MACs in the
> > >  	  MediaTek SoC family.
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > index abb8bc281015..eba95a86086d 100644
> > > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > @@ -3517,11 +3517,19 @@ static void mtk_get_strings(struct
> > > net_device *dev, u32 stringset, u8 *data)
> > >  	int i;
> > >  
> > >  	switch (stringset) {
> > > -	case ETH_SS_STATS:
> > > +	case ETH_SS_STATS: {
> > > +		struct mtk_mac *mac = netdev_priv(dev);
> > > +		struct mtk_eth *eth = mac->hw;
> > > +
> > >  		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats);
> > > i++) {
> > >  			memcpy(data, mtk_ethtool_stats[i].str,
> > > ETH_GSTRING_LEN);
> > >  			data += ETH_GSTRING_LEN;
> > >  		}
> > > +		if (!eth->hwlro)
> > 
> > I see the page_pool is enabled if and only if !hwlro, but I think
> > it
> > would be more clear if you explicitly check for page_pool here (and
> > in
> > a few other places below), so that if the condition to enable
> > page_pool
> > someday will change, this code will still be fine.
> 
> Hi Paolo,
> 
> page_pool pointer is defined in mtk_rx_ring structure, so
> theoretically we can have a
> page_pool defined for queue 0 but not for queues {1, 2, 3}.

I see. I missed hwlro is a per device setting.

> "!eth->hwlro" means
> there is at least one page_pool allocated. Do you prefer to do
> something like:
> 
> bool mtk_is_pp_enabled(struct mtk_eth *eth)
> {

> 	for (i = 0; i < ARRAY_SIZE(eth->rx_ring); i++) {
> 		struct mtk_rx_ring *ring = &eth->rx_ring[i];
> 
> 		if (ring->page_pool)
> 			return true;
> 	}
> 	return false;
> }

Even:

bool mtk_is_pp_enabled(struct mtk_eth *eth)
{
	return !eth->hwlro;
}

will suffice to encaspulate the logic behind page pool enabling in a
single place.

/P


