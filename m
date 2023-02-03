Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A6FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxXJxYIPXv5W1b2DuSTnG3h266yMn84BrwVZXf0OoBE=; b=MkqcIMWS9UxLSMlAdvIUyCobwn
	n4i08Ts454e64A515bjKXoMK8vyLEFAiMLIqMA24eBqFyXp4+X3Evmk02sAf7Gd4t7V+ZWzh0UvCd
	51xjMylL7NiorKxHUD4ZiFNNgt9TGKNTKJfustEI6P6aYDcvo695NOtsTiCVm9spmmn9u4hD2SZqE
	LclfJPCbEP1Nvh2+7J2xtwYm+Ta2XZP8N5TtBGK+NLvm04kQJzbbrvin4a3GZAdJTGfbzSpZz30qW
	8AjwVgFTSo8NQC//keXKSkq2Hml4qnL1HtpkAiIO6jpg6TEO9J8dOEE/Va8854eEDTvxnGR9rZW8R
	loghkSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNzWo-00325f-I2; Fri, 03 Feb 2023 17:07:10 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNzWc-00321m-6X; Fri, 03 Feb 2023 17:06:59 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 292A65C039C;
	Fri,  3 Feb 2023 12:06:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 03 Feb 2023 12:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675444017; x=1675530417; bh=VxXJxYIPXv5W1b2DuSTnG3h266yM
	n84BrwVZXf0OoBE=; b=FF9EwHkwa0Zr/2YgDkYkO260VoVYDFPfdSKIw0xooXry
	POePgsM/c0pJ4275GEWJCj5+R2viqbMMxLWnlJu7PBFfP+p7nqWnlkpI/JyIjgvM
	0BAsN2x3u8KEWhaQamirT/bZGqOUc9Nb+IqdFHay0v1VtPhb9WsAOFzZFHYpVPrm
	ufNgPrK42fo31lVBnNYqODjPWWfxPTXWmqxspIX5OMPa881YYqPx5SwBssMYh/dr
	XEWjfg+V220WXBlFZieLX5wZXmaOuVXePunwWkPm9XjwDVAEM7DaivKJcFH7ZjCG
	y4VHyCoLJu/hMY3gfpYyjmH6ADsgspjUeC/1GampaQ==
X-ME-Sender: <xms:Lz_dY9taAdul_ZgZWNaTYO-qEVnby_sHLAszHSg0iXBGR2nm7Akr7w>
    <xme:Lz_dY2eNDmvUzyk0GXNsDIfmdWhY95FcXjARRvNykL6YYoedPRXAttapptS5ODLlC
    VfQpnQEO-lSMNM>
X-ME-Received: <xmr:Lz_dYwwXkUzytces8t_usahexlD6gvX9QQ4Exhh44r92pdNEMguh4a6bHdllPQED2ZBGR9DaRftVgJgqv8E1k-0vx70>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegtddgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepkfguohcu
    ufgthhhimhhmvghluceoihguohhstghhsehiughoshgthhdrohhrgheqnecuggftrfgrth
    htvghrnhepvddufeevkeehueegfedtvdevfefgudeifeduieefgfelkeehgeelgeejjeeg
    gefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
    guohhstghhsehiughoshgthhdrohhrgh
X-ME-Proxy: <xmx:Lz_dY0MEb-DwR57d-j_Gl-qLoBo2Z2kGUXLpxK3y3eZrGTywkU1aLQ>
    <xmx:Lz_dY9_GIJH5wlD0jcqqs9nty6r4MtnZ0z4h2c9ReT_7obPRqhxGrw>
    <xmx:Lz_dY0WjG3Y2VkkVQbZf0UXtx70DtwKKjWlkjI6FlsMJSQrXRk3YGg>
    <xmx:MT_dY5J8Liv0IRcIZMEe9Y35dJrpbgugWCoCx2bhz1ku66IpEUCVRg>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Feb 2023 12:06:54 -0500 (EST)
Date: Fri, 3 Feb 2023 19:06:51 +0200
From: Ido Schimmel <idosch@idosch.org>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,	Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,	Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>,	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>,	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 1/5] net: bridge: add dynamic flag to switchdev
 notifier
Message-ID: <Y90/K8BPHijxFZci@shredder>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-2-netdev@kapio-technology.com>
 <Y9qrAup9Xt/ZDEG0@shredder>
 <f27dd18d9d0b7ff8b693af8a58ea8616@kapio-technology.com>
 <Y9vgz4x/O+dIp+0/@shredder>
 <766efaf94fcb6362c5ceb176ad7955f1@kapio-technology.com>
 <Y90y9u+4PxWk4b9E@shredder>
 <4188a35c3c260d8ea2b5f8b2ac0ae6b2@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4188a35c3c260d8ea2b5f8b2ac0ae6b2@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_090658_332981_14E794D1 
X-CRM114-Status: GOOD (  10.89  )
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

On Fri, Feb 03, 2023 at 05:27:43PM +0100, netdev@kapio-technology.com wrote:
> On 2023-02-03 17:14, Ido Schimmel wrote:
> > 
> > OK, so can't this hunk:
> > 
> > ```
> > 	if (fdb_info->is_dyn)
> > 		fdb_flags |= DSA_FDB_FLAG_DYNAMIC;
> > ```
> > 
> > Become:
> > 
> > ```
> > 	if (fdb_info->is_dyn && !fdb_info->added_by_user)
> > 		fdb_flags |= DSA_FDB_FLAG_DYNAMIC;
> > ```
> > 
> > ?
> > 
> > Then there is no need to fold 'added_by_user' into 'is_dyn' in the
> > bridge driver. I *think* this is the change Vladimir asked you to do.
> 
> I suppose you mean?:
>  	if (fdb_info->is_dyn && fdb_info->added_by_user)
>  		fdb_flags |= DSA_FDB_FLAG_DYNAMIC;

Yes

