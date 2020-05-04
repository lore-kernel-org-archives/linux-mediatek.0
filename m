Return-Path: <SRS0=oHVa=6S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E339C3A5A9
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 10:23:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB62206E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2020 10:23:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NR3k9e8A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qr8TqGXl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB62206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4KHzG9sq58s8czlew2jNMyOwuIpJ3BdJQE9wxkPz3c=; b=NR3k9e8AN/LAWV
	jZlg+Ak96Mv1doBIzE6m5e98IAPqpsYtEiQ5qi5SXZfkoubJXfNQg00LaFq0KnbhUZT+oCck40485
	HJGyuFwrlrkpVTrJ533hkFUiJfsOifErNilbeAMtB/BUpdZykn3lBeMRoR7tPhGL9q6vIXQYnC0Mw
	hIx23RsdYJEZ7wTbAe4MVWq6Pyyr8PZZ6MgJD/8sdQrVvMOaAQLJaNaifL1mYn8m2vPnTpGZ1+KXN
	m0JQgXsNsJI0iKIcYklT6KcstKLo8A8QJrKlmIm0FnZ/b20vpeifC75bISyOTug9E/0O++sofvsdV
	nxdFO2IQkttyXdZXlKQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVYGM-0001R1-Qn; Mon, 04 May 2020 10:23:50 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVYGJ-0001OW-JO
 for linux-mediatek@lists.infradead.org; Mon, 04 May 2020 10:23:49 +0000
Received: by mail-ej1-x643.google.com with SMTP id s9so13437354eju.1
 for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2020 03:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QKIehFHWwvSGI5j1A6FtkuGdpgXvVnZnjyFdcNCcJF8=;
 b=qr8TqGXlb4D2tb0+ne2Da+ZeWmUcoSEUNp75Arx2DUbi1MCd3GWLF4rCWrPThPEsDx
 uATvXfH+QXaCMXKePq4rSWqmBojLlTX07fGXIGiZfDLnP+/l+caHSZMW5gj6wtgBrIO8
 XQvIVysTazIOE/YszOyPGzsa+8HelrXAZw7fHyNfECF1h0pKIOcc8fvpw43AYCAbGMAL
 iILxiWDnpqjfRGXdfeC+nYildxd34pOnkSUxWUypydxTzuDcIiN88MxhTepk4r0YwNkA
 Syo0uLe4P2Pj2ERM6A1tZ2KXpRdsoSpaSti9bwur4qNQYPE3/jhp0fCmXG4zQ0wYyGQq
 Nssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QKIehFHWwvSGI5j1A6FtkuGdpgXvVnZnjyFdcNCcJF8=;
 b=BQ5teP7Ri3b9C4WEdI9nCMA2Y69kC0DN/lsd7ELYoGpTepkbMvdR6rBbzWFm8JwGuc
 yFMFih9X3EVdQxJ1MYFkTkRHzGCDQ3O/iroIb65MI6V9BNQTDnvoKl9gs3O9BMjlOzKr
 c1FUyUcviovi8OnwMPwm7jVp/E47QvfVn73mEGzQzpoUXfJUkQF22k0gjzyfFWsoD2AR
 yAI47V8fDkQBV6nbO89cCShmJEDeGu5UOhjy+PEaeMp9Pkkpag5iOoeLn+8PsPgRm7cl
 wiS5dkLEW89eCvm04SOYvOJzVy0v/wZaO5R72QbTcR4sHhu0FPAOktN7hAEPuKcdiSdO
 /bZg==
X-Gm-Message-State: AGi0Pua92WNYTOWjjnhmeNPgGAW3wPcrV5/+D8Il3afzuqrXTV0T7TKL
 BIHr/5FNRbE0G/0YkNT8HirYJTstSkbMqU8Au9E=
X-Google-Smtp-Source: APiQypLfV/REVA1t9wWKlXZlCIVJ3T/UyzTw6ZnIBS3pGt4uSR3Rf8vhSbrXmFSJEnGjx1c944pfHibLBSi85R8MpYM=
X-Received: by 2002:a17:906:2503:: with SMTP id
 i3mr13454264ejb.293.1588587825234; 
 Mon, 04 May 2020 03:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200425120207.5400-1-dqfext@gmail.com>
In-Reply-To: <20200425120207.5400-1-dqfext@gmail.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Mon, 4 May 2020 13:23:34 +0300
Message-ID: <CA+h21hpeJK8mHduKoWn5rbmz=BEz_6HQdz3Xf63NsXpZxsky0A@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: fix roaming from DSA user
 ports
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_032347_639174_93BD7AD4 
X-CRM114-Status: GOOD (  28.74  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 riddlariddla@hotmail.com, Paul Fertser <fercerpav@gmail.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Stijn Segers <foss@volatilesystems.org>, Szabolcs Hubai <szab.hu@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Tom James <tj17@me.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Qingfang,

On Sat, 25 Apr 2020 at 15:03, DENG Qingfang <dqfext@gmail.com> wrote:
>
> When a client moves from a DSA user port to a software port in a bridge,
> it cannot reach any other clients that connected to the DSA user ports.
> That is because SA learning on the CPU port is disabled, so the switch
> ignores the client's frames from the CPU port and still thinks it is at
> the user port.
>
> Fix it by enabling SA learning on the CPU port.
>
> To prevent the switch from learning from flooding frames from the CPU
> port, set skb->offload_fwd_mark to 1 for unicast and broadcast frames,
> and let the switch flood them instead of trapping to the CPU port.
> Multicast frames still need to be trapped to the CPU port for snooping,
> so set the SA_DIS bit of the MTK tag to 1 when transmitting those frames
> to disable SA learning.
>
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

I think enabling learning on the CPU port would fix the problem
sometimes, but not always. (actually nothing can solve it always, see
below)
The switch learns the new route only if it receives any packets from
the CPU port, with a SA equal to the station you're trying to reach.
But what if the station is not sending any traffic at the moment,
because it is simply waiting for connections to it first (just an
example)?
Unless there is any traffic already coming from the destination
station too, your patch won't work.
I am currently facing a similar situation with the ocelot/felix
switches, but in that case, enabling SA learning on the CPU port is
not possible.
The way I dealt with it is by forcing a flush of the FDB entries on
the port, in the following scenarios:
- link goes down
- port leaves its bridge
So traffic towards a destination that has migrated away will
temporarily be flooded again (towards the CPU port as well).
There is still one case which isn't treated using this approach: when
the station migrates away from a switch port that is not directly
connected to this one. So no "link down" events would get generated in
that case. We would still have to wait until the address expires in
that case. I don't think that particular situation can be solved.
My point is: if we agree that this is a larger problem, then DSA
should have a .port_fdb_flush method and schedule a workqueue whenever
necessary. Yes, it is a costly operation, but it will still probably
take a lot less than the 300 seconds that the bridge configures for
address ageing.

Thoughts?

>  drivers/net/dsa/mt7530.c |  9 ++-------
>  drivers/net/dsa/mt7530.h |  1 +
>  net/dsa/tag_mtk.c        | 15 +++++++++++++++
>  3 files changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 5c444cd722bd..34e4aadfa705 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -628,11 +628,8 @@ mt7530_cpu_port_enable(struct mt7530_priv *priv,
>         mt7530_write(priv, MT7530_PVC_P(port),
>                      PORT_SPEC_TAG);
>
> -       /* Disable auto learning on the cpu port */
> -       mt7530_set(priv, MT7530_PSC_P(port), SA_DIS);
> -
> -       /* Unknown unicast frame fordwarding to the cpu port */
> -       mt7530_set(priv, MT7530_MFC, UNU_FFP(BIT(port)));
> +       /* Unknown multicast frame forwarding to the cpu port */
> +       mt7530_rmw(priv, MT7530_MFC, UNM_FFP_MASK, UNM_FFP(BIT(port)));
>
>         /* Set CPU port number */
>         if (priv->id == ID_MT7621)
> @@ -1294,8 +1291,6 @@ mt7530_setup(struct dsa_switch *ds)
>         /* Enable and reset MIB counters */
>         mt7530_mib_reset(ds);
>
> -       mt7530_clear(priv, MT7530_MFC, UNU_FFP_MASK);
> -
>         for (i = 0; i < MT7530_NUM_PORTS; i++) {
>                 /* Disable forwarding by default on all ports */
>                 mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index 979bb6374678..82af4d2d406e 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -31,6 +31,7 @@ enum {
>  #define MT7530_MFC                     0x10
>  #define  BC_FFP(x)                     (((x) & 0xff) << 24)
>  #define  UNM_FFP(x)                    (((x) & 0xff) << 16)
> +#define  UNM_FFP_MASK                  UNM_FFP(~0)
>  #define  UNU_FFP(x)                    (((x) & 0xff) << 8)
>  #define  UNU_FFP_MASK                  UNU_FFP(~0)
>  #define  CPU_EN                                BIT(7)
> diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> index b5705cba8318..d6619edd53e5 100644
> --- a/net/dsa/tag_mtk.c
> +++ b/net/dsa/tag_mtk.c
> @@ -15,6 +15,7 @@
>  #define MTK_HDR_XMIT_TAGGED_TPID_8100  1
>  #define MTK_HDR_RECV_SOURCE_PORT_MASK  GENMASK(2, 0)
>  #define MTK_HDR_XMIT_DP_BIT_MASK       GENMASK(5, 0)
> +#define MTK_HDR_XMIT_SA_DIS            BIT(6)
>
>  static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
>                                     struct net_device *dev)
> @@ -22,6 +23,9 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
>         struct dsa_port *dp = dsa_slave_to_port(dev);
>         u8 *mtk_tag;
>         bool is_vlan_skb = true;
> +       unsigned char *dest = eth_hdr(skb)->h_dest;
> +       bool is_multicast_skb = is_multicast_ether_addr(dest) &&
> +                               !is_broadcast_ether_addr(dest);
>
>         /* Build the special tag after the MAC Source Address. If VLAN header
>          * is present, it's required that VLAN header and special tag is
> @@ -47,6 +51,10 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
>                      MTK_HDR_XMIT_UNTAGGED;
>         mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;
>
> +       /* Disable SA learning for multicast frames */
> +       if (unlikely(is_multicast_skb))
> +               mtk_tag[1] |= MTK_HDR_XMIT_SA_DIS;
> +
>         /* Tag control information is kept for 802.1Q */
>         if (!is_vlan_skb) {
>                 mtk_tag[2] = 0;
> @@ -61,6 +69,9 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev,
>  {
>         int port;
>         __be16 *phdr, hdr;
> +       unsigned char *dest = eth_hdr(skb)->h_dest;
> +       bool is_multicast_skb = is_multicast_ether_addr(dest) &&
> +                               !is_broadcast_ether_addr(dest);
>
>         if (unlikely(!pskb_may_pull(skb, MTK_HDR_LEN)))
>                 return NULL;
> @@ -86,6 +97,10 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev,
>         if (!skb->dev)
>                 return NULL;
>
> +       /* Only unicast or broadcast frames are offloaded */
> +       if (likely(!is_multicast_skb))
> +               skb->offload_fwd_mark = 1;
> +
>         return skb;
>  }
>
> --
> 2.26.1
>

Thanks,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
