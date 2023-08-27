Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275ACC83F01
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Aug 2023 17:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tr9ua0BM53w+xJ2BW20y8vMMLjdok6vV3eOfbugM1yQ=; b=ANuPCHXI/sSJcHErptXo2BHtVD
	3Z3HAznevMra3assAe/snGhoUF5Dw0zt+0d2zJNoxAJ1MCYrZVZZ1hb/YJbmtKJ1f5tDr8DuzBj20
	287JP5LyrlEeQxmrlzrr7McXgrFlyMaRvRdZJCEhcCgeraH3J7yOhvKvbxrYiG1B4ie+odoVd3pxw
	DeH312eGTwRDDNlV3H1DzZcGdMqboEyigPAxBvl30cinYW4QN3KUSW6RqrBLIPLAHh2q04Lu19/8G
	UkL3P6LhCucUaH/UFTDtIWS2JuNrn4c4A6EO9slwhBiM06+00mGmzO+1c5+X+GHNfbeNPXwi3oJxv
	FwgC6IUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaJE1-008HhY-0R;
	Sun, 27 Aug 2023 17:06:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaJDt-008Hg8-08;
	Sun, 27 Aug 2023 17:06:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A0CC60FD2;
	Sun, 27 Aug 2023 17:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A02C433C7;
	Sun, 27 Aug 2023 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693156006;
	bh=kf7goXxFzP7UPvM4+zs0gsazvakWRvcmTwI7V2CQnXw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PowsSb3w+mXwzknuW+XZpdoiv2+Y2ez5ogTodw8fsCwGSZ6AyOg00Fhpg+eEmoXnW
	 rNtnFw6NX66XUhrt+OXzNT68ByUkB744I9xychP9SbcDGOhCL8pgunIp8QeyhfoKZQ
	 WrULVepsdTdX5dS2WGTFujqRU9KqQxpKYlvNYvBgQCF1PwNe2T0HHrqKQ9KkXdNRW/
	 fd2/S62TvNtSCu4MZB0y09g+FN3RZnkE2I/wOY1gyKQK/y6nqkaAYvi1lrNyG6Td3c
	 FO50Gx4dRhetJUS1yn0hHiEFBXP5QymWpljYnT0uG4IIUsiuN8fd1OYu77IknGtAl2
	 d/RSIlbM8k9fQ==
Date: Sun, 27 Aug 2023 18:07:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <lars@metafoo.de>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH -next 0/2] iio: adc: mt6577_auxadc: Cleanup with the
 helpers
Message-ID: <20230827180706.09242b5d@jic23-huawei>
In-Reply-To: <20230826035402.3512033-1-ruanjinjie@huawei.com>
References: <20230826035402.3512033-1-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_100653_679209_F6E9C7DA 
X-CRM114-Status: GOOD (  15.47  )
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

On Sat, 26 Aug 2023 11:54:00 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> Use the dev_err_probe() helper to simplify error handling during probe.
> This also handle scenario, when EDEFER is returned and useless
> error is printed.

Just a quick note to the driver maintainers.  Whilst I've applied this,
I won't be pushing that out as a non rebasing tree for a few weeks.
As such I'm very happy to add tags, or indeed to drop it if you see
any changes you would like.

Taking it quickly is mostly because I have a huge backlog having been
away and want to get the simple stuff off that list!

Thanks,

Jonathan

> 
> And use devm_add_action_or_reset() and devm_iio_device_register()
> to simplify the code.
> 
> Jinjie Ruan (2):
>   iio: adc: mt6577_auxadc: Simplify with dev_err_probe()
>   iio: adc: mt6577_auxadc: Simplify with device managed function
> 
>  drivers/iio/adc/mt6577_auxadc.c | 60 +++++++++++++--------------------
>  1 file changed, 23 insertions(+), 37 deletions(-)
> 


