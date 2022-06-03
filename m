Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 15:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jdp5hWH+ROamqlEBgpxuJAWxZ7izeAfyoS1bvRa/v6I=; b=dqDm3qQrEkNtNh
	26My6eRU4s/UCc/R8sbduCyYrkzc5xoXlGpkSPRkMPlZBCdyACl9yfeYdwEOwSXPCNkIra+zgPm4Q
	Q59UrxCj53adn6ud41duECL4mrPRYXmOzJJ+JM11YiQybEXb1Jmf5E0vTNiEYLdpoB0tnJ2hhAY9M
	QeL8g9mDgiIwKKnoO6p2FvQNJ/aCLQn13fyuzlkqJXdCb0XjgrlBHHyOfZKg6dNh/DJiqgYiwKxZs
	S8RKIlZga/lzGyZWnoLZc7rCarrM3yc+VEIek4jEHuWnlkwKVcsvSECXkMSNLlLqR7wSBttlHAhb/
	S2CkHYF0Wqm3bp6YacfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9BM-007zxC-Dv; Fri, 03 Jun 2022 15:25:48 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9BB-007ztC-7h; Fri, 03 Jun 2022 15:25:38 +0000
Received: by mail-ej1-x630.google.com with SMTP id s12so9386553ejx.3;
        Fri, 03 Jun 2022 08:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BsFKjZipbOTjUWCQRSSMQJgD00JclNvNv7Gv7B+yrU8=;
        b=M4JLXiWxSuRJFYbt5BPJdGkyNoQXlVZnC3Kbj97ggGitikrkpzh3SYa5y4tU4aoy8y
         +G0X6gPXjfMrlM2BLJeDWtAaIbWiox9nqn6xE4ITMhkFAdiVOmesKdEDm5tItpU1qZPF
         A94PqTFPnRY1LsOcxVhpIaUtA1fVBxpTVKXvIH7DWcOKYHF1XoqBi4kNhe4U82ii7faX
         ve/jVsfRKoDfx07xs+68rxEtIxMClWcvNTiwOmDZOnC7ZLIO/WVhoETXrND/b5lIHp43
         MAvTXthtvokzyDQIlVTIQkg8Aqu3dThwN7GNAKtIKjGmBYe4TAXWRA1JgYBx/1kHhCAT
         6t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BsFKjZipbOTjUWCQRSSMQJgD00JclNvNv7Gv7B+yrU8=;
        b=OW/ddDgX9oFEQar1CJ7yHsHGMZKkNVQZ7I6pZwj5eXVUYsr0IVIseDfRu+MMLZrlR6
         V29jqcx+0ovffyak0pEQocrxa+afPDbEiWCJNfGKNO48iWBu0kXvuAEITjFtUdchO5Kc
         kv+rrdGCAAAS+VesT9vKkpxFd2i/K8L4G0oBW5CO3h5h97lBZpGEK8+PUiYOBrxGgFkO
         X5QBH75YJlBJbGxwUPEF8xd8X9g3o416PlW01Fp8c6w6KaOSON60qVB2L6cBNDsFXlJu
         c1nusYZtPTJ40eLqNZ1sPRHqbkKjOCQjdOdpDMYoofyaNqzZeoPlYgELf7gSi3R5enGP
         KskQ==
X-Gm-Message-State: AOAM533GhVjYcdsVoHnLnoDN6HoAOm+XhohnPbl9bueND/mYNT7lYs3x
	4RCWOTeZ0vjKjfxhmrbZ1bFuz/xru1bmohk4w+g=
X-Google-Smtp-Source: ABdhPJzrwJnGaL84JtXS4Waw3Cqw/ZmtEJYT/uxuIbpHE62Y9br/lrSJdLekasDZcKyrvWXBktw5BEH6/zFZio9znQM=
X-Received: by 2002:a17:907:62a1:b0:6da:7952:d4d2 with SMTP id
 nd33-20020a17090762a100b006da7952d4d2mr8978189ejc.260.1654269934125; Fri, 03
 Jun 2022 08:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name> <1654245968-8067-1-git-send-email-chen45464546@163.com>
In-Reply-To: <1654245968-8067-1-git-send-email-chen45464546@163.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Fri, 3 Jun 2022 08:25:22 -0700
Message-ID: <CAKgT0Uc9vSEJxrev10Uc3P==+tTip7+7W=AF2uE+VB3GVyOTxg@mail.gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev[napi]_alloc_frag
To: Chen Lin <chen45464546@163.com>
Cc: Felix Fietkau <nbd@nbd.name>, Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>, 
	Sean Wang <sean.wang@mediatek.com>, Mark-MC.Lee@mediatek.com, 
	David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, matthias.bgg@gmail.com, Netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_082537_314808_2D536BC6 
X-CRM114-Status: GOOD (  21.36  )
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

On Fri, Jun 3, 2022 at 2:03 AM Chen Lin <chen45464546@163.com> wrote:
>
> When rx_flag == MTK_RX_FLAGS_HWLRO,
> rx_data_len = MTK_MAX_LRO_RX_LENGTH(4096 * 3) > PAGE_SIZE.
> netdev_alloc_frag is for alloction of page fragment only.
> Reference to other drivers and Documentation/vm/page_frags.rst
>
> Branch to use alloc_pages when ring->frag_size > PAGE_SIZE.
>
> Signed-off-by: Chen Lin <chen45464546@163.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c |   22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index b3b3c07..772d903 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -1467,7 +1467,16 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>                         goto release_desc;
>
>                 /* alloc new buffer */
> -               new_data = napi_alloc_frag(ring->frag_size);
> +               if (ring->frag_size <= PAGE_SIZE) {
> +                       new_data = napi_alloc_frag(ring->frag_size);
> +               } else {
> +                       struct page *page;
> +                       unsigned int order = get_order(ring->frag_size);
> +
> +                       page = alloc_pages(GFP_ATOMIC | __GFP_COMP |
> +                                           __GFP_NOWARN, order);
> +                       new_data = page ? page_address(page) : NULL;
> +               }
>                 if (unlikely(!new_data)) {
>                         netdev->stats.rx_dropped++;
>                         goto release_desc;
> @@ -1914,7 +1923,16 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>                 return -ENOMEM;
>
>         for (i = 0; i < rx_dma_size; i++) {
> -               ring->data[i] = netdev_alloc_frag(ring->frag_size);
> +               if (ring->frag_size <= PAGE_SIZE) {
> +                       ring->data[i] = netdev_alloc_frag(ring->frag_size);
> +               } else {
> +                       struct page *page;
> +                       unsigned int order = get_order(ring->frag_size);
> +
> +                       page = alloc_pages(GFP_KERNEL | __GFP_COMP |
> +                                           __GFP_NOWARN, order);
> +                       ring->data[i] = page ? page_address(page) : NULL;
> +               }
>                 if (!ring->data[i])
>                         return -ENOMEM;
>         }

Actually I looked closer at this driver. Is it able to receive frames
larger than 2K? If not there isn't any point in this change.

Based on commit 4fd59792097a ("net: ethernet: mediatek: support
setting MTU") it looks like it doesn't, so odds are this patch is not
necessary.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
