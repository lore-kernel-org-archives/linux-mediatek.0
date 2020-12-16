Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99544C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 12:29:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C77C23124
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 12:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C77C23124
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k/kMuQPgYTucG413Uyx9XY82Mm5+HT8ajvVpCUNCtgs=; b=xugllgj1DbOBYzHPEPtOg1isM
	6KT4Olsplb6Zptp6rHwOhoKzZsFbH/CkvDnArbbWUTWbINaIefbFmIbduEsgln4WY7iZiVEQcfUv0
	nHpmrLlXaA2gpntwzHE7NZaDkRxMyujTnQ4kpy+fYKTfvkYX64MNigKV6T5nIadt4csKx1Ee2aQbF
	luvi198KRzGgF9kYIb0kQ9EWkFQrJscomMgDU27O2PkzOqAJFuyMRMhLG1k+dATR1tIj7jtZLHk2/
	vwe0qC9sEYJNC89kVlpT8cD6+A3SnpI2EIJzC3ZbXs75H7InJOZxpeTpa4jpr9RlPnXU40Bh5+5uY
	s0PEPG2Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpVvM-0004jn-PH; Wed, 16 Dec 2020 12:28:56 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpVvJ-0004g7-H0
 for linux-mediatek@lists.infradead.org; Wed, 16 Dec 2020 12:28:54 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id u67so5606671vkb.5
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Dec 2020 04:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6pRvGHHMJqQbOIzkgWlEFS44+L0AY9CH1Qe7UGJ3u4=;
 b=odqmNK1hqN0cRlLeW7sn5pdXMShIK5Q/F49grfeu5fecHGIW3d2eANmZhNWdRfbOaG
 mF3Q2QJPWg+GEjMfy2yYUX2i3c19AhTygkQ+TyEGVuiGA7tVCzscJPfVfaLX16twNC6n
 +6u1ZvFmWnXBd4PhPlIy3gmzOoGNoq+s81aIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6pRvGHHMJqQbOIzkgWlEFS44+L0AY9CH1Qe7UGJ3u4=;
 b=pZG3TERRjnhl8kZwlV60Hv/Nh6FSKIrjPbYf7qNrNLTOA/cDb18OR8NJDyVOHGv9S6
 0DmHhEsO2hDmgHItTQINJgdNbbt/LVMNyJbz7daTUNjvtVXYrXty3CWe7Oxr4ZQL7d5i
 e/zMLKMCHEjHaUyGUI4K02hjv+6en3tXw2m2I5Oy/gY+2YMkX1+kwsNoDoptTUGDNkq5
 DS8EbDGsvfq14mJSyhze6YSrU+LVpgZ9zoo+0mzdB9wTCthEpl3PLVJNH40wnYSUOJOS
 0sl6zmy/sGNilI/kQTIgeZw/s99beosuRFCazmzvM9EQFmu+rTvQl6eD3k3tVNE3Qepx
 yFyg==
X-Gm-Message-State: AOAM5317up+yOpZQX8nqHwd08yOkF1+Wy/xOLj+IitA7lCWOfay0sQaZ
 xUjxT8hnEZcyAp6CDFlPMgfb74+aEspNQcuSxGBYBg==
X-Google-Smtp-Source: ABdhPJzlzIMkwB4MfwB+J+NG9epApgDDwgd0osNlLW2n3EV6nng8DOUfvGywX0ToxV0slELC4gu/RwcT3blVqy36deU=
X-Received: by 2002:a1f:96cd:: with SMTP id y196mr33980353vkd.18.1608121728276; 
 Wed, 16 Dec 2020 04:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20201216115125.5886-1-chunfeng.yun@mediatek.com>
 <20201216115125.5886-2-chunfeng.yun@mediatek.com>
In-Reply-To: <20201216115125.5886-2-chunfeng.yun@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 16 Dec 2020 20:28:37 +0800
Message-ID: <CANMq1KDBmuoBNeizm9+f1yJgqF9oMqU5k26KfZrSdjrPQm_LwA@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: xhci-mtk: fix UAS issue by XHCI_BROKEN_STREAMS
 quirk
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_072853_678755_1BE05143 
X-CRM114-Status: GOOD (  21.46  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 7:53 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> The 0.96 xHCI controller on some platforms does not support
> bulk stream even HCCPARAMS says supporting, due to MaxPSASize
> is set a non-zero default value by mistake, here use
> XHCI_BROKEN_STREAMS quirk to fix it.
>
> Fixes: 94a631d91ad3 ("usb: xhci-mtk: check hcc_params after adding primary hcd")
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk.c | 7 ++++++-
>  drivers/usb/host/xhci-mtk.h | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 8f321f39ab96..08dab974d847 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -395,6 +395,9 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
>         xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
>         if (mtk->lpm_support)
>                 xhci->quirks |= XHCI_LPM_SUPPORT;
> +
> +       if (mtk->broken_streams)
> +               xhci->quirks |= XHCI_BROKEN_STREAMS;
>  }
>
>  /* called during probe() after chip reset completes */
> @@ -460,6 +463,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>                 return ret;
>
>         mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
> +       mtk->broken_streams =
> +               of_property_read_bool(node, "mediatek,broken_streams_quirk");

Would it be better to add a data field to struct of_device_id
mtk_xhci_of_match, and enable this quirk on mediatek,mt8173-xhci only?

(IMHO usb3-lpm-capable detection should also be done in the same way)

Thanks,

>         /* optional property, ignore the error if it does not exist */
>         of_property_read_u32(node, "mediatek,u3p-dis-msk",
>                              &mtk->u3p_dis_msk);
> @@ -546,7 +551,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>         if (ret)
>                 goto put_usb3_hcd;
>
> -       if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
> +       if (!mtk->broken_streams && HCC_MAX_PSA(xhci->hcc_params) >= 4)
>                 xhci->shared_hcd->can_do_streams = 1;
>
>         ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> index a93cfe817904..86aa4978915e 100644
> --- a/drivers/usb/host/xhci-mtk.h
> +++ b/drivers/usb/host/xhci-mtk.h
> @@ -147,6 +147,7 @@ struct xhci_hcd_mtk {
>         struct phy **phys;
>         int num_phys;
>         bool lpm_support;
> +       bool broken_streams;
>         /* usb remote wakeup */
>         bool uwk_en;
>         struct regmap *uwk;
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
