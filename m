Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CABC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 14:27:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72792083E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 14:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WbhiscLC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aeB8G8gS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72792083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3GQG+BU7sbdWa5hkbUJ8KcLumS4N5hDBPuIyF0NUk20=; b=WbhiscLCWSxcjydGLZqwkYgp3
	APEBEUI9MeKLtkCz3kc1PFB2mYARfSHvAFXa6gEZzXDLOTgq/C2MPZFovo8qcFI/UiO44rO7jK4GD
	qE7BAowh6E3/+deIHUkCslFZGWmLilochbbnjgkfiivQuFPqgy3VrJ4NxQGTR5IBybffZoHIBfR0J
	X6Pk82XAplEQD0XN88yiChDF5RMBQV/StGiuXcHNdY+ZPgCqbNf6boa4EVK757DFTk5OJMjbvjUPo
	Uqygap5YVTm3fZ7DYyfxIFeNDxXuuZiFze2G6mB8XNxhWWSxlQpXfa0WTvLr/Zc85rmfbGnUnVIoo
	am2bbOkKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khZHV-0008CD-03; Tue, 24 Nov 2020 14:26:57 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khZGd-0007qq-UI
 for linux-mediatek@lists.infradead.org; Tue, 24 Nov 2020 14:26:05 +0000
Received: by mail-vk1-xa43.google.com with SMTP id s135so4793303vkh.6
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2020 06:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V535LKPebOfjmdDDJc9j/Xpd7Zkc2zNFkTI8tr1mekU=;
 b=aeB8G8gSYDiqcddXjf+bJO2gfHQapF4V+qksw4C4BVIyGL0pyLClxbkKLh02/5t5Ij
 oVA/vysGuoetb0VxPUrgrCN1I8b9JE/KtU6QBoe4IjuXdvQEuvCWAoOWFkxfmmZaoN5s
 vSfOSVZOzeEs7lGZaPfl//8ukdsSJ+Vlh7rwh4HQ2ep4BAtYYhTVDzsX3j74fwUapJnS
 UQQepa7pny+PS5ntOk6paekdm5slPySeTjfgROn1cNhuIq2+DdLER2DTWf40uDfPIoBB
 O6+HOE6DSl1S/GpOvWJLRQWURiI8jjodXAlx/6BypopUJH6XyzUS2RBAvrOl+Kdvb8MQ
 b0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V535LKPebOfjmdDDJc9j/Xpd7Zkc2zNFkTI8tr1mekU=;
 b=Duaf+GoFbdFiPPcbt5Wtj0fIuTacnDZL8LCyDw4KacukCYpobZMjkhQNo04C94uw6Q
 vlmQjKGosjAh0DiLfWaFanGCikLiZN5aMV9ZmMopOKLOWyzNz/CZTPHJNvS2VPxQyzRG
 D11z/MCtKvp7m63Vt7IvjRWNsKt+9mWT3xuTAlJY7VASIdnwWEmIk8lUKTmINFcEN/6C
 8JXbXfswsMQjEeSb+zIy5QMQ7D2jQWhbQpkIcjvB5rGS4fFlbhnfIYSSIxoeqLXoAS3k
 UbWt4PahhTX6MRlRzeL9QhlcaXOFL1OowALir8xtProb4C9Vtk1pnZwQSFcCzPvdD06z
 TtWA==
X-Gm-Message-State: AOAM532GoDOzABn1dj/a+cpBnNUt9bo0zSxc7mRbvnDwS+EDLNdBJ1/v
 nthyyP0zFAbl6HzewztjOV+spRRjm26hQzQxWWP/rQ==
X-Google-Smtp-Source: ABdhPJxncBq4QuAAzYdQ/eP6RGjssC+Rf5A4aYYuP4SphD7S8VrYEzyMVPS7yB7/TJm6uE+PNx+C9iC8IvIHjz7gDsM=
X-Received: by 2002:a1f:2cd4:: with SMTP id s203mr4017312vks.6.1606227962418; 
 Tue, 24 Nov 2020 06:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20201122120056.100045-1-krzk@kernel.org>
In-Reply-To: <20201122120056.100045-1-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Nov 2020 15:25:25 +0100
Message-ID: <CAPDyKFpTCtJx7Uab+072fz-8Mr00r5DuHLwj9sFbbnN3k-f0pQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: depend on COMMON_CLK to fix compile tests
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_092604_124710_6472CFAC 
X-CRM114-Status: GOOD (  17.60  )
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
Cc: kernel test robot <lkp@intel.com>, Baolin Wang <baolin.wang@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 22 Nov 2020 at 13:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The MFD_OMAP_USB_HOST uses Common Clock Framework thus it cannot be
> built on platforms without it (e.g. compile test on MIPS with LANTIQ):
>
>     mips-linux-ld: drivers/mmc/host/mtk-sd.o: in function `msdc_ops_set_ios':
>     mtk-sd.c:(.text+0x2bbc): undefined reference to `clk_get_parent'
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 310e546e5898..bfe912ec8955 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -1023,6 +1023,7 @@ config MMC_BCM2835
>  config MMC_MTK
>         tristate "MediaTek SD/MMC Card Interface support"
>         depends on HAS_DMA
> +       depends on COMMON_CLK
>         select REGULATOR
>         select MMC_CQHCI
>         help
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
