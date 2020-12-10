Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE33EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:02:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 483B9207A2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 483B9207A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=coqBmGQ6EWFExgR+mA7hXhETftGoYXdvZJxkz/BHWRg=; b=Z8mqltTOEftdeBhhh6dBPsHwY
	gtQgvPrPwEHJo6ICOf1iGipZFtfG03miG1HMNRE7e1i8uEUeTCnTjILZd/0eiclGFXYtB9UHJTaLg
	fsQwHmUUpqhNtOvv7kiYtHftpZMjNc0rSYaHlp3R5+bcBX4OBy534p/yhpM/+vZW7S38V01S1WJFx
	+yK5FncM02O8lZwAnRb8JIcEN+n1J2khL5Jj/0Uy5rMVeE/0Jjomu/n9sjnwNXtxaIHJx77GL3O6y
	azzkUI5Db7X94HQhkWrN8ndmiaWJMmvrxFCmGJGn79zYCGW5xHxAKU2zhxPTyVtrbbnup9FFfusBJ
	6DL3NSpwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knPKi-00056C-Mz; Thu, 10 Dec 2020 17:02:24 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knPKf-00055i-V8
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 17:02:22 +0000
Received: by mail-oi1-x243.google.com with SMTP id k2so6440980oic.13
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Dec 2020 09:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0VaF0OOvRvbqmxI8AgMHKOr2aUIB8S8aaloJf3KMn18=;
 b=YxzxynxTNd36hMWxs7lKCsjR/Ddsg3/lt2/xiXrxkP24POFyHbXIK2byi1sBM7Uwb/
 qAOVQ/T9i2wPy/lbStrUeV/8IYYNg3lkKXuNbFqqs2ZqVgsPdVzSX0y4dRwVtjhXNcIF
 7cMUfrIanGdcD6DdwYdnqbeMThZzuTj16KXE3k0E1Tc6lYzykjEI88Jjn1cO80mp864C
 hjTOqfIzIYZZiT8WJlRj83A00C5V3/3hpY9zEcqSNd+miV1t6JmP2WnG++qYxZ4zuq6y
 vKhgFlx60x5XLOOfcc6akuw1+zou1Cp0Wgenmud5k+ZYD8ANV/MbbWuHvxINr7+uP6Xv
 NKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0VaF0OOvRvbqmxI8AgMHKOr2aUIB8S8aaloJf3KMn18=;
 b=QIkRcX1hE7dDQHwRG3LeXYoz2wJ64kJRDMwM73mS+YLJQ6NwqbDQ842vYFsmSQISkC
 Opv9QcmDsRdcapocvamzqFQ8vnciJM9b8j0nOxdNfX8FHeO/jSlY7Fbj2pMryWTG/zOC
 fTlyp2Aq//Vhf1vzCEkTgpTjetmxAMChng5JOTa9nYkH2U/NmnDv8tV/yvIDgktPurak
 VuIoVIb+qysrQ96xIzMjWAsHoB024QMmcUPLZ+duf0dbzrbdmpJh7sShf6zPMZPJ8UQR
 b/EiAIpFOT8V5GPkyBnXMkZLsgZcnM+ZUWJulvGvFbET7etzeo1uSO+jiOdnhwRUAydk
 1x/Q==
X-Gm-Message-State: AOAM530PkXx5kgLxv0Ef0KeDKW6nzYPXD6dg0MiowZdC7F/WM/cVE51q
 DqjgBUzoSsMFANNLAEn/l3z2Gbt6IkTVAg==
X-Google-Smtp-Source: ABdhPJy62hrKm0Opsibnj0qTOS8+URi3cSwncZvHn05vkeU6wVyxwYHDIJHajWn9xWyAhd5Xk3c32w==
X-Received: by 2002:aca:5653:: with SMTP id k80mr3607428oib.0.1607619739938;
 Thu, 10 Dec 2020 09:02:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id o21sm1195845otj.1.2020.12.10.09.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:02:19 -0800 (PST)
Date: Thu, 10 Dec 2020 11:02:17 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] remoteproc/mediatek: change MT8192 CFG register base
Message-ID: <X9JUmRarnxPaXtrZ@builder.lan>
References: <20201210054109.587795-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210054109.587795-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_120222_079756_184A0FA7 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: ohad@wizery.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed 09 Dec 23:41 CST 2020, Tzung-Bi Shih wrote:

> The correct MT8192 CFG register base is 0x20000 off.  Changes the
> registers accordingly.
> 
> Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

I presume there's an associated DT change with this?

I'm okay with taking this, but would like to have Matthias ack on the
fact that we're breaking backwards compatibility with older DTS.

(Or I could ack this and Matthias can take it together with the DT
change, to reduce the breakage gap in the git history?)

Regards,
Bjorn

> ---
>  drivers/remoteproc/mtk_common.h | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index b3397d327786..fb022ff93dc1 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -32,22 +32,22 @@
>  #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
>  #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
>  
> -#define MT8192_L2TCM_SRAM_PD_0		0x210C0
> -#define MT8192_L2TCM_SRAM_PD_1		0x210C4
> -#define MT8192_L2TCM_SRAM_PD_2		0x210C8
> -#define MT8192_L1TCM_SRAM_PDN		0x2102C
> -#define MT8192_CPU0_SRAM_PD		0x21080
> -
> -#define MT8192_SCP2APMCU_IPC_SET	0x24080
> -#define MT8192_SCP2APMCU_IPC_CLR	0x24084
> +#define MT8192_L2TCM_SRAM_PD_0		0x10C0
> +#define MT8192_L2TCM_SRAM_PD_1		0x10C4
> +#define MT8192_L2TCM_SRAM_PD_2		0x10C8
> +#define MT8192_L1TCM_SRAM_PDN		0x102C
> +#define MT8192_CPU0_SRAM_PD		0x1080
> +
> +#define MT8192_SCP2APMCU_IPC_SET	0x4080
> +#define MT8192_SCP2APMCU_IPC_CLR	0x4084
>  #define MT8192_SCP_IPC_INT_BIT		BIT(0)
> -#define MT8192_SCP2SPM_IPC_CLR		0x24094
> -#define MT8192_GIPC_IN_SET		0x24098
> +#define MT8192_SCP2SPM_IPC_CLR		0x4094
> +#define MT8192_GIPC_IN_SET		0x4098
>  #define MT8192_HOST_IPC_INT_BIT		BIT(0)
>  
> -#define MT8192_CORE0_SW_RSTN_CLR	0x30000
> -#define MT8192_CORE0_SW_RSTN_SET	0x30004
> -#define MT8192_CORE0_WDT_CFG		0x30034
> +#define MT8192_CORE0_SW_RSTN_CLR	0x10000
> +#define MT8192_CORE0_SW_RSTN_SET	0x10004
> +#define MT8192_CORE0_WDT_CFG		0x10034
>  
>  #define SCP_FW_VER_LEN			32
>  #define SCP_SHARE_BUFFER_SIZE		288
> -- 
> 2.29.2.576.ga3fc446d84-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
