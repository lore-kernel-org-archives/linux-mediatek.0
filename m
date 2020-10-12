Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE370C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 15:00:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528C120838
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 15:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zboryipt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fXZNEzjp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528C120838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mdK9bm33N2vHYaRr3vjV/VIZj3tFUHAzMS4NyLhGi1A=; b=ZboryiptkBjfjM1uuXK3veU9Q
	lAxJgaMCwF9an72WHgXGkK0fx0VaUWvp00HBeb3aQffe8pT5vhPZ/vUerpbJMuDAyl+LZmpXsESfp
	n//P6H0KyI/onLMxR4aiKuP5WpkpJlKH3QQOO4osU+3w+OuoRahwIEglYkHFVvDEN0EqmvzPERrtR
	zK5LKkSLSf3MTy80TuuotKvMjDsoXNrCus4pQTA4Ts8Q6n80KBn53394l3yWHpDsoaBTbw8XpcPBY
	6PN5Ou5LnxpUQDOgo5h+IbO+RB1lkBJPjSHOuQDhHXl0oOCZb652eKWgX14g6p9nJ1KV7mpyE+Z7k
	4+mQZosKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRzJ3-0005Ya-5j; Mon, 12 Oct 2020 15:00:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRzJ0-0005YF-Tz
 for linux-mediatek@merlin.infradead.org; Mon, 12 Oct 2020 15:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=n9rKwABW1rW8ifuT1wp/xKxs4ZM4lyDE+xlv3wP2wvY=; b=fXZNEzjpAEg8beql8d+moKCW2D
 NhvsyZK3u5DwneXnRsjCCl3uwLthGxJ0G1IQLpcGKLjPtM7E5oJtZe+zIhOJI0JQOKcxHYyUwKpdD
 Fnm3lsZKpi+BDIRPa1xy9q1aXWvJ1N/LyvE3CenOGCTzbpBsQbTPBECKEjnC91eGMtS/+FyZ9Axg4
 9DphTPPWGx5GnTDAiG539iRndmJ3Lur5fDJRBRLRyrPjkXOVv0NSWwIVsZcGl/O9Jzn7sFZGfACUn
 VRiofm2B4nAZrBSecyfHzOkxD/XBrq+jRFIN3CJb021BIo+CHV7ynYcraRdxVviudqFP+5UgqVenM
 d5e84wIQ==;
Received: from [2601:1c0:6280:3f0::507c]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRzIu-0006Jv-Eq; Mon, 12 Oct 2020 15:00:01 +0000
Subject: Re: [PATCH v3 2/2] media: mtk-vcodec: fix build breakage when one of
 VPU or SCP is enabled
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20201012053557.4102148-1-acourbot@chromium.org>
 <20201012053557.4102148-3-acourbot@chromium.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b9afc70f-9787-6513-29e7-41ffd6972da0@infradead.org>
Date: Mon, 12 Oct 2020 07:59:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012053557.4102148-3-acourbot@chromium.org>
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, gnurou@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/11/20 10:35 PM, Alexandre Courbot wrote:
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

That Ack applied to v2. I have not tested nor acked this version of the patch.

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
>  
> +config VIDEO_MEDIATEK_VCODEC_VPU
> +	bool
> +
> +config VIDEO_MEDIATEK_VCODEC_SCP
> +	bool
> +
>  config VIDEO_MEM2MEM_DEINTERLACE
>  	tristate "Deinterlace support"
>  	depends on VIDEO_DEV && VIDEO_V4L2
> diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> index 6e1ea3a9f052..4618d43dbbc8 100644
> --- a/drivers/media/platform/mtk-vcodec/Makefile
> +++ b/drivers/media/platform/mtk-vcodec/Makefile
> @@ -25,5 +25,11 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
>  mtk-vcodec-common-y := mtk_vcodec_intr.o \
>  		mtk_vcodec_util.o \
>  		mtk_vcodec_fw.o \
> -		mtk_vcodec_fw_vpu.o \
> -		mtk_vcodec_fw_scp.o
> +
> +ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU),)
> +mtk-vcodec-common-y += mtk_vcodec_fw_vpu.o
> +endif
> +
> +ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
> +mtk-vcodec-common-y += mtk_vcodec_fw_scp.o
> +endif
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
> index 51f1694a7c7d..b41e66185cec 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
> @@ -27,8 +27,26 @@ struct mtk_vcodec_fw_ops {
>  	void (*release)(struct mtk_vcodec_fw *fw);
>  };
>  
> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU)
>  struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
>  					     enum mtk_vcodec_fw_use fw_use);
> +#else
> +static inline struct mtk_vcodec_fw *
> +mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
> +		       enum mtk_vcodec_fw_use fw_use)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_VPU */
> +
> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP)
>  struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev);
> +#else
> +static inline struct mtk_vcodec_fw *
> +mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_SCP */
>  
>  #endif /* _MTK_VCODEC_FW_PRIV_H_ */
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
