Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8712C11F67
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 16:04:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A70761D88
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 16:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A70761D88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9Pn2ZCnwqHLWSyoCx+DRWoB5vsI3sI+hwltpZuxh4w=; b=L6bAZt7q+8YBDd
	VmCM9wK2n2VQb46kT6AlE0D6MiKu7gl+e+mVoaBvCeQRmaLmeCN2spMD4uutE6AO9wEPv83khIF0N
	I9suWh2UjJSL+thSBDQvOdbB90LQqhtKEUXVF1iv4af/Pn1Bi4g0ObARdrjd0FuDualsw6ofDy8PU
	r+F9C40ITdXrRTThv/zS8fBXeBZ9ThF8HZz5vglhoGcUg9cYac6N6xciM7iuZxvdckIM4HzzL75Rj
	yNVqZzDKg/qpmum8YTf2NzHZEiqSkiFadsuW2ldbmBiMyWBiMpIVrQKcud9PjFqalnFPJBHsIDiIJ
	UxVuI0YR5Ij/M4n6gnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyGDM-00BYnF-OC; Tue, 29 Jun 2021 16:03:56 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyGDI-00BYlr-Mw
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 16:03:54 +0000
Received: by mail-oi1-x229.google.com with SMTP id d19so26803097oic.7
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 09:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=22YCX1gTuHxij8jBkd6zakC86sS35hKmpf8kUxvjUtA=;
 b=uNeO5HQ/ALYrv8nofxfYkzdeDAGS1Xx9YbfqiTXo82HWDllL+J+AvuQpCzIVUM8K+a
 SKl340JpBbSYnEzjVYXgxousi3t27+S5sloXkIBnbywCuwwUDmadKGIVmFozaPq1S2zo
 /CQnqX/w48kCBJ4oUo15C37Nx1sSYhDwWr1YcAf0lKMLGuOwwsleJ0t15S65WSS570QZ
 AtgV6/DxttbW5g7DSxr/F8Mbu7uylHJ9wV0w5LtaeAHRU32gQRnHzz3uB52Ux6cXBsnq
 RJrfqVVqO5cRx1P2B0dT28h6QzLckbINiLl1dsuoPFfYrYS+Fm8vGnvJ3exh8T6U2qc5
 ZUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=22YCX1gTuHxij8jBkd6zakC86sS35hKmpf8kUxvjUtA=;
 b=pSD6D9GoUsLQK1selNpSvrsO497f6qQuLd+H5Drv8H2ccehEgFteyizfFI+5WZKERQ
 C4j6sK8ZRiQRZpWPv6OvjHtASG04QaUqZeUVa23Aab5hmO2b6ouSptf7LkAwxkcUTXiG
 uoANm7xW8WNEFwWCYlgnbzunIIGI0yi1TTtbmKEzr31LPYU+49pUy4R6tpfiobVpvIor
 jJdq6j8jd59p13/4G+yaNpZIGIeycZznsRAIwSIVDu7QenDNTwBdRQ9LSboixU37dNzK
 T4Fjli9EceJ6cTBpxNMbd8ASwSdPcWxG6duonWT0WCe6E66zaoycZbA8YLu6W+QWhna/
 Ctkw==
X-Gm-Message-State: AOAM532YK351ziRjw6L2z918EIktugx1yRxXMeNUSmnck4gkneQASUnF
 bEd86Fxd6i0YJG30XVGCGnHZCw==
X-Google-Smtp-Source: ABdhPJx4ReJpcx5aMpggn8YB+452U+YvCzJu2XF3zGPSA+kp4p1LMkT+7egjWO81/LUgvGGbBcRaNQ==
X-Received: by 2002:aca:3285:: with SMTP id
 y127mr22031113oiy.115.1624982628172; 
 Tue, 29 Jun 2021 09:03:48 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id y18sm3941779oiv.46.2021.06.29.09.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 09:03:47 -0700 (PDT)
Date: Tue, 29 Jun 2021 11:03:45 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Phil Chang <phil.chang@mediatek.com>
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com,
 mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com,
 mark-pk.tsai@mediatek.com, weiting.tsai@mediatek.com
Subject: Re: [PATCH] remoteproc: export rproc re/unregister to virtio device
 APIs
Message-ID: <YNtEYUuW/OKSQlfp@yoga>
References: <20210629150002.8050-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629150002.8050-1-phil.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_090352_866126_13650254 
X-CRM114-Status: GOOD (  17.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue 29 Jun 10:00 CDT 2021, Phil Chang wrote:

> In some case, the remote processor already boot up on previous state,
> but still need register to virtio device, so that exported those APIs.
> 
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> Signed-off-by: YJ chiang <yj.chiang@mediatek.com>
> ---
> Hi
> 
> In our case, the remote processor is already boot up in u-boot,
> we don't want to boot again or load fw in driver but register to virtio
> device for rpmsg. so that needs those API exported.
> Furthermore, the rproc_vq_interrupt is exported, so those functions
> should be exported also.
> 

Would the recently introduces support in remoteproc for "attaching" to
an already running remote processor be useful to you?


If you don't need a remoteproc driver, but rather just want e.g. a
platform_driver that spawns the appropriate virtio devices, wouldn't
virtio_mmio work?

Regards,
Bjorn

> thanks
> 
>  drivers/remoteproc/remoteproc_virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 0cc617f76068..e23658a76f5e 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -425,6 +425,7 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  out:
>  	return ret;
>  }
> +EXPORT_SYMBOL(rproc_add_virtio_dev);
>  
>  /**
>   * rproc_remove_virtio_dev() - remove an rproc-induced virtio device
> @@ -440,3 +441,4 @@ int rproc_remove_virtio_dev(struct device *dev, void *data)
>  	unregister_virtio_device(vdev);
>  	return 0;
>  }
> +EXPORT_SYMBOL(rproc_remove_virtio_dev);
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
