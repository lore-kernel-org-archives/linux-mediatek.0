Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ADBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 12:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0dOT0aoWjL+lbs0iOTlnO4cjKCDOz1SepxYS4dSMs8=; b=xifYu1vLsBPj7c
	8QRUqqyJ/QrStt7YNuY/bsAX67aVLhJ6Bp3r19jINE95ed8QVSKMuTv5T30boMiqCt8OVu2iT+7jz
	fpgOZ/ICHm04lj2JH3tYMqrhwkB4eS9dwj+RFdH4Zu5iugMOB0+zioySy9PTF1epVUHZRNY4hJ7Uc
	a4IHARvxVWlPC0pKSwJAE2dBKOssr4KbEzYTG8/VxbP0fQ3Mj+XiPtzoSdmlGvHzze3VtWRtGTX+J
	MPlHPhpxgwmQetJsta/l+GydC4J/LFCJe4dRDIWqpfSU/8K+ayBm4tc4Hk+FXgfI3RdT1r7H+fCBp
	XJ0VNOtVkZDdWKrmcsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np86Y-00Bqz5-Nq; Thu, 12 May 2022 12:39:42 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np86I-00BqrM-HZ; Thu, 12 May 2022 12:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=JDJLNxtzQmNv9ZM52zmyIFiZT5LJsi4aBhzMv6fNHmo=; b=jHvGd0Dw9Ky0KKv4tiTPpTLvRq
 6Nrv82JqSu+/cX65x3e8B2HMj3jJ54HwHyKf2HyjZbsD0B+DrY8qtQDJ/SubeZAhKKc7Eo32KN4B/
 UOSCwdM5E2d5cFG4EM7TcWJnPw19ZZqui8ZQulmJh+vrdA6LmwH10zKf9xRu5skS4lbE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1np861-002Ryk-2D; Thu, 12 May 2022 14:39:09 +0200
Date: Thu, 12 May 2022 14:39:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Felix Fietkau <nbd@nbd.name>
Cc: Vladimir Oltean <olteanv@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
Message-ID: <Ynz/7Wh6vDjR7ljs@lunn.ch>
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
 <20220510222101.od3n7gk3cofwhbks@skbuf>
 <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
 <20220511093245.3266lqdze2b4odh5@skbuf> <YnvJFmX+BRscJOtm@lunn.ch>
 <0ef1e0c2-1623-070d-fbf5-e7f09fc199ca@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ef1e0c2-1623-070d-fbf5-e7f09fc199ca@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_053926_615464_40972DB8 
X-CRM114-Status: GOOD (  15.35  )
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

Hi Felix

Thanks for the additional testing.

> I just ran some more tests, here's what I found:
> The switch automatically pads all forwarded packets to 64 bytes.
> When packets are forwarded from one external port to another, the padding is
> all zero.
> Only when packets are sent from a CPU port to an external port, the last 4
> bytes contain garbage. The garbage bytes are different for every packet, and
> I can't tell if it's leaking contents of previous packets or what else is in
> there.
> Based on that, I'm pretty sure that the hardware simply has a quirk where it
> does not account for the special tag when generating its own padding
> internally.

This does not yet explain why your receiver is dropping the frame. As
Vladimir pointed out, the contents of the pad should not matter.

Is it also getting the FCS wrong when it pads? That would cause the
receiver to drop the frame.

Or do we have an issue in the receiver where it is looking at the
contents of the pad?

	 Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
