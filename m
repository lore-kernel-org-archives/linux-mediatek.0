Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3A5C982E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 15:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9OuFK8krYG5CFJQY5mJoDN0CmcjBiY8Df4psmo7f7k=; b=wSPl2jMd1SoxZKdfE2JcMvZkdo
	k1q5RsDHP5QVNX8ElrHqH1tOHU9VIf3aoIIkrJAQlf7XqDkKM5e6/GZ4FvZxlN8cqQJE6tC1+q/HS
	xo7X8XU1L/H1/1FY/xyIabCA9hlq/gBsrJD2UibhSbP301y2B3uPwnA2xryJ4lNsaUYn0zOp2oPM/
	XAGAsqmePg9/cDzkUemdsmkFmJtogF9eGEf6Jle7SWkVJvqUOQWa5v3fc0gFHD5YLFxO4SUC9ssI9
	wweDuwou6ToTF7QdWOt2eoYLOGOXmVms4OpfwZZ6KwDDfY1YhYX3rygPPzRZ9oTIGQsl+4op2VK/1
	UNY5UwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fc5-00000002Xyc-18Yw;
	Mon, 21 Sep 2026 15:07:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fc1-00000002Xwu-2QDV;
	Mon, 21 Sep 2026 15:07:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0E7D600C8;
	Mon, 21 Sep 2026 15:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58001F000FF;
	Mon, 21 Sep 2026 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003240;
	bh=C9OuFK8krYG5CFJQY5mJoDN0CmcjBiY8Df4psmo7f7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C/PKQEwySgSwNGafp4Sed39F3rpKkgJQ9XIP0UYxKqxZvrMvYXyt6ySX5tsVuZxtC
	 RSIe4qkmkI/8xo5pUSmj+b00/rzYZG/O/+NjmfTYri9F6GQCday5ZSCBk/dZ++SmHi
	 yDJ5oVf3VsfjfgWRSliRTvrU2goNx1jIs2e+vTPfdHvqAW2uZzlbqr8YyDKiCwp5+K
	 aODTlXJN+FNQIfmh7Wkcm690cvq4z+0SYEXJJD7z36I2Nre/4NAUYriP8EoES8qcu7
	 2DmPWmMMg++gdD1uKvCsAj/LuqEtyNTKRF4EDKjEGvWx7mkbwWtXkUsooLBtCMTbQw
	 6VM9txvXC8xOA==
Date: Mon, 21 Sep 2026 17:07:17 +0200
From: krzk@kernel.org
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Yonglong Wu <yonglong.wu@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Min Guo <min.guo@mediatek.com>, stable@vger.kernel.org, 
	Bin Liu <b-liu@ti.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] usb: musb: mediatek: fix child device leak
Message-ID: <arFIIXUAYO8OXa_5@quoll>
References: <20260921085119.308981-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921085119.308981-1-lgs201920130244@gmail.com>
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


On Mon, 21 Sep 2026 16:51:19 +0800, Guangshuo Li wrote:
> mtk_musb_probe() populates child platform devices using
> of_platform_populate(), but neither the probe error paths nor the
> driver remove path depopulate them.
> 
> If any initialization step after of_platform_populate() fails, the
> probe returns without unregistering the populated child devices.
> Likewise, the children remain registered when the driver is later
> unbound.
> 
> Use devm_of_platform_populate() so the populated child devices are
> automatically depopulated when probe fails or the driver is unbound.
> 
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
> 
> Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/usb/musb/mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem, how to document usage of LLM and how what you should not
do if this was posted in a good faith.

Best regards,
Krzysztof




