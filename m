Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9C8C5B572
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 23:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3qPDFXgplZ5oaO13rh5SXHaEjFeglT/aQYRf2YpTTo=; b=Q5s40kjFixIcwIz6TueYPYnoTz
	BOOimyIhJg8tbOd1dVfaFaQE5Dyyn2wpShdXt4UMrTF5pByPwG374vHHKZdgA/QWieS+Plzk/66Ox
	P1pUMuEKZol08IhsBACr7rLXnmSXlyDKAkK0KrVImR1+fRbfMM+3jNywIaUjnCpajPk1yExLyNMSY
	iXwZxs481vlmJWr5X9YcpN1nkOVHrYLLnK2ogKRaU7vtZlTjCSWYgUI0CC0LMUFroTEvoRk9QHMIJ
	z3pCpWEORM5loCzIqeizXB/0L4+h/v8dIeu/4qtrCd8yMwq5xizvIimMlNbGKNW6FpgrBYqM/hzn5
	3Ksdq9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwpHl-0000000AdXu-3jMv;
	Wed, 19 Aug 2026 23:01:29 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwpHi-0000000AdXD-1QiC
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 23:01:28 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-836c4474028so20783427b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 16:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787180484; cv=none;
        d=google.com; s=arc-20260327;
        b=ZrogLmofIOC9K5tt8jk/gYGn4WwZo2Ew21QDdHAdTOn0HSutOERZlWYeFn80bAgKmH
         UOiyQKd+yr4Yz85O7CeacgmgLlz27k+Mo6KoJny44mWQRjW87CMOshGnJc94AYl/rBCT
         pgsviPG8q+iAVo1ZWJf+MuHE1SCDmOEe5k1hToMbfz0pfJs30risL6cw1oz69OXcaPkV
         JwyQQBtJ+b7j9Wd+/31J5tP76eK8neypylYw33Vq5pXgHadGpZWIRiKcgMiMEqcfYDfX
         xXSCh5cGZBvKQjQ+tlBBPXyan+xtHSn5yx3DYNgoEjzwQ7kFI6YV/L+gcV5rSOFu3lxS
         AVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e3qPDFXgplZ5oaO13rh5SXHaEjFeglT/aQYRf2YpTTo=;
        fh=H4BhJMQlKZeVyxNU5ZFg3g87MBzH6Kftthi35RatPLk=;
        b=c198XPJ1rQCHAE1tUPZU6uiyxDF+u1Dvl8d1V83so4FQoJTuVnGgB1/gRKEQW0F58Y
         HN0eHk7V2S16ziXxaQWbHAkHoLSLsqgVHwG+BhRi0W83aKlk1HtjOoIUL01MFpdUNezC
         0iD5+XByEr7WVFZupI4jIqK7GQqfOplDSArpZbqzMZNv4mMogqChyRVSELUW4XgDFkWb
         nDfuhjnT2JjnzVJuVr10o8iWPmgnGF/teoCCIuo/hX5i8aisN9f/66t4SYSk/OnYfPMD
         Db49rj4SHcRbc8UhhaUwKMqpZAizRwUWTAli5GZyg+UvnNSUgIPKh7Y3k0oNGhrz7L29
         gPdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787180484; x=1787785284; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e3qPDFXgplZ5oaO13rh5SXHaEjFeglT/aQYRf2YpTTo=;
        b=Qje5BL3kIoc9L5OfeBYQBorH24iWhFvKsjP1Ne5LNPp0NkBftw32yQwgqsA4zpkitS
         U1+XLhdYnCAItYQushIE4uAPUM5QRK0vKnVP+BDFtf9oCYnFXwmezvInj/19Sqpj7uQU
         Rzfgw6CGsrwWii3EJDsl9ayvbimbnbWQGSIOV9trfDC2zNzCVcAWghPfcUdzXzrPaD+T
         cG7OkIiP6yVc7teLnOy3RIQsAzKk08X3CVcgYFGJzfNXAgq31d3WMnVbOSt3l3bkeLU1
         W2YaEU2fkcB8UbcozZaJRlDuV5s5MzSixGgGA4d1m2q3Bqp7WvT/nV5iiVfxFpSEqQtW
         5TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787180484; x=1787785284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3qPDFXgplZ5oaO13rh5SXHaEjFeglT/aQYRf2YpTTo=;
        b=WmvXq/BoCct3LmuFHsUpkhLMcSAwpi1Vlxr+Ex7fK+jsiVUtRDWjqignmE762eUNaa
         bocrRVOc+I4OkuKxOvfsJzyM+vqjfIxP1yyXdjWcc8SJ0f50YsoWgNRk2NI3SxzRjd1K
         w3SxMrflHV80+C2idavD+cKWiEN2gDJC5WX1hRGMICKOgEV2qmuR/oLFfRwnF7tFfnZb
         6DTBfV4ujJYAtBqBOhjWzNOKbqH9AIp88FLaBpZCRUIDylIQX6ADc4wLaZlaAKI5pClB
         JmSKKrgUb9/QZGF353SV0RxdfO3eeXytbgRR86A4pIG1lY0WEDq5IqhLUuP90zGmwvhi
         +Afw==
X-Forwarded-Encrypted: i=1; AHgh+RoT+Fy0RRoRPjliOVsuwp33J/+eTYOiKy1VdS3qKFU/TpQ50A7ppmG/tLwxhtZfyAAyji83ZEulpybLWheoXg==@lists.infradead.org
X-Gm-Message-State: AFuF++nOVnS9Y68+CiDkmeyw6NR1BzzxDtfDeLQcNhuYCVSJqaRrMPsP
	CDhU57JsReCxFrIdhU7e7Je0vOZJXb+e+xkVC3FQLp20voIm3Lc3kaFC83J0F+BB6DDK/grZ/Rp
	R+QI4t5913UAegR3fVw9hnSUlOf0Kat4=
X-Gm-Gg: AR+sD12hd18RWNeAGSr9z8lbQsbtrNPQspytomEslBo/eQ50c97jNyrtwPKzHnSEI94
	/1zBR43LtwNiCKMKOuZVF9adI5oU8Jh+hHyN3F/DJbCmE5cPXExnKN7Ykv8z6UWmcxefZwOMcbk
	tTLNqVkunDEIXJkGGhWvE3xkP7NFCz8VejoM+zT6B7YmhgjsB5wAawxyuPYTKcNaQoFEol1ywjE
	BoJDfmkFSAR4NqiKyD5hvslQ80eVTiYknbav+ZE1wPqX8elgHeBQr/QYVGMOsXqjTRNo4c9j7mP
	1TzzAiajyGJOOOU19inylCkBxzJl181owWdVHbdGh4s/DBrsguunKngow2G+aFYRAePfmonbqat
	X4A==
X-Received: by 2002:a05:690e:dce:b0:667:bae0:e55e with SMTP id
 956f58d0204a3-66ccb55edb6mr2785816d50.4.1787180484224; Wed, 19 Aug 2026
 16:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260819093226.193385-1-zhaoping.shu@mediatek.com>
In-Reply-To: <20260819093226.193385-1-zhaoping.shu@mediatek.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 19 Aug 2026 19:00:46 -0400
X-Gm-Features: AcwNN1WEM4e_ulk3k65OjzBP61d1mbrUjNG1Ufz5gSu5el3BQMuGb2PvDL75O80
Message-ID: <CAF=yD-Lx7aHQEr6MN7D8LBp9ctZz3B3dmfsyhLbPxWaiK1UBzw@mail.gmail.com>
Subject: Re: [PATCH net v4] net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()
To: zhaoping.shu@mediatek.com
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	dsahern@kernel.org, willemb@google.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	haijun.liu@mediatek.com, xiayu.zhang@mediatek.com, lambert.wang@mediatek.com, 
	Iven.Yang@mediatek.com, HW He <hw.he@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_160126_398049_0CD252BD 
X-CRM114-Status: GOOD (  31.78  )
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

On Wed, Aug 19, 2026 at 5:37=E2=80=AFAM <zhaoping.shu@mediatek.com> wrote:
>
> From: HW He <hw.he@mediatek.com>
>

Perhaps a brief one sentence summary of the problem, before
a detailed repro. For instance:

Fraglist GRO plus hardware GRO can create an fraglist of
HW-GRO packets. This cannot be segmented back into
the original form.

Avoid constructing such a GSO packet, by flushing an already
built fraglist GRO packet if a hardware GRO packet arrives.

> A device supports GRO_HW, and the device driver enables the
> NETIF_F_GRO_FRAGLIST feature. During a tethering test,
> skb_gro_receive_list() reaggregates the GSO packet. However,
> skb_segment_list() cannot segment this packet back into
> the original packets, which leads to IP fragmentation or packet drop.
>
> Scenario (Tethering/Forwarding):
> 1.Driver submits a single TCP packet, P1. P1 is kept in the
> gro_list as the first packet.
>
> 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> multiple TCP packets by HW_GRO, and its non-linear data is stored in
> frags[].
>
> 3. P1 and P2 match the GRO rules, and since there is no local socket,
> they are aggregated by skb_gro_receive_list(). The resulting skb,
> P3, has a frag_list entry that still contains frags[]:
> P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
>                                     [ frag[1] ]
>                                     [ frag[2] ]
>                                     ...
> 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> skb_segment_list() to segment P3. However, skb_segment_list() only
> segments the entries in frag_list. It does not segment the frags[]
> inside P2, so P3 is not restored to the original packets, which leads
> to IP fragmentation or packet drop in the following path.
>
> Check skb_is_gso(skb) and current GRO method, make sure fraglist GRO
> applies to consecutive non-GSO skb, others adopt regular GRO path.
>
> Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
> Signed-off-by: Zhaoping Shu <zhaoping.shu@mediatek.com>
> Signed-off-by: HW He <hw.he@mediatek.com>
>
> ---
> [3]: https://patchwork.kernel.org/patch/14747095
> [2]: https://patchwork.kernel.org/patch/14706032
> [1]: https://patchwork.kernel.org/patch/14702209
> ---
>  net/ipv4/tcp_offload.c   | 22 ++++++++++++++++------
>  net/ipv6/tcpv6_offload.c | 15 +++++++++++++--
>  2 files changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index 3b1fdcd3cb29..e74d99ca9fac 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -332,6 +332,7 @@ struct sk_buff *tcp_gro_receive(struct list_head *hea=
d, struct sk_buff *skb,
>                 flush |=3D skb->ip_summed !=3D p->ip_summed;
>                 flush |=3D skb->csum_level !=3D p->csum_level;
>                 flush |=3D NAPI_GRO_CB(p)->count >=3D 64;
> +               flush |=3D NAPI_GRO_CB(p)->is_flist !=3D NAPI_GRO_CB(skb)=
->is_flist;

Technically, is this one-line sufficient?

>                 skb_set_network_header(skb, skb_gro_receive_network_offse=
t(skb));
>
>                 if (flush || skb_gro_receive_list(p, skb))
> @@ -395,12 +396,20 @@ static void tcp4_check_fraglist_gro(struct list_hea=
d *head, struct sk_buff *skb,
>         struct net *net;
>         int iif, sdif;
>
> -       if (likely(!(skb->dev->features & NETIF_F_GRO_FRAGLIST)))
> -               return;
> -
>         p =3D tcp_gro_lookup(head, th);
>         if (p) {
> -               NAPI_GRO_CB(skb)->is_flist =3D NAPI_GRO_CB(p)->is_flist;
> +               /* flist GRO applies to consecutive non-GSO skbs */
> +               if (!skb_is_gso(skb) || !NAPI_GRO_CB(p)->is_flist) {
> +                       NAPI_GRO_CB(skb)->is_flist =3D NAPI_GRO_CB(p)->is=
_flist;
> +                       return;
> +               }
> +
> +               /* Fall back to the regular GRO path */
> +               if (NAPI_GRO_CB(p)->count =3D=3D 1)
> +                       NAPI_GRO_CB(p)->is_flist =3D 0;
> +
> +               NAPI_GRO_CB(skb)->is_flist =3D 0;
> +

This reduces the chance to have to flush, by downgrading fraglist GRO
packets if a hardware GRO packet is detected at the stage (count =3D=3D 1)
where fraglist is not enabled in practice.

This is quite a bit of complexity. And if hardware GRO is enabled, what
are the odds in practice that the device does not produce any hardware
GRO packets, yet the software GRO stack is capable of assembling
signficant GSO packets. I suspect low.

The solution is technically correct. But would simply disabling fraglist
GRO when hardware GRO is enabled not be simpler? Or only keeping
the flush and avoiding this micro-optimization.

>                 return;
>         }
>
> @@ -410,7 +419,7 @@ static void tcp4_check_fraglist_gro(struct list_head =
*head, struct sk_buff *skb,
>         sk =3D __inet_lookup_established(net, iph->saddr, th->source,
>                                        iph->daddr, ntohs(th->dest),
>                                        iif, sdif);
> -       NAPI_GRO_CB(skb)->is_flist =3D !sk;
> +       NAPI_GRO_CB(skb)->is_flist =3D !sk && !skb_is_gso(skb);
>         if (sk)
>                 sock_gen_put(sk);
>  }
> @@ -430,7 +439,8 @@ struct sk_buff *tcp4_gro_receive(struct list_head *he=
ad, struct sk_buff *skb)
>         if (!th)
>                 goto flush;
>
> -       tcp4_check_fraglist_gro(head, skb, th);
> +       if (unlikely(skb->dev->features & NETIF_F_GRO_FRAGLIST))
> +               tcp4_check_fraglist_gro(head, skb, th);
>
>         return tcp_gro_receive(head, skb, th);
>
> diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
> index f2a659cd6183..eec3778855eb 100644
> --- a/net/ipv6/tcpv6_offload.c
> +++ b/net/ipv6/tcpv6_offload.c
> @@ -26,7 +26,18 @@ static void tcp6_check_fraglist_gro(struct list_head *=
head, struct sk_buff *skb,
>
>         p =3D tcp_gro_lookup(head, th);
>         if (p) {
> -               NAPI_GRO_CB(skb)->is_flist =3D NAPI_GRO_CB(p)->is_flist;
> +               /* flist GRO applies to consecutive non-GSO skbs */
> +               if (!skb_is_gso(skb) || !NAPI_GRO_CB(p)->is_flist) {
> +                       NAPI_GRO_CB(skb)->is_flist =3D NAPI_GRO_CB(p)->is=
_flist;
> +                       return;
> +               }
> +
> +               /* Fall back to the regular GRO path */
> +               if (NAPI_GRO_CB(p)->count =3D=3D 1)
> +                       NAPI_GRO_CB(p)->is_flist =3D 0;
> +
> +               NAPI_GRO_CB(skb)->is_flist =3D 0;
> +
>                 return;
>         }
>
> @@ -36,7 +47,7 @@ static void tcp6_check_fraglist_gro(struct list_head *h=
ead, struct sk_buff *skb,
>         sk =3D __inet6_lookup_established(net, &hdr->saddr, th->source,
>                                         &hdr->daddr, ntohs(th->dest),
>                                         iif, sdif);
> -       NAPI_GRO_CB(skb)->is_flist =3D !sk;
> +       NAPI_GRO_CB(skb)->is_flist =3D !sk && !skb_is_gso(skb);
>         if (sk)
>                 sock_gen_put(sk);
>  #endif /* IS_ENABLED(CONFIG_IPV6) */
> --
> 2.17.0
>
>

