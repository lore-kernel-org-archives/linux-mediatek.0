Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3448C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mchVQibYHj455l1K8B9yHaPMqNOAV0XnputczQK6euE=; b=lP3jAyUN+7mx84OZgTsyz4CAaD
	yzpVuyUblffw3LzHfDAZP83HlQvHnkOaP9MzjX1ubNIATegvu5TeIRCIk8/eudkHdvu+8ztz+c5u0
	csEuVU6cs4Zzf/1wVMc2CvZWRVqOnBTNOqHW0LIObb2IpVqZFQZ6yV2tzFGAIFMe25i/r5D4c//SQ
	hDvu9saDegIj6ydkjz7M81lxZ0fAxK6QCsGen0ZQvDFzXFOslHZN1Fm4H7zi7Kyg11+MGOiUfifyv
	22ot7avbVJsm8IzudM9ylD0DvRjo9yXIcnsNvThuQPnzusI9KLiBwkgIOyeHwE6SiOZyTR4nGaR1c
	AkR/ZdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5jX-001SGF-Kk; Thu, 09 Feb 2023 12:08:59 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5jT-001SFB-Qx; Thu, 09 Feb 2023 12:08:57 +0000
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pQ5jK-0008Pq-03; Thu, 09 Feb 2023 13:08:46 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A46D9C26DF; Thu,  9 Feb 2023 13:08:18 +0100 (CET)
Date: Thu, 9 Feb 2023 13:08:18 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: ye.xingchen@zte.com.cn
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] MIPS: =?iso-8859-1?Q?pci-mt762?=
 =?iso-8859-1?Q?0=3A_Use=A0devm=5Fplatform=5Fget=5Fand=5Fioremap=5Fresourc?=
 =?iso-8859-1?B?ZSgp?=
Message-ID: <20230209120818.GD11168@alpha.franken.de>
References: <202302081048037733713@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302081048037733713@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_040856_058346_53DA0EB3 
X-CRM114-Status: GOOD (  12.21  )
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

On Wed, Feb 08, 2023 at 10:48:03AM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
>  arch/mips/pci/pci-mt7620.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

