Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5FCC10DCE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 03:14:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76C3921927
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 03:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VnBiGVLQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kma7Tvna"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76C3921927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rB5fIJ4t+ZcFhO1gkLYrOV6HkMVu1gyPznnLWxC868=; b=VnBiGVLQymo8Uf
	LqGrgA3USyo26gJg4k+7VfYAJ7jcWAXZRh3DaukWqeqlhWAPur6onmGytVBnoGmSZuoYvyBdeLD83
	bVgquyuvspfw0OsB6JvFPOTysyWlDbJT7xfFJzz/xkKLcVnyUfKvphgfwuG3+X8HEYK1dKNLEeDb6
	D/fk567mje0x2N9knxe3uhXxaC+Dihdmn/pbzBa0V8mGGctbnINQYV3+CUg2Ux9u0v7+E/BHL4KH8
	0EKQ2pCUkAbbFkTKRZZifOOAHISOYIixpyZYttujQbhWHc2nOC5uKTW5uaW7RIuM16OjDOQiKAfh4
	65oF4ZafQf35CLeG3MkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBrpK-00012b-2U; Wed, 11 Mar 2020 03:14:34 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBrp3-0000nk-Fl
 for linux-mediatek@lists.infradead.org; Wed, 11 Mar 2020 03:14:20 +0000
Received: by mail-vs1-xe41.google.com with SMTP id x82so379242vsc.12
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2020 20:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xYwUciegLoUmC80zL9vJOXVRDnxOH2mkTDk31tr500o=;
 b=kma7TvnaUs14CAynENNhB9yMyXCLNtcX+aYaWo+QKVGodAO3cUufnRsCqYxRF+OqQG
 OJnWRsCWKVXflciiGN1gFbuiCGI2OnYJ/8yprBahXg4gqa3Jr1YNGNE8DETggWwqF/IK
 OvFgZTSZgTNZXZhXlkbh/RQF5OXbFr0sK67jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xYwUciegLoUmC80zL9vJOXVRDnxOH2mkTDk31tr500o=;
 b=MG3olR22YEiwXKwHEYCJAUCsL0e2oztLdIPhyM44nBmJSTSPXDYvNDtc356L4xZeMS
 a3U8P+WA3/wEWqrKbLZXN+SlNWopoyAt6lFjwmxXlYYY+VpnaRVOnqd5gbA5mYKS4X0F
 HBKjtNMX7iqUXLXkObyDh2figlQT22hDu/HYw9LkV2wK9VESPErAAFAxJAUC6kVhgLgN
 2uOJL/xPhuflI2wyzEskDCdBkt8Vi0MPeY4WZh5NxEAnKD+LZWyK0GbSOP9qw/wVKrlu
 kr/myqgx1geieKP2GRuWt4SQXU55Lc8HKghNsc1YChRIc7Ihb9lSJe0QTv/GTtRbVH2d
 Cw/g==
X-Gm-Message-State: ANhLgQ0+fCMnxD/kdeZnRlnqX6jCh2wT7xIgThy4iChC+wXxcvlwcFCO
 SwHSLslyzMT4xS9Vip8AhOxtqv/d6pSQoh8/FMbtzw==
X-Google-Smtp-Source: ADFU+vv6UMRH1wtcZGia0LIimAxqqwzcUCmpByfY2SG1i3IMsl7POB0lt6NB5QfIGWx8nIhwio7eOjvKXR6Tc1ZJNVs=
X-Received: by 2002:a67:fe05:: with SMTP id l5mr700513vsr.186.1583896456343;
 Tue, 10 Mar 2020 20:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <1581910527-1636-1-git-send-email-weiyi.lu@mediatek.com>
 <1581910527-1636-8-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1581910527-1636-8-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 11 Mar 2020 11:14:05 +0800
Message-ID: <CANMq1KCL0qi3kXmhya7T_vBYreNmrCQGh6XTrk9qhU9eOWWnLQ@mail.gmail.com>
Subject: Re: [PATCH v12 07/10] soc: mediatek: Add extra sram control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_201417_556966_A494E46C 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 17, 2020 at 11:35 AM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> For some power domains like vpu_core on MT8183 whose sram need to
> do clock and internal isolation while power on/off sram.
> We add a cap "MTK_SCPD_SRAM_ISO" to judge if we need to do
> the extra sram isolation control or not.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Still looks good to me, and addresses Matthias' comments AFAICT:

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 2a9478f..98cc5ed 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -26,6 +26,7 @@
>
>  #define MTK_SCPD_ACTIVE_WAKEUP         BIT(0)
>  #define MTK_SCPD_FWAIT_SRAM            BIT(1)
> +#define MTK_SCPD_SRAM_ISO              BIT(2)
>  #define MTK_SCPD_CAPS(_scpd, _x)       ((_scpd)->data->caps & (_x))
>
>  #define SPM_VDE_PWR_CON                        0x0210
> @@ -57,6 +58,8 @@
>  #define PWR_ON_BIT                     BIT(2)
>  #define PWR_ON_2ND_BIT                 BIT(3)
>  #define PWR_CLK_DIS_BIT                        BIT(4)
> +#define PWR_SRAM_CLKISO_BIT            BIT(5)
> +#define PWR_SRAM_ISOINT_B_BIT          BIT(6)
>
>  #define PWR_STATUS_CONN                        BIT(1)
>  #define PWR_STATUS_DISP                        BIT(3)
> @@ -234,6 +237,14 @@ static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
>                         return ret;
>         }
>
> +       if (MTK_SCPD_CAPS(scpd, MTK_SCPD_SRAM_ISO))     {
> +               val = readl(ctl_addr) | PWR_SRAM_ISOINT_B_BIT;
> +               writel(val, ctl_addr);
> +               udelay(1);
> +               val &= ~PWR_SRAM_CLKISO_BIT;
> +               writel(val, ctl_addr);
> +       }
> +
>         return 0;
>  }
>
> @@ -243,8 +254,15 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
>         u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
>         int tmp;
>
> -       val = readl(ctl_addr);
> -       val |= scpd->data->sram_pdn_bits;
> +       if (MTK_SCPD_CAPS(scpd, MTK_SCPD_SRAM_ISO))     {
> +               val = readl(ctl_addr) | PWR_SRAM_CLKISO_BIT;
> +               writel(val, ctl_addr);
> +               val &= ~PWR_SRAM_ISOINT_B_BIT;
> +               writel(val, ctl_addr);
> +               udelay(1);
> +       }
> +
> +       val = readl(ctl_addr) | scpd->data->sram_pdn_bits;
>         writel(val, ctl_addr);
>
>         /* Either wait until SRAM_PDN_ACK all 1 or 0 */
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
