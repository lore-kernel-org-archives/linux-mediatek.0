Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012AAC43602
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 06:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWhVhD5eLCMV4lXuEV0ZYaY1wQTvatZLeKGOm+NJE/g=; b=DXr+Ps59gbm+U3uejgaVejnodp
	r6jMCcuTyzv4GgzBujs1KLSuvs0m8qensRqLDPLYa4nPOVkdnOj6lEgnKz/m6rSOUUX7TxZhtYxuy
	7z5jZ9aPVq4pCVdxwZvkxkbSGhttApGavRoxmT8uoMtaTC0Q5aqJWIy8BWMoXDVnJUF0os+a5r5H4
	+3arj74cJgTpJFoCa3Ipr/DPunXxlSOgOEkYMMkEbXthCtW4hiwdvl+CSh8nkQCCz87O63swBIs2m
	H7JwlYEFBMYq5Hx361zJldXSFr4RliL/xMiWdvvOJwJuti6whukyCIOAUHW1I3/XF9DVBDpZFwQlS
	T6z6mPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoAN-00000000m9L-0Tjn;
	Wed, 01 Jul 2026 06:11:23 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoAK-00000000m8W-2KsX
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Jul 2026 06:11:22 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6986578d8c0so491746a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 23:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782886277; cv=none;
        d=google.com; s=arc-20260327;
        b=c51SqfaV8HFmN9LDRF60rrDZLKcMHRa/o+Zz2hBp6zeYghXZX6DLXpy/GjR7uiIPOO
         bCzq95EH0auHIMQ5cfoF5gI/jFua8hZVZreBvqNtWq3vhJrgCCsQLxtqytBflq+rzu1m
         V+tOW88gmJdN4h4r05GpKoE9g3zkn2n7WrqC+sH+XAsX9dDmUfYcE9ij/O/vI54ZMNTx
         SQ7zPBSH0bI9fZbZ+NLLbeljNoLsQRbBdwot0zrCj+czinbp153aR2EKBxj/32aZPqZd
         TFsSkxpFhJWP2B/SiBcMIae/xNuWuhljr7UL80dIG/8w1FHNoaAEalRDMKpobWqVkpA0
         CsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWhVhD5eLCMV4lXuEV0ZYaY1wQTvatZLeKGOm+NJE/g=;
        fh=FHNZW9QsfUYMZ5euuGuilFTXcOuo5PjBVSNATCFZUTs=;
        b=e4F2ebJKLNHWDnk03ubHkeb8nFr47ETUnFUX/35/g75MBSgP0QOmMq4ldE1agAQyFX
         FFKD9Rmy3zUSSBrQyHsJeaoIlWVjFvaACm0ngHhuhvD/IMTKBOiP+anh0e9hFEdG9bnW
         4uxSdsvM7VuMhuU5Wp/PTVmEWpclb6F+yort9IzaC+OfJfTl2bjOXa7zChxHBj4Vsuml
         oDpZ7BkPeT1WmibmLFSUtYl0MAA9YB+ohFBZO3NNAos5PiNcvXUAqLEITziKwiKQBZZL
         FQXkaaTu6tKpkLjMikEezBpnTK3lJTYBL/wZnUZwN7HZeW+30hqkXy4EIGIwi5Htb4IV
         VZgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782886277; x=1783491077; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWhVhD5eLCMV4lXuEV0ZYaY1wQTvatZLeKGOm+NJE/g=;
        b=bDQg94/XgUcmmNuEJM/JkjKBJ5K7npfYNI3tnfaR62C+Q4mmNivijn+xR5z67LqdI3
         bJCxHA5nodZyDq+bd7ckST6asblq5pQ2ppFSq13k0rht+073syFFhBuTVL8Aw1mEI7hO
         BKXCKtp42nWdxCJOBipYOEUaN6gohyguC447jBMQNG+3NLflmJgaS5grM5aakg7Ozv98
         hcu+S0mGQ4AUTHZoAXMjqabUH5/za72mCfWCzGaf5D1e5meUVqMkc9b09kJcSfis7uhJ
         Thqw7wAa3LbKKcbd9JDVlmKw/yh/sJ6FOcZb1r3b8/SD5H2x72+zAqu/hY1iKAYeKFIn
         erSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886277; x=1783491077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWhVhD5eLCMV4lXuEV0ZYaY1wQTvatZLeKGOm+NJE/g=;
        b=gtUo51ePQDkqcMXd8Z7qVo2cwEYt1To9GetH7eD6doOH/N7gwH/Wc69xuPqpTaanEb
         FDzMVXhgZNXfdYBVRVh559QgciCALVx8RBnydw/JK7tGV4LDWRB6QOiQvqhV08EkAtna
         We8CvwueH7Op5KdTlNNP5pHxjgzWK/Edg+/Z9xBQOANs0vpVYvtHQi3ppmOfjsr368r1
         60pEtxHnIHNJaMIcLwo9nYHK4XYy+TOzOCWi+Q+icM9KtH+B+l7j2MDpe/ceamK3PATo
         +MNCG4nCdNnjJrVCbDtj/LbMZQ5dNvNF3NCAVES/F9KkqsQlr8BLMVzcfsx99RomUnd3
         T+Eg==
X-Forwarded-Encrypted: i=1; AHgh+RqNQvfC4vskt5DCBDG2x4bPW7OKPv35DSQhqYSEXSAxSEGZEZ4kkXSxugvGoaFlnq6oy22UMCdzd0Z0odoC+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxN3ZRiH5+LKcbA1pfnZ+ZpQQfLNUdl13zlL1dzph/eqdczgGE1
	OkkR6B8jyRosJiqWcVZN4tQ0LrRhXmLghV3emxMGaB1mzUwmXXQycwHfeprW5y6HffRIKYRph4t
	3ARizML9HA8oB0r3yRbfevQQts6pzkLA=
X-Gm-Gg: AfdE7ckeWsVkPPc9B6rCfw+r1mgm6a1pT9r9JMYiKKpM4wqGXjZhTOXQTSDYrw5lnxM
	y3n4qabkfOFEb9DmEjHNCBG+llVcnMk+piC4mpUlAtIOLI6yki1LEdYPBj9/WWR0Bg/gKPaeiBS
	Ian7iLaEvXwgYmhxBjfOgbjGXwfDXXxV56obD5p/iw/Bj4AhgvKbdWIt2lsuhgYTEsTeGDQNj7p
	2vuwwqyhjYknL2GdoNiwjQQq/5NcyLSPQqCwRQWy09oKYQ7CHhPwqUv+FozoPMe4CnmBVDMLkJ5
	GkmAFko=
X-Received: by 2002:a17:907:3e18:b0:c12:a330:b92b with SMTP id
 a640c23a62f3a-c12aa14aac6mr6173366b.40.1782886276371; Tue, 30 Jun 2026
 23:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260630065735.3341614-1-pawlik.dan@gmail.com> <akOCJI-2kAAwOQzz@chamomile>
In-Reply-To: <akOCJI-2kAAwOQzz@chamomile>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Wed, 1 Jul 2026 08:11:05 +0200
X-Gm-Features: AVVi8CfA9uhypD8RuUIaiCQhrLk2tdtBO915kC01GwUewd1n6TYEXO1SRl3IXQQ
Message-ID: <CALC2ApjGZFFPXr4d-r+4VNCpQO1N3Z4NOiBXwYU307jm-626OA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] netfilter: nf_flow_table_path: L2 bridge offload
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, 
	bridge@lists.linux.dev, coreteam@netfilter.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_231120_652716_AA5E9633 
X-CRM114-Status: GOOD (  28.51  )
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

Hi Florian, Pablo,

I'll leave it up to you - if `br_netfilter` isn't the right approach
in this case, then we can drop that series.

Before your reply, I wasn't familiar with Eric Woudstra's
"bridge-fastpath" series - thanks for the tip.
I'll take a look at it and try to build on those patches.

Thanks, and best regards,
Dan


wt., 30 cze 2026 o 10:45 Pablo Neira Ayuso <pablo@netfilter.org> napisa=C5=
=82(a):
>
> Hi,
>
> On Tue, Jun 30, 2026 at 08:57:30AM +0200, Daniel Pawlik wrote:
> > This series adds L2 bridge offload support to nft_flow_offload, allowin=
g
> > bridged IPv4/IPv6 flows to be accelerated by the flowtable fast path
> > without requiring L3 routing.
> >
> > Background
> > ----------
> > Hardware flow offload engines (e.g. MediaTek PPE) can accelerate bridge=
d
> > traffic but require that nft_flow_offload detect and handle bridged flo=
ws
> > differently from routed ones: no routing table lookup, MAC addresses fr=
om
> > the Ethernet header, and VLAN context pre-populated from the bridge por=
t.
> >
> > v2: Fix missing Returns: tags in kernel-doc comments for the three new
> >     bridge helpers (br_fdb_has_forwarding_entry_rcu,
> >     br_vlan_get_offload_info_rcu, br_vlan_is_enabled_rcu).
> >
> > Patches
> > -------
> > 1/5  net: export __dev_fill_forward_path
> >      Refactors dev_fill_forward_path() to expose __dev_fill_forward_pat=
h()
> >      which accepts a caller-supplied net_device_path_ctx, needed to
> >      pre-populate VLAN state before the forward path walk.
> >
> > 2/5  net: bridge: add flow offload helpers
> >      Adds br_fdb_has_forwarding_entry_rcu(), br_vlan_get_offload_info_r=
cu()
> >      and br_vlan_is_enabled_rcu() to expose bridge state to nft_flow_of=
fload
> >      without requiring inclusion of net/bridge/br_private.h.
> >
> > 3/5  netfilter: nf_flow_table_path: add L2 bridge offload
> >      Core of the series. Adds nft_flow_offload_is_bridging() detection,
> >      nft_flow_route_bridging() which avoids nf_route() (fails for
> >      bridged-only subnets), MAC/VLAN pre-population for bridged flows,
> >      and a dst leak fix. nft_flow_route() becomes a thin dispatcher.
> >
> > 4/5  netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path in=
fo
> >      Fixes zero-source-MAC in PPE entries when a bridged flow traverses
> >      MT7996/MT7915 WiFi WDMA hardware.
> >
> > 5/5  netfilter: nf_flow_table_path: add VLAN passthrough support
> >      Records VLAN encap info for passthrough-mode bridge ports so hardw=
are
> >      offload entries include the correct VLAN tag.
> >
> > Rebase note
> > -----------
> > Originally developed against OpenWrt pending-6.18 patches by Ryan Chen
> > <rchen14b@gmail.com> and Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
> > Rebased to current upstream: path discovery infrastructure moved to
> > nf_flow_table_path.c in commit 93d7a7ed0734 ("netfilter: flowtable: mov=
e
> > path discovery infrastructure to its own file"), so all netfilter chang=
es
> > now land in that file rather than nft_flow_offload.c.
> >
> > How to enable bridge offload
> > -----------------------------
> > 1. Load kmod-br-netfilter so that bridged IP traffic traverses the
> >    netfilter forward chain.
> >
> > 2. Enable netfilter hooks on the bridge:
> >      echo 1 > /sys/class/net/<br>/bridge/nf_call_iptables
> >      echo 1 > /sys/class/net/<br>/bridge/nf_call_ip6tables
>
> This requires br_netfilter which is a no go.
>
> Sorry, but we should really target at the native nf_conntrack_bridge
> support.
>
> > 3. Register bridge member interfaces in the nft flowtable:
> >      table inet filter {
> >          flowtable f {
> >              hook ingress priority filter
> >              devices =3D { eth0, wlan0 }
> >          }
> >          chain forward {
> >              type filter hook forward priority filter
> >              meta l4proto { tcp, udp } flow add @f
> >          }
> >      }
>
> Yes, but br_netfilter makes no sense for nftables.
>
> br_netfilter was made to fill gap at the time ebtables was lagging a
> lot behind iptables in terms of features. And getting ebtables on pair
> with iptables in functionality was not feasible either, because it
> required many new extensions that were specific of the bridge family,
> which probably was not a big deal, but it also required to get
> the ebtables command line tool on pair with iptables userspace, which
> has received more development attention/effort that the bridge tool.
>
> All of this does not stand true anymore with nftables, where the
> bridge family capabilities are at pair with the inet families.
>
> I am looking now at the native flowtable bridge support, I will get
> back to you with updates.

