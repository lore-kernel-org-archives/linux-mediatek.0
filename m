Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94450C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 10:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kpSOnlZjQwzkLck3YkQft8hCuVeUlhmPEVOtkdKNbI=; b=Wpal/yzsHyRCGy
	35qNsG4YDW0eMNtgkZYqXWFbsXoI+Jb0bLzUEo7qShETGcjjow7oC3TVGlPuHzLl70NVCkyaVkzyP
	qVuQkzGzntiFWFMJUYqVQ6L8aX/bgJ9fxSAJRgFGLnO9J5iqXzI8LgSS7TnUxl5dxd6OJraHL/mkb
	itEBTngubPwdxqtsxUNZ87+A12QmlkUhdfjLKiF4p0feSm4badAxDKn4v4nVnkIclcUk8ZPD6JiKK
	zKdZQTY087TNXznv/k6G9OIrkCXDlodExbxSy7PWRXfhKAihc4aeG1JlGp3zyCAC75dTS1nubiCQV
	X5+E44Fy25FAlVT4jARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYJE-009xWL-2G; Fri, 26 Nov 2021 10:18:24 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYIa-009xKz-GA
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 10:17:45 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 8so8497994pfo.4
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Nov 2021 02:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xMgOp7lbYkwgl7D+YMk4FsWl75ZCyIN6+KuA/rtaF/I=;
 b=LBWGHLBRsRzhoMj3EqgNJCHjvF8Omp+lFltj4q3PZ2eTjzxauxbrZCw7VbA2RptFHn
 9JO/dvgYGwWp4DfxLeQ87M9rBFpS5DkINqTqchCLy+3yNbuIofGIjth24f7bfe8aKXFT
 EglCS4q/j7GP5uJ4lMjPtOb2gbX0j0DUHXDzZXyTF8mmC7crt2z6WMYg92igq2kFgHOQ
 EkDVWvXJ9BG6UYNazP6na42UVuE1dJn4OPLcOrN4d9Cxu4OOcaCKeaRAkFHhej6oMlSi
 Zu30smqSUDtulrTke8JXTTjnTRyYDBkyb2lMv6lTqM1BVNgwNV2dvLtMbFd8ZVIpNeUC
 g5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xMgOp7lbYkwgl7D+YMk4FsWl75ZCyIN6+KuA/rtaF/I=;
 b=BmJv8EnGSfOZ0b+/Y/vA+ukNYUJ2LegnKCkEp523g8PMNbiQM/MI7dKBaI+4RZGbnA
 W/m606ziSVt0Q1Rd6c2uAJuLkw4u4M77R+oDLKJ1kV8RJRpIyqpxET8bGwMFq9dd0Lj7
 zD2CWpbM6BfkSx4SLhQl7srVlmX8QlMp/HNdJ2mEAnT4RKfJvLbKeDscJYe6AHpywF9b
 Mz6462tSFt+L4lo/E7x+aN7YQBGIzT+zVJ8sEqSZ0mxLeRwz+sSsh7UXMOceSnC/2YXr
 8hVIyX1TfUA/j4Vc1GUn63+grzu5MLh4YSxVtnPiQPC1c1kMb+mJ6C+ZDBWnNpLsbwm9
 /pmg==
X-Gm-Message-State: AOAM533/GT78jvpMnRjNA4R3Ii/85KNwxwxl++ByU2qRBQuy1XtPCjOu
 qgb5igwPPPw2tfUGURiqD3c5Sg==
X-Google-Smtp-Source: ABdhPJy9F/ggoPbCVgIvZMQl0QH1RDypskEwFasKoD+ufuypgX8T72E/Pcuk/nqiUvcMw6OeB5Z0yw==
X-Received: by 2002:a05:6a00:24cd:b0:49f:bf3f:c42c with SMTP id
 d13-20020a056a0024cd00b0049fbf3fc42cmr19995895pfv.54.1637921863703; 
 Fri, 26 Nov 2021 02:17:43 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id f185sm6281835pfg.39.2021.11.26.02.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 02:17:43 -0800 (PST)
Date: Fri, 26 Nov 2021 18:17:39 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v6 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaC0Q2Qo4UJc+f3A@google.com>
References: <20211126093021.25462-1-allen-kh.cheng@mediatek.com>
 <20211126093021.25462-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126093021.25462-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_021744_606303_E21BA83A 
X-CRM114-Status: GOOD (  13.90  )
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

On Fri, Nov 26, 2021 at 05:30:21PM +0800, allen-kh.cheng wrote:
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

With a minor comment:
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index c9fc06c7e685..c44a0102585d 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -226,6 +226,13 @@ config STM32_IPCC
>  	  with hardware for Inter-Processor Communication Controller (IPCC)
>  	  between processors. Say Y here if you want to have this support.
>  
> +config MTK_ADSP_IPC_MBOX
> +	tristate "MediaTek ADSP Mailbox Controller"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	help
> +	  Say yes here to add support for MediaTek ADSP IPC mailbox controller
> +	  driver. It is used to send short messages between processors with dsp.
> +
>  config MTK_CMDQ_MBOX
>  	tristate "MediaTek CMDQ Mailbox Support"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index c2089f04887e..13d5c81852ca 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -49,6 +49,8 @@ obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
>  
>  obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
>  
> +obj-$(CONFIG_MTK_ADSP_IPC_MBOX)	+= mtk-adsp-mailbox.o
> +
>  obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o

To be neat, Kconfig name should be aligned to the file name.

That is, either:
- s/MTK_ADSP_IPC_MBOX/MTK_ADSP_MBOX/
- s/mtk-adsp-mailbox.o/mtk-adsp-ipc-mailbox.o/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
