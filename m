Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15791C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 16:55:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D526420767
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 16:55:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cYeTDOqL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckoL68k4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D526420767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O6zGYOKVqZ+z2qbULQ16N9KUVPEDJYlLopYtWL/JZL8=; b=cYeTDOqLC04k+l88hcC6cCspT
	DHza0wIXv1i5bY6ns/SqrzLTd0qUI8pwGG7c21iHtR5YcI3r0Q73+bhpaJK6+rKB9HHI+K/nNtN/I
	6BRnHib8yTp3Tt+zBWCxRC1zk4JfARlQCJeIxuSIleoXtZqfpZag7jxQCzESA1Kx8+non7xcYKPYt
	Gfx6bbSRcA1+d2wafskWZC7AxLabnaODDolofalYi18ea0EqwqWzCZ0hEmLE2iOrCznF0Q1aopj44
	0XoQFqaDWsNGWexKfKARmVrz3s8RxBfOfKMoFBYsBu5Bu2vKdcQVUq72poTF3jiMEpC1Pod+7cxyE
	Gvjt0lD2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDW2T-0002Dm-KT; Wed, 02 Sep 2020 16:55:13 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDW2R-0002CV-I1
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 16:55:12 +0000
Received: by mail-pf1-x441.google.com with SMTP id c142so3159661pfb.7
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 09:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+Y0rjP2iRr424s96psUmYnoN7aoVH40URoisUkWEVKM=;
 b=ckoL68k4N/ik2ZM3N7/wFHn1WzW9q/41PJ3NFI8LjEBIY08L/A2DWIaIWQ7xQaq8p+
 w6cREHr7FtQseHeaxYE/mA/A7YNIb28ZQcQFTuKRtQTv3lBcWErJv8onhO+AN3cBl+ae
 9fYw6oars+ro982BewlZThDi3ZBaLtBqUNcrOLh17FpQkL/1IHBZrNuciWBbqEpZ5RDz
 6efXbrOEyKZvfeyQugwu4FiV80Y5r4t5gGJZAAIQBGeAKtNPEOXoSpNwlpqviKS3yv9f
 CVti1fm5+5KCFF3rAMZDfzLOj+wAkbm58GzierLsh3rH/ZTYcUp5Me/q518fUlfP7huu
 6qLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Y0rjP2iRr424s96psUmYnoN7aoVH40URoisUkWEVKM=;
 b=IayJcRr0TPKsynjdODxb3STJlS8QNjQsvi9JwA+WHyWmgRWRLRRwTmKJOvdDVG8t5H
 NNNbbQ/s0SvLmU+17S3WkGIX6NKvwuWoWwh6kKumtKfj5AkNc1vJlhLIDERJ1RtIwl+g
 J4t3kFPN9nY++YxofAAl9ShNQyY4Q7acZ0n5P7cU7vMkqBPItfnKVwq8xHN7d0Z2tFEY
 5ZmvAmHpmyCWa0PVWVFq+37z7SlepdygaGf1Azbu6HJjOtamqmRCveH+hr6J4JEFx/1a
 chSoW9oEPOP1YC95T6JD1HUJzsfcYhdCk0a8ioetLJTmCk3Xu/vckWq+nH0K+Yzhz4Ua
 aDmQ==
X-Gm-Message-State: AOAM5318HSHZiiJ9HBVlrmK8Dunxl3cXR3AM4zv1QdS7eBm/HCDi1+WW
 HlOqvJ1XQv5QGuo3MjWNKBc7JA==
X-Google-Smtp-Source: ABdhPJwEIpsuErTO/bWqZFc6vuzEv2QNL7ehNrDIKdUja/jaTX8OxvJGXpuesTYh+HH/mviug93JAg==
X-Received: by 2002:a63:e015:: with SMTP id e21mr2682319pgh.264.1599065707722; 
 Wed, 02 Sep 2020 09:55:07 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id ca6sm2763262pjb.53.2020.09.02.09.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 09:55:07 -0700 (PDT)
Date: Wed, 2 Sep 2020 10:55:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v2] rpmsg: Avoid double-free in mtk_rpmsg_register_device
Message-ID: <20200902165505.GA280378@xps15>
References: <20200902190709.v2.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902190709.v2.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_125511_632143_111199D4 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-mediatek@lists.infradead.org, Pi-Hsun Shih <pihsun@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 02, 2020 at 07:07:15PM +0800, Nicolas Boichat wrote:
> If rpmsg_register_device fails, it will call
> mtk_rpmsg_release_device which already frees mdev.
> 
> Fixes: 7017996951fde84 ("rpmsg: add rpmsg support for mt8183 SCP.")

The SHA should be 12 characters instead of 15.  With that:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> Changes in v2:
>  - Drop useless if and ret variable (Markus Elfring)
> 
>  drivers/rpmsg/mtk_rpmsg.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 83f2b8804ee989d..96a17ec2914011d 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -200,7 +200,6 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
>  	struct rpmsg_device *rpdev;
>  	struct mtk_rpmsg_device *mdev;
>  	struct platform_device *pdev = mtk_subdev->pdev;
> -	int ret;
>  
>  	mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
>  	if (!mdev)
> @@ -219,13 +218,7 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
>  	rpdev->dev.parent = &pdev->dev;
>  	rpdev->dev.release = mtk_rpmsg_release_device;
>  
> -	ret = rpmsg_register_device(rpdev);
> -	if (ret) {
> -		kfree(mdev);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return rpmsg_register_device(rpdev);
>  }
>  
>  static void mtk_register_device_work_function(struct work_struct *register_work)
> -- 
> 2.28.0.402.g5ffc5be6b7-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
