Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D1DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:25:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5214C20855
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NxdKeJYI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="sHdXFrps";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nnd9aDAe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5214C20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gxw5KQwz7bxVRu8W3PDqPjFz8rPZQ7kDw4uzsTfIFbY=; b=NxdKeJYI/BmqmaTqaf6Lsn99E
	OJwlhLTdUyKrF6m1tTx9hCynVOcfGY5107NdOhsNKttnvr3BYuKegFE4v1X9CaD9rwgCBuJrd/ZvC
	VUhl6AhnkKCy9YjgE/GuxOEBIaWY+y+/Fir0h133tCKlQD9ELPEI4YOKuVRzX4NA9EiHmdgeWovWz
	NkQmfTWMu/bproamOX4vkcjlxunuugTLn5dPjROxcj8+ExsZrQg8YGJ/FoRBlErpXdTwxjylSJuy9
	AHvpdmFHYtcnVfQAw6xELxQ/MSPim0O4zmAn6jDxjYxHnyW8DzppSwE8H8ZfzauAyFOJVj7cs1RTe
	yUZGQ0aFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5ql6-00030N-8c; Wed, 12 Aug 2020 13:25:36 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5ql1-0002yD-Oj; Wed, 12 Aug 2020 13:25:32 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 846665803D8;
 Wed, 12 Aug 2020 09:25:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 12 Aug 2020 09:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=RMHVXbkkQR++heuoiM+MhmJ5JCS
 XfwoEAJZmcGdv5E0=; b=sHdXFrpsqDivqXytN+mzcwAC3wK/gl+f3WcRAdi4PaB
 sjBoxrF9Boeho/UE8NeaElNM904QP2qfQ4bmZWXB/Qp30yvvbgrA+EPaIq+FTnDK
 wt5pIW3mc9j5tKdVfxRQuC9x1qnlESsQ8iRw8T/JSNtJklXaoxnr2lcry2E1Pyf6
 v9ZlJYuCygryjOncMiv5ayI6NuEKb3ptP4Irv+fLDrvMksC0+9ggJ/ltFC+9nB2q
 pR28PmWbdx5WkeVOkBeA2B/09xFDjwcXb3OwhZhTlp7BjlDOtcyEsXU4iM0gI7+t
 bvN7fqncVQAN84gy38LQoJRHpibad+9a8/DZyeJURiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RMHVXb
 kkQR++heuoiM+MhmJ5JCSXfwoEAJZmcGdv5E0=; b=nnd9aDAe3uRQZt9RpaQ3Yu
 wXsVSELMVioDXhKTOICCCFPEO7GsjChFyug1hRhArcNR+ZCXW7oQv9wxJtxWzOwG
 KIBkmiHjcDm17hbNGxTXkjXPi1qz+F4TpEnZHB6hVmUIgRAAR+K+c7YSc3oL2R0g
 Xw7yiXKH9+XgDS5DGUlhRsp9s99FpYNx4UIsTNxQ+vm+ByeXOCLrwD/VJB6nJKKN
 WSWyO3jMLXV9cgou1hCG9wYMpxeibTuDqaj5mjNH0A5EHeLjjjY3287LqQaBKASG
 //nrliteazYATIz15qc3lU5d7lnVR5tSrQfA5hfk7y1MwLjafSdcqtjS5Ft+nHXA
 ==
X-ME-Sender: <xms:w-0zXytFvE8q2H6PMYuY_EqkoCHuNVtkGcK9x_YovuSpVRhHJjfITw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrledvgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
 keeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:w-0zX3cx6G6iRvRDAbPdS5a1hZVce8CKcQNLbhWnX2z2wWyZGkgw-w>
 <xmx:w-0zX9xRYphP1JT1ZNcglcxX468swkKT88cgkP81AJNnxJXMgdZyqg>
 <xmx:w-0zX9PuG7srrDgRJ2e-MbIoGN5MdAFrsGnXoRy3yA6jvTmvtXVvWA>
 <xmx:xO0zX1Zqpi7Juq1WK7UB5WMHyl88blX6ITnH77B8nyMCgvEPIe4VQA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id A9C0D328005E;
 Wed, 12 Aug 2020 09:25:22 -0400 (EDT)
Date: Wed, 12 Aug 2020 15:25:32 +0200
From: Greg KH <greg@kroah.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [v2,0/3] add optional reset property arm64: dts: mt7622: add
 reset node for mmc device  mmc: mediatek: add optional module reset property
 Documentation/devicetree/bindings/mmc/mtk-sd.txt |  2 ++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi         |  2 ++
 drivers/mmc/host/mtk-sd.c                        | 13 +++++++++++++ 3 files
 changed, 17 insertions(+)
Message-ID: <20200812132532.GA2489711@kroah.com>
References: <20200812130129.13519-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812130129.13519-1-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_092531_846705_F80C20D8 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 12, 2020 at 09:01:26PM +0800, Wenbin Mei wrote:
> --
> 2.18.0

I think something is wrong with your subject line :(

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
