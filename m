Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CBEC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 07:43:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E3D2080D
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 07:43:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ct8Hs5cN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4bI/s+y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6E3D2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EgPm1pzG3JnPTFJE7Z4ckQGfooDhGT7tECMgIpDPiG8=; b=ct8Hs5cN7SwzwKXmU5TO/u6FN
	eRu2TPUijdJSv7GoTD/xWWusWS5iJ9AAw/dkr1zLcqRRGxeJczUXz5XM19BkpvOajrQ5+w2LmE0Uc
	PnBp5Mvq1eAQdOQuP7PewNJs4dnoagx/gS6NZRvVKksRJupwtasCNLfq2aTDmfjrAtuqFdSY7fDaR
	08X3ytQDpNXHpIf5i0TQCkZxL+SGKtIApL8aVoQsX2Q4kOrRsWtDLY6isKmdwhousNe0ZUXWO0/i9
	K/Umn5CHH5DiHs4Ig13YzZtdsFFXM9yPWkuBKU0nvazolJjZcI9p47ZkKGbE95Msn7WcyWc5ylyun
	5Eme32Z1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRsUF-00087V-MZ; Mon, 12 Oct 2020 07:43:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRsUD-00086c-QZ
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 07:43:14 +0000
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A79652080D;
 Mon, 12 Oct 2020 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602488592;
 bh=bAc0d6eqVxt5kvlc4/0fQ1Dt0V8pQkYKNF5xQvY2t1c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I4bI/s+y9vhd/nExxWZ2y1XlzgBQbfzcWfLW4DA6opqThS+SEVWVra3xcsUSwUYB0
 7GWCy1HVs91CGAzCZP450EzLotvskdCmFtt/vKkoa3U+yoSRHrcwYguEsMFOFnqg1U
 ScjBKMOPw39aL8eSQFn+wWTOTiWmAeXR+nP5bhMI=
Date: Mon, 12 Oct 2020 09:43:07 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v3 2/2] media: mtk-vcodec: fix build breakage when one
 of VPU or SCP is enabled
Message-ID: <20201012094307.1f32155b@coco.lan>
In-Reply-To: <20201012053557.4102148-3-acourbot@chromium.org>
References: <20201012053557.4102148-1-acourbot@chromium.org>
 <20201012053557.4102148-3-acourbot@chromium.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_034314_003427_86B08A0F 
X-CRM114-Status: GOOD (  25.81  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, gnurou@gmail.com,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Em Mon, 12 Oct 2020 14:35:57 +0900
Alexandre Courbot <acourbot@chromium.org> escreveu:

> The addition of MT8183 support added a dependency on the SCP remoteproc
> module. However the initial patch used the "select" Kconfig directive,
> which may result in the SCP module to not be compiled if remoteproc was
> disabled. In such a case, mtk-vcodec would try to link against
> non-existent SCP symbols. "select" was clearly misused here as explained
> in kconfig-language.txt.
> 
> Replace this by a "depends" directive on at least one of the VPU and
> SCP modules, to allow the driver to be compiled as long as one of these
> is enabled, and adapt the code to support this new scenario.
> 
> Also adapt the Kconfig text to explain the extra requirements for MT8173
> and MT8183.
> 
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/Kconfig                | 22 +++++++++++++++----
>  drivers/media/platform/mtk-vcodec/Makefile    | 10 +++++++--
>  .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  | 18 +++++++++++++++
>  3 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index a3cb104956d5..457b6c39ddc0 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -253,18 +253,32 @@ config VIDEO_MEDIATEK_VCODEC
>  	depends on MTK_IOMMU || COMPILE_TEST
>  	depends on VIDEO_DEV && VIDEO_V4L2
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> +	# The two following lines ensure we have the same state ("m" or "y") as
> +	# our dependencies, to avoid missing symbols during link.
> +	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
> +	depends on MTK_SCP || !MTK_SCP
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
> -	select VIDEO_MEDIATEK_VPU
> -	select MTK_SCP
> +	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> +	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
>  	help
>  	    Mediatek video codec driver provides HW capability to
> -	    encode and decode in a range of video formats
> -	    This driver rely on VPU driver to communicate with VPU.
> +	    encode and decode in a range of video formats on MT8173
> +	    and MT8183.
> +
> +	    Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
> +	    also be selected. Support for MT8183 depends on MTK_SCP.
>  
>  	    To compile this driver as modules, choose M here: the
>  	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.

Just my 2 cents here, and to complement my last e-mail, the helper message
here IMO is a lot more confusing than if you do this, instead:

	config VIDEO_MEDIATEK_CODEC
	         depends on VIDEO_MEDIATEK_VPU_SCP || VIDEO_MEDIATEK_VPU
		 default y

	config VIDEO_MEDIATEK_VPU
            depends on VIDEO_DEV && VIDEO_V4L2
            depends on ARCH_MEDIATEK || COMPILE_TEST
            tristate "Enable Mediatek Video Processor Unit for MT8173"
	    help
		Select this option to enable Mediatek VPU on MT8173.

	config VIDEO_MEDIATEK_VPU_SCP
            depends on VIDEO_DEV && VIDEO_V4L2
            depends on ARCH_MEDIATEK || COMPILE_TEST
            tristate "Enable Mediatek Video Processor Unit for MT8183"
	    help
		Select this option to enable Mediatek VPU on MT8183.

To be clear, from my side, I can live with either one of the alternatives,
but, IMHO, the above is a lot clearer for anyone wanting to use
VPU, as, if MTK_SCP is disabled, the MT8183 Kconfig prompt will
disappear.


Thanks,
Mauro

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
