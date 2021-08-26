Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C2CC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7605360EFE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7605360EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59fmZbQFUnK/tD+clk4o9jn2Se5Cw/fT0WSxxf+SF6w=; b=BR2dVhrM81rBTp
	P2uLZnVM78BAzdMYKwsDyzedtSk7paYhvgrHj88DUbaCbIYbJvKh3KO+YGHKv6gLzrLK0WSmWsm+q
	ugNOWxpC1p9tB9hdxvQofsLyzZPq4S+OzLTeWYp/W1Azbd6DqM8drq18QuojszQ4NTyBdRcGfUrOa
	fA24FkJ/qwrkcwnXc7VBo0ZjOBj4W99GT3MagczavBUpRCFg0lt86bV1Ve6oX3Nr3d5++JAW7oeWc
	n3l7R8NJ2ELi3TMPvDq3rwNcQ0gtUGTQBuJpMhUatNJVb2oPnGDEFIqDgkbLPJ53Qewq/JFDSspN9
	MUycjjS+t+bC2jUwYAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ2p9-008j41-07; Thu, 26 Aug 2021 00:00:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ2ov-008j0k-1b; Thu, 26 Aug 2021 00:00:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id f10so675503wml.2;
 Wed, 25 Aug 2021 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0Tchv2oY6Cx3fLEGg+fdfAoeAssl1qaeHYeW6E4lQ7Q=;
 b=gc3Iy7HEp9wXG/mB+BJp5EG4H4Pwz07bMEwIxJKOWfozIYqXvlCbd4eKuaCXzmrzVT
 sGKEOZPjrfSgCkPbZpyrmx30hdBuQ/7fZQxP6sI82h3VYrJZqCWYNiBlavh4jdyDUtRR
 IbUt0LxHq/RkPTuJzyStLFdOmHiu3Fo1SFzG5kYZdDBwdLsEPFFZ2qS8mIB+QABG7azh
 L1ldkFxCxhAvPLCMHfIbIwOY+sSONktD3FtlBVVHoxT0tnv4zISg8XaCvhNw+ToQcfme
 Ic/nCsex1MTo4vLATBUG4RkW2QYHbSYf/w2r1wWghna6sYoE4JXHzXsKgjubfU8N3Uqn
 HDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Tchv2oY6Cx3fLEGg+fdfAoeAssl1qaeHYeW6E4lQ7Q=;
 b=jdqXMXyMfdX4KTJNMVPCl4oBoAV5LxzkdYgRi1PM5rdj3D2F3FOoBx6VEaitoFM1Rn
 6uM2CfZzmfT+KZ2w4gv1/fEfS24nVcLP1xc1Q8N+xp7ah3Sg3rR3IHSMXaafFniIPIov
 NpTGs4n87Gl3IBs3xzrHS9I2YOtUdoQ9GlAgT2qNcpJOVkhyRFd8AyrLo0XZqLJZ/HhN
 WkL/PGlEMBaterJOkfbBNfshqvSFDREC4oi/cGZ3ybHqaRny5hxOkyR3JDXcRwfHpVja
 an6TbUh9Rx7zQMACqHIKjrQikTWs+w0BSnzLlx/Ppc3Ms0TMAO2wmblvq8GgxlmRtUj/
 Jyjw==
X-Gm-Message-State: AOAM531A5aZE3BDj6POSTy6e4fEvK3V50mp/hgVRR+rTYS6FzxX20vDG
 /CE7W1HYOYxSgB+gP8HXaD4=
X-Google-Smtp-Source: ABdhPJxDv4UaIWb/Mq2+rTcw8JbYo2WHdxTa485C/RXoXJrSJcf0XsuVcHphfM7W6O/0DfrBU4FcYg==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr808506wmc.95.1629936031747;
 Wed, 25 Aug 2021 17:00:31 -0700 (PDT)
Received: from skbuf ([82.78.148.104])
 by smtp.gmail.com with ESMTPSA id q11sm1281281wrx.85.2021.08.25.17.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 17:00:31 -0700 (PDT)
Date: Thu, 26 Aug 2021 03:00:30 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 0/2] DSA slave with customise netdev features
Message-ID: <20210826000030.dhiwv4puqiqyh3re@skbuf>
References: <20210825083832.2425886-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825083832.2425886-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_170037_143862_E888743A 
X-CRM114-Status: GOOD (  28.35  )
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

On Wed, Aug 25, 2021 at 04:38:29PM +0800, DENG Qingfang wrote:
> Some taggers, such as tag_dsa.c, combine VLAN tags with DSA tags, which
> currently has a few problems:
>
> 1. Unnecessary reallocation on TX:
>
> A central TX reallocation has been used since commit a3b0b6479700
> ("net: dsa: implement a central TX reallocation procedure"), but for
> VLAN-tagged frames, the actual headroom required for DSA taggers which
> combine with VLAN tags is smaller.

If true, this would be a major failure of the central TX reallocation idea.

However, for this to fail, it would mean that there is a code path in
the network stack that routinely allocates skbs with skb_needed_headroom(skb)
smaller than dev->needed_headroom. That's the only thing that would trigger
reallocs (beside cloned skbs).

The fact that we ask for a dev->needed_headroom that is a bit larger
than what is needed in some cases is not an issue. We should declare the
largest dev->needed_headroom that should cover all cases.

Would you please let me know what is the stack trace when you apply this
patch?

-----------------------------[ cut here ]-----------------------------
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 6d6f1aebf1ca..1924025ac136 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -600,6 +600,10 @@ static int dsa_realloc_skb(struct sk_buff *skb, struct net_device *dev)
 		/* No reallocation needed, yay! */
 		return 0;
 
+	netdev_err(dev, "%s: skb realloc: headroom %u, tailroom %u, cloned %d, needed_headroom %d, needed_tailroom %d\n",
+		  __func__, skb_headroom(skb), skb_tailroom(skb), skb_cloned(skb), needed_headroom, needed_tailroom);
+	WARN_ON(!skb_cloned(skb));
+
 	return pskb_expand_head(skb, needed_headroom, needed_tailroom,
 				GFP_ATOMIC);
 }
-----------------------------[ cut here ]-----------------------------

>
> 2. Repeated memmoves:
>
> If a both Marvell EDSA and VLAN tagged frame is received, the current
> code will move the (DA,SA) twice: the first in dsa_rcv_ll to convert the
> frame to a normal 802.1Q frame, and the second to strip off the 802.1Q
> tag. The similar thing happens on TX.

I don't think a lot of people use 8021q uppers with mv88e6xxx. At least
the error messages I've seen during the few times when I've booted the
Turris Mox would seem to suggest that.

The code that converts DSA 'tagged' frames to VLAN tags originates from
Lennert Buytenhek himself.

>
> For these tags, it is better to handle DSA and VLAN tags at the same time
> in DSA taggers.

No objection there.

>
> This patch set allows taggers to add custom netdev features to DSA
> slaves so they can advertise VLAN offload, and converts tag_mtk to use
> the TX VLAN offload.
>
> DENG Qingfang (2):
>   net: dsa: allow taggers to customise netdev features
>   net: dsa: tag_mtk: handle VLAN tag insertion on TX
>
>  include/net/dsa.h |  2 ++
>  net/dsa/slave.c   |  3 ++-
>  net/dsa/tag_mtk.c | 46 ++++++++++++++++++++++------------------------
>  3 files changed, 26 insertions(+), 25 deletions(-)
>
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
