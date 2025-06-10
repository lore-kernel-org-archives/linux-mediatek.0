Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8EDC5B552
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsdrXpgQvufl30tw+xFnwjynEEaG+R4jXiG8VrmKG+s=; b=tzGXsgL0UlHLCx5uCqqMkovrWQ
	ybJQDo62Esvl/J/s2/yrxNuXQD9xrr7N0J4yVA+dcmb/DWcqnUfKi7e0OxWi4sdicfli3pXXirLC/
	yfzP8sP0vnJv7Ez9ZbWxLBxnyYPe9XaXOVasdLw5P/NAkJcgH+vUsrFxwe3c9TVMTnb6/Z+DcHQz3
	cKqbequGc37bTz3hB39mvy8jF+bnGkHqPK9V6ODPbaHcTj9ijRZEexCoVbWMVJkASdmMufVnJyHDH
	ppz0zCpi0iZa9I7fCVnpNPP3QZIJC8y/aQq8q3wzqtmywMiOEsYhx/q7zskukyWlEoKC9RCwXbcY7
	hwC6sLvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwem-00000006Xvp-3S1o;
	Tue, 10 Jun 2025 10:56:40 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvO3-00000006MHe-0uSK
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 09:35:20 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4a3db0666f2so120221151cf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 02:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749548117; x=1750152917; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsdrXpgQvufl30tw+xFnwjynEEaG+R4jXiG8VrmKG+s=;
        b=Mg82GDVA7R8Axp0UTnf87Jc8UvoF3uhPD47l/SMMqjaZo4IcC8Vq8LEZmvkrW9sC5d
         uvyGvChmU5x5G5kkypUgFi/B0jPnHeMmNQgRFlqlAc/Ow1mgw9uvPx4SDVz+RI0ESEvd
         DoO6+C1ZoBc/BpMrTDM0yB/xm04UjZzJjqkiLS4IFp7ws3+6NMcjqR1MtkdGDJrudnRg
         fFIv7XTkj3JYhVV1C0E8BCqmaTnwqwlMA7HRZiEAubJ5Yg3p5s97pw6NfxCQiHEAhIUS
         qAr9ik67uuz3zhyUkvitXEUGPrdfNVCgj75mIvYlP29jr0AcGcFKyP7Zeg00C4Tt+0rm
         DlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548117; x=1750152917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsdrXpgQvufl30tw+xFnwjynEEaG+R4jXiG8VrmKG+s=;
        b=H5h62zwBEfbIatVr3BvjT5FbdzS15IB8l0IdXCOM3keIpCT53ohNAmncMLLQcpbbiW
         kOJxXVXt0KhpxFxzN3Acr5v75XpveDnU1ieZTM8rkr/8n3L69j2J5MSGV6xZUuGUUuoo
         gVy0PuFal0JjifquHi2CP62KMpErkcZfHVyZ8Jn/e8+L5vG4f3DwIeXdDjOaNqXjSGPz
         mpP0Nezig7DjOo3src0Vjxz5nygr4h4y8oFcOL1wmAjqbEMmF3xQrhb+dtXIgQ48lnps
         TB7mHxPrtRwmadUr8S7K2T97Hs34FalmfVHk8S1vRSlEciX1y7VHT6PN1lCyeAoespHU
         pxmg==
X-Forwarded-Encrypted: i=1; AJvYcCWE50CDdsjjZRWUe5ED4rIQp6s3pQuXdgkovKZRECR/7Eo8ZGDDpgpkgkX+gAEZyit1t0LnyBJXqle4eh8QJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5v9Ypm6ZHH/PoW0ak4luxLugb3cMjEvtJyOW1l7Xj1lNEOT28
	WWNqOl6dxD5OQm3oOnDLXYKJ73FCfxXI9nWBnO2pqTvMxa6741XyWi90n9tbOA+7Ndl+hNQZYlx
	/h3StYHcWdD6qTzml7rTyCV5exDBTsPvjpEKDOUii0I7dqo7ECsAvcxrmh70=
X-Gm-Gg: ASbGncvUhQr66qq93IVd3feu9BzdcEhtF2Lk2UX03ySr5ltmtGStVwD2birU+P6l9Cu
	5kmsIKlrEB3ClliC7uaTk7SBVg6Ako7eR38dY5bzKDdTdHq/6clMHfNSZd5URMZNk6AqbZd94wz
	s+y5bfPqCsK68+r8IiyPaY0qWFe3DaLOPOM7fx2CrJMIZN
X-Google-Smtp-Source: AGHT+IGhRH5aE3niOaYItuG73rF2TfxvjZzeKaYfyvLTlm49rzRiaTfOsn0DR0kd1fA23ZF8Eh+l09mxfhsoTuQEp6c=
X-Received: by 2002:a05:6214:4116:b0:6e8:ddf6:d11e with SMTP id
 6a1803df08f44-6fb08ff67eemr261241026d6.21.1749548105349; Tue, 10 Jun 2025
 02:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
In-Reply-To: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Jun 2025 02:34:54 -0700
X-Gm-Features: AX0GCFsOQjueGBnQJH0bxT-ejS8z6yrtGKMc3jCHZ5tSrg15lgc6ROnIRuf0xmo
Message-ID: <CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_023519_274531_668E4876 
X-CRM114-Status: GOOD (  24.49  )
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

On Tue, Jun 10, 2025 at 2:12=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> EN7581 SoC supports TCP hw Large Receive Offload (LRO) for 8 hw queues.
> Introduce TCP LRO support to airoha_eth driver for RX queues 24-31.
> In order to support hw TCP LRO, increase page_pool order to 5 for RX
> queues 24-31.
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c  | 191 ++++++++++++++++++++++++=
+++---
>  drivers/net/ethernet/airoha/airoha_eth.h  |  10 ++
>  drivers/net/ethernet/airoha/airoha_regs.h |  25 +++-
>  3 files changed, 210 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index a7ec609d64dee9c8e901c7eb650bb3fe144ee00a..9378ca384fe2025a40cc52871=
4859dd59300fbcd 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -12,6 +12,7 @@
>  #include <net/dst_metadata.h>
>  #include <net/page_pool/helpers.h>
>  #include <net/pkt_cls.h>
> +#include <net/tcp.h>
>  #include <uapi/linux/ppp_defs.h>
>
>  #include "airoha_regs.h"
> @@ -439,6 +440,40 @@ static void airoha_fe_crsn_qsel_init(struct airoha_e=
th *eth)
>                                  CDM_CRSN_QSEL_Q1));
>  }
>
> +static void airoha_fe_lro_init_rx_queue(struct airoha_eth *eth, int qdma=
_id,
> +                                       int lro_queue_index, int qid,
> +                                       int nbuf, int buf_size)
> +{
> +       airoha_fe_rmw(eth, REG_CDM_LRO_LIMIT(qdma_id),
> +                     CDM_LRO_AGG_NUM_MASK | CDM_LRO_AGG_SIZE_MASK,
> +                     FIELD_PREP(CDM_LRO_AGG_NUM_MASK, nbuf) |
> +                     FIELD_PREP(CDM_LRO_AGG_SIZE_MASK, buf_size));
> +       airoha_fe_rmw(eth, REG_CDM_LRO_AGE_TIME(qdma_id),
> +                     CDM_LRO_AGE_TIME_MASK | CDM_LRO_AGG_TIME_MASK,
> +                     FIELD_PREP(CDM_LRO_AGE_TIME_MASK,
> +                                AIROHA_RXQ_LRO_MAX_AGE_TIME) |
> +                     FIELD_PREP(CDM_LRO_AGG_TIME_MASK,
> +                                AIROHA_RXQ_LRO_MAX_AGG_TIME));
> +       airoha_fe_rmw(eth, REG_CDM_LRO_RXQ(qdma_id, lro_queue_index),
> +                     LRO_RXQ_MASK(lro_queue_index),
> +                     qid << __ffs(LRO_RXQ_MASK(lro_queue_index)));
> +       airoha_fe_set(eth, REG_CDM_LRO_EN(qdma_id), BIT(lro_queue_index))=
;
> +}
> +
> +static void airoha_fe_lro_disable(struct airoha_eth *eth, int qdma_id)
> +{
> +       int i;
> +
> +       airoha_fe_clear(eth, REG_CDM_LRO_LIMIT(qdma_id),
> +                       CDM_LRO_AGG_NUM_MASK | CDM_LRO_AGG_SIZE_MASK);
> +       airoha_fe_clear(eth, REG_CDM_LRO_AGE_TIME(qdma_id),
> +                       CDM_LRO_AGE_TIME_MASK | CDM_LRO_AGG_TIME_MASK);
> +       airoha_fe_clear(eth, REG_CDM_LRO_EN(qdma_id), LRO_RXQ_EN_MASK);
> +       for (i =3D 0; i < AIROHA_MAX_NUM_LRO_QUEUES; i++)
> +               airoha_fe_clear(eth, REG_CDM_LRO_RXQ(qdma_id, i),
> +                               LRO_RXQ_MASK(i));
> +}
> +
>  static int airoha_fe_init(struct airoha_eth *eth)
>  {
>         airoha_fe_maccr_init(eth);
> @@ -618,9 +653,87 @@ static int airoha_qdma_get_gdm_port(struct airoha_et=
h *eth,
>         return port >=3D ARRAY_SIZE(eth->ports) ? -EINVAL : port;
>  }
>
> +static bool airoha_qdma_is_lro_rx_queue(struct airoha_queue *q,
> +                                       struct airoha_qdma *qdma)
> +{
> +       int qid =3D q - &qdma->q_rx[0];
> +
> +       /* EN7581 SoC supports at most 8 LRO rx queues */
> +       BUILD_BUG_ON(hweight32(AIROHA_RXQ_LRO_EN_MASK) >
> +                    AIROHA_MAX_NUM_LRO_QUEUES);
> +
> +       return !!(AIROHA_RXQ_LRO_EN_MASK & BIT(qid));
> +}
> +
> +static int airoha_qdma_lro_rx_process(struct airoha_queue *q,
> +                                     struct airoha_qdma_desc *desc)
> +{
> +       u32 msg1 =3D le32_to_cpu(desc->msg1), msg2 =3D le32_to_cpu(desc->=
msg2);
> +       u32 th_off, tcp_ack_seq, msg3 =3D le32_to_cpu(desc->msg3);
> +       bool ipv4 =3D FIELD_GET(QDMA_ETH_RXMSG_IP4_MASK, msg1);
> +       bool ipv6 =3D FIELD_GET(QDMA_ETH_RXMSG_IP6_MASK, msg1);
> +       struct sk_buff *skb =3D q->skb;
> +       u16 tcp_win, l2_len;
> +       struct tcphdr *th;
> +
> +       if (FIELD_GET(QDMA_ETH_RXMSG_AGG_COUNT_MASK, msg2) <=3D 1)
> +               return 0;
> +
> +       if (!ipv4 && !ipv6)
> +               return -EOPNOTSUPP;
> +
> +       l2_len =3D FIELD_GET(QDMA_ETH_RXMSG_L2_LEN_MASK, msg2);
> +       if (ipv4) {
> +               u16 agg_len =3D FIELD_GET(QDMA_ETH_RXMSG_AGG_LEN_MASK, ms=
g3);
> +               struct iphdr *iph =3D (struct iphdr *)(skb->data + l2_len=
);
> +
> +               if (iph->protocol !=3D IPPROTO_TCP)
> +                       return -EOPNOTSUPP;
> +
> +               iph->tot_len =3D cpu_to_be16(agg_len);
> +               iph->check =3D 0;
> +               iph->check =3D ip_fast_csum((void *)iph, iph->ihl);
> +               th_off =3D l2_len + (iph->ihl << 2);
> +       } else {
> +               struct ipv6hdr *ip6h =3D (struct ipv6hdr *)(skb->data + l=
2_len);
> +               u32 len, desc_ctrl =3D le32_to_cpu(desc->ctrl);
> +
> +               if (ip6h->nexthdr !=3D NEXTHDR_TCP)
> +                       return -EOPNOTSUPP;
> +
> +               len =3D FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
> +               ip6h->payload_len =3D cpu_to_be16(len - l2_len - sizeof(*=
ip6h));
> +               th_off =3D l2_len + sizeof(*ip6h);
> +       }
> +
> +       tcp_win =3D FIELD_GET(QDMA_ETH_RXMSG_TCP_WIN_MASK, msg3);
> +       tcp_ack_seq =3D le32_to_cpu(desc->data);
> +
> +       th =3D (struct tcphdr *)(skb->data + th_off);
> +       th->ack_seq =3D cpu_to_be32(tcp_ack_seq);
> +       th->window =3D cpu_to_be16(tcp_win);
> +
> +       /* check tcp timestamp option */
> +       if (th->doff =3D=3D sizeof(*th) + TCPOLEN_TSTAMP_ALIGNED) {
> +               __be32 *topt =3D (__be32 *)(th + 1);
> +
> +               if (*topt =3D=3D cpu_to_be32((TCPOPT_NOP << 24) |
> +                                        (TCPOPT_NOP << 16) |
> +                                        (TCPOPT_TIMESTAMP << 8) |
> +                                        TCPOLEN_TIMESTAMP)) {
> +                       u32 tcp_ts_reply =3D le32_to_cpu(desc->tcp_ts_rep=
ly);
> +
> +                       put_unaligned_be32(tcp_ts_reply, topt + 2);
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
>  {
>         enum dma_data_direction dir =3D page_pool_get_dma_dir(q->page_poo=
l);
> +       bool lro_queue =3D airoha_qdma_is_lro_rx_queue(q, q->qdma);
>         struct airoha_qdma *qdma =3D q->qdma;
>         struct airoha_eth *eth =3D qdma->eth;
>         int qid =3D q - &qdma->q_rx[0];
> @@ -663,9 +776,14 @@ static int airoha_qdma_rx_process(struct airoha_queu=
e *q, int budget)
>                         __skb_put(q->skb, len);
>                         skb_mark_for_recycle(q->skb);
>                         q->skb->dev =3D port->dev;
> -                       q->skb->protocol =3D eth_type_trans(q->skb, port-=
>dev);
>                         q->skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>                         skb_record_rx_queue(q->skb, qid);
> +
> +                       if (lro_queue && (port->dev->features & NETIF_F_L=
RO) &&
> +                           airoha_qdma_lro_rx_process(q, desc) < 0)
> +                               goto free_frag;
> +
> +                       q->skb->protocol =3D eth_type_trans(q->skb, port-=
>dev);
>                 } else { /* scattered frame */
>                         struct skb_shared_info *shinfo =3D skb_shinfo(q->=
skb);
>                         int nr_frags =3D shinfo->nr_frags;
> @@ -751,14 +869,16 @@ static int airoha_qdma_rx_napi_poll(struct napi_str=
uct *napi, int budget)
>  }
>
>  static int airoha_qdma_init_rx_queue(struct airoha_queue *q,
> -                                    struct airoha_qdma *qdma, int ndesc)
> +                                    struct airoha_qdma *qdma,
> +                                    int ndesc, bool lro_queue)
>  {
> +       int pp_order =3D lro_queue ? 5 : 0;
>         const struct page_pool_params pp_params =3D {
> -               .order =3D 0,
> -               .pool_size =3D 256,
> +               .order =3D pp_order,
> +               .pool_size =3D 256 >> pp_order,
>                 .flags =3D PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
>                 .dma_dir =3D DMA_FROM_DEVICE,
> -               .max_len =3D PAGE_SIZE,
> +               .max_len =3D PAGE_SIZE << pp_order,
>                 .nid =3D NUMA_NO_NODE,
>                 .dev =3D qdma->eth->dev,
>                 .napi =3D &q->napi,
> @@ -767,7 +887,7 @@ static int airoha_qdma_init_rx_queue(struct airoha_qu=
eue *q,
>         int qid =3D q - &qdma->q_rx[0], thr;
>         dma_addr_t dma_addr;
>
> -       q->buf_size =3D PAGE_SIZE / 2;
> +       q->buf_size =3D pp_params.max_len / (2 * (1 + lro_queue));

Tell us more... It seems small LRO packets will consume a lot of
space, incurring a small skb->len/skb->truesize ratio, and bad TCP WAN
performance.

And order-5 pages are unlikely to be available in the long run anyway.

LRO support would only make sense if the NIC is able to use multiple
order-0 pages to store the payload.

