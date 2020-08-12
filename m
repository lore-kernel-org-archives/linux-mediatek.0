Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627A2C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:25:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 333262080C
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZN8RjwJ6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="SWWPiB4Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H81HBxxX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 333262080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Scxra+e2AImJqexWaXBHRz1Q4ggNWpeRL5bEr+j2pkw=; b=ZN8RjwJ6eHZPOZle5mlDrpnFZ
	bq1ASUrvcRuMa3uoDdXY4r2lZECubOzRb3kDNH56O6DyFcdP7+NsLB4MLPXU4ShrYbD8ERjqt36th
	UbWI2UK8oSe+RU5V/kNN2V8518hJOhrV52+ik0Skhg/q0nNAmDKUq+p1bHt5IdOS3HMgR4ohb+L6O
	2ERdeEVwFN0NVf/mLO8U1+86dibIeXyJO9j3J89m7uXc7eiljFIXC2obGneEcTcFVNRxeHbaxt8wF
	6aOwCo5w8RO6/H97YsBEZc81yKAndv3utePDsy3gwagUOcwMuNYLNevDrzKEjkZTxRfAzFEJLoakF
	tgFBthxYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5ql9-00031a-Pl; Wed, 12 Aug 2020 13:25:39 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5ql2-0002zI-Hr; Wed, 12 Aug 2020 13:25:33 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 49D315803DD;
 Wed, 12 Aug 2020 09:25:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 12 Aug 2020 09:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=i8XRP2VVPIQwUPhvLuLe5eBXjcL
 /b/B3ukCtwKVvXZk=; b=SWWPiB4QgAlnbKDiZPT8AW01PsffGj0mrWQyc97g3/v
 8EPAPSx3q4uR8pxdunQOQdU3CYfzEhUxi5IhHk/51NWbbiJ01IZM+D1Y9okbKR4l
 1PA/DephHOSIaKmiDIX1mNczVU915u5qaonwiLa6hKJcIGUSoay3uhJFlrsVIxJ0
 7bDIfW5zXV/E5r2IjpFq47bwdwj6ZFNEEqd62aGIxTOxMpjNpdWmcS2QsRKUHAAx
 4dvCTHv7OU9ZD8yLwR/pgNv3x3mMxC6LjFM9z2SmWrAnkZlG4lm8pmvECAj2ezxX
 Yvocn/52skKMNrlbvLEw/W0WigZZNHGM+fzo6gL6zfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=i8XRP2
 VVPIQwUPhvLuLe5eBXjcL/b/B3ukCtwKVvXZk=; b=H81HBxxX4JrQ1zha30YBda
 yr7S3/jm8F8i9uy8C00665rTJX54SHUOYIgS8RGB4a2RB06bU/IoQOeP7JmGSe+d
 qXCpfzLe7HemRq/yohmq4iJQp6jivUGOaMmt4LuxgpanlaXXjL16Nv4QJuAzvo+l
 m1LWrhDUBu1dtyZS26dubDnv6zrkRrRwejUK+FsgoobjYVpZcZkrj9T63yd3fo6s
 l19ih6HVi9IwN4jRG4/HfexvL1K3lg1saqBGFn+JqYfCz3kkffosOCXqwFZgXCGb
 pDY7ilHTwGAixd0Dw5LeOAeKncOxiQQOm5qGbgUPZCjr3dJkq14I1GGMdv6sI0cg
 ==
X-ME-Sender: <xms:zO0zX8_wVHT6keAG2IM9EuvNFhU4C5-AX9rYIl_H8Fv46Xfa_Q45mQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrledvgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueelledthe
 ekleethfeludduvdfhffeuvdffudevgeehkeegieffveehgeeftefgnecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrkeelrddutdejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
 rdgtohhm
X-ME-Proxy: <xmx:zO0zX0ueTqGbRvjnBEbuQALeQ5o0wI2a13y2RDS_hugxcXohwqCI8w>
 <xmx:zO0zXyAgNT_2F1bYAu-jI8QUAQdouYfi0Mic-WLHGhTqOkxbtDsdrA>
 <xmx:zO0zX8fZ3kavY9GE9pSuhTtb6NLKG9QmvKTAGaypXZRRBEiLw_jQJA>
 <xmx:zO0zX0r6iSe_5AL_yw0hjMkHh0CPJdYs_vqclR_254UT70VS5pKEaA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id B536B328005D;
 Wed, 12 Aug 2020 09:25:31 -0400 (EDT)
Date: Wed, 12 Aug 2020 15:25:42 +0200
From: Greg KH <greg@kroah.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [v2,2/3] arm64: dts: mt7622: add reset node for mmc device
Message-ID: <20200812132542.GB2489711@kroah.com>
References: <20200812130129.13519-1-wenbin.mei@mediatek.com>
 <20200812130129.13519-3-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812130129.13519-3-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_092532_675749_7C4E72DC 
X-CRM114-Status: GOOD (  16.46  )
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

On Wed, Aug 12, 2020 at 09:01:28PM +0800, Wenbin Mei wrote:
> This commit adds reset node for mmc device.
> 
> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 1a39e0ef776b..5b9ec032ce8d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -686,6 +686,8 @@
>  		clocks = <&pericfg CLK_PERI_MSDC30_0_PD>,
>  			 <&topckgen CLK_TOP_MSDC50_0_SEL>;
>  		clock-names = "source", "hclk";
> +		resets = <&pericfg MT7622_PERI_MSDC0_SW_RST>;
> +		reset-names = "hrst";
>  		status = "disabled";
>  	};
>  
> -- 
> 2.18.0

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
