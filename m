Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD7EC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 20:25:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2768F20782
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 20:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xc1jLi/t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vfv9l63v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2768F20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dL84xfWT8ohEN5HkbCVF3cqxZwpkKX79NkQthwO2A0M=; b=Xc1jLi/t90lzSCeaZGK9zjjNh
	59g9Z2R2NIvBb/P48f7RaltHgi8yQ+kHeUsayuIdIbkbvRAf8cPRy1GMmvQm6DAVDDRpS0NntZcEE
	cJGE1f5KvBmMsccyBP6TCh9W6ghMIHr6B4X2TXX+9LTszqkHVr3UZe0w2fY8bm+/JwukTN9KSQJYJ
	ORO3LHXHadJ4M3nNGXhmRq4Pny67ysC32hkJkf3n4qgx/poueWdZCrB0sghICW5wR8phvPr8ETM8/
	WOLEgDEb7mMhWjzFBOpJGhSK0tfFalj5dXoNKSpbiPTPIok8kfeQWQbcZh+0idnQJIE2aY1whatkd
	9REY2AYKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kel4L-0006Nc-OI; Mon, 16 Nov 2020 20:25:45 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kel4H-0006Mk-5x
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 20:25:43 +0000
Received: by mail-pf1-x444.google.com with SMTP id q10so15266689pfn.0
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 12:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ERfliqYr2okDo/CXLM9ccwNtHFoL5ZwQlob+5xlpBAw=;
 b=vfv9l63vPqLbgqfRkXqTkQT4X1BgZc+9AaWxyCGLMGbo3Fb8559zZGpnm1gBs+X2zI
 XBsALxhsb+gttWFr+gZ20NGTXHAb9Qm62jHi9Gj7KIIRujCBZ04U3kXGhkNGJ4B/Za/Z
 Z4RWZMiUG77fEkRq57gp7dym8tAta+sXT3F8ACHKN4n+ikRn6+Wkxm17l7CP4uNALafe
 weuw7eimW40MoloINAK8LYAS1oHraPnVh/UI+wb9EQnZvE0dqh+MhbgsIyfV5YG1hhzi
 HZr1P0V4usdhYD1BnF39nuZ+9ZIxz/rU/8ZHIDQQrNdWJK4OZlhPa90V7nYWe/mD9NDq
 /uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ERfliqYr2okDo/CXLM9ccwNtHFoL5ZwQlob+5xlpBAw=;
 b=MeM/v0ycJefMiRR6xybm664kTF1AkGoEs1gbB3oG5NRkqZlJvczs4xAQjDTeaEdjeW
 9b3vjZcslnmIfI0M9d9f3COf8zNeOuK7c6MyZ+ODLvszBYxXkgYMI8topXygPyd/2yaX
 /fxfR8iXchHEhZOKKmktzSj2UtCtoA67N9UUd2GLZAlhTNsctCKhrXR/bMeawlY5mcuo
 IzXUlRqyIosTM+ZqXTka+cZDswt5t+6M/BnxznSRxUaGadQIJ9rwKq0PooNKZAEfZNxP
 lkzw3Ll+WrX7GP2snS6NINrFd/8Imbx6m5GoP6igA81KGin20atgbpAxksWifsByyMYD
 unpg==
X-Gm-Message-State: AOAM5339t1/7/fUJUHkV4PnCDNk3PEQCIuKSPzHj4VmEoZB1RIJAJdyu
 UbRMDvjkInVRiTnmKDnreBflPQ==
X-Google-Smtp-Source: ABdhPJxBsWwLAEXr9sgdaH/oomiPMDNWSFUwbLKunoLii+UFwnXH5TPi+ukCCrppOZwAZ1z64gBgGQ==
X-Received: by 2002:a62:2c8a:0:b029:160:d7a:d045 with SMTP id
 s132-20020a622c8a0000b02901600d7ad045mr15787364pfs.65.1605558338816; 
 Mon, 16 Nov 2020 12:25:38 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id c2sm18350144pfi.21.2020.11.16.12.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 12:25:38 -0800 (PST)
Date: Mon, 16 Nov 2020 13:25:36 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2 1/2] remoteproc/mediatek: fix sparse errors on sram
 power on and off
Message-ID: <20201116202536.GA3892875@xps15>
References: <20201116082537.3287009-1-tzungbi@google.com>
 <20201116082537.3287009-2-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116082537.3287009-2-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_152542_325453_99F4DC7E 
X-CRM114-Status: GOOD (  18.01  )
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
Cc: ohad@wizery.com, drinkcat@chromium.org, kernel test robot <lkp@intel.com>,
 linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org,
 groeck@chromium.org, linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 04:25:36PM +0800, Tzung-Bi Shih wrote:
> Fixes the following sparse errors on sram power on and off:
> 
> On drivers/remoteproc/mtk_scp.c:306:17:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> 
> On drivers/remoteproc/mtk_scp.c:307:9:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> 
> On drivers/remoteproc/mtk_scp.c:314:9:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> 
> On drivers/remoteproc/mtk_scp.c:316:17:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 577cbd5d421e..8ed89ea1eb78 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -298,7 +298,7 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
>  	return 0;
>  }
>  
> -static void mt8192_power_on_sram(void *addr)
> +static void mt8192_power_on_sram(void __iomem *addr)
>  {
>  	int i;
>  
> @@ -307,7 +307,7 @@ static void mt8192_power_on_sram(void *addr)
>  	writel(0, addr);
>  }
>  
> -static void mt8192_power_off_sram(void *addr)
> +static void mt8192_power_off_sram(void __iomem *addr)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  {
>  	int i;
>  
> -- 
> 2.29.2.299.gdc1121823c-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
