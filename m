Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A968DC624CF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5xUrqa6zSY5RggXlOvnQn1pXM3VVHoRSVX9zGt7wDs=; b=SopNGxpH7iEyMZ3v0igxpYyCFR
	UZzzTYLSg6nhjWmWEMPQ27ttMN/dR0TaOufciQ3y0fsDC5E8hdSFt/q5XcLyDdHhA7rBQWLAqJfki
	2B+NpIEcGGPuhYSUIU18S3hNvamK6qDB/IP+smpHngICRgy/TWDU1o4JEqWmy+FQwkJf4lOBH+y1V
	Vg166BgoNgWKHLUitzLbj9xK8juq2cGjj8wWtKrnXCqmuBrJ/COha1SfWhn9l/QuKHABBRFJI4//7
	hPQKamLaZk308EOqJyWipz/oc3UVgxG7UriJc4sGvZ2pYixHt/jax9bmccxXtXNdwaoBb+eHDV072
	1E8xXEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Lvz-0000000BZEU-1FQk;
	Tue, 01 Sep 2026 10:41:43 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Lvw-0000000BZCF-1A9C
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 10:41:41 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-855de2d0d4dso12845167b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 03:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788259299; cv=none;
        d=google.com; s=arc-20260327;
        b=Y5psSPjs6appUqFG4atByhhcnl7CW8IIAye027s8LY7CZMuoJjFB4lh77Q0Z2H6Fha
         DCCNDWkA3EB7+MeNa1Pkd5BRgYNr4XlUFuJeEEV8/46E37Kv2QDMRN2cVS3SQKyaFYw5
         ks899y5UwLd/yaNKwS4anuVMt7DvxPOP3CQIuo/pWNGhrO/NZpitvNBodEgd2DnBhr33
         zzYdIfCXTLaIPs4D3JgByDkpOrse2PAdwNIKCREjRLL1TJnewg2eztIjjWlOraUsKKn7
         KKRfASiHTAyqwnfEMyJ1TpZdhtpyBirPC6Whj0DF1dv+VJS7pjEp695EHpCdlIsyGRDk
         KIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r5xUrqa6zSY5RggXlOvnQn1pXM3VVHoRSVX9zGt7wDs=;
        fh=3CYPJ71mo2FqjFiFEJa15ttCVy8TioKQqR7SZMWjNbQ=;
        b=Sz1RhKrLEHAmAP6RtQ5Tgnhab5OZeNhA7BY2AW1dYCq2Ybn7CPnsSmr6DOuqKEXg37
         RqBo6iQuyBi+4ssFUergY4/bSRl2DOB599JE9GMkEIfsFb9FYMimBPJr8IaAWtaoOzJw
         vbtB6R19GnqbWTj3aqfkRV1yqgc181Sk42iqy/GJvmT66nWq4kaDZwXkanTi1OvptMXJ
         86SXU3L33DoAE07tMVU30Izu70CKtrqcLBbx7MXM+PEVD+pz28XyktW/6RlGjGumr3FL
         b2BU22lMz4Swye3Sym2xrOnzvEaqIfgBqs6KHBl+/mkBvFDMj7NvMtmy7jm7T4OfhKNa
         tuXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788259299; x=1788864099; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5xUrqa6zSY5RggXlOvnQn1pXM3VVHoRSVX9zGt7wDs=;
        b=F+BCRYWHMYNRDBKXOog1afkcLJkiZAx1IVJqqYi6TQrNmDN8+JjF1ueECVOwKfpUYr
         XtcM2Sb0B7oVpjUFtFU0FL1aGjQ10Sr66WCBrshUeXRJkw5zEd4v4Naf0+mdYT+3ziSM
         UY7TdLuBLmButRBRHyisTuOGO4Pzc7K8l0P5oOgxPgzmh/Kw4ZT728pjLFx9KBT8CrGr
         Fs7+92ccnkGpo/z8JoYszzcvxbKEv2rSxnf7Kt1C4/WR3gYBvb74lDREbRKmRT70PKCo
         ZkIewMNqoptEZAHGq8WUXOFzKv3O09Bf0ritCANL6OezVPZjQ271fVKz0+9uaJXcO7B1
         z0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259299; x=1788864099;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r5xUrqa6zSY5RggXlOvnQn1pXM3VVHoRSVX9zGt7wDs=;
        b=B3QhEjEL1j/Dxp+qbLl8A8Pr3YH5dGtWFStdbN1e4IlYitW34c1F21W2w+b2I/hXOU
         /RFH6p97Oh/eYD30+w6f5gtQ67rQfioyOJLuk1gfSCy4OJQKcDYPGNWylEwk5lznqN2i
         qyF7cl1q5TcQWtBuZZWrZdTItEf2mRVM5MRpWNlafuE6KxULmhUvJWSgNndFKJ9Rglya
         dlnv03XWbhpGXGqTPPvIp6tpgEyUby2n58EvQUIAjmgnQQGfW3+iZNXcnWqaolU3lNwu
         RXRX4VuX39qrWos+ANA3teOC86QdTRCshreYg4y87ZtHQ2IRofAz8WRKZccad4tPoM47
         ZnvA==
X-Forwarded-Encrypted: i=1; AKwUvByrdl/AIp3jAby7jq+waYtzksOZk/XutVbbwomHri0HxeCQ334jsRKqyaE8sKTAyDpJxZjUPCJ5UTcT5Bd9sQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mSVyLWufhGRDih0ZCnue6nfcO0h9GXp0IhhZOfljngw3f5P0vL
	iieQG6lQu/IxHyvGln44SI1bTGSMG/L0mkLpctuyJHwacmZlNs6qePoKuwHiUVJRKzjC+e+7XsS
	SfT3C/T/Q7fU5nomknZRq1bvycrO9WaFlK/g7LbLc
X-Gm-Gg: AYBFou0d2vNAfXQuBIh15CRNQZabdCWhZAmPiAPLIrNK8u37D0fNX2ZelWcLcNKrv0d
	8fMMYhV94dub/OKVWehgTP/zJBTE+rucUv3U/itezS8sG9jI44gw6zo53iPyNksz+2YnI8F2OUQ
	yHuukKrZlKNo8bGNp4c8LPvMAoSqvx/3rdo9ATJtguxxIpMgEYXeASyPVglmykaw8VNHo6NAi3I
	CN4H7DAoZbsX+hBEzoM1XCzyzBhm7rYCtnC2EA/mU21T2hXw8fUo2sIfNRNQhFXB5Fe5rmCTopg
	2BOa9uI9k5qsZ36R0qg5JIEztkVHiOZMvrxgB851T4wCHSI5o9uGAf7Pu3pkA8TNB7ef+0guf/l
	LxsL2i/Ic8yMIQ/rKaoqa7FThmu6sw+Awqhn2jO8QOYBDx83Lw5XWoJnOVMjC7l9xWEuPihitFh
	nmStIrkIin27eVfeV/eOkehkvVIdndAJHi+kpiA4JOTPPULNnvqen4Nmnrxic7YA19S2Qc2lLht
	FiraX69slidXhbmSM177E7Ry1sjFe3xmpuu+wEycK6x+1DXuMJPY7iCltbyO4399ZFn8qYw05a5
	0eMAFsjjL+Jrow==
X-Received: by 2002:a05:690c:e187:b0:82e:2dda:fb0a with SMTP id
 00721157ae682-86949e580b0mr14937287b3.7.1788259299093; Tue, 01 Sep 2026
 03:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260901092632.369248-1-julius@bairaktaris.de> <apaix8MjIkRPjHVq@lore-desk>
In-Reply-To: <apaix8MjIkRPjHVq@lore-desk>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Tue, 1 Sep 2026 10:41:01 +0000
X-Gm-Features: AcwNN1VC5hjHM3WR5pHxOoSAcDyx36Os8cGZ9xiJpcKS8kl0-4xHvvgS61p5JxY
Message-ID: <CAC1t37KSALgrxX_4ZkGqWFnUStfYmMz+sG773UPQQ3TbjHm5CQ@mail.gmail.com>
Subject: Re: [PATCH nf-next] netfilter: flowtable: carry a priority into the offload
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_034140_808144_2E6C1E61 
X-CRM114-Status: GOOD (  33.12  )
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

Hi Lorenzo,

Agreed. v2 applies the stored priority on the software fast path as
well, in the IPv4 and IPv6 hooks, so a flow forwarded in software and
one forwarded by hardware get the same treatment; both paths are
exercised on IPQ8074 hardware. It follows once the 24h window passes.

If the earlier discussion is the CT metadata action RFC from last
September, the software-plane point raised there is what v2 closes - a
pointer would be welcome if more was raised elsewhere.

Thanks,
Julius


Am Di., 1. Sept. 2026 um 10:02 Uhr schrieb Lorenzo Bianconi
<lorenzo@kernel.org>:
>
> > A flow rule handed to a driver describes NAT, encapsulation and the
> > output device, but not how the flow should be treated on the way out,
> > so hardware with priority queues can only fall back on the DSCP the
> > packet carries.
> >
> > Carry skb->priority of the packet that created the flow and emit it as
> > FLOW_ACTION_PRIORITY, the action act_skbedit already emits on the tc
> > path. "meta priority set" before "flow add" then reaches the hardware.
> > A flow without a priority emits no action; mtk and airoha, the two
> > in-tree consumers of these rules, ignore the new one as they do
> > FLOW_ACTION_CSUM.
> >
> > The flowtable holds one flow for both directions and the expression
> > runs once, so the priority applies to both; per-direction
> > classification is not carried.
> >
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
>
> Hi Julius,
>
> we have already discussed about this kind of approach to offload skb priority
> into drivers that support flowtable hw offload. The main blocking point is we
> need the same feature in the flowtable sw path in order to not introduce any
> missing capability in the kernel tx path.
>
> Regards,
> Lorenzo
>
> > ---
> > The consumer of the emitted action is a DSA driver for the IPQ8074 PPE,
> > maintained in OpenWrt; measured there, "meta priority set" ahead of
> > "flow add" places offloaded flows in the port's hardware priority
> > queues. The mtk and airoha hunks are compile-tested only. The new field
> > grows struct flow_offload by eight bytes on 64-bit; the entry allocates
> > from its own kmem_cache, so no allocation-class change.
> >
> >  drivers/net/ethernet/airoha/airoha_ppe.c        |  1 +
> >  drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  1 +
> >  include/net/netfilter/nf_flow_table.h           |  1 +
> >  net/netfilter/nf_flow_table_offload.c           | 11 +++++++++++
> >  net/netfilter/nft_flow_offload.c                |  7 +++++++
> >  5 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
> > index 92611802801e..2afce76ad131 100644
> > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > @@ -1161,6 +1161,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
> >               case FLOW_ACTION_REDIRECT:
> >                       odev = act->dev;
> >                       break;
> > +             case FLOW_ACTION_PRIORITY:
> >               case FLOW_ACTION_CSUM:
> >                       break;
> >               case FLOW_ACTION_VLAN_PUSH:
> > diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> > index 99b28aaa7cc4..4ee99e8e4a34 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> > @@ -378,6 +378,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
> >               case FLOW_ACTION_REDIRECT:
> >                       odev = act->dev;
> >                       break;
> > +             case FLOW_ACTION_PRIORITY:
> >               case FLOW_ACTION_CSUM:
> >                       break;
> >               case FLOW_ACTION_VLAN_PUSH:
> > diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
> > index f2e2771f188f..23218c8cbc3d 100644
> > --- a/include/net/netfilter/nf_flow_table.h
> > +++ b/include/net/netfilter/nf_flow_table.h
> > @@ -202,6 +202,7 @@ struct flow_offload {
> >       unsigned long                           flags;
> >       u16                                     type;
> >       u32                                     timeout;
> > +     u32                                     priority;
> >       struct rcu_head                         rcu_head;
> >  };
> >
> > diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
> > index 801a3dd9ceea..caaadffc2563 100644
> > --- a/net/netfilter/nf_flow_table_offload.c
> > +++ b/net/netfilter/nf_flow_table_offload.c
> > @@ -696,6 +696,17 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
> >           flow_offload_eth_dst(net, flow, dir, flow_rule) < 0)
> >               return -1;
> >
> > +     if (flow->priority) {
> > +             struct flow_action_entry *entry;
> > +
> > +             entry = flow_action_entry_next(flow_rule);
> > +             if (!entry)
> > +                     return -1;
> > +
> > +             entry->id = FLOW_ACTION_PRIORITY;
> > +             entry->priority = flow->priority;
> > +     }
> > +
> >       tuple = &flow->tuplehash[dir].tuple;
> >
> >       for (i = 0; i < tuple->encap_num; i++) {
> > diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
> > index 32b4281038dd..dd3ac2b9c963 100644
> > --- a/net/netfilter/nft_flow_offload.c
> > +++ b/net/netfilter/nft_flow_offload.c
> > @@ -117,6 +117,13 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
> >       if (tcph)
> >               flow_offload_ct_tcp(ct);
> >
> > +     /* Whatever classified this packet before it reached the flowtable also
> > +      * describes every packet the hardware will forward in its place, so
> > +      * carry it into the offload rather than losing it with the software
> > +      * path.
> > +      */
> > +     flow->priority = pkt->skb->priority;
> > +
> >       __set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
> >       ret = flow_offload_add(flowtable, flow);
> >       if (ret < 0)
> >
> > base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
> > --
> > 2.53.0
> >

