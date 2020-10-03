Return-Path: <SRS0=+yJE=DK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF5BC41604
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 16:50:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FE4D20709
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 16:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rpQj5sDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FE4D20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rr+8nIxDkbaqLbqqoiF4+31bjDfCf8Dqr8uZHT+mvxo=; b=rpQj5sDjWCZWuxBggSRoksu6F
	/EIL49cXzcd7+IdaH83QwxicmkE/nhQvogkBrLS4QlYi+SdRzH75wUyE5Kx86yiUxkDYwmM3o3J6i
	1+sCtsf41HLJI8cJ3viuckSEWyENqnfSSOZBYN2XrWZSCoi9kQcb1Pl6e+ZFVK6KAbmT0rP2Rh7h8
	Sht30SXCPyHNVaxMR31GbFUwyBlqQ6Q3m6pIf0N/KAkQ8uAtMNnCx6NYoV9HdtNE7hcJlZxFeL1St
	QM40tUKCxc875U76mSv7KUJX2UkV0YineeCEpcFbFUbcwM8e1wpm6l27P7Dm+gE7p2ChguTZjNQmH
	BXmk7CHcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOkjp-0006yH-Ep; Sat, 03 Oct 2020 16:50:25 +0000
Received: from [2601:1c0:6280:3f0::2c9a]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOkjk-0006xp-8v; Sat, 03 Oct 2020 16:50:20 +0000
Subject: Re: [PATCH] media: mtk-vcodec: fix builds when remoteproc is disabled
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Tomasz Figa <tfiga@chromium.org>
References: <20201003130947.555637-1-acourbot@chromium.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <43e118c9-0bc6-d85d-2f86-e74f833e1e8a@infradead.org>
Date: Sat, 3 Oct 2020 09:50:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201003130947.555637-1-acourbot@chromium.org>
Content-Language: en-US
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/3/20 6:09 AM, Alexandre Courbot wrote:
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

I was seeing this also, so I checked this patch. WFM.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

See below.

> ---
>  drivers/media/platform/Kconfig                | 11 +--
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
>  2 files changed, 55 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index a3cb104956d5..e559d9c529b6 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -253,14 +253,17 @@ config VIDEO_MEDIATEK_VCODEC
>  	depends on MTK_IOMMU || COMPILE_TEST
>  	depends on VIDEO_DEV && VIDEO_V4L2
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
> -	select VIDEO_MEDIATEK_VPU
> -	select MTK_SCP
>  	help
>  	    Mediatek video codec driver provides HW capability to
> -	    encode and decode in a range of video formats
> -	    This driver rely on VPU driver to communicate with VPU.
> +	    encode and decode in a range of video formats on MT8173
> +	    and MT8183.
> +
> +	    Note that support for support for MT8173 requires

Drop one of "support for" above. (or "for support" ;)

> +	    VIDEO_MEDIATEK_VPU to also be selected. Support for
> +	    MT8183 depends on MTK_SCP.
>  
>  	    To compile this driver as modules, choose M here: the
>  	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.


thanks.
-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
