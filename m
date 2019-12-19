Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C87C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 03:58:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE1BD21582
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 03:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sq6/L7Eq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hqFkhfDz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE1BD21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReBD5VXMOdIHrH+9QM9OBjo1Dz/fLRBlvT411RHbaVw=; b=sq6/L7EqV/SrlS
	4Uo6BcmEgba6arvWEb+XqocoNb2OOtewOwThtVDHMsE9AKSnbmpFqu5pgXYiMVL0a+gjcOXV0k9Us
	DKmW3TXWc+OwtvSI4dUl6uTmy/HLL1Y6Oa1E7E7wNmsyDE1HzPykjidiYZX7QUrdMIP6sUBSwBNpF
	TwtvxE5GlKKCcPdz9MmMgTA71kYcT35LgdSmgOu7y8HJBU95dPG6KYZUjYSDqqz/JQmKTJ5iuQ4Ja
	mQOISBWAFgVnepIu2PUtYD1G8bCExZ3wrSU42wtYapBspVXtyWIEQMAzsTtAk4O4A6RipJGy78Dre
	+kQjVkd8qzGCZhvmobAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihmwu-00052P-8J; Thu, 19 Dec 2019 03:58:04 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihmws-00051K-2q
 for linux-mediatek@lists.infradead.org; Thu, 19 Dec 2019 03:58:03 +0000
Received: by mail-qk1-x743.google.com with SMTP id c16so3540832qko.6
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Dec 2019 19:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gW5SNpt87UiG+lsIdrY5UhkxjdU7rCSW5a9k6JS9SRk=;
 b=hqFkhfDzCCKIUTBL6FeQxUmjvs91e8R1WmNH0Vumuze6UR95Wrm3Tm7TSP/G5+p2yi
 NcohuQv4yW/e/F73o9/U/0brsCCYjDSsFJ0FzHUZUJ7Y3w8xzUwKwuVzwHyodCdvvRTY
 xPQFXPHStersJiiwdEMwbEwdFJOsf8FM7ID0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gW5SNpt87UiG+lsIdrY5UhkxjdU7rCSW5a9k6JS9SRk=;
 b=j5XX4EuIRPZay0XcTjbsMeloqqWrxrKB3wHreKdUdTacF5ZnM6tpJmqmBRBJQbO2QA
 ZmPfTxerxiSZ7a7lXZTk6BaL4T6oNk88oG+j26v1vyfkthnpBTVe9yLVYN3fpnD10v96
 I18koeLT7mH9vHJWUyO4crjF4f/2BowAMB1ITdQjuOyvf+ypI6X71e44QT7LOoodkQD/
 oFT3Qzqdih+SxYRv3zD8hiZ1+JRsnJxt76roKo6g5qNQR29kOx+VLdoi7MYQAFgSxCjo
 005W8ZO32NTgHsrzjIy63s++DEpxkyKVxQmuldKhZSSiuiEyVEQ2tnvrb7h+B7MMJaUz
 K20g==
X-Gm-Message-State: APjAAAVYv8TOxHQpdsIbsHhrWmRdliyF6PWH120fWv8DCICa8pNlFXgy
 yUW8iHU5+6hC0wfZZqHnYuwD+gDRVXjXEvg7gD2DZ+PNrsg=
X-Google-Smtp-Source: APXvYqyXidRE2qnvUa+RAtayNDFWnB5o5tPU43BxSLYWf08arGF8HAOG7Pl7mstZLKWLgHOqgzccqGmeitfLHhV35Sk=
X-Received: by 2002:ae9:f003:: with SMTP id l3mr6202689qkg.457.1576727881256; 
 Wed, 18 Dec 2019 19:58:01 -0800 (PST)
MIME-Version: 1.0
References: <1576657848-14711-1-git-send-email-weiyi.lu@mediatek.com>
 <1576657848-14711-10-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1576657848-14711-10-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 19 Dec 2019 11:57:50 +0800
Message-ID: <CANMq1KB_YFUg34UJ_-uaOgrr_UDig5GkZrtMWKTD-qxg=+GRmg@mail.gmail.com>
Subject: Re: [PATCH v10 09/12] soc: mediatek: Add extra sram control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_195802_128871_44C0F703 
X-CRM114-Status: GOOD (  16.04  )
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

On Wed, Dec 18, 2019 at 4:31 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> For some power domains like vpu_core on MT8183 whose sram need to
> do clock and internal isolation while power on/off sram.
> We add a flag "sram_iso_ctrl" in scp_domain_data to judge if we
> need to do the extra sram isolation control or not.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 9f06f17..e010fb3 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -56,6 +56,8 @@
>  #define PWR_ON_BIT                     BIT(2)
>  #define PWR_ON_2ND_BIT                 BIT(3)
>  #define PWR_CLK_DIS_BIT                        BIT(4)
> +#define PWR_SRAM_CLKISO_BIT            BIT(5)
> +#define PWR_SRAM_ISOINT_B_BIT          BIT(6)
>
>  #define PWR_STATUS_CONN                        BIT(1)
>  #define PWR_STATUS_DISP                        BIT(3)
> @@ -86,6 +88,8 @@
>   * @name: The domain name.
>   * @sta_mask: The mask for power on/off status bit.
>   * @ctl_offs: The offset for main power control register.
> + * @sram_iso_ctrl: The flag to judge if the power domain need to do
> + *                 the extra sram isolation control.
>   * @sram_pdn_bits: The mask for sram power control bits.
>   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
>   * @basic_clk_name: The basic clocks required by this power domain.
> @@ -98,6 +102,7 @@ struct scp_domain_data {
>         const char *name;
>         u32 sta_mask;
>         int ctl_offs;
> +       bool sram_iso_ctrl;
>         u32 sram_pdn_bits;
>         u32 sram_pdn_ack_bits;
>         const char *basic_clk_name[MAX_CLKS];
> @@ -233,6 +238,14 @@ static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
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
> @@ -242,8 +255,15 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
>         u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
>         int tmp;
>
> -       val = readl(ctl_addr);
> -       val |= scpd->data->sram_pdn_bits;
> +       if (scpd->data->sram_iso_ctrl)  {
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
