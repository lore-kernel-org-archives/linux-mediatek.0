Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F8EC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:22:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BBB1613A7
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BBB1613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+o3so+Qc7JJ0ImUJ5R74Fgmi+InCtL7WQbQKtZ95tE=; b=aV56HMhaw/LsjD
	qx3K0n0YY3Te4FecA1voNQ0poJxKvxuspbse8KfqlvrPPEQWfo5gjbqCw6MeTklFUUxBTdYA0Ibro
	oMg5qFzVUZOR3qqAMcOc0hkyDnr21EBen/M5NANcfB97aTq4CfEdv70zZLCRepVt1XaUSqYKxGB5o
	zorCeP3E5F4YpUA6c2/CToxNHqpbDwQQxeY2ow9Ys5WR6z1f7uezjkCSuwkxAfZlJo5psIvQwsjEO
	FHEvUR/KqurGxaEknaF2rDB2ki4ZP4+hzYQJst75qrsK3UFKOo/HAP/qRFNhr2rEtWfpUKcn4Mhsa
	aP/thXKbvJsSzzqaK5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI8yN-00Gkhi-8U; Mon, 23 Aug 2021 12:22:39 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI8xz-00GkZL-TE
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:22:19 +0000
Received: by mail-lf1-x129.google.com with SMTP id p38so37620035lfa.0
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pc12zDw8HcYKb0baS7+gSB5w4I/LyyBVqE2pxnJzv8s=;
 b=kX3AskkyzPKb03HvUEmuGI9gh4CNya94lDJ22/YV9n7LSxvdZ5BI3MdTs5iqJV5pnM
 o4yyRUYje7OVexrfH1pDJQqobRchfSZ3nvXQWBxVucSaCcG9OahIUluKY/qONVy8QFzB
 R6v1jrIOx5y6/DX9OSvDV/MrWYzj1tP/cs5/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pc12zDw8HcYKb0baS7+gSB5w4I/LyyBVqE2pxnJzv8s=;
 b=NfxAtZ6fS0Cm9ltVgyXCivG07/SW2KtUeuAyypmh6Bp5mQyTRGhEMCdm/4YBDpq7++
 IPgq06mkHNZjHVZrdo/hd0vKdYES2hhctecEL+lIHCOxD1K9MVyalWOEe9O0rEHxQxoj
 dj44kQoYfcsBBj1ds6ZkAPoZvuNX6wxskpvT5/8vw71LIxVrpOfDX+vLMj+yLJwy3NI4
 T+9NbFqtNQ3JoSwP5rNwhlpgmwShh9pCUJqpSdKrnyfpkuY06TjbJyp71Sv3XHKSP/gq
 ZM593VyMfiPlqU+tTINXQ6MGQCHQOxeALuRtZHZLU3GG1/RdiJfwVjbEDqEbBK3s75yU
 H6XA==
X-Gm-Message-State: AOAM5320yDwaaAdbYdL+DA00/STDnBgr3FGUyh6rGwYs2ZlcCkmQRgg6
 CB6Fzot1vrWuYkVJYj8vaFw2FbRKsQ1DmbnkAQH/BA==
X-Google-Smtp-Source: ABdhPJx1FKfj17h2z7cPtACyH3OONTpQ2GGSY9YpNwF75edIYpH95oAYMUAh5Qab+UPPELdq1wRLFzXO5IVlm+50bBk=
X-Received: by 2002:ac2:5e8f:: with SMTP id b15mr22656456lfq.656.1629721324078; 
 Mon, 23 Aug 2021 05:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-17-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-17-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 20:21:53 +0800
Message-ID: <CAGXv+5HGjd4tQ4rg11VmQYOzUxkSrGStV8vS7kXkKWS1N4nM3Q@mail.gmail.com>
Subject: Re: [v2 16/24] clk: mediatek: Add MT8195 vdecsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_052215_992282_4B0BA56D 
X-CRM114-Status: GOOD (  12.91  )
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

On Fri, Aug 20, 2021 at 7:28 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdec clock controllers which provide clock gate
> control for video decoder.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile          |   3 +-
>  drivers/clk/mediatek/clk-mt8195-vdec.c | 104 +++++++++++++++++++++++++
>  2 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-vdec.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 472e5bc40fcb..ac269f6d39e3 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
> -                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o
> +                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
> +                                       clk-mt8195-vdec.o

Apart from the line wrapping,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
