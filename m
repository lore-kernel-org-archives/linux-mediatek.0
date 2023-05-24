Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F77BC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oso4v1E0bkWDfuZFGRWc8pQY1FBubFJsVEaGbMpS84k=; b=RUvaJEtmklGbMqU+61sHPcuru5
	vJINlo09sr0xUzi5frftSsPRxdzcBUTFLLS0vQNaHW+YYtK1l42H0Oq+aXB/lNt2XsaOYO/ub0X7y
	vx7YR1Eu4wk3X6ks5JjrxJLoMsBeSyepIGemNyBEHLQeLk5LuVZe0kGDJKhHoNCYHkwjkjghF3iCH
	QkSiTHIFafbhaNP8j0OJPuCM/r4LsWqiEmAaJ12HNNrwSE4jjtLVR74S3lZKPt+wbiGhGJnnFGahg
	4MPT2OKg9dv7CoR9gkxrGYvJzaXAhC0hCFBNuUQs6VHvtaJrVAOZboG0QGscyS8/T1xfdQSWA/W01
	evAzCUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oHD-00DXZg-08;
	Wed, 24 May 2023 13:11:39 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oH0-00DXS8-0F
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 13:11:27 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-55db055b412so88488587b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 06:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684933882; x=1687525882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oso4v1E0bkWDfuZFGRWc8pQY1FBubFJsVEaGbMpS84k=;
        b=Apaj5KDsXHrYKpPqQC4wT+FQzOj8DqWhEJZX9xCxaPJsp2jqKzPsDXRXg8F7SFc0g2
         LJ8kgR+31Wig8EpUQA38/eY6S2skw/bt6HFl6O1U2zauerZFWECwx/byD4KS9v/J/tj1
         +0Vbcmd6oAnsVQtqzT5zTfoLiMLO5Y1ihXZuRmUl1R57aCUBtuWiHOqf84g6zWIJa5Ax
         rcSjKLFL/PI2iktW5Ws8dbE55HWnIvvXtYPdpI86pli3OiQaBOpGi1zue9rWPUQ6urzV
         rJehoLTPlOTNvJUfCsYVgxxm5+uTLx8WctKuoYZebj3UXmDs6TywBX37LTf4HVSTVAew
         Aeag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684933882; x=1687525882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oso4v1E0bkWDfuZFGRWc8pQY1FBubFJsVEaGbMpS84k=;
        b=lwi3PQ2AmqWJvoS/92xEufaH9Am8L98aNS7LEZsuNiDmM0FRS89jrlo2QsJBRTsZ5q
         3FCp7tMJmlBQhG3KWDvZb+gOsDFokPck+0grpISfnyKhRKVVAmqmUZZGWpKbdBSQO9zy
         floXej/yDx1f5cEIKu3+dR3ce1CJQHY29mPuzjXfIiuRxnIjAvxDm4qmG6s+OheNgD6D
         81mJyJvNBNh6S08eWnbTrKEBgb/BuQPWMaZ5WfuctZdxNDdVKRXXoJr4Nr4CkDbYW9sD
         zk3EmDNPikklpc8Tc/7+2vc4iUzjkGhqe6S2tg/PPI4XJ4kOVMtmggUcchx487sx1U7Z
         2D2w==
X-Gm-Message-State: AC+VfDx7VBVtDX7X5OJQOhqmFdPr3RbWYxZEFwaUMiEoLC/donrqT/BD
	vbxk6z5aYnbIC53B4aGGwAQ9VP/QGjbQEO79ZLWWxg==
X-Google-Smtp-Source: ACHHUZ6bcKDs7Amsm5cCpd2ysnRqkResVkUy0BUfWRZFtHYtlv9QgDcmI01yi3hpqYLAG1pkAX3zEoSaS0pxpIYQtvA=
X-Received: by 2002:a0d:cb55:0:b0:54c:1716:b20 with SMTP id
 n82-20020a0dcb55000000b0054c17160b20mr18232628ywd.17.1684933881824; Wed, 24
 May 2023 06:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230510064434.1.I935404c5396e6bf952e99bb7ffb744c6f7fd430b@changeid>
In-Reply-To: <20230510064434.1.I935404c5396e6bf952e99bb7ffb744c6f7fd430b@changeid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 24 May 2023 15:10:46 +0200
Message-ID: <CAPDyKFoWoJLf8utGxv3RytkvVypaC0Qdo6OZUyfupfo822SA3g@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: Avoid ugly error message when SDIO wakeup
 IRQ isn't used
To: Douglas Anderson <dianders@chromium.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yong Mao <yong.mao@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_061126_118923_30A4AEF7 
X-CRM114-Status: GOOD (  20.43  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 10 May 2023 at 15:46, Douglas Anderson <dianders@chromium.org> wrote:
>
> When I boot a kukui-kodama board, I see an ugly warning in my kernel
> log:
>   mtk-msdc 11240000.mmc: error -ENXIO: IRQ sdio_wakeup not found
>
> It's pretty normal not to have an "sdio_wakeup" IRQ defined. In fact,
> no device trees in mainline seem to have it. Let's use the
> platform_get_irq_byname_optional() to avoid the error message.
>
> Fixes: 527f36f5efa4 ("mmc: mediatek: add support for SDIO eint wakup IRQ")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
>  drivers/mmc/host/mtk-sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index edade0e54a0c..8ce864169986 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2707,7 +2707,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
>
>         /* Support for SDIO eint irq ? */
>         if ((mmc->pm_caps & MMC_PM_WAKE_SDIO_IRQ) && (mmc->pm_caps & MMC_PM_KEEP_POWER)) {
> -               host->eint_irq = platform_get_irq_byname(pdev, "sdio_wakeup");
> +               host->eint_irq = platform_get_irq_byname_optional(pdev, "sdio_wakeup");
>                 if (host->eint_irq > 0) {
>                         host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
>                         if (IS_ERR(host->pins_eint)) {
> --
> 2.40.1.521.gf1e218fcd8-goog
>

