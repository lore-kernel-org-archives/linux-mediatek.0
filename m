Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621FCC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 04:36:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1DE60FF1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 04:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1DE60FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAXL6dnZVDRSU/GNlyAD1bLhYn1V6zvHRhIobehtVcc=; b=e1VO6ilnUi/C/B
	vlv9xl0iTW2m8AcVcKriLcnfLTYxVVyWGyIOAGN/yLpKpj/jAYoJowd32FEe5CIv8B3HAW3m4bIHU
	SoQrQq8vY/nPM6/kTziGnHFP+ZPpo2moAcg/vFZN1HskbsnYwa9gSTpYWbqEJMoHgtgQXaM7TQ6i5
	yzg/kbdmW1AsTfy/XDV3ucSWr5gUWTI3LZSwGtnfXmeLjOFGkNKONA/VREkkFnHU3VgED1Vd+S+0q
	p5ZL8WEcWEAw2K5Zd2Bh0kdOzpehXWJ/M3wHpaWoFEvHmc6WNxhb3dE3I9G2H0ovrTFRbsnIMKNwB
	X/MVIpKcB8L8EY9t6bXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2nfg-005rrT-Uv; Mon, 12 Jul 2021 04:35:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2nfd-005rqQ-4S; Mon, 12 Jul 2021 04:35:55 +0000
X-UUID: 8556ba77bfbd4e688517a62fa00ae288-20210711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hrbvRGC7OU+XT0g/Z/h59hrTZ0pUIiKb8kUnknC9BKA=; 
 b=eVrUKKHlW+ExTLAMh+v+IPKG+IDbx4AlOjZbncMzaCvt1G0NLiSD3DudqLKGDsH4nsCbNj0tKvvQeRjPvfXLOIP4DuT3rHMSfvOI00ttS5hDdz5XdzjFOTak2NUt4LoIocn7E81/i+gnwTJ4EN3I22CGBSmErh7YFh0UGcN+kaQ=;
X-UUID: 8556ba77bfbd4e688517a62fa00ae288-20210711
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1394492978; Sun, 11 Jul 2021 21:35:51 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Jul 2021 21:35:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 12:35:48 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 12:35:48 +0800
Message-ID: <c05485ad5db717afc8abb5070b33611c4d6a156f.camel@mediatek.com>
Subject: Re: [PATCH 05/22] clk: mediatek: Add MT8195 audio clock support
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat
 <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Jul 2021 12:35:47 +0800
In-Reply-To: <CAGXv+5FRc_hj03aqW-3XqqP5FpLX7zGwZ79-473a_HNOgrJQNA@mail.gmail.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-6-chun-jie.chen@mediatek.com>
 <YOLKxrJin5kkwiIl@google.com>
 <3b52d1781db5b67a04cdbd18852e0857f8b73a38.camel@mediatek.com>
 <CAGXv+5FRc_hj03aqW-3XqqP5FpLX7zGwZ79-473a_HNOgrJQNA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_213553_238964_3D66F3EE 
X-CRM114-Status: GOOD (  27.00  )
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

On Mon, 2021-07-12 at 10:09 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Mon, Jul 12, 2021 at 9:26 AM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
> > 
> > On Mon, 2021-07-05 at 17:03 +0800, Chen-Yu Tsai wrote:
> > > Hi,
> > > 
> > > On Thu, Jun 17, 2021 at 06:47:26AM +0800, Chun-Jie Chen wrote:
> > > > Add MT8195 audio clock provider
> > > > 
> > > > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > > ---
> > > >  drivers/clk/mediatek/Kconfig          |   6 +
> > > >  drivers/clk/mediatek/Makefile         |   1 +
> > > >  drivers/clk/mediatek/clk-mt8195-aud.c | 198
> > > > ++++++++++++++++++++++++++
> > > >  3 files changed, 205 insertions(+)
> > > >  create mode 100644 drivers/clk/mediatek/clk-mt8195-aud.c
> > > > 
> > > > diff --git a/drivers/clk/mediatek/Kconfig
> > > > b/drivers/clk/mediatek/Kconfig
> > > > index 6707aba3d500..e2bae9d490a4 100644
> > > > --- a/drivers/clk/mediatek/Kconfig
> > > > +++ b/drivers/clk/mediatek/Kconfig
> > > > @@ -588,6 +588,12 @@ config COMMON_CLK_MT8195
> > > >     help
> > > >       This driver supports MediaTek MT8195 basic clocks.
> > > > 
> > > > +config COMMON_CLK_MT8195_AUDSYS
> > > > +   bool "Clock driver for MediaTek MT8195 audsys"
> > > > +   depends on COMMON_CLK_MT8195
> > > > +   help
> > > > +     This driver supports MediaTek MT8195 audsys clocks.
> > > > +
> > > 
> > > The clock modules aren't shared between different chips, so
> > > either we
> > > enable support for all clock hardware in one chip or we don't. It
> > > doesn't make sense to support just some of them. So having just
> > > one
> > > Kconfig option and having all drivers under it is better.
> > > 
> > > >  config COMMON_CLK_MT8516
> > > >     bool "Clock driver for MediaTek MT8516"
> > > >     depends on ARCH_MEDIATEK || COMPILE_TEST
> > > > diff --git a/drivers/clk/mediatek/Makefile
> > > > b/drivers/clk/mediatek/Makefile
> > > > index f8002d8966e1..f27c04314186 100644
> > > > --- a/drivers/clk/mediatek/Makefile
> > > > +++ b/drivers/clk/mediatek/Makefile
> > > > @@ -81,5 +81,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) +=
> > > > clk-
> > > > mt8192-scp_adsp.o
> > > >  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
> > > >  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
> > > >  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195.o
> > > > +obj-$(CONFIG_COMMON_CLK_MT8195_AUDSYS) += clk-mt8195-aud.o
> > > >  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
> > > >  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> > > > diff --git a/drivers/clk/mediatek/clk-mt8195-aud.c
> > > > b/drivers/clk/mediatek/clk-mt8195-aud.c
> > > > new file mode 100644
> > > > index 000000000000..db5f80d41de0
> > > > --- /dev/null
> > > > +++ b/drivers/clk/mediatek/clk-mt8195-aud.c
> > > > @@ -0,0 +1,198 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +//
> > > > +// Copyright (c) 2021 MediaTek Inc.
> > > > +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > > +
> > > > +#include <linux/clk-provider.h>
> > > > +#include <linux/of_platform.h>
> > > > +#include <linux/platform_device.h>
> > > > +
> > > > +#include "clk-mtk.h"
> > > > +#include "clk-gate.h"
> > > > +
> > > > +#include <dt-bindings/clock/mt8195-clk.h>
> > > > +
> > > > +static const struct mtk_gate_regs aud0_cg_regs = {
> > > > +   .set_ofs = 0x0,
> > > > +   .clr_ofs = 0x0,
> > > > +   .sta_ofs = 0x0,
> > > > +};
> > > > +
> > > > +static const struct mtk_gate_regs aud1_cg_regs = {
> > > > +   .set_ofs = 0x10,
> > > > +   .clr_ofs = 0x10,
> > > > +   .sta_ofs = 0x10,
> > > > +};
> > > > +
> > > > +static const struct mtk_gate_regs aud2_cg_regs = {
> > > > +   .set_ofs = 0x14,
> > > > +   .clr_ofs = 0x14,
> > > > +   .sta_ofs = 0x14,
> > > > +};
> > > > +
> > > > +static const struct mtk_gate_regs aud3_cg_regs = {
> > > > +   .set_ofs = 0x18,
> > > > +   .clr_ofs = 0x18,
> > > > +   .sta_ofs = 0x18,
> > > > +};
> > > > +
> > > > +static const struct mtk_gate_regs aud4_cg_regs = {
> > > > +   .set_ofs = 0x4,
> > > > +   .clr_ofs = 0x4,
> > > > +   .sta_ofs = 0x4,
> > > > +};
> > > > +
> > > > +static const struct mtk_gate_regs aud5_cg_regs = {
> > > > +   .set_ofs = 0xc,
> > > > +   .clr_ofs = 0xc,
> > > > +   .sta_ofs = 0xc,
> > > > +};
> > > > +
> > > > +#define GATE_AUD0(_id, _name, _parent, _shift)
> > > > \
> > > > +   GATE_MTK(_id, _name, _parent, &aud0_cg_regs, _shift,
> > > > &mtk_clk_gate_ops_no_setclr)
> > > > +
> > > > +#define GATE_AUD1(_id, _name, _parent, _shift)
> > > > \
> > > > +   GATE_MTK(_id, _name, _parent, &aud1_cg_regs, _shift,
> > > > &mtk_clk_gate_ops_no_setclr)
> > > > +
> > > > +#define GATE_AUD2(_id, _name, _parent, _shift)
> > > > \
> > > > +   GATE_MTK(_id, _name, _parent, &aud2_cg_regs, _shift,
> > > > &mtk_clk_gate_ops_no_setclr)
> > > > +
> > > > +#define GATE_AUD3(_id, _name, _parent, _shift)
> > > > \
> > > > +   GATE_MTK(_id, _name, _parent, &aud3_cg_regs, _shift,
> > > > &mtk_clk_gate_ops_no_setclr)
> > > > +
> > > > +#define GATE_AUD4(_id, _name, _parent, _shift)
> > > > \
> > > > +   GATE_MTK(_id, _name, _parent, &aud4_cg_regs, _shift,
> > > > &mtk_clk_gate_ops_no_setclr)
> > > > +
> > > > +#define GATE_AUD5(_id, _name, _parent, _shift)
> > > > \
> > > > +   GATE_MTK(_id, _name, _parent, &aud5_cg_regs, _shift,
> > > > &mtk_clk_gate_ops_no_setclr)
> > > > +
> > > > +static const struct mtk_gate aud_clks[] = {
> > > > +   /* AUD0 */
> > > > +   GATE_AUD0(CLK_AUD_AFE, "aud_afe", "a1sys_hp_sel", 2),
> > > > +   GATE_AUD0(CLK_AUD_LRCK_CNT, "aud_lrck_cnt", "a1sys_hp_sel",
> > > > 4),
> > > > +   GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_APLL,
> > > > "aud_spdifin_tuner_apll",
> > > > "apll4_sel", 10),
> > > > +   GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_DBG,
> > > > "aud_spdifin_tuner_dbg",
> > > > "apll4_sel", 11),
> > > > +   GATE_AUD0(CLK_AUD_UL_TML, "aud_ul_tml", "a1sys_hp_sel",
> > > > 18),
> > > > +   GATE_AUD0(CLK_AUD_APLL1_TUNER, "aud_apll1_tuner",
> > > > "apll1_sel",
> > > > 19),
> > > > +   GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner",
> > > > "apll2_sel",
> > > > 20),
> > > > +   GATE_AUD0(CLK_AUD_TOP0_SPDF, "aud_top0_spdf",
> > > > "aud_iec_sel",
> > > > 21),
> > > > +   GATE_AUD0(CLK_AUD_APLL, "aud_apll", "apll1_sel", 23),
> > > > +   GATE_AUD0(CLK_AUD_APLL2, "aud_apll2", "apll2_sel", 24),
> > > > +   GATE_AUD0(CLK_AUD_DAC, "aud_dac", "a1sys_hp_sel", 25),
> > > > +   GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis",
> > > > "a1sys_hp_sel",
> > > > 26),
> > > > +   GATE_AUD0(CLK_AUD_TML, "aud_tml", "a1sys_hp_sel", 27),
> > > > +   GATE_AUD0(CLK_AUD_ADC, "aud_adc", "a1sys_hp_sel", 28),
> > > > +   GATE_AUD0(CLK_AUD_DAC_HIRES, "aud_dac_hires",
> > > > "audio_h_sel",
> > > > 31),
> > > > +   /* AUD1 */
> > > > +   GATE_AUD1(CLK_AUD_I2SIN, "aud_i2sin", "a1sys_hp_sel", 0),
> > > > +   GATE_AUD1(CLK_AUD_TDM_IN, "aud_tdm_in", "a1sys_hp_sel", 1),
> > > > +   GATE_AUD1(CLK_AUD_I2S_OUT, "aud_i2s_out", "a1sys_hp_sel",
> > > > 6),
> > > > +   GATE_AUD1(CLK_AUD_TDM_OUT, "aud_tdm_out", "a1sys_hp_sel",
> > > > 7),
> > > > +   GATE_AUD1(CLK_AUD_HDMI_OUT, "aud_hdmi_out", "a1sys_hp_sel",
> > > > 8),
> > > > +   GATE_AUD1(CLK_AUD_ASRC11, "aud_asrc11", "a1sys_hp_sel",
> > > > 16),
> > > > +   GATE_AUD1(CLK_AUD_ASRC12, "aud_asrc12", "a1sys_hp_sel",
> > > > 17),
> > > > +   GATE_AUD1(CLK_AUD_MULTI_IN, "aud_multi_in",
> > > > "mphone_slave_b",
> > > > 19),
> > > > +   GATE_AUD1(CLK_AUD_INTDIR, "aud_intdir", "intdir_sel", 20),
> > > > +   GATE_AUD1(CLK_AUD_A1SYS, "aud_a1sys", "a1sys_hp_sel", 21),
> > > > +   GATE_AUD1(CLK_AUD_A2SYS, "aud_a2sys", "a2sys_sel", 22),
> > > > +   GATE_AUD1(CLK_AUD_PCMIF, "aud_pcmif", "a1sys_hp_sel", 24),
> > > > +   GATE_AUD1(CLK_AUD_A3SYS, "aud_a3sys", "a3sys_sel", 30),
> > > > +   GATE_AUD1(CLK_AUD_A4SYS, "aud_a4sys", "a4sys_sel", 31),
> > > > +   /* AUD2 */
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_UL1, "aud_memif_ul1",
> > > > "a1sys_hp_sel",
> > > > 0),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_UL2, "aud_memif_ul2",
> > > > "a1sys_hp_sel",
> > > > 1),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_UL3, "aud_memif_ul3",
> > > > "a1sys_hp_sel",
> > > > 2),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_UL4, "aud_memif_ul4",
> > > > "a1sys_hp_sel",
> > > > 3),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_UL5, "aud_memif_ul5",
> > > > "a1sys_hp_sel",
> > > > 4),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_UL6, "aud_memif_ul6",
> > > > "a1sys_hp_sel",
> > > > 5),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_UL8, "aud_memif_ul8",
> > > > "a1sys_hp_sel",
> > > > 7),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_UL9, "aud_memif_ul9",
> > > > "a1sys_hp_sel",
> > > > 8),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_UL10, "aud_memif_ul10",
> > > > "a1sys_hp_sel",
> > > > 9),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_DL2, "aud_memif_dl2",
> > > > "a1sys_hp_sel",
> > > > 18),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_DL3, "aud_memif_dl3",
> > > > "a1sys_hp_sel",
> > > > 19),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_DL6, "aud_memif_dl6",
> > > > "a1sys_hp_sel",
> > > > 22),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_DL7, "aud_memif_dl7",
> > > > "a1sys_hp_sel",
> > > > 23),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_DL8, "aud_memif_dl8",
> > > > "a1sys_hp_sel",
> > > > 24),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_DL10, "aud_memif_dl10",
> > > > "a1sys_hp_sel",
> > > > 26),
> > > > +   GATE_AUD2(CLK_AUD_MEMIF_DL11, "aud_memif_dl11",
> > > > "a1sys_hp_sel",
> > > > 27),
> > > > +   /* AUD3 */
> > > > +   GATE_AUD3(CLK_AUD_GASRC0, "aud_gasrc0", "asm_h_sel", 0),
> > > > +   GATE_AUD3(CLK_AUD_GASRC1, "aud_gasrc1", "asm_h_sel", 1),
> > > > +   GATE_AUD3(CLK_AUD_GASRC2, "aud_gasrc2", "asm_h_sel", 2),
> > > > +   GATE_AUD3(CLK_AUD_GASRC3, "aud_gasrc3", "asm_h_sel", 3),
> > > > +   GATE_AUD3(CLK_AUD_GASRC4, "aud_gasrc4", "asm_h_sel", 4),
> > > > +   GATE_AUD3(CLK_AUD_GASRC5, "aud_gasrc5", "asm_h_sel", 5),
> > > > +   GATE_AUD3(CLK_AUD_GASRC6, "aud_gasrc6", "asm_h_sel", 6),
> > > > +   GATE_AUD3(CLK_AUD_GASRC7, "aud_gasrc7", "asm_h_sel", 7),
> > > > +   GATE_AUD3(CLK_AUD_GASRC8, "aud_gasrc8", "asm_h_sel", 8),
> > > > +   GATE_AUD3(CLK_AUD_GASRC9, "aud_gasrc9", "asm_h_sel", 9),
> > > > +   GATE_AUD3(CLK_AUD_GASRC10, "aud_gasrc10", "asm_h_sel", 10),
> > > > +   GATE_AUD3(CLK_AUD_GASRC11, "aud_gasrc11", "asm_h_sel", 11),
> > > > +   GATE_AUD3(CLK_AUD_GASRC12, "aud_gasrc12", "asm_h_sel", 12),
> > > > +   GATE_AUD3(CLK_AUD_GASRC13, "aud_gasrc13", "asm_h_sel", 13),
> > > > +   GATE_AUD3(CLK_AUD_GASRC14, "aud_gasrc14", "asm_h_sel", 14),
> > > > +   GATE_AUD3(CLK_AUD_GASRC15, "aud_gasrc15", "asm_h_sel", 15),
> > > > +   GATE_AUD3(CLK_AUD_GASRC16, "aud_gasrc16", "asm_h_sel", 16),
> > > > +   GATE_AUD3(CLK_AUD_GASRC17, "aud_gasrc17", "asm_h_sel", 17),
> > > > +   GATE_AUD3(CLK_AUD_GASRC18, "aud_gasrc18", "asm_h_sel", 18),
> > > > +   GATE_AUD3(CLK_AUD_GASRC19, "aud_gasrc19", "asm_h_sel", 19),
> > > > +   /* AUD4 */
> > > > +   GATE_AUD4(CLK_AUD_A1SYS_HP, "aud_a1sys_hp", "a1sys_hp_sel",
> > > > 2),
> > > > +   GATE_AUD4(CLK_AUD_AFE_DMIC1, "aud_afe_dmic1",
> > > > "a1sys_hp_sel",
> > > > 10),
> > > > +   GATE_AUD4(CLK_AUD_AFE_DMIC2, "aud_afe_dmic2",
> > > > "a1sys_hp_sel",
> > > > 11),
> > > > +   GATE_AUD4(CLK_AUD_AFE_DMIC3, "aud_afe_dmic3",
> > > > "a1sys_hp_sel",
> > > > 12),
> > > > +   GATE_AUD4(CLK_AUD_AFE_DMIC4, "aud_afe_dmic4",
> > > > "a1sys_hp_sel",
> > > > 13),
> > > > +   GATE_AUD4(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm",
> > > > "a1sys_hp_sel", 14),
> > > > +   GATE_AUD4(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires",
> > > > "audio_h_sel", 16),
> > > > +   GATE_AUD4(CLK_AUD_ADC_HIRES, "aud_adc_hires",
> > > > "audio_h_sel",
> > > > 17),
> > > > +   GATE_AUD4(CLK_AUD_ADDA6_ADC, "aud_adda6_adc",
> > > > "a1sys_hp_sel",
> > > > 18),
> > > > +   GATE_AUD4(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires",
> > > > "audio_h_sel", 19),
> > > > +   /* AUD5 */
> > > > +   GATE_AUD5(CLK_AUD_LINEIN_TUNER, "aud_linein_tuner",
> > > > "apll5_sel", 5),
> > > > +   GATE_AUD5(CLK_AUD_EARC_TUNER, "aud_earc_tuner",
> > > > "apll3_sel",
> > > > 7),
> > > > +};
> > > 
> > > These are all clock gates, and are all internal to the audio
> > > hardware,
> > > i.e. not used by other drivers or modules.
> > > 
> > > So these don't actually need to be in a separate clk driver. They
> > > can
> > > be
> > > modelled within ASoC as supplies that are automatically managed
> > > by
> > > ASoC
> > > core. Otherwise just have them as bits that are toggled by the
> > > audio
> > > driver's start/stop sequencing code, like they are now, but
> > > through
> > > vastly more complicated plumbing.
> > > 
> > > Please work with the audio driver owner to see if this can be
> > > moved
> > > into
> > > the audio driver.
> > > 
> > > Regards
> > > ChenYu
> > > 
> > 
> > The afe device will be the child of audsys clock provider node and
> > audsys clock driver will use devm_of_platform_populate() to
> > populate
> > afe device when audsys clock gates are registered successfully,
> > It means afe will be toggled by audsys clock, do you suggest to
> > change
> > the toggled order?
> 
> What I'm saying is that they shouldn't be represented as two drivers
> and two devices in Linux. They are in the same address space, and the
> clocks aren't used by any other hardware block. In the device tree we
> should represent them as one unified device, unless there is a good
> reason, such as hardware design, not to do so. In the drivers, we can
> actually just get rid of the audsys clock driver, and have the afe
> driver toggle the clock enable bits directly. Treat them as any other
> "enable bits" that exist in any hardware.
> 
> 
> ChenYu

Because the parent source of audio clock gate is other clocks model in
CCF, if we get rid of the audsys clock driver then audio driver need to
guarantee the clock dependence by itself, that makes the control of
audsys clock gate more complicated.

Best Regards,
Chun-Jie
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
