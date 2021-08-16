Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5FDC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 12:12:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 383C463219
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 12:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 383C463219
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZfucw+bTFG97WBO6BQtHqYudkpr29Q9sDqJEUl1F6E=; b=PmqeABKuR8Iy8y
	0/JmXHWK0/7PgvVZm+zepQOIJP2RwbAnpGg9pY51QWBb9oRG1WGupa6bY3VIbEzBpmw37daF1o6fY
	/SlmwFk+ELPonHjZvb03BwwDlUntlOw7xf6SaZnhACgqHqupNlQSjrawnOfy/IwMnbcLz/NN5Mf6r
	NQXRMhAKZKhMe56h+DicAdAArJJBA70Z/XWv1Q6rjsZlFrmM/apJLh4bzF9VrQQlFK9orkCWibuiY
	I2nv6dFhElg7dvo8gtHLd2qpsZyhEcIuX0BU4M6U4FI1ewvwGl3bfd5n/534T32zkaNkyPnrDXkta
	JBJYoFSr/JijX//oBnMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFbTK-00GvRu-37; Mon, 16 Aug 2021 12:12:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFbT5-00GvQQ-90; Mon, 16 Aug 2021 12:11:55 +0000
X-UUID: b31474f86231490fa6d1827f547818ee-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kkysPn/5aJXvWrgV2Um/G5eKzXBq7Ohp9jMuEy/5iYQ=; 
 b=Fjqo8WY5cgB2jePVO0i542gfEym99HrP0JrThjvjeUrpf1HG5tX6ExGpoS0qX4jaY0eodyMVtT+2MOPhMmEKwfEWvwsuh+2Js21ZqOfbKWqLNLza2rUKXLMVhAqEsWmTrcBzavSfo2uRFgw88Qw9pIDH3Y1JGycIdN6Y7MR91FA=;
X-UUID: b31474f86231490fa6d1827f547818ee-20210816
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1483893401; Mon, 16 Aug 2021 05:11:41 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 05:11:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 20:11:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 20:11:38 +0800
Message-ID: <1629115898.29907.3.camel@mtksdaap41>
Subject: Re: [PATCH v10 3/5] spmi: mediatek: Add support for MT6873/8192
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 16 Aug 2021 20:11:38 +0800
In-Reply-To: <162853170949.1975443.12492156194100139076@swboyd.mtv.corp.google.com>
References: <1627972461-2627-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1627972461-2627-4-git-send-email-hsin-hsiung.wang@mediatek.com>
 <162853170949.1975443.12492156194100139076@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_051151_373279_09C1F510 
X-CRM114-Status: GOOD (  30.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 2021-08-09 at 10:55 -0700, Stephen Boyd wrote:
> Quoting Hsin-Hsiung Wang (2021-08-02 23:34:19)
> > diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> > new file mode 100644
> > index 000000000000..94c45d46ab0c
> > --- /dev/null
> > +++ b/drivers/spmi/spmi-mtk-pmif.c
> > @@ -0,0 +1,465 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (c) 2021 MediaTek Inc.
> > +
> > +#include <linux/clk.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> 
> include platform_device.h for the platform device driver that this is.
> 
Thanks for the commit, I will update it in the next patch.

> > +#include <linux/spmi.h>
> > +
> > +#define SWINF_IDLE     0x00
> > +#define SWINF_WFVLDCLR 0x06
> > +
> > +#define GET_SWINF(x)   (((x) >> 1) & 0x7)
> > +
> > +#define PMIF_CMD_REG_0         0
> > +#define PMIF_CMD_REG           1
> > +#define PMIF_CMD_EXT_REG       2
> > +#define PMIF_CMD_EXT_REG_LONG  3
> > +
> > +#define PMIF_DELAY_US   10
> > +#define PMIF_TIMEOUT_US (10 * 1000)
> > +
> > +#define PMIF_CHAN_OFFSET 0x5
> > +
> > +#define PMIF_MAX_CLKS  3
> > +
> > +#define SPMI_OP_ST_BUSY 1
> > +
> > +struct ch_reg {
> > +       u32 ch_sta;
> > +       u32 wdata;
> > +       u32 rdata;
> > +       u32 ch_send;
> > +       u32 ch_rdy;
> > +};
> > +
> > +struct pmif_data {
> > +       const u32       *regs;
> > +       const u32       *spmimst_regs;
> > +       u32     soc_chan;
> > +};
> > +
> > +struct pmif {
> > +       void __iomem    *base;
> > +       void __iomem    *spmimst_base;
> > +       struct ch_reg   chan;
> > +       struct clk_bulk_data clks[PMIF_MAX_CLKS];
> > +       u32 nclks;
> 
> size_t? Surely 32-bits isn't important.
> 

Thanks. I will use size_t in the next patch.

> > +       const struct pmif_data *data;
> > +};
> > +
> > +static const char * const pmif_clock_names[] = {
> > +       "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux",
> > +};
> [...]
> > +
> > +static bool pmif_is_fsm_vldclr(struct pmif *arb)
> > +{
> > +       u32 reg_rdata;
> > +
> > +       reg_rdata = pmif_readl(arb, arb->chan.ch_sta);
> 
> Newline here please.
> 

Thanks, I will update it in the next patch.

> > +       return GET_SWINF(reg_rdata) == SWINF_WFVLDCLR;
> > +}
> > +
> > +static int pmif_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
> > +{
> > +       struct pmif *arb = spmi_controller_get_drvdata(ctrl);
> > +       u32 rdata, cmd;
> > +       int ret;
> > +
> > +       /* Check the opcode */
> > +       if (opc < SPMI_CMD_RESET || opc > SPMI_CMD_WAKEUP)
> > +               return -EINVAL;
> > +
> > +       cmd = opc - SPMI_CMD_RESET;
> > +
> > +       mtk_spmi_writel(arb, (cmd << 0x4) | sid, SPMI_OP_ST_CTRL);
> > +       ret = readl_poll_timeout_atomic(arb->spmimst_base + arb->data->spmimst_regs[SPMI_OP_ST_STA],
> > +                                       rdata, (rdata & SPMI_OP_ST_BUSY) == SPMI_OP_ST_BUSY,
> > +                                       PMIF_DELAY_US, PMIF_TIMEOUT_US);
> > +       if (ret < 0)
> > +               dev_err(&ctrl->dev, "timeout, err = %d\n", ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> > +                             u16 addr, u8 *buf, size_t len)
> > +{
> > +       struct pmif *arb = spmi_controller_get_drvdata(ctrl);
> > +       struct ch_reg *inf_reg;
> > +       int ret;
> > +       u32 data, cmd;
> > +
> > +       /* Check for argument validation. */
> > +       if (sid & ~0xf) {
> > +               dev_err(&ctrl->dev, "exceed the max slv id\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (len > 4) {
> > +               dev_err(&ctrl->dev, "pmif supports 1..4 bytes per trans, but:%zu requested", len);
> 
> Missing newline
> 

Thanks, I will update it in the next patch.

> > +               return -EINVAL;
> > +       }
> > +
> > +       if (opc >= 0x60 && opc <= 0x7f)
> > +               opc = PMIF_CMD_REG;
> > +       else if ((opc >= 0x20 && opc <= 0x2f) || (opc >= 0x38 && opc <= 0x3f))
> > +               opc = PMIF_CMD_EXT_REG_LONG;
> > +       else
> > +               return -EINVAL;
> > +
> > +       /* Wait for Software Interface FSM state to be IDLE. */
> > +       inf_reg = &arb->chan;
> > +       ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
> > +                                       data, GET_SWINF(data) == SWINF_IDLE,
> > +                                       PMIF_DELAY_US, PMIF_TIMEOUT_US);
> > +       if (ret < 0) {
> > +               /* set channel ready if the data has transferred */
> > +               if (pmif_is_fsm_vldclr(arb))
> > +                       pmif_writel(arb, 1, inf_reg->ch_rdy);
> > +               dev_err(&ctrl->dev, "failed to wait for SWINF_IDLE\n");
> > +               goto out;
> > +       }
> > +
> > +       /* Send the command. */
> > +       cmd = (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
> > +       pmif_writel(arb, cmd, inf_reg->ch_send);
> > +
> > +       /*
> > +        * Wait for Software Interface FSM state to be WFVLDCLR,
> > +        * read the data and clear the valid flag.
> > +        */
> > +       ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
> > +                                       data, GET_SWINF(data) == SWINF_WFVLDCLR,
> > +                                       PMIF_DELAY_US, PMIF_TIMEOUT_US);
> > +       if (ret < 0) {
> > +               dev_err(&ctrl->dev, "failed to wait for SWINF_WFVLDCLR\n");
> > +               goto out;
> > +       }
> > +
> > +       data = pmif_readl(arb, inf_reg->rdata);
> > +       memcpy(buf, &data, len);
> > +       pmif_writel(arb, 1, inf_reg->ch_rdy);
> > +
> > +out:
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       return 0;
> > +}
> > +
> > +static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> > +                              u16 addr, const u8 *buf, size_t len)
> > +{
> > +       struct pmif *arb = spmi_controller_get_drvdata(ctrl);
> > +       struct ch_reg *inf_reg;
> > +       int ret;
> > +       u32 data, cmd;
> > +
> > +       if (len > 4) {
> > +               dev_err(&ctrl->dev, "pmif supports 1..4 bytes per trans, but:%zu requested", len);
> 
> Missing newline
> 

Thanks, I will update it in the next patch.

> > +               return -EINVAL;
> > +       }
> > +
> > +       /* Check the opcode */
> > +       if (opc >= 0x40 && opc <= 0x5F)
> > +               opc = PMIF_CMD_REG;
> > +       else if ((opc <= 0xF) || (opc >= 0x30 && opc <= 0x37))
> > +               opc = PMIF_CMD_EXT_REG_LONG;
> > +       else if (opc >= 0x80)
> > +               opc = PMIF_CMD_REG_0;
> > +       else
> > +               return -EINVAL;
> > +
> > +       /* Wait for Software Interface FSM state to be IDLE. */
> > +       inf_reg = &arb->chan;
> > +       ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
> > +                                       data, GET_SWINF(data) == SWINF_IDLE,
> > +                                       PMIF_DELAY_US, PMIF_TIMEOUT_US);
> > +       if (ret < 0) {
> > +               /* set channel ready if the data has transferred */
> > +               if (pmif_is_fsm_vldclr(arb))
> > +                       pmif_writel(arb, 1, inf_reg->ch_rdy);
> > +               dev_err(&ctrl->dev, "failed to wait for SWINF_IDLE\n");
> > +               goto out;
> > +       }
> > +
> > +       /* Set the write data. */
> > +       memcpy(&data, buf, len);
> > +       pmif_writel(arb, data, inf_reg->wdata);
> > +
> > +       /* Send the command. */
> > +       cmd = (opc << 30) | BIT(29) | (sid << 24) | ((len - 1) << 16) | addr;
> > +       pmif_writel(arb, cmd, inf_reg->ch_send);
> > +
> > +out:
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       return 0;
> 
> Simplify to 
> 
> 	out:
> 		return ret;
> 

Thanks, I will update it in the next patch.

> > +}
> > +
> > +static const struct pmif_data mt6873_pmif_arb = {
> > +       .regs = mt6873_regs,
> > +       .spmimst_regs = mt6873_spmi_regs,
> > +       .soc_chan = 2,
> > +};
> > +
> > +static int mtk_spmi_probe(struct platform_device *pdev)
> > +{
> > +       struct pmif *arb;
> > +       struct spmi_controller *ctrl;
> > +       int err, i;
> > +       u32 chan_offset;
> > +
> > +       ctrl = spmi_controller_alloc(&pdev->dev, sizeof(*arb));
> > +       if (!ctrl)
> > +               return -ENOMEM;
> > +
> > +       arb = spmi_controller_get_drvdata(ctrl);
> > +       arb->data = of_device_get_match_data(&pdev->dev);
> 
> Use device_get_match_data() instead please.
> 

Thanks, I will change to use device_get_match_data in the next patch.

> > +       if (!arb->data) {
> > +               err = -EINVAL;
> > +               dev_err(&pdev->dev, "Cannot get drv_data\n");
> > +               goto err_put_ctrl;
> > +       }
> > +
> > +       arb->base = devm_platform_ioremap_resource_byname(pdev, "pmif");
> > +       if (IS_ERR(arb->base)) {
> > +               err = PTR_ERR(arb->base);
> > +               dev_err(&pdev->dev, "pmif failed to get the remappped memory\n");
> 
> Please drop print as the API already prints errors for every problem.
> 

Thanks, I will update it in the next patch.

> > +               goto err_put_ctrl;
> > +       }
> > +
> > +       arb->spmimst_base = devm_platform_ioremap_resource_byname(pdev, "spmimst");
> > +       if (IS_ERR(arb->spmimst_base)) {
> > +               err = PTR_ERR(arb->spmimst_base);
> > +               dev_err(&pdev->dev, "spmimst failed to get the remappped memory\n");
> 
> Please drop print as the API already prints errors for every problem.
> 

Thanks, I will update it in the next patch.

> > +               goto err_put_ctrl;
> > +       }
> > +
> > +       arb->nclks = ARRAY_SIZE(pmif_clock_names);
> > +       if (arb->nclks > PMIF_MAX_CLKS) {
> > +               err = -EINVAL;
> > +               dev_err(&pdev->dev, "exceed the max clock numbers\n");
> 
> Do we really care? The dt schema should be checking this instead of the
> driver.
> 

Thanks, I will remove the check in the next patch.

> > +               goto err_put_ctrl;
> > +       }
> > +
> > +       for (i = 0; i < arb->nclks; i++)
> > +               arb->clks[i].id = pmif_clock_names[i];
> > +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
