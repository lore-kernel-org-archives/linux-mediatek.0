Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39788C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 10:59:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED4C561058
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 10:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED4C561058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2IE4T5uDp6WySQQXx7zUTduok+nysVJXpAm6M3qTfnE=; b=jMPKwzOM1aCPD0
	tw0Y6V2x8y+0ncPgGpy3OlVxGCr9aekCWyEutLXo0RePnm0skQUj1hwsyUClBUzG6RD38kj2O4OFD
	8V7PsYnDqGZjqSr1B62vtq0CGkDYDAddFtxEeU+vMfN6yEpv3jZ3c/iQrXgs1U3uNiSAC4KDadp2i
	nGHL86qSkPTmoK5Znj2ummYmU4u11yy1tEGv3CLlE01Sm4nk3+3pHRBWsOg222NwEl2pXelAEBWqu
	LGtY2BxGvpqFivQzn9aDg5eWYS2lw0jUew08Mdimq8lGWYHQQPbk/lWpZ+ql4kqbg6/p/CyaOnDW9
	IyDtiVxQi5qI8gYJTY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLNxH-005OGt-Gx; Wed, 01 Sep 2021 10:58:55 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLMXz-004tBD-Bg; Wed, 01 Sep 2021 09:28:47 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 71BA8580B31;
 Wed,  1 Sep 2021 05:28:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 01 Sep 2021 05:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=hjKhFYSRanqW3ieK7WfmVCGe65O
 txH7oj5QcwBwcF/I=; b=kH7ZD4TbENRfccCEhk7bbqWw/tR+TJRq4arDsT7sBoR
 3Ag2qPqjOIprqEh1Ke4KKAjE0kpuXex8gafDEvmcxn6QxrX6ItPwEnpTVyR0n2e5
 IlI84zbpa2VEBk81hVYqV6Yy0g48VNJp/Yen2YqbViQiDqJ3UP9Y8LHUwh2QQbhe
 tSE5qCMFadYPmXMBGzNWr3WcWN7UwHihq1Ne9ygJw1ppgpTp2+GxDKU0znyvf6DN
 9UzUGSqLJAyoCLPMblUBR4GqafOhHqEF3HA1Py3l0rL664j6sqV34jKROo4D4ayr
 zAtVlCr6tBFBfjhyEzT3BVn1qIW7U+35WX383rcH8oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hjKhFY
 SRanqW3ieK7WfmVCGe65OtxH7oj5QcwBwcF/I=; b=UUO4osKr4lAXGXmd/Wcgm2
 XNCDf3I5+NYFvgw/jEQbEhnKTUtW+dFiMqGf9BcdR2N+VT49HXbqMXXScak9WmAM
 AxDg/ERJ5Gwcl+tKi/uO1lS6iW12K5E9ZpsiLAb2vFE8qQDGybZfz2pK9QEJyEmr
 1r/UPoAS9ev5gpO6eRkxpbvna/QBsJlYHRR31oYCU4ijFjTdJndCehytsmUhT7ig
 j9tcnBVo4q9wWE9GTiikXMoZfs0k+qfuqlgvdhSrkAgew8nEU8Dnwar1tDey5kNs
 Q6Ad4xYJBoLFomH1ybqfQjkVdyS/7KVBn1RO3zrqA0VdIAAoec+DDvIN9kMy2UAg
 ==
X-ME-Sender: <xms:xkcvYYNWVqd0R3X-VOb3eOudZ3OBdhL2zAItJT26y2xSYWiFRm5Big>
 <xme:xkcvYe-jNnTjfaSZIfQTHonWcEylQqgSInpqSSyIgxYYwrJYs9Ly2IRtBDlwmviYf
 CnLhpa-uttcOQ>
X-ME-Received: <xmr:xkcvYfTeQOygYOs-XPacW2GqgX_RW_ZV0KQMdBvar8LnPQfO7kZl7Qqr6FMiESlbOmP-I08nCUKXBu2S01uBhUY7dUB_X_1a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
 drtghomh
X-ME-Proxy: <xmx:xkcvYQuSwUVRjF46xtUj1idAMdICA_myxKthNPm2ukIxxLBbQbXaTA>
 <xmx:xkcvYQfVCAXY_4NmVAEsPaiXWae3JWT9XIvC_N55DNoSg3VfFNdEbA>
 <xmx:xkcvYU2agQmAgPDCp0CwpmOnManxPEMQAp0wxj5ec3VrXV-Vv9T4rg>
 <xmx:yEcvYTxIAokmDCwRpkbj5FYb1sTxiMCuS7wTwV56pt1uq5vRePzb2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:28:37 -0400 (EDT)
Date: Wed, 1 Sep 2021 11:28:34 +0200
From: Greg KH <greg@kroah.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: stable@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5.4.y] net: dsa: mt7530: fix VLAN traffic leaks again
Message-ID: <YS9HwpC9TulUvps/@kroah.com>
References: <20210823070928.166082-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210823070928.166082-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_022843_568487_D9EF19EB 
X-CRM114-Status: GOOD (  14.52  )
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

On Mon, Aug 23, 2021 at 03:09:27PM +0800, DENG Qingfang wrote:
> [ Upstream commit 7428022b50d0fbb4846dd0f00639ea09d36dff02 ]
> 
> When a port leaves a VLAN-aware bridge, the current code does not clear
> other ports' matrix field bit. If the bridge is later set to VLAN-unaware
> mode, traffic in the bridge may leak to that port.
> 
> Remove the VLAN filtering check in mt7530_port_bridge_leave.
> 
> Fixes: 4fe4e1f48ba1 ("net: dsa: mt7530: fix VLAN traffic leaks")
> Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> ---
>  drivers/net/dsa/mt7530.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Now queued up, thanks.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
