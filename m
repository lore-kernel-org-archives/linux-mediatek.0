Return-Path: <SRS0=zmqO=NU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987A0C432BE
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Aug 2021 18:27:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB1460F23
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Aug 2021 18:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BB1460F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOcf3EXmI6vRXjfvDC7jqzf2WOCz9omUxxV6jhkgLPQ=; b=lrv8CF8H4Z1sPI
	aUyPSmKCqFvxj+Nm996g+Um+3LXB84eFDxEsbfHiCqaJ4QxMM/sff5AQ9FVOUWun8X4cb6B4+c1MU
	PF2xoC61oAVZrKktU1RHbTRxOB8cO10g0XdzqsojPXMaoD/FZr6R7JhxjsOxSYyDQPPnrrqzY7CWj
	0UKHD+jclTNDMd1JNZdaR3xSXOwF8GYs6m1oH0MaX50OlKwvdeG51BZHu25GU1/X8Oh5RThMijS5l
	Pbne8rJERDNNR6BYjDDpuCRc8VK1jRHK/kNWwoEa73U1Ps0bxsDiZk5dPgUvL/RqMtTNKGqtqGFOG
	HLIiMnKdm9u6f/cnghsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKPWK-00Fsza-8y; Sun, 29 Aug 2021 18:27:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKPVu-00Fsnw-So; Sun, 29 Aug 2021 18:26:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F91460F3A;
 Sun, 29 Aug 2021 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630261598;
 bh=nKCTcBqz5WPjxEtG2krSvcfWV1osO03SdX1Dref/wBc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gRNqnt/A1jEsAGOH5jlXpYyRf1qdZjXZ5zzARBSi99TYNUqCr2PEslLuEV3SEiU7y
 VFPFY+LKrobIP+cGTAX/rqVD+qePRS43myF95JCJtV4b89qXjiYBewo3l4RkDR0G5z
 mgYUFR93yNAMuBHsyADW+Kubp0jDkQg/uaf2GtVfbbCSPiNadoyP+3sP0Aq0VwUH2B
 XqJAxHBxvEly9U48O/SL4nhFvw56dzqnC2C0w2/8FSy1mDaRj0w8Z9/6lKSUfViPeX
 VmDEs4FMjC9/Qce6vGvc3a7v3pzwgrxIbwnaGYqGz1+wcU14HPh5WbLorAXVuZbm/I
 C8rZufk6WKttQ==
MIME-Version: 1.0
In-Reply-To: <20210820111504.350-7-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-7-chun-jie.chen@mediatek.com>
Subject: Re: [v2 06/24] clk: mediatek: Add MT8195 apmixedsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Sun, 29 Aug 2021 11:26:36 -0700
Message-ID: <163026159693.2676726.8564637566834797534@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_112639_044158_551E95BB 
X-CRM114-Status: GOOD (  12.64  )
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

Quoting Chun-Jie Chen (2021-08-20 04:14:46)
> Add MT8195 apmixedsys clock controller which provides Plls
> generated from SoC 26m and ssusb clock gate control.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig                 |   8 +
>  drivers/clk/mediatek/Makefile                |   1 +
>  drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 145 +++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 576babd86f98..7ba1f4118e0d 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -580,6 +580,14 @@ config COMMON_CLK_MT8192_VENCSYS
>         help
>           This driver supports MediaTek MT8192 vencsys clocks.
>  
> +config COMMON_CLK_MT8195
> +        bool "Clock driver for MediaTek MT8195"
> +        depends on ARM64 || COMPILE_TEST
> +        select COMMON_CLK_MEDIATEK
> +        default ARM64

Please no. The default should presumably be ARCH_MEDIATEK, or just
nothing at all.

> +        help
> +          This driver supports MediaTek MT8195 basic clocks.
> +
>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
