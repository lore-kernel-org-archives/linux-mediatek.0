Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DDEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:14:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E775B6137B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E775B6137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqQSwVMj3BQHk42XoVsmKorv2zkWt6k51romTtIEs4o=; b=FI+6nDWRHVEY5T
	M/Qm7oMl6GTCVwHL9c0S8RGzE603mxnmJXm1rp2ufr4SU0lnjavCkKdPcapPMLFp91PuF2A/3P4RZ
	KSSAHoDLck/85ezZ493CFawM/l/2JyUCD0FgUYCVV0LGhGWEA/h0YwL4+5bGJlSFRy97CxWGbl6XY
	UmVN3DSqV4j8DW9obOBi15c9iOCBUSLeCXg00bUdE/HhSWngxDWHEoVvRcQAxqctNMgZcq7OsefCL
	jz6uWZx3G6sx8mJjpTVqbD7/+3s7SazNH+I7AEqYn6ZO1Q8aqT0o4LFV/nw8Sq9fLooGVz9bvnks6
	bt7T1vF46Cey20VgGB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI8qZ-00Gia4-1J; Mon, 23 Aug 2021 12:14:35 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI8qJ-00GiTt-7U
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:14:23 +0000
Received: by mail-lf1-x131.google.com with SMTP id j4so2591971lfg.9
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 05:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eVtZNqos1Uj8nVU7A68cFH5SksBGPlDtgJ1wjTiX97U=;
 b=RhqJDGeOtqUx7Razl8VfrpFJnXXewY+c6hqjK5nNkefvqqjvEaQoYZxF0bodUfAEuQ
 RNYypGJdSGrTiAm07z/iI68GyQtYiGIsmq5DVyq+Yt/dRY8PsDOufqsZdOsHTKN96iYL
 1NCvNjcs0Ws6E5UXLCj0RB9rI1YNhwb9TXNc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eVtZNqos1Uj8nVU7A68cFH5SksBGPlDtgJ1wjTiX97U=;
 b=HrTDOX6TK4/eEQ+sUg5MpaWHqotBvh+RGmZE1mWMT5NXiQ1LPvxm/T9Ed2GX/lYUG3
 FVOEKzaiqyF3ojfuANRy8S/vEcZJIWKRBB+1D1jqSDwX2mC2kfO5AibHFItGulJVpYKc
 nAA7FNGukWCqJ8+dtG5rhKEjCSVUs3aI9rJkbf0oq/39zeqWRwtthj+yPJQotez5JCkz
 jSOZeoSrk+31W8C/WeRBzJmUthfyfRy87iw9CcqOidx6qktiVHQtB7rZRvarup3neERE
 wFBDnxIUWA9WjZrxQ+UoFfuKMcw7NYVLobJAlcOhNNIbzozly00/b0eTsXzaAF2NphJF
 P2hA==
X-Gm-Message-State: AOAM5318KADYWZYqx2q3LFtbDtV38/cbYn84cfWxsynddgDhuOQw6yLe
 f99noRMqqoYSYJnk+/s27a9sOiLYvqPZMq8wExXV4Q==
X-Google-Smtp-Source: ABdhPJwrlfSQYMdqbYrEgwxn7wBOO+2G6mAsp2Jq0PdZ+FDkTRSbUkreb53Sw0fdjMpceYj13dgvGxu/2HRe+7mlXHQ=
X-Received: by 2002:a05:6512:ac7:: with SMTP id
 n7mr25121383lfu.479.1629720847844; 
 Mon, 23 Aug 2021 05:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-12-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-12-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 20:13:56 +0800
Message-ID: <CAGXv+5EMoZq8BohUA_OoChmEdHL988pphxUJX077hO88htRUtA@mail.gmail.com>
Subject: Re: [v2 11/24] clk: mediatek: Add MT8195 ccusys clock support
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
X-CRM114-CacheID: sfid-20210823_051419_301485_C19D3E9A 
X-CRM114-Status: GOOD (  14.15  )
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

On Fri, Aug 20, 2021 at 7:23 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 ccusys clock controller which provides clock gate
> control in Camera Computing Unit.

Could you offer a bit more explanation about this unit? Is it an ISP?
Or some other function that does computation on images?

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/mediatek/Makefile         |  3 +-
>  drivers/clk/mediatek/clk-mt8195-ccu.c | 50 +++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-ccu.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 718bbb04191b..03fb020834f3 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -80,6 +80,7 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
> -obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o
> +obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
> +                                       clk-mt8195-ccu.o

When wrapping, please align with previous line. "clk-mt8195-ccu.o" should
align with "clk-mt8195-apmixedsys.o".


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
