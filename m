Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B47C2BA1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 17:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/b5P6UUD7xfnt/tDFVwY45Vum8wfJz8h3q/qmnfBFY=; b=Y9gtu/X4XwhuaKJNyQ07uSSfkt
	THPDYKi7P+iEW3OnR9mYTqEQdjuJThfV3P4RpXJOpBDMPDjMsMRN30c0YmEI6Dj3G+hbexEY+fBjq
	783cBtnYt3zTCIBcmxInV2/YRzPGno5g1zaPc6n9d5+sGCWVfgP9KtL0iXzj3F5+5IAQOMYx20Ad4
	0fBKaDPB+J+aPf8QoznPkkyMOdXLwfism5xxJgHNszBBuiqHPhI0g28LaelTyaarD3T6Fu01boypF
	i88tdv3YibN21LGlUM2z2ciXRVNvRThwAF+kVYiVC/4/WXBatKXUzSxvjSAGm24q+SvfafxtKKnln
	Mz+qN4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKLS8-000000061v3-0sMZ;
	Thu, 20 Jun 2024 17:20:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKLS3-000000061sU-48Ze;
	Thu, 20 Jun 2024 17:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FE25621A3;
	Thu, 20 Jun 2024 17:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0176DC2BD10;
	Thu, 20 Jun 2024 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718903998;
	bh=0EITIsqCJubudjU1im913x1NvRsb6Pperj0ae9Q9IyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLpIgkFReZvp3j40kOfUVwQGHXaTIeS3AMOoheI7XTX6TumouC+XX3vNgNYwFVfne
	 WkTAj/VyMueaQdhIPiL4/dCMZC9eoQ/AmzZzTegVtVuWETd/+YLWEz4+TD2Fjm5Gu5
	 pE8cTc+y2rjjNXVBpDYb1+L2Y+87x/6ezY+XiNcbxi8oPyypU4HYs5+9nerwx0yGHn
	 1AMgu0Mi47mD5o1DIDOuilphEj+WMRSGmJA6OxZu+YpSCDJOpfhg3HoBP4/YB2kzWX
	 V7aMDINbybSuZWpRRuu3sTSfAixoB28YYAf+LYn3oicANIdmQBzkSu+wlEzbCWgHXE
	 8aU4Qo/1wduqw==
Date: Thu, 20 Jun 2024 18:19:50 +0100
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: kvalo@kernel.org, linux-wireless@vger.kernel.org, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, kees@kernel.org,
	Bo Jiao <Bo.Jiao@mediatek.com>, Alexander Couzens <lynxis@fe80.eu>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>, Ingo Rohloff <lundril@gmx.de>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next v2] wifi: mt76: un-embedd netdev from mt76_dev
Message-ID: <20240620171950.GO959333@kernel.org>
References: <20240619105311.3144908-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619105311.3144908-1-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_102000_218716_7A5B5E88 
X-CRM114-Status: GOOD (  12.22  )
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

On Wed, Jun 19, 2024 at 03:52:36AM -0700, Breno Leitao wrote:
> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
> 
> Un-embed the net_devices from struct mt76_dev by converting them
> into pointers, and allocating them dynamically. Use the leverage
> alloc_netdev_dummy() to allocate the net_device object at
> mt76_dma_init().
> 
> The free of the device occurs at mt76_dma_cleanup().
> 
> Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> 
> Changelog:
>  * v2:
> 	- Renamed mt76_from_netdev() to mt76_priv(), and returns a
> 	  void pointer instead of struct mt76_dev, avoiding the cast
> 	  later, as suggested by Simon Horman.

Thanks for the update, it looks good to me.

