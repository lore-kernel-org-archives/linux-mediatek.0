Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC35C27C6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 08:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOrrGwiKumhubkTs/e35uhjYXPsUQv/mo2MGJn/NTQ0=; b=lqdx8bUpV08uP5/9wjkVMDzdOx
	m7PRFVGYQUrYfhNOxG/qEdUkFMM/GLeooZmjd5pzAXQU4alkX5ihSQyXaJ9VZZSfNUWrTNZ/A4PMs
	787sZfWUf6vNriDoGMXUIIWdoEjxMgz8NubmBGMG7OTKSWnXNvmpaO16H1ymCpgpYN1LVC8wcTRcq
	lhGcGyPKdYQjXKNwHcyrNvj3hqOXts1rMv/9DeDXjteyOJ0qlszJqSAWIMgTvvcPyQVNwf4tx3HFa
	8nOn6x1erTq09fP7xV/stzz03DeTcpCo9xZSEnz6Nc4LnPPXxytCSs1uDnewFowooL49ZUpU0tt3a
	TJx3D7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlMZ-000000079uu-0wRg;
	Sun, 16 Jun 2024 08:35:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlMV-000000079qd-1RoV;
	Sun, 16 Jun 2024 08:35:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46B44CE0B53;
	Sun, 16 Jun 2024 08:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53123C2BBFC;
	Sun, 16 Jun 2024 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718526937;
	bh=gMHw0zgKhT2FIrKEWVvNVX2awLi4Bqd58VLtETxGG0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKITIvAfZUzTfAk4VH+3dgKt1FYvHBwTTDgWvZjE9b4QyI4fiF3jwQe3H1Gm5wTuQ
	 wP5EF/gxM+BNzy7Nm/FSZEHtQKlvHJhya2+2vUU95C+bMWunrs9RCLPRS6rztYwjtB
	 FAK7IPVBszykFDvXKjJoMv6unq66JO9et4sXrnrts8I9FZgB8BNQCsf5/BldVITew4
	 Ci01x0bm3SH3g8ESfXOWgd/1wf2LYuR8Jvs/XMB2FCGsCEj/BTDKtxnG1eODq28tM9
	 p4GpUn/huIZIoi4Ep+yzqvxjQkIeppSf0YbLZmEca4RwFz4ntP49lpadQVN/40Uywe
	 SZCRyHmKxjmDg==
Date: Sun, 16 Jun 2024 09:35:29 +0100
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: kvalo@kernel.org, linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, kees@kernel.org, kuba@kernel.org,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>, Ingo Rohloff <lundril@gmx.de>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: un-embedd netdev from mt76_dev
Message-ID: <20240616083529.GH8447@kernel.org>
References: <20240614115317.657700-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614115317.657700-1-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_013543_784796_E5AFEBD6 
X-CRM114-Status: GOOD (  19.29  )
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

On Fri, Jun 14, 2024 at 04:52:42AM -0700, Breno Leitao wrote:
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
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> 
> PS: Due to the lack of hardware, this patch was not tested on a real
> hardware, unfortunately.
> 
> PS2: this is the last driver that is still using embedded netdevices.

...

> diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
> index 1de5a2b20f74..6454a5eca13e 100644
> --- a/drivers/net/wireless/mediatek/mt76/dma.h
> +++ b/drivers/net/wireless/mediatek/mt76/dma.h
> @@ -116,4 +116,9 @@ mt76_dma_should_drop_buf(bool *drop, u32 ctrl, u32 buf1, u32 info)
>  	}
>  }
>  
> +static inline struct mt76_dev *mt76_from_netdev(struct net_device *dev)
> +{
> +	return *(struct mt76_dev **)netdev_priv(dev);
> +}
> +
>  #endif

Hi Breno,

I agree that the above is correct, but I wonder if somehow it
is nicer to avoid explicit casts and instead take advantage of
implicit casting too and from void *.

Maybe something like this:

static inline struct mt76_dev *mt76_from_netdev(struct net_device *dev)
{
        struct mt76_dev **priv;

        priv = netdev_priv(dev);

        return *priv;
}

Further, some of the callers of mt76_from_netdev() cast the return value to
(struct mt7615_dev *). Which seems a bit awkward seeing as it was very
recently a void * (i.e. netdev_priv() returns void *).

I wonder if something like this makes sense, which I believe would avoid
the need for any callers to cast.

static inline void *mt76_priv(struct net_device *dev)
{
        struct mt76_dev **priv;

        priv = netdev_priv(dev);

        return *priv;
}

Ideas above compile tested only.

Other than the above, which is clearly more about style than substance,
this patch looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>


