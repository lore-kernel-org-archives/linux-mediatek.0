Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30D0C43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 07:02:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9772C20700
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 07:02:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/45dppp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k8Jz8WhY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9772C20700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMF6/hyeA39vzx+QoKFiFL/822vShALh0qIPBvPhj7Q=; b=q/45dppp/UjVWT
	2NpN6V0iJbn9oo2P5KTHkdbyZ0Sjis+plGjI00mZPXuwj/hiS65fdoz4yanCNBOW/tzFgDWoBr2S7
	TaRUg8VbKUY4FTuL4lllTooTQbjTBZnMcJUpdqJg5RIAxDQxQ46UTkzS6WzVsgebblw60B5sovn60
	5LMCF8x37nGb9uNNXeh7LVcVuewow+8PtkQNuQy9zVt6GTXhZvqWLce7/YglcEfoNMWRZW4MyBpr0
	k0jswtVLE0cYkTolI2SxjbzlBGj/Rizjtg8u/YQ4mXMwuTleZzWNp1r9V1ljOs6NTaQ6DUIpGGkJ6
	BYLfFtCEmSkf2AkDU8hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igkOP-0005QD-CT; Mon, 16 Dec 2019 07:02:09 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igkO0-00051U-8V
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 07:01:46 +0000
Received: by mail-qk1-x742.google.com with SMTP id w127so4401725qkb.11
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Dec 2019 23:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mNxq9QEx/Y0AFfmFBHfjO9qh1l6j5wyPEAuFcOtgvko=;
 b=k8Jz8WhY1cxn9bFKXeAi5vzaTBfRitVt26Dv8N8sNlYJP+LrdDlQqaBI0DhBwVSp3j
 jqUvtkluKNvckqYdwX0zAwgdTSijpgtwIQkpJR0wV31kbIiO6lN/sqeFNJxRolylHi9z
 mkNpLYAbfL38r2dXtuppefORp2tXgISUEAbu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mNxq9QEx/Y0AFfmFBHfjO9qh1l6j5wyPEAuFcOtgvko=;
 b=WRMlv+MKVgj24bYNAVDiQTykvb4YQmJJw/bKxC+JlZs+1VP9h2u8uX1LnlbTR6HIcN
 BfUsMbATxwt6vsvjjnAMBGJp2iOK0ISMxZX3xC8ilbScLGuFyDLsgYla1chRik0xlmiw
 cVWGvPrlfqTFfnFxm9rSkgCWWYDWKBEhgkFlKSo6mT935OCOdo0NM0KctFoSdUIkGL2e
 oNogCv0I14x+U277GSHnUDiRQjKeFzKJo6gwfv03YNvhfX85Jz3b/jwobOA5/2crPLGf
 pYO+Y1G+8vdZ7Foeaw7Ui8TJasN4O86RqiZ53ZR0ro0RXiXTS/eluSnmxiFOBDaLix/1
 MJZA==
X-Gm-Message-State: APjAAAVTkjbAc3PC5nFWrukvtKk8IK2AnZeT8wx0OhMHv4edIcWkJ5V4
 hkoe6QJbOOUGKi8AjzvFxfg+ZQUPrx4Q/5k/qeUWMA==
X-Google-Smtp-Source: APXvYqzVdceLqcG+3fAzc6E6Q5G9XbMKp+zuFLQXrq1VY+BvVu+NpyPVVDbAVBh4Vyd+Tbmbw9ZSQBEix3ZXm6HqNCo=
X-Received: by 2002:ae9:f003:: with SMTP id l3mr25598095qkg.457.1576479702489; 
 Sun, 15 Dec 2019 23:01:42 -0800 (PST)
MIME-Version: 1.0
References: <1575960413-6900-1-git-send-email-weiyi.lu@mediatek.com>
 <1575960413-6900-4-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1575960413-6900-4-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 16 Dec 2019 15:01:31 +0800
Message-ID: <CANMq1KC4Qz8yKNTqfjYb335RCY8t5pdRa09Bvroo_BNXv19hWQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] soc: mediatek: Add basic_clk_id to scp_power_data
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_230144_324021_3089810A 
X-CRM114-Status: GOOD (  17.16  )
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
> Try to stop extending the clk_id or clk_names if there are
> more and more new BASIC clocks. To get its own clocks by the
> basic_clk_id of each power domain.

Looking at this a bit more, I'm not sure why we make this an option...

The easiest way to make this consistent with non-MT8183 scpsys drivers
is to add your missing clocks to "enum clk_id" and clk_names, but I
understand it's not desired (number of clocks would blow up).

Can we, instead, convert all existing scpsys drivers to use "char *"
clock names instead?
I made an attempt here and it seems simple enough:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1969103

>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index f669d37..915d635 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -117,6 +117,8 @@ enum clk_id {
>   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
>   * @bus_prot_mask: The mask for single step bus protection.
>   * @clk_id: The basic clocks required by this power domain.
> + * @basic_clk_id: provide the same purpose with field "clk_id"
> + *                by declaring basic clock prefix name rather than clk_id.

Actually, I prefer the name clk_name, not sure why I pushed you in
that direction...

>   * @caps: The flag for active wake-up action.
>   */
>  struct scp_domain_data {
> @@ -127,6 +129,7 @@ struct scp_domain_data {
>         u32 sram_pdn_ack_bits;
>         u32 bus_prot_mask;
>         enum clk_id clk_id[MAX_CLKS];
> +       const char *basic_clk_id[MAX_CLKS];
>         u8 caps;
>  };
>
> @@ -493,16 +496,26 @@ static struct scp *init_scp(struct platform_device *pdev,
>
>                 scpd->data = data;
>
> -               for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
> -                       struct clk *c = clk[data->clk_id[j]];
> +               if (data->clk_id[0]) {
> +                       WARN_ON(data->basic_clk_id[0]);
>
> -                       if (IS_ERR(c)) {
> -                               dev_err(&pdev->dev, "%s: clk unavailable\n",
> -                                       data->name);
> -                               return ERR_CAST(c);
> -                       }
> +                       for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
> +                               struct clk *c = clk[data->clk_id[j]];
> +
> +                               if (IS_ERR(c)) {
> +                                       dev_err(&pdev->dev,
> +                                               "%s: clk unavailable\n",
> +                                               data->name);
> +                                       return ERR_CAST(c);
> +                               }
>
> -                       scpd->clk[j] = c;
> +                               scpd->clk[j] = c;
> +                       }
> +               } else if (data->basic_clk_id[0]) {
> +                       for (j = 0; j < MAX_CLKS &&
> +                                       data->basic_clk_id[j]; j++)
> +                               scpd->clk[j] = devm_clk_get(&pdev->dev,
> +                                               data->basic_clk_id[j]);
>                 }
>
>                 genpd->name = data->name;
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
