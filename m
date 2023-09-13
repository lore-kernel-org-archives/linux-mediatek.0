Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46B3EE020A
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 19:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nm8co6zhS/czjY0gsC34548/H1vpxiHHFrEZujA8jGE=; b=KrYFaL7VYNLm+3sV0VL17U0MrT
	cV7K30SXxtyrfvRhxIlGX3Q/Ez7MAzi5HZztIVk7IIuqmd7XPW5xFJhMnQU3DmZs1itc1Gpynqkb0
	Ecf02ef3F1+sn/Kuzn0t4VkXUocu7b0N11icA9up+cIPq/FMmWFpdp7lx6NNTO7g3uly0NeyJgkE/
	4HqHvM0oB7pwSU4jJaAJyZdjuDjS3AFq0wMWFKK6ffvaas9ACdTDB5b1Hf4NzT3u6t3zu/Jct8HwA
	dT0w785UW6XRAjnB1OZD5xR5sU5gf/oHzXziIkchZh7e3GP/rMwdatbtHJm2J4e6Mv0Pg1OZj3rhH
	ju8wR6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVMd-006bGw-2H;
	Wed, 13 Sep 2023 19:17:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVMa-006bGR-1l;
	Wed, 13 Sep 2023 19:17:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E086EB82675;
	Wed, 13 Sep 2023 19:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60F3C433C7;
	Wed, 13 Sep 2023 19:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694632636;
	bh=1uNpasMKRDcqodi/AK3ivr+N8diGJYfAl17uGfgdbDk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PK8EWJHRi0DzYYdUcWMJAmMkBCqp249M11U0tHD8SBENcAMMy9Y46pqTZqWAP6nxG
	 7SAOEjPqICycCuXi036Psj+tVL5ShkGkfbu+IAOxYRVZVroQQdUgcsWTJuxjnBNgtv
	 cIJZq18q++MpvGayoBwNYpAxYVgtrLvTeRlXSlMDhakGgc2S4qbt4p2qrcKl3ynDYY
	 8QH5L4VKP0Mqj6Zq+uJWY9qwEDyHOeqdywdTWiS9K4AnU0gyu2+ZpD5y/6YebFA/88
	 /8dywi8pGG9NMftCp68qyY5jWAoJorxH80Ychymxp4979oK2tVPI6lJO6eVucuIKWZ
	 lwf7HmaBYMCDg==
Date: Wed, 13 Sep 2023 20:17:08 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, lars@metafoo.de,
 matthias.bgg@gmail.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH -next 2/2] iio: adc: mt6577_auxadc: Simplify with device
 managed function
Message-ID: <20230913201708.3136e5eb@jic23-huawei>
In-Reply-To: <09603bb9-59df-a6a4-fda0-c47fa3941659@collabora.com>
References: <20230826035402.3512033-1-ruanjinjie@huawei.com>
	<20230826035402.3512033-3-ruanjinjie@huawei.com>
	<09603bb9-59df-a6a4-fda0-c47fa3941659@collabora.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_121724_741326_D8615EF0 
X-CRM114-Status: GOOD (  14.48  )
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

On Wed, 13 Sep 2023 10:56:28 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 26/08/23 05:54, Jinjie Ruan ha scritto:
> > Add a device managed hook, via devm_add_action_or_reset() and
> > mt6577_power_off(), to power off on device detach.
> > 
> > Replace iio_device_register() by devm_iio_device_register() and remove
> > the mt6577_auxadc_remove() function used to unregister the device and
> > power off the device.
> > 
> > Remove platform_set_drvdata() from the probe function, since
> > platform_get_drvdata() is not used anymore.
> > 
> > Remove mt6577_auxadc_mod_reg() call from the probe function error path.
> > 
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> > Suggested-by: Jonathan Cameron <jic23@kernel.org>  
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
Just missed. I finally pushed this out as non rebasing (rebased on rc1) on Monday.
Still the patches have a link back to here I think so people can see this if they
come looking!

Thanks

Jonathan

