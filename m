Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048E8C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 07:48:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 732A121D43
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 07:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YD1L2DTY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="wHMRJTrV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 732A121D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8e2HvBNFHIeltsp0oQSsMfQh7ijw3ZYNQXejjRv6hJ8=; b=YD1L2DTYFoMVhkVl2mVJxtPps
	4CJ+uyACv4CQicjxfiuyR4YAXCmzHBdU2BltpPEwjrSEmwrsjxJjjXfGBDXsDkav3SCZl2jdGz5Z5
	WxfVvrpQYLPSTbp3KWhrqNT5gIoANVqOW1E+skyEanYz2ak4kXAvQPzSax2gDUldiOSoERo4DowpP
	E/adYEH3nd6Edx/OD815xMKuoEo56BvUk4ch60UdYpy2xWQ/3KA34lIEoDWSeWRdcmfxRtOWjfRFv
	6Y8FiK69TjJN6XZdCkph6N2O9PKabW34DzFWOgedHb67qeF1xqCQXYOqJPPv2Sn0Ssoc68TDlI37p
	mANAE/LLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVVKb-0006Tz-Bo; Thu, 22 Oct 2020 07:48:17 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVVKW-0006Sv-Vp
 for linux-mediatek@lists.infradead.org; Thu, 22 Oct 2020 07:48:15 +0000
Received: by mail-io1-xd42.google.com with SMTP id q9so589477iow.6
 for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2020 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GS3HinPPiSHGmTokNQrXPwzb4Xbdo2XI45QftMVflLc=;
 b=wHMRJTrVrsMw9MbYSWAo2b1/cS/rQvRh3GemJqY1lK0DmJ2W9mfKYJvluewt/b2vt4
 oWmITgGvVQEJhmKqdbpzUDbLTh8X4l5/6x13PWj4TOAb0JzkqB5LdwGAVSobl5tvNmI4
 BltkomYDkWR8asAW3ibzUV+oUkl2xViEWM8hJw1Ie3FDEHKSFMQ//x3rBL2K4O1i66hK
 MSktzQBUDxfH1bEsWuvQDnmgfSoATqi59vQsOw2oJRVyxdbZYxXanjhgrnWnZehLn7rc
 aVmaopaKYYs7k3ig4mJvIwyrNVfXXC3edO4gJZy7OAdp0yM4vi7Hn6aGLL8ruNEADX89
 e3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GS3HinPPiSHGmTokNQrXPwzb4Xbdo2XI45QftMVflLc=;
 b=PaDmYG5+axWfcTznhlNTKvbwYrwvl/+Z5HaF6y+HhXCs11LL8R+/a+Fpcv/oHBODIQ
 IpcY0dpKlsWFETCGnAkJeDdOw9jJsXZ76YZkz/AHU5zJZFP6tYPZ2Cxk2nfwGkOfaExj
 jYmdNoLNHRXJOwvDrfR0T0ESl7vNe1yChAioIXqTr6kd4zzmWIXjpApdYe/vsR+hDE9i
 SBKJasTesEC2sAuFkHlrYVzmG7y4YnJp0LiTi7TNKXreo+c8tUOXPKhiVWj9oLe0pQMx
 JobcGC/MdNzETqFTmPMf+PEWGgxzF+Yf/2FbgSskwXdNuuH320rgQBIewJTUNN8yZKnq
 JzCQ==
X-Gm-Message-State: AOAM531cHOK5BE5dB0kZ+2OR43qNfIn+oEpi67yoTkxVdLPtKdvwm//w
 R5s/7kR0ondd1cE8hLi3NK6YgM+QVh6B/qeqLA1GOw==
X-Google-Smtp-Source: ABdhPJwYStOCpJdbialfLNPCOOA0rjqsGTx2io8xZHjQfKGzLN42ca8K9dAQ7+tv9moZ2UyZKvsrZMIwqeEoHbVZuoQ=
X-Received: by 2002:a6b:9187:: with SMTP id t129mr987305iod.30.1603352889352; 
 Thu, 22 Oct 2020 00:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1602864634-23489-3-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1602864634-23489-3-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Fei Shao <fshao@google.com>
Date: Thu, 22 Oct 2020 15:47:33 +0800
Message-ID: <CAC=S1ng=7zfSxRshVLtzzSyse3zvXajbZhydocgViS5Rj5o+CA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] spmi: mediatek: Add support for MT6873/8192
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_034813_048596_7BE3A129 
X-CRM114-Status: GOOD (  30.61  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 17, 2020 at 12:11 AM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> add spmi support for MT6873/8192.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/spmi/Kconfig         |   9 +
>  drivers/spmi/Makefile        |   1 +
>  drivers/spmi/spmi-mtk-pmif.c | 490 +++++++++++++++++++++++++++++++++++
>  3 files changed, 500 insertions(+)
>  create mode 100644 drivers/spmi/spmi-mtk-pmif.c
>
> diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> index a53bad541f1a..418848840999 100644
> --- a/drivers/spmi/Kconfig
> +++ b/drivers/spmi/Kconfig
> @@ -25,4 +25,13 @@ config SPMI_MSM_PMIC_ARB
>           This is required for communicating with Qualcomm PMICs and
>           other devices that have the SPMI interface.
>
> +config SPMI_MTK_PMIF
> +       tristate "Mediatek SPMI Controller (PMIC Arbiter)"
> +       help
> +         If you say yes to this option, support will be included for the
> +         built-in SPMI PMIC Arbiter interface on Mediatek family
> +         processors.
> +
> +         This is required for communicating with Mediatek PMICs and
> +         other devices that have the SPMI interface.
>  endif
> diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
> index 55a94cadeffe..91f303b96925 100644
> --- a/drivers/spmi/Makefile
> +++ b/drivers/spmi/Makefile
> @@ -5,3 +5,4 @@
>  obj-$(CONFIG_SPMI)     += spmi.o
>
>  obj-$(CONFIG_SPMI_MSM_PMIC_ARB)        += spmi-pmic-arb.o
> +obj-$(CONFIG_SPMI_MTK_PMIF)    += spmi-mtk-pmif.o
> \ No newline at end of file
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> new file mode 100644
> index 000000000000..1b8b628fc9b6
> --- /dev/null
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -0,0 +1,490 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/spmi.h>
> +
> +#define SWINF_IDLE     0x00
> +#define SWINF_WFVLDCLR 0x06
> +
> +#define GET_SWINF(x)   (((x) >> 1) & 0x7)
> +
> +#define PMIF_CMD_REG_0         0
> +#define PMIF_CMD_REG           1
> +#define PMIF_CMD_EXT_REG       2
> +#define PMIF_CMD_EXT_REG_LONG  3
> +
> +#define PMIF_DELAY_US   10
> +#define PMIF_TIMEOUT    (10 * 1000)
> +
> +#define PMIF_CHAN_OFFSET 0x5
> +
> +#define SPMI_OP_ST_BUSY 1
> +
> +struct ch_reg {
> +       u32 ch_sta;
> +       u32 wdata;
> +       u32 rdata;
> +       u32 ch_send;
> +       u32 ch_rdy;
> +};
> +
> +struct pmif {
> +       void __iomem    *base;
> +       const u32       *regs;
> +       void __iomem    *spmimst_base;
> +       const u32       *spmimst_regs;
> +       u32             soc_chan;
> +       int             grpid;
> +       raw_spinlock_t  lock;
> +       struct clk      *pmif_sys_ck;
> +       struct clk      *pmif_tmr_ck;
> +       struct clk      *spmimst_clk_mux;
> +       struct ch_reg chan;
Nit: use tab to align.

> +};
> +
> +enum pmif_regs {
> +       PMIF_INIT_DONE,
> +       PMIF_INF_EN,
> +       PMIF_ARB_EN,
> +       PMIF_CMDISSUE_EN,
> +       PMIF_TIMER_CTRL,
> +       PMIF_SPI_MODE_CTRL,
> +       PMIF_IRQ_EVENT_EN_0,
> +       PMIF_IRQ_FLAG_0,
> +       PMIF_IRQ_CLR_0,
> +       PMIF_IRQ_EVENT_EN_1,
> +       PMIF_IRQ_FLAG_1,
> +       PMIF_IRQ_CLR_1,
> +       PMIF_IRQ_EVENT_EN_2,
> +       PMIF_IRQ_FLAG_2,
> +       PMIF_IRQ_CLR_2,
> +       PMIF_IRQ_EVENT_EN_3,
> +       PMIF_IRQ_FLAG_3,
> +       PMIF_IRQ_CLR_3,
> +       PMIF_IRQ_EVENT_EN_4,
> +       PMIF_IRQ_FLAG_4,
> +       PMIF_IRQ_CLR_4,
> +       PMIF_WDT_EVENT_EN_0,
> +       PMIF_WDT_FLAG_0,
> +       PMIF_WDT_EVENT_EN_1,
> +       PMIF_WDT_FLAG_1,
> +       PMIF_SWINF_0_STA,
> +       PMIF_SWINF_0_WDATA_31_0,
> +       PMIF_SWINF_0_RDATA_31_0,
> +       PMIF_SWINF_0_ACC,
> +       PMIF_SWINF_0_VLD_CLR,
> +       PMIF_SWINF_1_STA,
> +       PMIF_SWINF_1_WDATA_31_0,
> +       PMIF_SWINF_1_RDATA_31_0,
> +       PMIF_SWINF_1_ACC,
> +       PMIF_SWINF_1_VLD_CLR,
> +       PMIF_SWINF_2_STA,
> +       PMIF_SWINF_2_WDATA_31_0,
> +       PMIF_SWINF_2_RDATA_31_0,
> +       PMIF_SWINF_2_ACC,
> +       PMIF_SWINF_2_VLD_CLR,
> +       PMIF_SWINF_3_STA,
> +       PMIF_SWINF_3_WDATA_31_0,
> +       PMIF_SWINF_3_RDATA_31_0,
> +       PMIF_SWINF_3_ACC,
> +       PMIF_SWINF_3_VLD_CLR,
> +};
> +
> +static const u32 mt6873_regs[] = {
> +       [PMIF_INIT_DONE] =      0x0000,
> +       [PMIF_INF_EN] =         0x0024,
> +       [PMIF_ARB_EN] =         0x0150,
> +       [PMIF_CMDISSUE_EN] =    0x03B4,
> +       [PMIF_TIMER_CTRL] =     0x03E0,
> +       [PMIF_SPI_MODE_CTRL] =  0x0400,
> +       [PMIF_IRQ_EVENT_EN_0] = 0x0418,
> +       [PMIF_IRQ_FLAG_0] =     0x0420,
> +       [PMIF_IRQ_CLR_0] =      0x0424,
> +       [PMIF_IRQ_EVENT_EN_1] = 0x0428,
> +       [PMIF_IRQ_FLAG_1] =     0x0430,
> +       [PMIF_IRQ_CLR_1] =      0x0434,
> +       [PMIF_IRQ_EVENT_EN_2] = 0x0438,
> +       [PMIF_IRQ_FLAG_2] =     0x0440,
> +       [PMIF_IRQ_CLR_2] =      0x0444,
> +       [PMIF_IRQ_EVENT_EN_3] = 0x0448,
> +       [PMIF_IRQ_FLAG_3] =     0x0450,
> +       [PMIF_IRQ_CLR_3] =      0x0454,
> +       [PMIF_IRQ_EVENT_EN_4] = 0x0458,
> +       [PMIF_IRQ_FLAG_4] =     0x0460,
> +       [PMIF_IRQ_CLR_4] =      0x0464,
> +       [PMIF_WDT_EVENT_EN_0] = 0x046C,
> +       [PMIF_WDT_FLAG_0] =     0x0470,
> +       [PMIF_WDT_EVENT_EN_1] = 0x0474,
> +       [PMIF_WDT_FLAG_1] =     0x0478,
> +       [PMIF_SWINF_0_ACC] =    0x0C00,
> +       [PMIF_SWINF_0_WDATA_31_0] =     0x0C04,
> +       [PMIF_SWINF_0_RDATA_31_0] =     0x0C14,
> +       [PMIF_SWINF_0_VLD_CLR] =        0x0C24,
> +       [PMIF_SWINF_0_STA] =    0x0C28,
> +       [PMIF_SWINF_1_ACC] =    0x0C40,
> +       [PMIF_SWINF_1_WDATA_31_0] =     0x0C44,
> +       [PMIF_SWINF_1_RDATA_31_0] =     0x0C54,
> +       [PMIF_SWINF_1_VLD_CLR] =        0x0C64,
> +       [PMIF_SWINF_1_STA] =    0x0C68,
> +       [PMIF_SWINF_2_ACC] =    0x0C80,
> +       [PMIF_SWINF_2_WDATA_31_0] =     0x0C84,
> +       [PMIF_SWINF_2_RDATA_31_0] =     0x0C94,
> +       [PMIF_SWINF_2_VLD_CLR] =        0x0CA4,
> +       [PMIF_SWINF_2_STA] =    0x0CA8,
> +       [PMIF_SWINF_3_ACC] =    0x0CC0,
> +       [PMIF_SWINF_3_WDATA_31_0] =     0x0CC4,
> +       [PMIF_SWINF_3_RDATA_31_0] =     0x0CD4,
> +       [PMIF_SWINF_3_VLD_CLR] =        0x0CE4,
> +       [PMIF_SWINF_3_STA] =    0x0CE8,
> +};
> +
> +enum spmi_regs {
> +       SPMI_OP_ST_CTRL,
> +       SPMI_GRP_ID_EN,
> +       SPMI_OP_ST_STA,
> +       SPMI_MST_SAMPL,
> +       SPMI_MST_REQ_EN,
> +       SPMI_REC_CTRL,
> +       SPMI_REC0,
> +       SPMI_REC1,
> +       SPMI_REC2,
> +       SPMI_REC3,
> +       SPMI_REC4,
> +       SPMI_MST_DBG,
> +};
> +
> +static const u32 mt6873_spmi_regs[] = {
> +       [SPMI_OP_ST_CTRL] =     0x0000,
> +       [SPMI_GRP_ID_EN] =      0x0004,
> +       [SPMI_OP_ST_STA] =      0x0008,
> +       [SPMI_MST_SAMPL] =      0x000c,
> +       [SPMI_MST_REQ_EN] =     0x0010,
> +       [SPMI_REC_CTRL] =       0x0040,
> +       [SPMI_REC0] =           0x0044,
> +       [SPMI_REC1] =           0x0048,
> +       [SPMI_REC2] =           0x004c,
> +       [SPMI_REC3] =           0x0050,
> +       [SPMI_REC4] =           0x0054,
> +       [SPMI_MST_DBG] =        0x00fc,
> +};
> +
> +static u32 pmif_readl(struct pmif *arb, enum pmif_regs reg)
> +{
> +       return readl(arb->base + arb->regs[reg]);
> +}
> +
> +static void pmif_writel(struct pmif *arb, u32 val, enum pmif_regs reg)
> +{
> +       writel(val, arb->base + arb->regs[reg]);
> +}
> +
> +static void mtk_spmi_writel(struct pmif *arb, u32 val, enum spmi_regs reg)
> +{
> +       writel(val, arb->spmimst_base + arb->spmimst_regs[reg]);
> +}
> +
> +static bool pmif_is_fsm_vldclr(struct pmif *arb)
> +{
> +       u32 reg_rdata;
> +
> +       reg_rdata = pmif_readl(arb, arb->chan.ch_sta);
> +       return GET_SWINF(reg_rdata) == SWINF_WFVLDCLR;
> +}
> +
> +static int pmif_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
> +{
> +       struct pmif *arb = spmi_controller_get_drvdata(ctrl);
> +       u32 rdata;
> +       u8 cmd;
> +       int ret;
> +
Validate arb and sid (like what pmif_spmi_read_cmd() does).

> +       /* Check the opcode */
> +       if (opc == SPMI_CMD_RESET)
> +               cmd = 0;
> +       else if (opc == SPMI_CMD_SLEEP)
> +               cmd = 1;
> +       else if (opc == SPMI_CMD_SHUTDOWN)
> +               cmd = 2;
> +       else if (opc == SPMI_CMD_WAKEUP)
> +               cmd = 3;
> +       else
> +               return -EINVAL;
> +
> +       mtk_spmi_writel(arb, (cmd << 0x4) | sid, SPMI_OP_ST_CTRL);
> +       ret = readl_poll_timeout_atomic(arb->spmimst_base + arb->spmimst_regs[SPMI_OP_ST_STA],
> +                                       rdata, (rdata & SPMI_OP_ST_BUSY) == SPMI_OP_ST_BUSY,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0)
> +               dev_err(&ctrl->dev, "timeout, err = %d\r\n", ret);
Remove "\r"

> +
> +       return ret;
> +}
> +
> +static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +                             u16 addr, u8 *buf, size_t len)
> +{
> +       struct pmif *arb = spmi_controller_get_drvdata(ctrl);
> +       struct ch_reg *inf_reg = NULL;
> +       int ret;
> +       u32 data = 0;
> +       u8 bc = len - 1;
> +       unsigned long flags;
> +
> +       /* Check for argument validation. */
> +       if (sid & ~(0xf))
> +               return -EINVAL;
> +
> +       if (!arb)
> +               return -EINVAL;
Add dev_err()s to explain why -EINVAL is returned (for both checkers).

> +
> +       inf_reg = &arb->chan;
> +       /* Check the opcode */
> +       if (opc >= 0x60 && opc <= 0x7f)
> +               opc = PMIF_CMD_REG;
> +       else if (opc >= 0x20 && opc <= 0x2f)
> +               opc = PMIF_CMD_EXT_REG_LONG;
> +       else if (opc >= 0x38 && opc <= 0x3f)
> +               opc = PMIF_CMD_EXT_REG_LONG;
> +       else
> +               return -EINVAL;
> +
> +       raw_spin_lock_irqsave(&arb->lock, flags);
> +       /* Wait for Software Interface FSM state to be IDLE. */
> +       ret = readl_poll_timeout_atomic(arb->base + arb->regs[inf_reg->ch_sta],
> +                                       data, GET_SWINF(data) == SWINF_IDLE,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0) {
> +               /* set channel ready if the data has transferred */
> +               if (pmif_is_fsm_vldclr(arb))
> +                       pmif_writel(arb, 1, inf_reg->ch_rdy);
> +               raw_spin_unlock_irqrestore(&arb->lock, flags);
> +               return ret;
There are 3 raw_spin_unlock_irqrestore()s, consider using goto?
(and dev_err() to say we failed to wait for SWINF_IDLE)

> +       }
> +
> +       /* Send the command. */
> +       pmif_writel(arb,
> +                   (opc << 30) | (sid << 24) | (bc << 16) | addr,
> +                   inf_reg->ch_send);
> +
> +       /* Wait for Software Interface FSM state to be WFVLDCLR,
> +        *
> +        * read the data and clear the valid flag.
> +        */
> +       ret = readl_poll_timeout_atomic(arb->base + arb->regs[inf_reg->ch_sta],
> +                                       data, GET_SWINF(data) == SWINF_WFVLDCLR,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0) {
Add dev_err().

> +               raw_spin_unlock_irqrestore(&arb->lock, flags);
> +               return ret;
> +       }
> +
> +       data = pmif_readl(arb, inf_reg->rdata);
> +       memcpy(buf, &data, (bc & 3) + 1);
> +       pmif_writel(arb, 1, inf_reg->ch_rdy);
> +       raw_spin_unlock_irqrestore(&arb->lock, flags);
> +
> +       return 0;
> +}
> +
> +static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +                              u16 addr, const u8 *buf, size_t len)
> +{
Please refer to the comments in pmif_spmi_read_cmd().

> +       struct pmif *arb = spmi_controller_get_drvdata(ctrl);
> +       struct ch_reg *inf_reg = NULL;
> +       int ret;
> +       u32 data = 0;
> +       u8 bc = len - 1;
> +       unsigned long flags = 0;
> +
> +       /* Check for argument validation. */
> +       if (sid & ~(0xf))
> +               return -EINVAL;
> +
> +       if (!arb)
> +               return -EINVAL;
> +
> +       inf_reg = &arb->chan;
> +
> +       /* Check the opcode */
> +       if (opc >= 0x40 && opc <= 0x5F)
> +               opc = PMIF_CMD_REG;
> +       else if (opc <= 0x0F)
> +               opc = PMIF_CMD_EXT_REG_LONG;
> +       else if (opc >= 0x30 && opc <= 0x37)
> +               opc = PMIF_CMD_EXT_REG_LONG;
> +       else if (opc >= 0x80)
> +               opc = PMIF_CMD_REG_0;
> +       else
> +               return -EINVAL;
> +
> +       raw_spin_lock_irqsave(&arb->lock, flags);
> +       /* Wait for Software Interface FSM state to be IDLE. */
> +       ret = readl_poll_timeout_atomic(arb->base + arb->regs[inf_reg->ch_sta],
> +                                       data, GET_SWINF(data) == SWINF_IDLE,
> +                                       PMIF_DELAY_US, PMIF_TIMEOUT);
> +       if (ret < 0) {
> +               /* set channel ready if the data has transferred */
> +               if (pmif_is_fsm_vldclr(arb))
> +                       pmif_writel(arb, 1, inf_reg->ch_rdy);
> +               raw_spin_unlock_irqrestore(&arb->lock, flags);
> +               return ret;
> +       }
> +
> +       /* Set the write data. */
> +       memcpy(&data, buf, (bc & 3) + 1);
> +       pmif_writel(arb, data, inf_reg->wdata);
> +
> +       /* Send the command. */
> +       pmif_writel(arb,
> +                   (opc << 30) | BIT(29) | (sid << 24) | (bc << 16) | addr,
> +                   inf_reg->ch_send);
> +       raw_spin_unlock_irqrestore(&arb->lock, flags);
> +
> +       return 0;
> +}
> +
> +static struct pmif mt6873_pmif_arb[] = {
> +       {
> +               .regs = mt6873_regs,
> +               .spmimst_regs = mt6873_spmi_regs,
> +               .soc_chan = 2,
> +       },
> +};
> +
> +static int mtk_spmi_probe(struct platform_device *pdev)
> +{
> +       struct pmif *arb;
> +       struct resource *res;
> +       struct spmi_controller *ctrl;
> +       int err = 0;
> +
> +       ctrl = spmi_controller_alloc(&pdev->dev, sizeof(*arb));
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->cmd = pmif_arb_cmd;
> +       ctrl->read_cmd = pmif_spmi_read_cmd;
> +       ctrl->write_cmd = pmif_spmi_write_cmd;
> +
> +       /* re-assign of_id->data */
> +       spmi_controller_set_drvdata(ctrl, (void *)of_device_get_match_data(&pdev->dev));
> +       arb = spmi_controller_get_drvdata(ctrl);
Validate arb is not NULL.

> +
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pmif");
Validate res.

> +       arb->base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(arb->base)) {
dev_err().

> +               err = PTR_ERR(arb->base);
> +               goto err_put_ctrl;
> +       }
> +
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "spmimst");
Same here.

> +       arb->spmimst_base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(arb->spmimst_base)) {
dev_err().

> +               err = PTR_ERR(arb->spmimst_base);
> +               goto err_put_ctrl;
> +       }
;> +
> +       arb->pmif_sys_ck = devm_clk_get(&pdev->dev, "pmif_sys_ck");
> +       if (IS_ERR(arb->pmif_sys_ck)) {
> +               dev_err(&pdev->dev, "[%s] Failed to get ap clock: %ld\n",
> +                       __func__, PTR_ERR(arb->pmif_sys_ck));
err = PTR_ERR(arb->pmif_sys_ck);

> +               goto err_put_ctrl;
> +       }
> +
> +       arb->pmif_tmr_ck = devm_clk_get(&pdev->dev, "pmif_tmr_ck");
> +       if (IS_ERR(arb->pmif_tmr_ck)) {
> +               dev_err(&pdev->dev, "[%s] Failed to get tmr clock: %ld\n",
> +                       __func__, PTR_ERR(arb->pmif_tmr_ck));
err = PTR_ERR(arb->pmif_tmr_ck);

> +               goto err_put_ctrl;
> +       }
> +
> +       arb->spmimst_clk_mux = devm_clk_get(&pdev->dev, "spmimst_clk_mux");
> +       if (IS_ERR(arb->spmimst_clk_mux)) {
> +               dev_err(&pdev->dev, "[%s] Failed to get clock: %ld\n",
Failed to get "spmi master" clock.

> +                       __func__, PTR_ERR(arb->spmimst_clk_mux));
err = PTR_ERR(arb->spmimst_clk_mux);

> +               goto err_put_ctrl;
> +       }
> +
> +       err = clk_prepare_enable(arb->pmif_sys_ck);
> +       if (err) {
> +               dev_err(&pdev->dev, "[%s] Failed to enable ap clk.\n", __func__);
> +               goto err_put_ctrl;
> +       }
> +
> +       err = clk_prepare_enable(arb->pmif_tmr_ck);
> +       if (err) {
> +               dev_err(&pdev->dev, "[%s] Failed to enable tmr clk.\n", __func__);
> +               goto err_clk_1;
I'd prefer a more informative label e.g. err_disable_sys_ck.

> +       }
> +
> +       err = clk_prepare_enable(arb->spmimst_clk_mux);
> +       if (err) {
> +               dev_err(&pdev->dev, "[%s] Failed to enable spmi master clk.\n", __func__);
> +               goto err_clk_2;
Ditto.

> +       }
> +
> +       arb->chan.ch_sta = PMIF_SWINF_0_STA + (PMIF_CHAN_OFFSET * arb->soc_chan);
> +       arb->chan.wdata = PMIF_SWINF_0_WDATA_31_0 + (PMIF_CHAN_OFFSET * arb->soc_chan);
> +       arb->chan.rdata = PMIF_SWINF_0_RDATA_31_0 + (PMIF_CHAN_OFFSET * arb->soc_chan);
> +       arb->chan.ch_send = PMIF_SWINF_0_ACC + (PMIF_CHAN_OFFSET * arb->soc_chan);
> +       arb->chan.ch_rdy = PMIF_SWINF_0_VLD_CLR + (PMIF_CHAN_OFFSET * arb->soc_chan);
Define "(PMIF_CHAN_OFFSET * arb->soc_chan)" as a variable (or a macro).


> +
> +       raw_spin_lock_init(&arb->lock);
> +
> +       platform_set_drvdata(pdev, ctrl);
> +
> +       err = spmi_controller_add(ctrl);
> +       if (err)
> +               goto err_domain_remove;
> +
> +       return 0;
> +
> +err_domain_remove:
> +       clk_disable_unprepare(arb->spmimst_clk_mux);
> +err_clk_2:
> +       clk_disable_unprepare(arb->pmif_tmr_ck);
> +err_clk_1:
> +       clk_disable_unprepare(arb->pmif_sys_ck);
> +err_put_ctrl:
> +       spmi_controller_put(ctrl);
> +       return err;
> +}
> +
> +static int mtk_spmi_remove(struct platform_device *pdev)
> +{
> +       struct spmi_controller *ctrl = platform_get_drvdata(pdev);
> +
> +       spmi_controller_remove(ctrl);
> +       spmi_controller_put(ctrl);
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_spmi_match_table[] = {
> +       {
> +               .compatible = "mediatek,mt6873-spmi",
> +               .data = &mt6873_pmif_arb,
> +       }, {
> +               /* sentinel */
> +       },
> +};
> +MODULE_DEVICE_TABLE(of, mtk_spmi_match_table);
> +
> +static struct platform_driver mtk_spmi_driver = {
> +       .driver         = {
> +               .name   = "spmi-mtk",
> +               .of_match_table = of_match_ptr(mtk_spmi_match_table),
> +       },
> +       .probe          = mtk_spmi_probe,
> +       .remove         = mtk_spmi_remove,
> +};
> +module_platform_driver(mtk_spmi_driver);
> +
> +MODULE_AUTHOR("Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>");
> +MODULE_DESCRIPTION("MediaTek SPMI Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
