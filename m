Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7DBC43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 07:19:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D81120663
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 07:19:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A2JWdtDZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdU3jT5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D81120663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4X1OVon+HYFl3xoadVCoLfKgzq7rFm1Ab1cZ9NzxQxs=; b=A2JWdtDZRC9l8K
	XkRBwG+i+UtoANZA0Gb1CvpFhU5FthUV1a3ttBxD0fg+afS+WFoFrk1Wjv3beb5jIDOcv7qJpsvMv
	+H5OJ1j0QKar+JzbcRLKkNmneyq2z3J99eA8MvcSr9EvGwZB4ciLD//NV+UF/QdnvB9UNY3yK9+Bv
	g9bODWeUI/SdDfAMYySOC4GD0lWCLyYgDb2dZ3GigCdddTF79FjL8zWRBYgM0eaIrqtcWJZRRTnDx
	lnlFt2VBSu9fBsY0IKmehnTBTz5/wfUOyWC8uEYCFGnswQAfZ91wYkBOUIV7tzaEYg/3eDSGTOUB2
	2KBiqSQH/si7bR5sl3Ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHjH9-00058V-5R; Fri, 27 Mar 2020 07:19:31 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHjGy-00051S-Jr
 for linux-mediatek@lists.infradead.org; Fri, 27 Mar 2020 07:19:22 +0000
Received: by mail-lf1-x141.google.com with SMTP id h6so1237165lfp.6
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2020 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8yD3/mZAPx4NyJAYvyAM42UOXEcrRRB02HlarcvJcpY=;
 b=cdU3jT5oe/H7QKTBQOhKMp9drgTOsgZe5NhZH3AgSZm3iIiqG7Mpdb7eiSi/aoXspU
 adDnKmgjnNQOPOlbHzzO67tuGNnmIIXVdvnZjQLsWvhaxncdd/E9LNTu0B8xituEt11S
 im4peLookDERzMUR0/fJILym8NflyDU2H23CU1F2sEboZO0GzyBnSX7Sw58NmW1eoFRz
 QmjqAIIJ9eQ8gHc/xFj9sQsbaUodlZeNkmUP/NtCyr8IOePkWyk2t1k8IYPAE5lUA9Un
 TRQsPtLWtJUdSDAhud+rUIempEHW9rwXfg91DpI/kpwYm00hGRzm7ZMusZ+CVcF3VjUC
 zW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8yD3/mZAPx4NyJAYvyAM42UOXEcrRRB02HlarcvJcpY=;
 b=mjVosLtJ/+qjJuk/bBwEgUwZM13bM5SVt0eiHc4ooJ9PjS0S0Cb/2uEySGibrRaUQy
 Li7C7LVZ75j6w1xgcKDcw8h2uSYA/Rb2OD6D1GbY8X26NXw7AeImnHXiOUoKmiav1GrA
 WH4qQZaSjXjQ/uC8OkmYVDdQRTvhucPSfrp2XzEC+5VIix3Vc2+RIO9UT/GPwz/P5aUm
 B6ExyMiZAPl6ClsWrjQa0eD2av1TcKPm0MJu5jTq3J24hLsaqV0Uu4j9q7NIx54h4ouC
 Wf22mpKipv3FxSAgyg9B/040MpNm5E40Ip2guWRrQfKv3IBpa/uYodssCqUQvu2nLakO
 YA7Q==
X-Gm-Message-State: ANhLgQ0ASExlCMPm8sV5coNo7SuMJE+Na0/ZV+8fLzgJ+yi+vUwq4ber
 9FCAkHWOArezCJ1dBL6qhZImsH129JhxenCuDistAQ==
X-Google-Smtp-Source: ADFU+vsVleHzR2OlQgFnip8JwdTpgtyxbozUTC6A2rWBZO45SHy2RsvKY2E8cSZkDmSqmkfRqCMidvfUsGCh9kDJWeQ=
X-Received: by 2002:ac2:53b2:: with SMTP id j18mr8178328lfh.206.1585293557144; 
 Fri, 27 Mar 2020 00:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200326182742.487026-1-enric.balletbo@collabora.com>
In-Reply-To: <20200326182742.487026-1-enric.balletbo@collabora.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Fri, 27 Mar 2020 08:19:06 +0100
Message-ID: <CADYN=9Kd-eWAFaN-ttX+Aq5HyH2AiUfqeCRC1mMTZM93DBshsA@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-mmsys: Export ddp_dis/connect symbols
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_001920_794853_DF43C124 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: drinkcat@chromium.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 26 Mar 2020 at 19:27, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> When building on arm64 with allmodconfig or CONFIG_DRM_MEDIATEK=m we see
> the following error.
>
>   ERROR: modpost: "mtk_mmsys_ddp_disconnect"
>   [drivers/gpu/drm/mediatek/mediatek-drm.ko] undefined!
>   ERROR: modpost: "mtk_mmsys_ddp_connect"
>   [drivers/gpu/drm/mediatek/mediatek-drm.ko] undefined!
>
> Export mtk_mmsys_ddp_connect and mtk_mmsys_ddp_disconnect symbols to be
> able to be used for other modules.
>
> Fixes: 396c3fccaf03 ("soc / drm: mediatek: Move routing control to mmsys device")
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Cheers,
Anders

> ---
>
>  drivers/soc/mediatek/mtk-mmsys.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 32a92ec447c5..05e322c9c301 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -259,6 +259,7 @@ void mtk_mmsys_ddp_connect(struct device *dev,
>                 writel_relaxed(reg, config_regs + addr);
>         }
>  }
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>
>  void mtk_mmsys_ddp_disconnect(struct device *dev,
>                               enum mtk_ddp_comp_id cur,
> @@ -279,6 +280,7 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>                 writel_relaxed(reg, config_regs + addr);
>         }
>  }
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>
>  static int mtk_mmsys_probe(struct platform_device *pdev)
>  {
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
