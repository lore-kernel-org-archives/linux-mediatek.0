Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADD6C2D0E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 08:29:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FA772078D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 08:29:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ng/hdkAy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gzvat5xv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FA772078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uka5HGoe96Nf6KUNltkah+zFkHd6fCpY37S/fEJzoBw=; b=Ng/hdkAybElH9fGp2FKibi41j
	B7RrjlfTcx2lxGGNMpM6wAiWOSNKWg8AJ6uqaIkpaSIbL5p+rfHWzH0Q8rO9KXxPZEJ3Vd0+ZjsGW
	NxeZYidwW8EqUZf6a3VNlIPshSRTUw7efVHv75BT/bTEX3w4xWkQoiMA0sqWtp3tLk47YYrGFH1mk
	hoICz0CS7o5XhHfRLG+dM9/brmjK2jXraGzryLLplICSfWWd7af+sdqR4LkCr5jPXUPbVB7XZCgWF
	hKqAYKDL/iNtgWITkR7oarxKPKFR9JONtsyUoT5LHcz8XUW+3xr6abpwnLd7Xbxb6CHjbyaLwCp6s
	0i6RXzR4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI6Kh-00086B-Hl; Tue, 15 Sep 2020 08:28:59 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI6Ke-00084p-7I
 for linux-mediatek@lists.infradead.org; Tue, 15 Sep 2020 08:28:57 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id y190so1447178vsy.1
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2020 01:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u6BjYQLaAwV26Mi2vh+LML/U8Q9Whk76Cx/0/rrw3U0=;
 b=gzvat5xvmuyXYfMhmMKwSfytbSLfCrn7HB51Hptx+u23fZcnFwGU9aBnQw9dMNvjO6
 hni+S4JTYL1xeDxowckQFpaHuuNP0dyACRXJBfSHORgyHdlOe3cX0THvrQZC3Hw9N6+z
 Z7hjqAzrKstAZxnKJCMnUoBwqc7um0deLh9ocwU2aMcnEAbuEFyJ1AeYTrbD9HLcUoCr
 GTGplSxThusbFvMQp6h8aDPeKN1p0Cpjl01cP/kyNTsbA8PbX0okuAhv9eSWuzjNvz1m
 uOxIwaLjW4nQ0FW8ia5x6bavZAKeJ6ShRDj+QU0yKfkYftHMoJasrMHDBs2hphvF4OT/
 VfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u6BjYQLaAwV26Mi2vh+LML/U8Q9Whk76Cx/0/rrw3U0=;
 b=UjkRFMy20cvDlYfkteYg+QhF1EKjxEMWS/wc7PyRnI6wiRBobIBH4NegDMKjf7QVoE
 HPh60I6kWJ24da5SMzzxs0/1X4zBS4TZxq8N79A+9lIURr9QTUYm6pvxExeC7+DJXM+L
 5VFR03c3otAhrJybLyaYI8OgwGi0Fjp+TOOXoCVtEXywDvtKubNBZwh2cBLX8z6yEhRD
 T4l3/NfNcUGto8WDrFbDb3RO/j6Ddcn4p71TYVxEyA3CIf7Dx6w4gzbKttT7E0XBfv3G
 aZN8LitXavkfpm3E1K1Y2gQUVaT0eWoyIWzuBq92Gt+bE4/XWqHuDi9Aj6tRUSwYRN9f
 S6pQ==
X-Gm-Message-State: AOAM531eeiZHStTVtgGBGziS0o5wxz+yYIal27eUOL85OiVd6dV6hzri
 WxLvMNReB40Ch9UkhTemJyxioB4VPqmM4xDp+3hWEg==
X-Google-Smtp-Source: ABdhPJySeYdpF5S+wZ0ekph6d6N8fb5D/jkEqVNTRLa/wzfrhZMiJMLds6ZCRrZRSUVqxtY6ZFD3JGm2s+sfXSsU8d0=
X-Received: by 2002:a67:d011:: with SMTP id r17mr418947vsi.48.1600158532082;
 Tue, 15 Sep 2020 01:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200915061110.25833-1-wenbin.mei@mediatek.com>
 <20200915061110.25833-2-wenbin.mei@mediatek.com>
In-Reply-To: <20200915061110.25833-2-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Sep 2020 10:28:15 +0200
Message-ID: <CAPDyKFpYAmhZXin7Lms9ymc2aXNY9UKyxYvW5PPZUqET2jBZOg@mail.gmail.com>
Subject: Re: [RESEND 1/3] mmc: dt-bindings: add support for MT8192 SoC
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_042856_403104_C8401545 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 at 08:13, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> MT8192 mmc host ip is compatible with MT8183.
> Add support for this.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>

Before we continue to extend the current DT bindings, can you please
convert from the legacy text based format to the yaml format. Then,
please add the new properties for MT8183 on top.

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> index 26a8f320a156..6422ad7d439d 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> @@ -10,7 +10,7 @@ Required properties:
>  - compatible: value should be either of the following.
>         "mediatek,mt8135-mmc": for mmc host ip compatible with mt8135
>         "mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
> -       "mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
> +       "mediatek,mt8192-mmc", "mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
>         "mediatek,mt8516-mmc": for mmc host ip compatible with mt8516
>         "mediatek,mt6779-mmc": for mmc host ip compatible with mt6779
>         "mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
> @@ -27,6 +27,10 @@ Required properties:
>         "hclk" - HCLK which used for host (required)
>         "source_cg" - independent source clock gate (required for MT2712)
>         "bus_clk" - bus clock used for internal register access (required for MT2712 MSDC0/3)
> +       "sys_cg" - msdc subsys clock gate (required for MT8192)
> +       "pclk_cg" - peripheral bus clock gate (required for MT8192)
> +       "axi_cg" - AXI bus clock gate (required for MT8192)
> +       "ahb_cg" - AHB bus clock gate (required for MT8192)
>  - pinctrl-names: should be "default", "state_uhs"
>  - pinctrl-0: should contain default/high speed pin ctrl
>  - pinctrl-1: should contain uhs mode pin ctrl
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
