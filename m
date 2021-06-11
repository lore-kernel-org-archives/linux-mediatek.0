Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F96C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 21:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4908C61285
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 21:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4908C61285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JumJlvM1jJCVq9e2bizhpx4Ly3QWEP/KbZVgHv3FeEE=; b=ohSAKvbgLIE+Xq
	Jx5Gzma3Yl0yEk6c+Lxl1m0HofSxzAT7sRQjdEXNv5GgPIWbYfXOP4uiyFs0zIdRNlUhqb15EcNp9
	qhkG5xi3nekCj2MYvacGSC5bpbJmRVevOTVS7nFuKP+awPaDht87luUB3izB23bJk1d/vZFfjKzbp
	JlV2cus8NydfNoSo+OWzifK9FnGbOKezABVcP7P/Su3sfikCzLgDb+kw9YGQD5FHh9KD6A+fpszPj
	Zu6CpTaswvT4Rnf6Lnf1Zj+CHvJPJElCWKE013ZjtegyQuh0HSrhaTpuBfsBGv7624eTwt6h6MMmz
	5SEvw/asYfSFEeFgxqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lroIu-0077Bb-OV; Fri, 11 Jun 2021 21:03:00 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrnvQ-006wyc-PL; Fri, 11 Jun 2021 20:38:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso6646693pjp.2; 
 Fri, 11 Jun 2021 13:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9KuDiR0/afvizS4hj5Loo8cboTWM7MdUw0YpF4dlIWg=;
 b=e4OQoZbapGBsd95gfs4ae/RGRxzuezrU1OD20VjNZ+lKu4GxF+x99x2e53E8snHBK6
 ig/LOzry5seJ8nfXzMZIMt7/EQjtmm3CWfQgDbkg72fk5BZrzApvbOnZpgPGTB1NpIfv
 uXVHas6DXCpm9VXaajj7YO/CP70/8LkJRmN9HOSmQWN8m4j0RAa19Zz8Sndpke/Rh6n9
 uf7z8L7fC2NgMlioRgSfs/78sHpJBjUqgBajwR1JDFXP1bfDbSl5qGEMbtT4cLBq2Lkt
 90Tqa6Oadb2agJvehPwbyGu1EmgwOZ4s5gnAAUQrczA0CsZq5A7ku/Rt7FHSP3M1Dfmy
 Zsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9KuDiR0/afvizS4hj5Loo8cboTWM7MdUw0YpF4dlIWg=;
 b=ZuB4liRMvLzwSHVt7KU3ebefNZGnefo83KakchsZMOz2XyyGGXR7ROM2pYCzxywO3C
 IhHcNrhC41+LcLvDK1qCXgI095CPUL9FwNAAMg7weBObPt0aaee1dphOfR6JIvvjX6XV
 FQPTflf3z/lNsf2whoUMzmgaQqPPJt56w0ebRhJsBHiaGwLl/3kzo2b60H4ifq4HuowE
 571vQPdIodpgBlHxZUqVh4wuX5gwqAOOrmSYgYhlIvr3YesFynX3mpGjQvmp30n4bfmh
 RNExukWcTkOzTHFZcgW5qn9/ecWR9B6g+pu9bohZnypH0+HPPDvl8eWa63tezIOugVde
 IxlA==
X-Gm-Message-State: AOAM532DQ+86FFkoRFS0otJzc22L9ftK3VJ1NPkX7LGXKh4qFGxu1XVz
 HISWjNsAae1Y/Trc6XgYnJY=
X-Google-Smtp-Source: ABdhPJxLceusjx4BsvK+pZ5JF8d1cmFw4KqrcEPZXtIyorMmdM28WNXXW5VjmcskR1gznU91dg5x+w==
X-Received: by 2002:a17:90a:8804:: with SMTP id
 s4mr6227626pjn.200.1623443922151; 
 Fri, 11 Jun 2021 13:38:42 -0700 (PDT)
Received: from localhost (g151.115-65-219.ppp.wakwak.ne.jp. [115.65.219.151])
 by smtp.gmail.com with ESMTPSA id
 i128sm5690754pfc.142.2021.06.11.13.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:38:41 -0700 (PDT)
Date: Sat, 12 Jun 2021 05:38:39 +0900
From: Stafford Horne <shorne@gmail.com>
To: trix@redhat.com
Cc: robh+dt@kernel.org, tsbogend@alpha.franken.de, jic23@kernel.org,
 lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, nbd@nbd.name,
 lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
 zhangqing@loongson.cn, jbhayana@google.com, sean.wang@mediatek.com,
 shayne.chen@mediatek.com, Soul.Huang@mediatek.com, gsomlo@gmail.com,
 pczarnecki@internships.antmicro.com, mholenko@antmicro.com,
 davidgow@google.com, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/7] drivers/soc/litex: fix spelling of SPDX tag
Message-ID: <YMPJPO9S9wiM5B23@antec>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-5-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610214438.3161140-5-trix@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_133844_869880_638D99B1 
X-CRM114-Status: GOOD (  14.53  )
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

On Thu, Jun 10, 2021 at 02:44:34PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> checkpatch looks for SPDX-License-Identifier.
> So change the '_' to '-'
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  drivers/soc/litex/Kconfig  | 2 +-
>  drivers/soc/litex/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/litex/Kconfig b/drivers/soc/litex/Kconfig
> index e7011d665b151..c03b1f816cc08 100644
> --- a/drivers/soc/litex/Kconfig
> +++ b/drivers/soc/litex/Kconfig
> @@ -1,4 +1,4 @@
> -# SPDX-License_Identifier: GPL-2.0
> +# SPDX-License-Identifier: GPL-2.0
>  
>  menu "Enable LiteX SoC Builder specific drivers"
>  
> diff --git a/drivers/soc/litex/Makefile b/drivers/soc/litex/Makefile
> index 98ff7325b1c07..aeae1f4165a70 100644
> --- a/drivers/soc/litex/Makefile
> +++ b/drivers/soc/litex/Makefile
> @@ -1,3 +1,3 @@
> -# SPDX-License_Identifier: GPL-2.0
> +# SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_LITEX_SOC_CONTROLLER)	+= litex_soc_ctrl.o
> -- 
> 2.26.3
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
