Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2813C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 17:58:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3512076D
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 17:58:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cQaqErgX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="khQzpyDe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF3512076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G9HJ4qBmKuJK5YzJZgCoF0ZCWL8HwD87WRlLak+oE/g=; b=cQaqErgXl+XM6DAOqJXMHKt1C
	3kvkVlMlC3GDawrwFwAyg4mvbREQnB1WmG9XrvmsYkSBxvYlmG3TIYRQ65ICTmAaYACm/q4VzB0RX
	APJPaCQJA76GlZ6aj1LURLFlJ4fM5ULn+vdrzR5U3keSciEOwSllZVhQOQTDvCulewKI/ZN+YAPbI
	H0sMCd2MdHr35ygT+cGcVdX8AU8ERBgkzoW43Oo/rheREMZmM7p0lH/p7yf72ntoGObLQFi5Zu8XG
	fazjEmJLeJq4ZD3tnceuIZzSq1DdAgd7ZIKZCboOuYCwj9d6MNtKcAHrBUdD2JPEPjiR/Zv43d/T7
	UmJp9xtpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS258-0000yV-Ca; Mon, 12 Oct 2020 17:57:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS256-0000y4-OW
 for linux-mediatek@merlin.infradead.org; Mon, 12 Oct 2020 17:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=cZw4jayN3HAr2KMB9YTkmcSf5Sy+pt/3xMbdYKhhmXk=; b=khQzpyDeKla36P5IttD3Sh6t/T
 IWz0Ju5rITG17faaDRhAMVCL/re6DGaVfUD8rSCdezrYmSxQHHMEn7ng8iUCL8nzbxL7v4+IiOebZ
 3J3mupjtOiqBHkBY1qu+lXdaTS44FHjdUzvfEAoY4YCLjCwSDxHzK6goj/DquZ3T3jAZu05Ud60M3
 klQPzj1vvhDNnK9ZsZQWJKixFvWX2vl9G8+dGCRJ//CkeYAxaRTGjNk3iPD1YtNtpUwYPMoCAGaL5
 H0Yv//MA2CUfLNNo4uNMXreNMPBx7nGhMiwOW9xpiVzihCvi/2Yavn0ZEzcYl4gJYdVqGVJDQelph
 FFuelRoQ==;
Received: from [2601:1c0:6280:3f0::507c]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS252-0000ia-UZ; Mon, 12 Oct 2020 17:57:54 +0000
Subject: Re: [PATCH v3 2/2] media: mtk-vcodec: fix build breakage when one of
 VPU or SCP is enabled
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20201012053557.4102148-1-acourbot@chromium.org>
 <20201012053557.4102148-3-acourbot@chromium.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b333d437-02a0-6d2f-67fc-e798a0a562ff@infradead.org>
Date: Mon, 12 Oct 2020 10:57:49 -0700
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

Hi,

For the Kconfig entries, specifically the help text:


On 10/11/20 10:35 PM, Alexandre Courbot wrote:
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

Please follow coding-style for Kconfig files:

from Documentation/process/coding-style.rst, section 10):

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


thanks.
-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
