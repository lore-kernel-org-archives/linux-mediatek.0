Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFC1C33CAB
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 06:20:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F13B20678
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 06:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t31796eE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WxS0Vug8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F13B20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfIeyOP+57dUuIW53fCZjL/OtHdfFr7mz1mcOSO3eX8=; b=t31796eEzh6Iu4
	yms4LqFG8kAP3tv0fFU8smj7NwRJ2TvBqAKJ545rn9P00TxpnegSgeQnxkXfplLAHf+qq7R0RFJPU
	U193RBuJPV3S9HUkJqKaj2RBC//mbgfb1IPK+UJ8knYz49BzpWrAht22yvhANZ8Kx/vs4VQuJnSlj
	sQcqAXJUqeaUzWNwqchTNURw+1pTjO+jzbGWTMhHzSpeN8q2iMgcZfz/R/FZrWaN2cpYfjfeGXuQt
	5CIgZpeJeWb5FDCxu28bFAs8rJFrjghACHDEbFBZCFctIqlNo6WIDJ/Dbm1oQC+n7cxfStpGE7fpb
	UuCdwg+fgOLzli8o/VgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqt5g-0004z7-H6; Mon, 13 Jan 2020 06:20:44 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqt5e-0004yD-4j
 for linux-mediatek@lists.infradead.org; Mon, 13 Jan 2020 06:20:43 +0000
Received: by mail-qk1-x744.google.com with SMTP id c16so7525892qko.6
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jan 2020 22:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rbidIxb647dakpGFJlRyQ3/ihwOOmZc8NjZm9uAOe7Y=;
 b=WxS0Vug8xhyLR97I/t2SZL6RKMcPSykb1/Bq9crc1+OYZoBfukLaCJ9Tc9EkP/uu4X
 Z/um91CPIbStVhvRelpbdaq1iHMzd7+XSjtZ8VepD8xsTX0rMGUdOyTvMt7hl6oHtKMp
 1B6kNdZiMwE4Ii6DDhLJyCHRDlv0pDydLfxB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbidIxb647dakpGFJlRyQ3/ihwOOmZc8NjZm9uAOe7Y=;
 b=UeoKJtQVCfa0V8+4MIFwvs0zTVbJHj5KBPUhLQKaedp8UMhzBCigGc0rO3ZDpICqUm
 kqJ7JXjLSMKJ3GEcpVJACKq+0iM+RRb05p5MNN2ifrkknRjHchkFYDlQ0GVlHqzHclAF
 TH9AS7zCPdciod3qOFcczRAss/8VHzF1CcVOB7KvQf2+4xpuAoXrt5NXJmSPYlnQSR01
 cXCyHc93+1w7rClXRp9LwT3od5K41bOY5paRmtJ7nOeUaNQGjCezDiugcl0JhuzeFZKV
 c9ne9Gu15ouqcvHKaKBuYZaBSD9vDaSurFo+CZ2aDX1gW361yyHW5D7oj0QOLHmuk5Ze
 ud3w==
X-Gm-Message-State: APjAAAXRep1wUzBRf+5xtU9xW54Rkn9Tn0rh8EFs7uHFso9NLlYjmD5y
 a6fF9OFrTINJPUdyjEye0wsicn0U4n42yygOAnprpw==
X-Google-Smtp-Source: APXvYqyg+DfzeIRu42KEs7ygYGGHEH4ohvCGoNjEgPqdFrdCkhfaR1L7mh+JsDSUmfVNYFE5Ptt8z7b4B+RTP5IqduA=
X-Received: by 2002:a05:620a:6d7:: with SMTP id
 23mr14062530qky.299.1578896440489; 
 Sun, 12 Jan 2020 22:20:40 -0800 (PST)
MIME-Version: 1.0
References: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578639862-14480-4-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1578639862-14480-4-git-send-email-jiaxin.yu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jan 2020 14:20:29 +0800
Message-ID: <CANMq1KBxL55A8vDwNsqNpDmdNUxkpJ+JPByDaTEFwxnPQM8ESw@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] watchdog: mtk_wdt: mt2712: Add reset controller
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_222042_184275_10755364 
X-CRM114-Status: GOOD (  15.39  )
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
 Yong Liang <yong.liang@mediatek.com>, freddy.hsin@mediatek.com,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, chang-an.chen@mediatek.com,
 wim@linux-watchdog.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 10, 2020 at 3:04 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add reset controller for 2712.
> Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.
>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

This is somewhat ok I guess, as Philipp review the same code before
you split it into 2 patches.

> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guenter Roeck <groeck7@gmail.com>

Those 2 need to be dropped.

> ---
>  drivers/watchdog/mtk_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index e88aacb0404d..d6a6393f609d 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,6 +9,7 @@
>   * Based on sunxi_wdt.c
>   */
>
> +#include <dt-bindings/reset-controller/mt2712-resets.h>
>  #include <dt-bindings/reset-controller/mt8183-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -67,6 +68,10 @@ struct mtk_wdt_data {
>         int toprgu_sw_rst_num;
>  };
>
> +static const struct mtk_wdt_data mt2712_data = {
> +       .toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> +};
> +
>  static const struct mtk_wdt_data mt8183_data = {
>         .toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>  };
> @@ -314,6 +319,7 @@ static int mtk_wdt_resume(struct device *dev)
>  #endif
>
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
> +       { .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>         { .compatible = "mediatek,mt6589-wdt" },
>         { .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>         { /* sentinel */ }
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
