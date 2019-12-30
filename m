Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CF4C2D0D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 17:19:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C882071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 17:19:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lf+mVe5z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bPkQ4RY2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C882071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXloqu+1oW8wtc5gMcc+PfgM0KlRAZK8oBAf3LYlel0=; b=Lf+mVe5zjYNSHS
	EKqjhWmbgSKRYPyQUByyRdQLfPEKUtIArnd4JKYSIwCGN6ACEfks4Dld2v/p4mH3qD9qwbF4DFREk
	fgQCmmDqa1qSV6SWW/Kz6Fa33XAD6t4RP93AnkcfzMgh852GM2w5GbNusxrEPGmWYBJE1YfZmK9Zf
	iYNz5DzgyKzqIrBRp4nqG28JehcU8nrxJazk8YiMKpMAm1oip8mgZsjWgRggkmyfHQbI5n1JuMDxk
	i5+oV/sko+yQWIt1uRwctqpP7ijIcrMbyf8bXatNDOnviA4MCgBxW8twbTnO5mGx//TxpGJAG/tI+
	L0rseaC+r0fuYo1vFD1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilyhb-0005cT-OH; Mon, 30 Dec 2019 17:19:35 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilyhQ-0005T1-DR; Mon, 30 Dec 2019 17:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JZ9rQfX2tOmDDl9S4tJiNghTw2MpHUqrZGdgml1GwI4=; b=bPkQ4RY29qFPhW3hVPQ7pTfeeZ
 e/mb8oNjSJweJZV+Ub1ilf2+dVnWwYXPL0qOEHlwXBq9fc1Hk1AlUL9qKYvt1JVSadUo4KC9Vapje
 fgFfcuX/D6X8IPwBuA2QrigzOtSGgOMeshSRbgWOc3FT/4gg4IctjdmG8Hpg7Ge4nq7I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1ilyh1-00049n-56; Mon, 30 Dec 2019 18:18:59 +0100
Date: Mon, 30 Dec 2019 18:18:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Lobakin <alobakin@dlink.ru>
Subject: Re: [PATCH RFC net-next 04/19] net: dsa: tag_ar9331: split out
 common tag accessors
Message-ID: <20191230171859.GD13569@lunn.ch>
References: <20191230143028.27313-1-alobakin@dlink.ru>
 <20191230143028.27313-5-alobakin@dlink.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191230143028.27313-5-alobakin@dlink.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_091924_454544_4BF7261F 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Yoshiki Komachi <komachi.yoshiki@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Matteo Croce <mcroce@redhat.com>, Edward Cree <ecree@solarflare.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Sean Wang <sean.wang@mediatek.com>, Jiri Pirko <jiri@mellanox.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Paul Blakey <paulb@mellanox.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 "David S. Miller" <davem@davemloft.net>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 30, 2019 at 05:30:12PM +0300, Alexander Lobakin wrote:
> They will be reused in upcoming GRO callbacks.
> (Almost) no functional changes except less informative error string.
> 
> Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
> ---
>  net/dsa/tag_ar9331.c | 46 +++++++++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/net/dsa/tag_ar9331.c b/net/dsa/tag_ar9331.c
> index 399ca21ec03b..c22c1b515e02 100644
> --- a/net/dsa/tag_ar9331.c
> +++ b/net/dsa/tag_ar9331.c
> @@ -24,6 +24,25 @@
>  #define AR9331_HDR_RESERVED_MASK	GENMASK(5, 4)
>  #define AR9331_HDR_PORT_NUM_MASK	GENMASK(3, 0)
>  
> +static inline bool ar9331_tag_sanity_check(const u8 *data)

Hi Alexander

Please don't use inline in C files. Leave it to the compiler to
decide.

	Thanks
		Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
