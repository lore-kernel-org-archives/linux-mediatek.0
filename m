Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E00C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:25:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B7620855
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VGYZF69V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="EBXQHQd4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DD3j5hLY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B7620855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fM218NgkhyzC702OWLh6Iw19r+MV3LRPmhyCzRdjArk=; b=VGYZF69VjGVNty06RROALNZ+b
	/eAgWkeQAtAY1UL2842y6xHKfCZL5HzwP0igvLECcGQbbhphzGSHbZ4BHzHIgFVDOSNNkYXaXTSV+
	S4lYJ1t9Uq88bka+wuD9fplQ4Mfx6JDRV4+vVzjqEdLGVlql0PWKOxk0JB/f/s75EEZjpMN7ZUyfi
	g3+cOiwi5IucTQhT2O8MagbP1JuuM+Dd3qQycRGUYLkhRrCl6/s6AYakxys/3ACRZxIVSZ05+RckL
	nscnl+vaKhjTJErxb0h5qTlGyTt3U9LGXEOVXvC3u1RMlsaNfbFwaEoYQlF6TDra53ww2am59uKxx
	RbMuoZfsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5qlE-00033t-87; Wed, 12 Aug 2020 13:25:44 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5ql9-000317-7E; Wed, 12 Aug 2020 13:25:40 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E19AB5803DD;
 Wed, 12 Aug 2020 09:25:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Aug 2020 09:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=8E1y/NnvHjfdOcfGM816z3reqbY
 KZDOAgNdGXHxjGaw=; b=EBXQHQd4ryb+F9ZSaBv9Q4BavNlR/kSgNXRrWiDRI1M
 rxeNQQFxG65rc1Yo47lPFN8Jyaf6x3tQTN9x5PxHbMiI8CZYVqj5mj7SpNIZ1+/v
 i6JCDMCBxgm5UDsN0pRYM6PWGU4Pa6RXLBObLzVe8OSzopE/saG4c//y9c+OzA3/
 g18/6YPPjk63YYfX/XAqBaw+lgydli57DeWdQkQuWRZXS/2RBOZk5VYR5rye/h2w
 6kIhzTUVwyCw+EwEgwPLuKLwnP2WI7pJExI6SXmuj/+gc6vWIHlNOPnDZ1stzS+L
 iZxMDCLnoVLMQtnEEBl6nTkd4V3BEPvNFCKywTJnKug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8E1y/N
 nvHjfdOcfGM816z3reqbYKZDOAgNdGXHxjGaw=; b=DD3j5hLY3gCCHmltFjc/qD
 4XSow+h2EY4M35Ttu0HlDWYygxXfBUz6ovouBxVz8QShSE/jLsjnbpBnE9rAhngP
 m6d1gNp/PQhTe/AbC8cmC9ckDj1tIHwMQtJ2keG+TBowaNZ4DHZTQm0ch2JN0/E4
 lISnpo6kthmnm+I3Ptf80NM3gAEKw6td2qEDNzEqJRszc9ZKshmMRoVXpyyVreho
 Jz0kY/Fe3/fpI+G7f0Sn3SivkoIjRFBKVfZyXBF1ETnTRN19ML8GKx52ghO7FeMi
 goclXhwsQYFOUFVhvPve1YmedholFb6yPO/OzRUOBfBLpThaxMDm0TIrV56hF+TQ
 ==
X-ME-Sender: <xms:0u0zXyalJ6S-Oy_DwzV1_DLJBLdT8_moKz1CeSKyFv0w6Gvxce2_XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrledvgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueelledthe
 ekleethfeludduvdfhffeuvdffudevgeehkeegieffveehgeeftefgnecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrkeelrddutdejnecuvehluhhsth
 gvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
 rdgtohhm
X-ME-Proxy: <xmx:0u0zX1aRP_6XWlm8ufBhncwcIEifV7fQNN0vpHh8Zp8w4l2X1Iv3Bw>
 <xmx:0u0zX899TOTDry5VHQUw8-EwbWyTN6zscayViVbfxj25jXWRDeP47w>
 <xmx:0u0zX0r3UK9LEkh89x2oBMqz5hVf5FYhbB0o4HcRSSg7G5yWRiB_Vw>
 <xmx:0u0zX41-GhDh1hDSkwwNTNcrmCmnfuvYrNMVBs-dNAq4868WjfJMJA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4BA133060717;
 Wed, 12 Aug 2020 09:25:38 -0400 (EDT)
Date: Wed, 12 Aug 2020 15:25:49 +0200
From: Greg KH <greg@kroah.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [v2,1/3] mmc: dt-bindings: Add resets/reset-names for Mediatek
 MMC bindings
Message-ID: <20200812132549.GC2489711@kroah.com>
References: <20200812130129.13519-1-wenbin.mei@mediatek.com>
 <20200812130129.13519-2-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812130129.13519-2-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_092539_409494_FFB9E019 
X-CRM114-Status: GOOD (  16.37  )
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

On Wed, Aug 12, 2020 at 09:01:27PM +0800, Wenbin Mei wrote:
> Add description for resets/reset-names.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> index 8a532f4453f2..15d42595a3f3 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> @@ -49,6 +49,8 @@ Optional properties:
>  		     error caused by stop clock(fifo full)
>  		     Valid range = [0:0x7]. if not present, default value is 0.
>  		     applied to compatible "mediatek,mt2701-mmc".
> +- resets: Phandle and reset specifier pair to softreset line of MSDC IP.
> +- reset-names: should be "hrst".
>  
>  Examples:
>  mmc0: mmc@11230000 {
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
