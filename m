Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DA8CDE00B
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 22:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gX7hQHyvfb4Ci0nY3Fxsfc2Doou++pLUQ8Pual9WtQ=; b=cGyaL55rAG7iyHLXR8vBxdksLz
	fFNv48pvVZ1/Cj9fQzlwz+vWjVz5iChcaKRAHJE+eoWBImKrdeoQpWmGwG8wtmyMXyiXalswVNTFM
	A/wNaBEujqAjmjq5C87DFVhSOdiZfmueb3gxK/2m/cSgd1NmnJvZ359aNNQRMncNruh0yANZD5G0U
	NWnRGLTw4ohpvF/49sxbCSAnE9Z+U+Z2q+OfKCJkLKuCV1gVdcUUye3Su0E+Gj4DAHWQckSztQhUG
	I0rJg0dNrB9fBTKJIPAYDrdZC1/cZ9Mg0yDiHwZKbDKJKgnrHs4m+2JHT6dNW8yniG9uvHe0Y+iJT
	zMhpQMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wct2e-00000009xo1-12RT;
	Thu, 25 Jun 2026 22:59:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wct2a-00000009xnD-3ux0
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 22:59:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c813a45a65so8235ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 15:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782428363; cv=none;
        d=google.com; s=arc-20260327;
        b=VFGT+1qFEUY/YR1XZl8HfLunSapd9qhsuEXPuBPA7qcpN6kNcA8eklHZ072w6B9F9q
         xff7yvjP6M+LMyVE65g9FQkBQ4bxRkR/Yd4rHvD7+hBzjb3jytQMqk+o+IAEPpcW0RxK
         ykQFf7IcctEmt41v9InSQvRgxJseD/KNrApy3b0XkrZTE79reEZolhgvTK5NNyWdMcC3
         05yKHQOgueoPlQ5J2BaJJZy/xJ4GcZ6M/uXRgSCEw3mLCDIeyimkiGDTuJchNV5xRiHa
         kzueAYU90bMcZ8O/XgRZjMWu8Eaz3rWWyWi4d7iSpmYog75mLzKexsbeNvCZUmXZ7sWp
         +jlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gX7hQHyvfb4Ci0nY3Fxsfc2Doou++pLUQ8Pual9WtQ=;
        fh=DUw3nIoQkExQSQeN6K6j/NavlnsVkTI//73NZk8W88k=;
        b=aYjXNz0SK8yon1n/+EmPTTnGdzjneOATlIM3U/oYjqiCqtD1Rt5t7fSMC08pAt3bKI
         0NGcb8UdjeTx0chUgKfCah1QO2i5hEdHDyIqm/7hVNPWBfv+q9Qtn0WPLqgrwQohFZO5
         siFeMjTiq3SBDaQ35CawGwCSs1Ji7tpIYQvFGalrtalt+mw1xDJXx5Cadg7bDmz2avKD
         v0UdP4zVh8wz8PrqAkaT09aNpVgVuJ4QQu8ZRHlvlvJRRHC50qbUrIhmgd+2e+7GhVyG
         yBXdPzGW2YQYCHhv2gybdnLPi9O+AAzietdsmntESWjwurVo6pUA1Vs51kAawWqTuSrN
         FIhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782428363; x=1783033163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gX7hQHyvfb4Ci0nY3Fxsfc2Doou++pLUQ8Pual9WtQ=;
        b=JSUeu97WuF1NxcYGKJZ3+OjcVCjTWhDzPVj0TixTAnSNW95O93n00nw1x+cUMmtPxd
         W2Ls7IyDw5Lg4xqxitO6BllHoZzPc8ut0oT0MA/9+dR3ezN7vwtPcWWWL/Dy805R2whM
         0Fa+ZnOzC/SEnFr5wVds+APYa68K/vHLTI+MEEZd8UimZFRIu7YJdwRxmKVIxhcOFbm5
         bd4IpWozeHTjmPlVhbIiyETfFmcJjDM2RiLIsSoYOtU+g/Ol7Bm7TBQbHI/5QN0F4N9u
         kIEXgLiK5t4enP14lK/0BK/pBmzgdVILPD1NbOuQ2XaJO7GjgP/JvBSuMkXrD+F3b0hQ
         kD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782428363; x=1783033163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gX7hQHyvfb4Ci0nY3Fxsfc2Doou++pLUQ8Pual9WtQ=;
        b=kV1rP9MUzOZhcRDD5pyL1MzWmPt2aoJnDXqfJA9e/Fne0t37K/scdpS2gs/RLcZldt
         7NoUF/RXIxiAC1BUJcu9X0xb2AYbgF+vWjNDVKrajMTDoP3IAX9zSW4ALmXOjSAbm4Qp
         ePYG+Z/69bsooC08Et2Ye8B/j8o9O3ZUboPj2iC7wvwevWqwyDY4uljEjRcP7kNRcl3p
         AGUz/ifQ0la7y/vPwIkVYkD3NAjSSaHLUPXaccpHjGq2/pTnhzwmYe0VwoOoCfuiIAxu
         1LnbbtPZiefmkjFBlo3NoZtlcy1In/jIhPdD7vDWHpcUIyFGPkhtbo85JltX08Q31Wvz
         bRyA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0x+nVYYPb+EqYmRYyDuPgelxDiGfhORLvuyv/AfpeQc+3HimtMUBd09Y7FNm3469eFxHdizJhCmPuLa0a/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGhhYWYkd4QTZFaIw0tQFDYl/p5Mu29KXhVuRyiczndiqzRPtB
	f4AObE3GUaWYgaaxcZpcm5NiaukyCBcAOUwub7O05c5pzgZWv71aYZB82AtSe7saT3gCojBnj/o
	+qOCgKHLs9IALTKIEPSUMoce++uB+geJBcHdLW6n4
X-Gm-Gg: AfdE7ck7yqDBeTurCtVroiNJxYxa3705Uye13dhwwVUoF1QApDhUA4yqRgifiKQSotY
	o8l5m8gj4+aGzbHNPNDjd3Fq2IDXbbXeqt3TOgPnCojK5XHwf9sRzAz/ra86WZ0b5Zo0uWmd5KN
	FIJ56Ggbjn+58t9UPDsgf6IYHugXXBaFp8Qidf+sUfkUd9diQORNH/0IT4qgfC9ebGt53LMy8l4
	//qnnceSdZlBRbYtVIGBtQpXUHnVo6Z+54MeBXhyC/N2yx3BlBioOAZfRLDeDRdqZyRNS4LQyKJ
	bxSf2V26qamwVDGuCkQj5H043NGHya7BW+T1C25oeLHErt9dZZqLRLtdtEirQkpeMmqU4sY=
X-Received: by 2002:a17:902:fc4d:b0:2bf:193b:a195 with SMTP id
 d9443c01a7336-2c813e4f6c6mr855945ad.11.1782428362363; Thu, 25 Jun 2026
 15:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260625-airoha-eth-skb_frag_dma_map-v1-1-31d9e460aae6@kernel.org>
In-Reply-To: <20260625-airoha-eth-skb_frag_dma_map-v1-1-31d9e460aae6@kernel.org>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Thu, 25 Jun 2026 15:59:10 -0700
X-Gm-Features: AVVi8CeiefQknrcxxwnBcBr19FhEdmLlZYqiKgArFjpWRrvJ_M8y2FZe1GT04Ic
Message-ID: <CAEAWyHfyWrSdKziDg3SOnx3QRfd6uu6YXtJV85OgqWEQSJykmQ@mail.gmail.com>
Subject: Re: [PATCH net] net: airoha: dma map xmit frags with skb_frag_dma_map()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_155924_983333_0B9AABBC 
X-CRM114-Status: GOOD (  23.18  )
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

On Thu, Jun 25, 2026 at 2:43=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> Map xmit skb fragments using skb_frag_dma_map() instead of
> dma_map_single(skb_frag_address()). skb_frag_address() relies on
> page_address() to obtain a kernel virtual address, which is not
> guaranteed to work for all page types (e.g. highmem pages or
> user-pinned pages from MSG_ZEROCOPY).
> skb_frag_dma_map() maps the fragment directly via its struct page and
> offset through dma_map_page(), avoiding the need for a kernel virtual
> address entirely.
> Introduce an enum airoha_dma_map_type to track how each queue entry was
> mapped (single vs page), so that the matching unmap function is called
> on completion and in error paths.
>
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 61 ++++++++++++++++++++------=
------
>  drivers/net/ethernet/airoha/airoha_eth.h |  7 ++++
>  2 files changed, 45 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 932b3a3df2e5..1caf6766f2c0 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -944,6 +944,25 @@ static void airoha_qdma_wake_netdev_txqs(struct airo=
ha_queue *q)
>         q->txq_stopped =3D false;
>  }
>
> +static void airoha_unmap_xmit_buf(struct airoha_eth *eth,
> +                                 struct airoha_queue_entry *e)
> +{
> +       switch (e->dma_type) {
> +       case AIROHA_DMA_MAP_PAGE:
> +               dma_unmap_page(eth->dev, e->dma_addr, e->dma_len,
> +                              DMA_TO_DEVICE);
> +               break;
> +       case AIROHA_DMA_MAP_SINGLE:
> +               dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
> +                                DMA_TO_DEVICE);
> +               break;
> +       case AIROHA_DMA_UNMAPPED:
> +       default:
> +               break;
> +       }
> +       e->dma_type =3D AIROHA_DMA_UNMAPPED;
> +}
> +
>  static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget=
)
>  {
>         struct airoha_tx_irq_queue *irq_q;
> @@ -1006,9 +1025,7 @@ static int airoha_qdma_tx_napi_poll(struct napi_str=
uct *napi, int budget)
>                 skb =3D e->skb;
>                 e->skb =3D NULL;
>
> -               dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
> -                                DMA_TO_DEVICE);
> -               e->dma_addr =3D 0;
> +               airoha_unmap_xmit_buf(eth, e);
>                 list_add_tail(&e->list, &q->tx_list);
>
>                 WRITE_ONCE(desc->msg0, 0);
> @@ -1177,12 +1194,10 @@ static void airoha_qdma_tx_cleanup(struct airoha_=
qdma *qdma)
>                         struct airoha_qdma_desc *desc =3D &q->desc[j];
>                         struct sk_buff *skb =3D e->skb;
>
> -                       if (!e->dma_addr)
> +                       if (e->dma_type =3D=3D AIROHA_DMA_UNMAPPED)
>                                 continue;
>
> -                       dma_unmap_single(qdma->eth->dev, e->dma_addr,
> -                                        e->dma_len, DMA_TO_DEVICE);
> -                       e->dma_addr =3D 0;
> +                       airoha_unmap_xmit_buf(qdma->eth, e);
>                         list_add_tail(&e->list, &q->tx_list);
>
>                         WRITE_ONCE(desc->ctrl, 0);
> @@ -2193,8 +2208,8 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>         struct netdev_queue *txq;
>         struct airoha_queue *q;
>         LIST_HEAD(tx_list);
> +       dma_addr_t addr;
>         int i =3D 0, qid;
> -       void *data;
>         u16 index;
>         u8 fport;
>
> @@ -2250,24 +2265,22 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff=
 *skb,
>                 return NETDEV_TX_BUSY;
>         }
>
> -       len =3D skb_headlen(skb);
> -       data =3D skb->data;
> -
>         e =3D list_first_entry(&q->tx_list, struct airoha_queue_entry,
>                              list);
> +       len =3D skb_headlen(skb);
> +       addr =3D dma_map_single(netdev->dev.parent, skb->data, len,
> +                             DMA_TO_DEVICE);
> +       if (unlikely(dma_mapping_error(netdev->dev.parent, addr)))
> +               goto error_unlock;
> +
> +       e->dma_type =3D AIROHA_DMA_MAP_SINGLE;
>         index =3D e - q->entry;
>
>         while (true) {
>                 struct airoha_qdma_desc *desc =3D &q->desc[index];
>                 skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> -               dma_addr_t addr;
>                 u32 val;
>
> -               addr =3D dma_map_single(netdev->dev.parent, data, len,
> -                                     DMA_TO_DEVICE);
> -               if (unlikely(dma_mapping_error(netdev->dev.parent, addr))=
)
> -                       goto error_unmap;
> -
>                 list_move_tail(&e->list, &tx_list);
>                 e->skb =3D i =3D=3D nr_frags - 1 ? skb : NULL;
>                 e->dma_addr =3D addr;
> @@ -2291,8 +2304,13 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff =
*skb,
>                 if (++i =3D=3D nr_frags)
>                         break;
>
> -               data =3D skb_frag_address(frag);
>                 len =3D skb_frag_size(frag);
> +               addr =3D skb_frag_dma_map(netdev->dev.parent, frag, 0, le=
n,
> +                                       DMA_TO_DEVICE);
> +               if (unlikely(dma_mapping_error(netdev->dev.parent, addr))=
)
> +                       goto error_unmap;
> +
> +               e->dma_type =3D AIROHA_DMA_MAP_PAGE;
>         }
>         q->queued +=3D i;
>
> @@ -2313,11 +2331,8 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff =
*skb,
>         return NETDEV_TX_OK;
>
>  error_unmap:
> -       list_for_each_entry(e, &tx_list, list) {
> -               dma_unmap_single(netdev->dev.parent, e->dma_addr, e->dma_=
len,
> -                                DMA_TO_DEVICE);
> -               e->dma_addr =3D 0;
> -       }
> +       list_for_each_entry(e, &tx_list, list)
> +               airoha_unmap_xmit_buf(dev->eth, e);
>         list_splice(&tx_list, &q->tx_list);
>  error_unlock:
>         spin_unlock_bh(&q->lock);
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index d7ff8c5200e2..2765244d937c 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -170,12 +170,19 @@ enum trtcm_param {
>  #define TRTCM_TOKEN_RATE_MASK                  GENMASK(23, 6)
>  #define TRTCM_TOKEN_RATE_FRACTION_MASK         GENMASK(5, 0)
>
> +enum airoha_dma_map_type {
> +       AIROHA_DMA_UNMAPPED,
> +       AIROHA_DMA_MAP_SINGLE,
> +       AIROHA_DMA_MAP_PAGE,
> +};
> +
>  struct airoha_queue_entry {
>         union {
>                 void *buf;
>                 struct {
>                         struct list_head list;
>                         struct sk_buff *skb;
> +                       enum airoha_dma_map_type dma_type;
>                 };
>         };
>         dma_addr_t dma_addr;
>
> ---
> base-commit: 232c4ca2343d1181cbfc061f9856d9591e397579
> change-id: 20260625-airoha-eth-skb_frag_dma_map-bcccd5d6e4b1
>
> Best regards,
> --
> Lorenzo Bianconi <lorenzo@kernel.org>
>
>

