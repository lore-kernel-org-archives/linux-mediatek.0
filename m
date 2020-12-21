Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFFEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 02:33:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC9522B37
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 02:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EC9522B37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TmBgkxjCIKVg5RQAEuavJrAlWTHk+Ea0F4Wt+8w+kYo=; b=S3deKcnptUYaDZt6cks5ulqVF
	kkfTa0kJkBhec11KvJANNtciedDQAWheSerkmp7/q7+93DNQjL/hFQ09FjFpog/DsVVhl9BZY8LPL
	3e2WctA9wPBVJiNlxmsJ49QcfiyyqHP/6CIvm//uSnrLyUcNHs4sq+KKlQ5Uad3dp4WYjj79ZGR+L
	8M976M0AwWfZ8U6nb9jRXdr0+hGEzp5g4cFQxzo51XnxKBsnRP+bxOqHK6nWhwEP03OImRm+tXFG9
	zUmDUlxGFLS1CL6a1KWaSKW+rQCUJJsAPHh0Jz6Tf5gSfZLkKuTIIOlAQ8qIW1lJUSfz+VyR/gmdd
	q+/Ql37TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krB0f-0005qC-W6; Mon, 21 Dec 2020 02:33:18 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krB0c-0005pP-Qi
 for linux-mediatek@lists.infradead.org; Mon, 21 Dec 2020 02:33:16 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id w66so1948325vka.3
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Dec 2020 18:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FY6z7JqllprlHMBYTUwFN6QjJFrlD6KrEW0CH05eYAQ=;
 b=R5jqp/JCDiAl3vkcOvnBFYNZhIBwEVup8M88NBZ90iM2d+RsHW2tIJdsz4zEJP8HDV
 PGSN+FdwA08HUWTXjsSmVqkjGBjj/DFDSa+wnOLQ1hBtjYN3hcwDLRVccIDoSWZuCVzX
 yAkRD5CfFTxOyjAyh32CA5lpwzAv4CA7bHrl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FY6z7JqllprlHMBYTUwFN6QjJFrlD6KrEW0CH05eYAQ=;
 b=H5Wivk9ibiNIVTccWWovgBM1h3TzHc3SsyZ+Kv+0kdGZdfr22g1J7/uAbatsvl80kh
 ZLpV5RLWsr5c5cTUXXv0HxK/xWQXf3rn26bv5ycr1lef95/2nZ8Y6cfur78WMMUQTwaJ
 DWgroYZk8KdZgWuYZJ0259LhJAjSw7pnWv9lIy2k3p14sDnLJEKlcnyrZRApyS0I19SZ
 Jk/g8xSU1p8iL2q2Xxvfb5v/0nwFMbS/adzrmJj1v2QaVgeYuMM0ltx2tXG0BaywLWsb
 rmZJmT52snbTXa6Qirl1OyF88sgkpi0vHcuin1lhCUJoe71g2eti/OyNZH1vYqQI/+Jo
 QW3A==
X-Gm-Message-State: AOAM532rSFeDwCH0t/ps+hLVAAmCzWIJ22Y5WGxFqFK/qsXCqHuGe54U
 Cq+tmiRxhMI9QjR9tOCbswXsj/69tGCzXl9B6VKDusilum+eYA==
X-Google-Smtp-Source: ABdhPJwqJjAstIPLLxsW1pe9oXKXOonBFCoT1lAtap0NVVd+ocFlsOOdNe1FWwMq647hX6mxfUZuyRapZInbgS/mrlw=
X-Received: by 2002:a1f:6743:: with SMTP id m3mr11694643vki.10.1608517992770; 
 Sun, 20 Dec 2020 18:33:12 -0800 (PST)
MIME-Version: 1.0
References: <1605700894-32699-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1605700894-32699-3-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1605700894-32699-3-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 21 Dec 2020 10:33:02 +0800
Message-ID: <CANMq1KDsNRk0FWDO3bnbhLrXPhW7O_OVD_a7Q01+ZvuGWL3dhA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] soc: mediatek: pwrap: add arbiter capability
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_213315_071049_7F6A5258 
X-CRM114-Status: GOOD (  29.08  )
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
 Argus Lin <argus.lin@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, Fei Shao <fshao@chromium.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 8:08 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> Add arbiter capability for pwrap driver.
> The arbiter capability uses new design to judge the priority and latency
> for multi-channel.
> This patch is preparing for adding mt6873/8192 pwrap support.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 57 ++++++++++++++++++++++++++++++------
>  1 file changed, 48 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index c897205..5678f46 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -25,10 +25,12 @@
>
>  /* macro for wrapper status */
>  #define PWRAP_GET_WACS_RDATA(x)                (((x) >> 0) & 0x0000ffff)
> +#define PWRAP_GET_WACS_ARB_FSM(x)      (((x) >> 1) & 0x00000007)
>  #define PWRAP_GET_WACS_FSM(x)          (((x) >> 16) & 0x00000007)
>  #define PWRAP_GET_WACS_REQ(x)          (((x) >> 19) & 0x00000001)
>  #define PWRAP_STATE_SYNC_IDLE0         BIT(20)
>  #define PWRAP_STATE_INIT_DONE0         BIT(21)
> +#define PWRAP_STATE_INIT_DONE1         BIT(15)
>
>  /* macro for WACS FSM */
>  #define PWRAP_WACS_FSM_IDLE            0x00
> @@ -74,6 +76,7 @@
>  #define PWRAP_CAP_DCM          BIT(2)
>  #define PWRAP_CAP_INT1_EN      BIT(3)
>  #define PWRAP_CAP_WDT_SRC1     BIT(4)
> +#define PWRAP_CAP_ARB          BIT(5)
>
>  /* defines for slave device wrapper registers */
>  enum dew_regs {
> @@ -340,6 +343,8 @@ enum pwrap_regs {
>         PWRAP_DCM_DBC_PRD,
>         PWRAP_EINT_STA0_ADR,
>         PWRAP_EINT_STA1_ADR,
> +       PWRAP_SWINF_2_WDATA_31_0,
> +       PWRAP_SWINF_2_RDATA_31_0,
>
>         /* MT2701 only regs */
>         PWRAP_ADC_CMD_ADDR,
> @@ -1108,14 +1113,22 @@ static void pwrap_writel(struct pmic_wrapper *wrp, u32 val, enum pwrap_regs reg)
>
>  static bool pwrap_is_fsm_idle(struct pmic_wrapper *wrp)
>  {
> -       u32 val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> +       u32 val;
> +
> +       val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> +       if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> +               return PWRAP_GET_WACS_ARB_FSM(val) == PWRAP_WACS_FSM_IDLE;
>
>         return PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_IDLE;
>  }
>
>  static bool pwrap_is_fsm_vldclr(struct pmic_wrapper *wrp)
>  {
> -       u32 val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> +       u32 val;
> +
> +       val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> +       if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> +               return PWRAP_GET_WACS_ARB_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR;

This code is now copied twice. Do you think it'd be better to create a
new function?

static u32 pwrap_get_fsm_state(struct pmic_wrapper *wrp) {
   if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
      return PWRAP_GET_WACS_ARB_FSM(val);
   else
      return PWRAP_GET_WACS_FSM(val);
}

>
>         return PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR;
>  }
> @@ -1165,6 +1178,7 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
>  static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
>  {
>         int ret;
> +       u32 val;
>
>         ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
>         if (ret) {
> @@ -1172,13 +1186,21 @@ static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
>                 return ret;
>         }
>
> -       pwrap_writel(wrp, (adr >> 1) << 16, PWRAP_WACS2_CMD);
> +       if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> +               val = adr;
> +       else
> +               val = (adr >> 1) << 16;
> +       pwrap_writel(wrp, val, PWRAP_WACS2_CMD);
>
>         ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
>         if (ret)
>                 return ret;
>
> -       *rdata = PWRAP_GET_WACS_RDATA(pwrap_readl(wrp, PWRAP_WACS2_RDATA));
> +       if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> +               val = pwrap_readl(wrp, PWRAP_SWINF_2_RDATA_31_0);
> +       else
> +               val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> +       *rdata = PWRAP_GET_WACS_RDATA(val);
>
>         pwrap_writel(wrp, 1, PWRAP_WACS2_VLDCLR);
>
> @@ -1228,8 +1250,13 @@ static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
>                 return ret;
>         }
>
> -       pwrap_writel(wrp, (1 << 31) | ((adr >> 1) << 16) | wdata,
> -                    PWRAP_WACS2_CMD);
> +       if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB)) {
> +               pwrap_writel(wrp, wdata, PWRAP_SWINF_2_WDATA_31_0);
> +               pwrap_writel(wrp, BIT(29) | adr, PWRAP_WACS2_CMD);
> +       } else {
> +               pwrap_writel(wrp, BIT(31) | ((adr >> 1) << 16) | wdata,
> +                            PWRAP_WACS2_CMD);
> +       }
>
>         return 0;
>  }
> @@ -2022,6 +2049,7 @@ MODULE_DEVICE_TABLE(of, of_pwrap_match_tbl);
>  static int pwrap_probe(struct platform_device *pdev)
>  {
>         int ret, irq;
> +       u32 mask_done;
>         struct pmic_wrapper *wrp;
>         struct device_node *np = pdev->dev.of_node;
>         const struct of_device_id *of_slave_id = NULL;
> @@ -2116,14 +2144,21 @@ static int pwrap_probe(struct platform_device *pdev)
>                 }
>         }
>
> -       if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & PWRAP_STATE_INIT_DONE0)) {
> +       if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> +               mask_done = PWRAP_STATE_INIT_DONE1;
> +       else
> +               mask_done = PWRAP_STATE_INIT_DONE0;
> +
> +       if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done)) {
>                 dev_dbg(wrp->dev, "initialization isn't finished\n");
>                 ret = -ENODEV;
>                 goto err_out2;
>         }
>
>         /* Initialize watchdog, may not be done by the bootloader */
> -       pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
> +       if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> +               pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
> +

To expand on Matthias' question on v3
(https://patchwork.kernel.org/project/linux-mediatek/patch/1600686235-27979-3-git-send-email-hsin-hsiung.wang@mediatek.com/):
is there any PWRAP implementation where a design with an arbiter is
still able to control the watchdog?

If not, at the very least, it'd be good to expand the comment above
(e.g. "designs with arbiter support cannot change the watchdog
timer").

>         /*
>          * Since STAUPD was not used on mt8173 platform,
>          * so STAUPD of WDT_SRC which should be turned off
> @@ -2132,7 +2167,11 @@ static int pwrap_probe(struct platform_device *pdev)
>         if (HAS_CAP(wrp->master->caps, PWRAP_CAP_WDT_SRC1))
>                 pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN_1);
>
> -       pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
> +       if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))

Please invert this if test:

if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
   ... 0x3 ...
else
   ... 0x1 ...

> +               pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
> +       else
> +               pwrap_writel(wrp, 0x3, PWRAP_TIMER_EN);
> +
>         pwrap_writel(wrp, wrp->master->int_en_all, PWRAP_INT_EN);
>         /*
>          * We add INT1 interrupt to handle starvation and request exception
> --
> 2.6.4
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
