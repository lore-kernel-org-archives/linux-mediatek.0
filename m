Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E7C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 13:42:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875B3224B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 13:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 875B3224B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9alHByBKqa3s8e4I+ehyuNsTsJ6hlTYaZDZwWm64yHk=; b=LMWNmrbnIzM4+68LP1+fY+QfJ
	D4OQ77WQIzUypZZurZ7YC0iS7/G/qWaJTkW06GU+8GyT/i8O4/C7aVr7IQYUNkE7cQpA0mGJyKKxo
	zfwHCP2hxp25CrYTIW0R8hL8UFR+bAbMbzZCtAlxyrXxVtQ4NPTOgTfpxttNoB69dMzLrrkkJ3cAu
	pV0X1TlCinxv7BsXPQ49XrTstQFerB86KULp7AcwdhDIW9MWQ6A4/nyT8bot2+H9eTzMxHt2qxpQO
	PgSo7E+7Gfx1kaDPAkEjDMDioeZAQzPTQC+h5wj3ZumgufVCMhH2/tCAcFoiS9LrKXE4nbcvGYbXj
	XxwheixuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpAb7-0003S9-Ei; Tue, 15 Dec 2020 13:42:37 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpAb5-0003R1-34
 for linux-mediatek@lists.infradead.org; Tue, 15 Dec 2020 13:42:36 +0000
Received: by mail-vs1-xe43.google.com with SMTP id b23so10957303vsp.9
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Dec 2020 05:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WdtyYhINVIP0zj4hUblQtYm+d83mIC5y4bO6fsIgws4=;
 b=C/RgTTl9KMhfhdhqZl9UbJevCVbwaNYQgtvwTG+fXTyFmB6V2/sys/PtcEKz+1Oy4O
 p3GSJKsust/Icf+LPbYr3T+jLpXLVEF8rug3mXG2q9goAHNClsaujDImUyJFUlTwWR7q
 VtyutBiwjXkLgHwiW1N9bmLQtkEKT0weRm398=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WdtyYhINVIP0zj4hUblQtYm+d83mIC5y4bO6fsIgws4=;
 b=e3ULf/KTG7/uIPWiGQ5PhRdqY3kMgqginBnHECV6U7vn0ab/wfw5nQeaXRG9e/KbMq
 TTrXvOvk0TUXnCrcC9rR7j+pgDRTgQFl9ckHFZtuSmnZ4frHmSMVxMCZqm4n8xgvOYGW
 3Trmo6YubzT+HZ4qBf782cmBk0o/h0mP+/s1ghgz2POKPmnfN7QF4a3JVux8fr5ry6bV
 R1HWHWPMsGefrJ8lFGLCIo8SVqclkwTmNLqG7gWRt01PWeseWZnqQc3gwXIg4s62pSRA
 uPNOI73m03rfw4IpGCxiTl/UaM7c/WQBR+mbnqrxkwzb1+j92YiQUIWiXVYg/hMKD7cO
 gcAA==
X-Gm-Message-State: AOAM531zyXXn4bMM3SDtwxwWEZJy/FTaJF7nVeJVd2b0On0stfh0fSkF
 vULKm0um0WSktzGy68MTtEjkMkZusKpiza9tQpY6ag==
X-Google-Smtp-Source: ABdhPJxv7M8JgVQKp38gzV7gwW3jUYVRPuREIp84PvUJ8p1GCQQ6BumzGfT66kHqi5Xu7tZP47OxnxOJibawlusR1MI=
X-Received: by 2002:a67:ff03:: with SMTP id v3mr26709138vsp.48.1608039752973; 
 Tue, 15 Dec 2020 05:42:32 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-15-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-15-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 15 Dec 2020 21:42:22 +0800
Message-ID: <CANMq1KBu4Ft49CUgGMxYdsv6ymWzVWK+eNBhn1t+oEN0ZwP0YA@mail.gmail.com>
Subject: Re: [PATCH v2, 14/17] soc: mediatek: mmsys: Use function call for
 setting mmsys ovl mout register
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_084235_189646_37BF1CF0 
X-CRM114-Status: GOOD (  21.34  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 12, 2020 at 12:13 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> Use function call for setting mmsys ovl mout register
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 18 ++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h |  3 +++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> index cb76e64..2558b42 100644
> --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> @@ -78,6 +78,15 @@ void mtk_mmsys_ddp_connect(struct device *dev,
>                 reg = readl_relaxed(mmsys->regs + addr) | value;
>                 writel_relaxed(reg, mmsys->regs + addr);
>         }
> +
> +       if (!funcs->ovl_mout_en)
> +               return;
> +
> +       value = funcs->ovl_mout_en(cur, next, &addr);
> +       if (value) {
> +               reg = readl_relaxed(mmsys->regs + addr) | value;
> +               writel_relaxed(reg, mmsys->regs + addr);
> +       }

This is technically correct, but I'm afraid this may become and issue
later if we have another function like ovl_mout_en.

So maybe it's better to do:
if (funcs->ovl_mout_en) {
  value = funcs->ovl_mout_en(cur, next, &addr);
  ...
}

Or another option: Create a new function
static unsigned int mtk_mmsys_ovl_mout_en(...) {
   if (!funcs->ovl_mout_en)
      return 0;
}

and call that, following the same pattern as
mtk_mmsys_ddp_mout_en/mtk_mmsys_ddp_sel_in?

>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>
> @@ -103,6 +112,15 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>                 reg = readl_relaxed(mmsys->regs + addr) & ~value;
>                 writel_relaxed(reg, mmsys->regs + addr);
>         }
> +
> +       if (!funcs->ovl_mout_en)
> +               return;
> +
> +       value = funcs->ovl_mout_en(cur, next, &addr);
> +       if (value) {
> +               reg = readl_relaxed(mmsys->regs + addr) & ~value;
> +               writel_relaxed(reg, mmsys->regs + addr);
> +       }
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index aa4f60e..220203d 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -49,6 +49,9 @@ struct mtk_mmsys_conn_funcs {
>         u32 (*mout_en)(enum mtk_ddp_comp_id cur,
>                        enum mtk_ddp_comp_id next,
>                        unsigned int *addr);
> +       u32 (*ovl_mout_en)(enum mtk_ddp_comp_id cur,
> +                          enum mtk_ddp_comp_id next,
> +                          unsigned int *addr);
>         u32 (*sel_in)(enum mtk_ddp_comp_id cur,
>                       enum mtk_ddp_comp_id next,
>                       unsigned int *addr);
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
