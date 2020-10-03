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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D9CC41604
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 11:22:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F88F206C9
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 11:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYxNdlDw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="lIEZoRG5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F88F206C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ON6GuKdH6ZPp0pv8lF+6efwKOGjNHquWRqw19vNZMVw=; b=LYxNdlDwFufl1poHawtMoCEbk
	X+rN7dp76PydNcxCpDZX//qchwl+81jTJkaAW/ytSRNroZFiRTrLhT7btNUr5NEJ1yNreEsAyarG7
	NGq+H7UwdLOVmqcnFiSqJmD71antnAmwfUMguzNpqdxGHrMYw8tOptqykBt1+a3/wRQRo0gtERIhk
	ywLPRF3SeTowEto6c65rSxn9mdb/0YUtxOXppsC2bx6smHmMRO+sjGXbUU9fTPGWXczbEOGdiMWYc
	Phi1d9z4aVKw08922U9I3wfdyUQKCy6XD2ak47j5xwjd0JtMP/70PFslSAbs5KlQDNSszosCHeLm5
	hpxJHRjFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOfcb-0008Lc-JC; Sat, 03 Oct 2020 11:22:37 +0000
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOfcX-0008KW-CU; Sat, 03 Oct 2020 11:22:34 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id OfZekjIBgTHgxOfZhk6bEB; Sat, 03 Oct 2020 13:22:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1601724143; bh=SrIug3qpOAiuSFr6U/yS7Rn0eFN46Emp41MwllPybCQ=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=lIEZoRG5CjtoeoEGPkLY/BIIasiZFbFulBjKPxpLjT+IpicVyZDErY75NewaGbHPc
 Qs/B3vZ8qEYRVyAgVcca3wvfUSKKQK2YLyys9BAdQwRc/ERAyXE1qpgxc31u8jSZLu
 EO6VyPvRaQBKeM11Rgdy9m+uOSJFCa3uOC82qjS7g94z2CVb4kFmZGA56LpSjDv3Fc
 ZHjbMmQ/4Sd7AcMUGXNAOBgLq+qO4BXZILehJKGCeMTh5qCzqLnnPyN/W6pbWQElp6
 8lGctRToXbv3dnwMbMm8dRPxkP2TmEEjDElxUcfUMSHg9L85hJxTqRL6QIWgf0/skv
 KTes3GM/39rCA==
Subject: Re: [PATCH 2/3] media: mtk-vcodec: add missing put_device() call in
 mtk_vcodec_init_dec_pm()
To: Yu Kuai <yukuai3@huawei.com>, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com
References: <20200924081802.1061024-1-yukuai3@huawei.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f155ec8b-9036-55b4-2624-a042b6e26866@xs4all.nl>
Date: Sat, 3 Oct 2020 13:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924081802.1061024-1-yukuai3@huawei.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJuldRTWhFqMmLPFuJSzU6XO6AcWXdH+xgdSGhNL9Iuz8Y9k8ajM8u1BN4mGtyFF5ZIEqQLmb3tapojSVpcHG56c/vQPXPK3ki9mw2qOzMXpJBboPsaw
 rNGssIMs1rGBwTUqaYOxdibW/AopGfHIuMaqBoCvpm+G7ZY4/u7hlMKPTUnMVtyQ23mfhqA6GbYSQoNwi8FPKWBWWyAqNjy0LWvhs+wogDotBhbdXRm/8Np+
 6brEA6w1YVztWW5fYPIOkISbehcGG2VfWG5f3KPIrynfoekCaw39M5qNQj0ncWtshCsDzH1OkdF6TOqxovOBd0N4xMvhmcHUWFZpzWXz5xEQ6Z2442ObyW7/
 jjQGRFdSWasQ4vhek+wG8N9sTJxPji9H3isACSv/+9csZlBw99BNFv8f8y6UDfQeRYFgUnkiHmBwuzx9/exGDoqdmI3d8rQmYvIuwCTFyrvr+ekD2/OdM7o8
 MY/DlpN7DR3foEyq9pExlzFMKIkB9A20JACAnqSsScAeo9MH97ZpCiy3oAE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_072233_531901_ED002672 
X-CRM114-Status: GOOD (  19.24  )
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
Cc: yi.zhang@huawei.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24/09/2020 10:18, Yu Kuai wrote:
> if of_find_device_by_node() succeed, mtk_vcodec_init_dec_pm() doesn't have
> a corresponding put_device(). Thus add jump target to fix the exception
> handling for this function implementation.
> 
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c    | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 5a6ec8fb52da..01e680ede9bd 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -48,11 +48,14 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>  		dec_clk->clk_info = devm_kcalloc(&pdev->dev,
>  			dec_clk->clk_num, sizeof(*clk_info),
>  			GFP_KERNEL);
> -		if (!dec_clk->clk_info)
> -			return -ENOMEM;
> +		if (!dec_clk->clk_info) {
> +			ret = -ENOMEM;
> +			goto put_device;
> +		}
>  	} else {
>  		mtk_v4l2_err("Failed to get vdec clock count");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto put_device;
>  	}
>  
>  	for (i = 0; i < dec_clk->clk_num; i++) {
> @@ -61,19 +64,22 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>  			"clock-names", i, &clk_info->clk_name);
>  		if (ret) {
>  			mtk_v4l2_err("Failed to get clock name id = %d", i);
> -			return ret;
> +			goto put_device;
>  		}
>  		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
>  			clk_info->clk_name);
>  		if (IS_ERR(clk_info->vcodec_clk)) {
>  			mtk_v4l2_err("devm_clk_get (%d)%s fail", i,
>  				clk_info->clk_name);
> -			return PTR_ERR(clk_info->vcodec_clk);
> +			ret = PTR_ERR(clk_info->vcodec_clk);
> +			goto put_device;
>  		}
>  	}
>  
>  	pm_runtime_enable(&pdev->dev);
> -
> +	return 0;
> +put_device:
> +	put_device(pm->larbvdec);
>  	return ret;
>  }
>  
> 

A similar question as with the previous patch: shouldn't there be a
put_device(pm->larbvdec); in the mtk_vcodec_release_dec_pm() function?

Same for the next patch.

Regards,

	Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
