Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811F7C43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 07:29:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C4F20717
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 07:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QMgMLcau";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DtWiSVkz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53C4F20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGeP1/7w6P3Rifx04gyZFhbIJd/6GRmypOrX88qhsdc=; b=QMgMLcauCao+wG
	47xwBp9UbG1XX7b0aiyi9Jgmp9Q89P79waODf+VasWaPdQMEIDHiSRfJ818VXGTI8q5HgFoEezdb0
	5X6HURxoof1OoGqmQ9etdeYTwDlGuTwTikBmMyKALYqQEo1kbGiNzJxiHDHhxXM9PqF/AiBbUgboR
	n5lHrCemOCu6Sch8RX7z1ETuHe5Hj8NiA8kJDOUIrG6QzbrcLGxX4rbdFvkY60Hbqq3/qZ8kQg97F
	OYXpkSrEL/vzwJEQHosGCdYZuDmEmxX+YENQ7b2KWltUNcY8rMH0inKOopId4B9NhpNHKc/PPsynk
	gsJ+hVK9K1RqtCw5ZqkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igkoj-0007M1-G0; Mon, 16 Dec 2019 07:29:21 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igkoZ-0007Br-0U
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 07:29:12 +0000
Received: by mail-qv1-xf42.google.com with SMTP id m14so1790618qvl.3
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Dec 2019 23:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dV2vlOFsb8F1dAAOKXkJvVUNN8FBypx/gfjiA3eTMEk=;
 b=DtWiSVkzUKVe/+yccfzUw4WSKnnZtLyFCqfBtFPkSMldVlhuvwOPUyS3ok/mY4XPAF
 PHC1IMbSqaHlr4Hh5oFyoIovVNdsI1TN66gV/B7nWVJSXuKWQgYaJFdCbhAg0Rlu7mRD
 3qHcptFRU6nlSJeHsmFWtsqh6MrCKNSH1Nv9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dV2vlOFsb8F1dAAOKXkJvVUNN8FBypx/gfjiA3eTMEk=;
 b=SAzhCLtxWtWOwWazc618jCVGEV4hZhgTKz7IkHFVzLJkA8e+Aoc63+6bZeffhvn+bF
 ns/Ce9zn44wuEsuzK5H13J6xjyK3i8aTO19vAlLv5AWE73eRyOvnPyujdY1TDG5ehyll
 ADUilCjRxT5/1Dbu07l89CQY+xwGYoVGIaLTbiRIgOWzvg70F4FFGGs00pgWNphhIhdG
 hTVsUJvZ7NTzD8tiPq9BXnCMCJhJ4MGY+YAln0vwcfWbq768+hx9wpPk9zx8C80SvKYZ
 XZ25lMvTECDsE9Tw0dutkL6KseUOTN5TsLr993qHKzbH9D7HiSfmor7n3WQrlqyUkhBN
 jJeg==
X-Gm-Message-State: APjAAAVxHmopqNidyRJGfc9Ab+vZXhsG/rja9doHkWHBuRwZEq54WX3z
 3c4vBhRGgHAH6jfWlfu+DHxfbxhri+57m3/ggWr3OQ==
X-Google-Smtp-Source: APXvYqwq88sA56fSNNx0AkPlWaUiYAr/DCMmo6+DmdP4m8AvPhTWR6m3PCZRTb+X+AY/KsJkRJPt4zf5ONRH+6KvmMI=
X-Received: by 2002:a0c:f703:: with SMTP id w3mr25474009qvn.6.1576481349748;
 Sun, 15 Dec 2019 23:29:09 -0800 (PST)
MIME-Version: 1.0
References: <1575960413-6900-1-git-send-email-weiyi.lu@mediatek.com>
 <1575960413-6900-7-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1575960413-6900-7-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 16 Dec 2019 15:28:58 +0800
Message-ID: <CANMq1KDkywkPBDK9bbKqDcYser-QiXV-XSuDmVCqnkh6Su9Awg@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] soc: mediatek: Add extra sram control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_232911_049211_AF1BD028 
X-CRM114-Status: GOOD (  16.16  )
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
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 2:47 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> For some power domains like vpu_core on MT8183 whose sram need to
> do clock and internal isolation while power on/off sram.
> We add a flag "sram_iso_ctrl" in scp_domain_data to judge if we
> need to do the extra sram isolation control or not.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 2bbf907..0676b46 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -57,6 +57,8 @@
>  #define PWR_ON_BIT                     BIT(2)
>  #define PWR_ON_2ND_BIT                 BIT(3)
>  #define PWR_CLK_DIS_BIT                        BIT(4)
> +#define PWR_SRAM_CLKISO_BIT            BIT(5)
> +#define PWR_SRAM_ISOINT_B_BIT          BIT(6)
>
>  #define PWR_STATUS_CONN                        BIT(1)
>  #define PWR_STATUS_DISP                        BIT(3)
> @@ -115,6 +117,8 @@ enum clk_id {
>   * @name: The domain name.
>   * @sta_mask: The mask for power on/off status bit.
>   * @ctl_offs: The offset for main power control register.
> + * @sram_iso_ctrl: The flag to judge if the power domain need to do
> + *                 the extra sram isolation control.
>   * @sram_pdn_bits: The mask for sram power control bits.
>   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
>   * @bus_prot_mask: The mask for single step bus protection.
> @@ -130,6 +134,7 @@ struct scp_domain_data {
>         const char *name;
>         u32 sta_mask;
>         int ctl_offs;
> +       bool sram_iso_ctrl;
>         u32 sram_pdn_bits;
>         u32 sram_pdn_ack_bits;
>         u32 bus_prot_mask;
> @@ -269,6 +274,14 @@ static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
>                         return ret;
>         }
>
> +       if (scpd->data->sram_iso_ctrl)  {
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
> @@ -278,8 +291,16 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
>         u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
>         int tmp;
>
> -       val = readl(ctl_addr);
> -       val |= scpd->data->sram_pdn_bits;
> +       if (scpd->data->sram_iso_ctrl)  {
> +               val = readl(ctl_addr);
> +               val |= PWR_SRAM_CLKISO_BIT;

You do this in 1 line above. I don't really care, but be consistent?
e.g. val = readl(ctl_addr) | PWR_SRAM_CLKISO_BIT;

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
