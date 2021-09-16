Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3731FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:50:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B0D611C4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8B0D611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7b/1ZQauNhPYtqkF9Gw5fb7VbKX9ZKJQ9fxqBOa5dD0=; b=A7+72ceAVZTCpB
	p83HXWsDAx2mEQLWREuF/2KJEw7G7Rk7iwrxKdmNJ/V+etvlvMUM5iJOvc0Dfq9+s0t5npSpALRv0
	zfeYFZNDwiAKCsKAKZhNxMGejdxe9iGmz4AuHVY1fj7o0sGbAOO3gZZo2873ZbdJmEwFkE4JbR1fI
	5+zLwbPDWV3ngXlNNXjm8VfSjT6QiDVUyRXXaxEHdqe95a7gF60/mMMAEGB4Q94lEvBeqBXTQ8Pik
	qxfmnAsKvhSbwLTEmwdfaeuFDYxcT/IeDqpfXGvMwqD5RsyydxwYzmJmmUtrNXJZ2zfFLWUtGqFlj
	vR4IIjy+xr84gSfNw+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQo2P-00AmLq-Ak; Thu, 16 Sep 2021 09:50:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQo2M-00AmKv-4C; Thu, 16 Sep 2021 09:50:36 +0000
X-UUID: 043fe8d2191b4c99aa2ba28c3c79b1af-20210916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gzK+pw9KcoSRjkXWSdTBJMZzJJD5+HACqPNMRdGb1tk=; 
 b=Wi3xo/Y7avQsxBVopoJiqfII1YKFMItQ6PS85KIBagKkU2YbBeEEqPI5SKESRv99tpYr3WLoDjnnJ+julM+EJVHzZvRrpfUdQRzBUE9ibA0k4ZZ2x6OkoObLi+p07IUGBbYmtRcs3QO9ZITisAk0yjxzqpqXUqZvVKqTiXXWKmw=;
X-UUID: 043fe8d2191b4c99aa2ba28c3c79b1af-20210916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 868383534; Thu, 16 Sep 2021 02:50:27 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 02:47:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 17:46:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 17:46:57 +0800
Message-ID: <5d5d49747b748db18ca66b9cf82c0e626f9c7638.camel@mediatek.com>
Subject: Re: [PATCH v3 2/2] mmc: mediatek: Add HS400 online tuning support
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, "Avri
 Altman" <avri.altman@wdc.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Yue Hu <huyue2@yulong.com>, Bean Huo <beanhuo@micron.com>, Adrian Hunter
 <adrian.hunter@intel.com>, linux-mmc <linux-mmc@vger.kernel.org>, DTML
 <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Date: Thu, 16 Sep 2021 17:46:59 +0800
In-Reply-To: <CAPDyKFqTx3wMm6mMy-wY892Nvu-ukqpRS=TSZxYr7e3TJWgF4A@mail.gmail.com>
References: <20210908013218.29702-1-wenbin.mei@mediatek.com>
 <20210908013218.29702-3-wenbin.mei@mediatek.com>
 <CAPDyKFqTx3wMm6mMy-wY892Nvu-ukqpRS=TSZxYr7e3TJWgF4A@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_025034_223380_5C4D29AA 
X-CRM114-Status: GOOD (  41.84  )
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

On Tue, 2021-09-14 at 10:46 +0200, Ulf Hansson wrote:
> On Wed, 8 Sept 2021 at 03:32, Wenbin Mei <wenbin.mei@mediatek.com>
> wrote:
> > 
> > Due to the influence of the corner IC and vcore voltage, for the
> > stability
> > of HS400 mode, we Add HS400 mode online tuning support for mediatek
> > mmc
> > host.
> 
> My apologies, but I am not familiar with what 'HS400 online tuning'
> is? Can you please elaborate on this?
> 
> Is it specific for a Mediatek eMMC controller - or is a common eMMC
> feature that is described in the eMMC spec?
> 
According to JEDEC Spec, there is no need to do tuning under HS400 mode
since the Rx signal is aligned with the DS signal. However, MediaTek's
IC need set its "DS delay" internally to ensure it can latch Rx signal
correctly.
In previous version, We provide an "hs400-ds-delay" in device tree to
cover different chipset/PCB design, and it works fine in most cases.
But, with the development of process technology and the big VCore
voltage scale range(may have 0.7V/0.6V/0.55V), it is difficult to find
a suitable "hs400-ds-delay" to cover all of IC corner
cases(SSSS/TTTT/FFFF).
So that We must have the ability to do hs400 online tuning.
It is specific for the Mediatek eMMC controller which support HS400
mode.
> > 
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
> > ---
> >  drivers/mmc/core/mmc.c    |   8 +++
> >  drivers/mmc/host/mtk-sd.c | 118
> > +++++++++++++++++++++++++++++++++++++-
> >  include/linux/mmc/host.h  |   3 +
> 
> Please split this patch into a core patch and a mtk-sd patch.
> 
I will change it in the next version.
> >  3 files changed, 127 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> > index 838726b68ff3..0aa72acd8612 100644
> > --- a/drivers/mmc/core/mmc.c
> > +++ b/drivers/mmc/core/mmc.c
> > @@ -1222,6 +1222,14 @@ static int mmc_select_hs400(struct mmc_card
> > *card)
> >         mmc_set_timing(host, MMC_TIMING_MMC_HS400);
> >         mmc_set_bus_speed(card);
> > 
> > +       if (host->ops->execute_hs400_tuning) {
> > +               mmc_retune_disable(host);
> > +               err = host->ops->execute_hs400_tuning(host, card);
> > +               mmc_retune_enable(host);
> > +               if (err)
> > +                       goto out_err;
> > +       }
> > +
> >         if (host->ops->hs400_complete)
> >                 host->ops->hs400_complete(host);
> > 
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index 4dfc246c5f95..484f5c38bfaf 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -258,6 +258,7 @@
> >  #define MSDC_PAD_TUNE_RD_SEL     (0x1 << 13)   /* RW */
> >  #define MSDC_PAD_TUNE_CMD_SEL    (0x1 << 21)   /* RW */
> > 
> > +#define PAD_DS_TUNE_DLY_SEL       (0x1 << 0)   /* RW */
> >  #define PAD_DS_TUNE_DLY1         (0x1f << 2)   /* RW */
> >  #define PAD_DS_TUNE_DLY2         (0x1f << 7)   /* RW */
> >  #define PAD_DS_TUNE_DLY3         (0x1f << 12)  /* RW */
> > @@ -301,6 +302,11 @@
> >  #define PAD_CMD_RD_RXDLY_SEL    (0x1 << 11)     /* RW */
> >  #define PAD_CMD_TX_DLY          (0x1f << 12)    /* RW */
> > 
> > +/* EMMC50_PAD_DS_TUNE mask */
> > +#define PAD_DS_DLY_SEL         (0x1 << 16)     /* RW */
> > +#define PAD_DS_DLY1            (0x1f << 10)    /* RW */
> > +#define PAD_DS_DLY3            (0x1f << 0)     /* RW */
> > +
> >  #define REQ_CMD_EIO  (0x1 << 0)
> >  #define REQ_CMD_TMO  (0x1 << 1)
> >  #define REQ_DAT_ERR  (0x1 << 2)
> > @@ -448,11 +454,13 @@ struct msdc_host {
> >         bool vqmmc_enabled;
> >         u32 latch_ck;
> >         u32 hs400_ds_delay;
> > +       u32 hs400_ds_dly3;
> >         u32 hs200_cmd_int_delay; /* cmd internal delay for
> > HS200/SDR104 */
> >         u32 hs400_cmd_int_delay; /* cmd internal delay for HS400 */
> >         bool hs400_cmd_resp_sel_rising;
> >                                  /* cmd response sample selection
> > for HS400 */
> >         bool hs400_mode;        /* current eMMC will run at hs400
> > mode */
> > +       bool hs400_tuning;      /* hs400 mode online tuning */
> >         bool internal_cd;       /* Use internal card-detect logic
> > */
> >         bool cqhci;             /* support eMMC hw cmdq */
> >         struct msdc_save_para save_para; /* used when gate HCLK */
> > @@ -1190,7 +1198,8 @@ static bool msdc_cmd_done(struct msdc_host
> > *host, int events,
> >         if (!sbc_error && !(events & MSDC_INT_CMDRDY)) {
> >                 if (events & MSDC_INT_CMDTMO ||
> >                     (cmd->opcode != MMC_SEND_TUNING_BLOCK &&
> > -                    cmd->opcode != MMC_SEND_TUNING_BLOCK_HS200))
> > +                    cmd->opcode != MMC_SEND_TUNING_BLOCK_HS200 &&
> > +                    !host->hs400_tuning))
> >                         /*
> >                          * should not clear fifo/interrupt as the
> > tune data
> >                          * may have alreay come when cmd19/cmd21
> > gets response
> > @@ -1287,7 +1296,8 @@ static void msdc_cmd_next(struct msdc_host
> > *host,
> >         if ((cmd->error &&
> >             !(cmd->error == -EILSEQ &&
> >               (cmd->opcode == MMC_SEND_TUNING_BLOCK ||
> > -              cmd->opcode == MMC_SEND_TUNING_BLOCK_HS200))) ||
> > +              cmd->opcode == MMC_SEND_TUNING_BLOCK_HS200 ||
> > +              host->hs400_tuning))) ||
> >             (mrq->sbc && mrq->sbc->error))
> >                 msdc_request_done(host, mrq);
> >         else if (cmd == mrq->sbc)
> > @@ -2251,6 +2261,106 @@ static int msdc_prepare_hs400_tuning(struct
> > mmc_host *mmc, struct mmc_ios *ios)
> >         return 0;
> >  }
> > 
> > +static int msdc_send_cxd_data(struct mmc_card *card, struct
> > mmc_host *host)
> > +{
> > +       struct mmc_request mrq = {};
> > +       struct mmc_command cmd = {};
> > +       struct mmc_data data = {};
> > +       unsigned int len = 512;
> > +       struct scatterlist sg;
> > +       u8 *ext_csd;
> > +
> > +       ext_csd = kzalloc(len, GFP_KERNEL);
> > +       if (!ext_csd)
> > +               return -ENOMEM;
> > +
> > +       mrq.cmd = &cmd;
> > +       mrq.data = &data;
> > +
> > +       cmd.opcode = MMC_SEND_EXT_CSD;
> > +       cmd.arg = 0;
> > +       cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_ADTC;
> > +
> > +       data.blksz = len;
> > +       data.blocks = 1;
> > +       data.flags = MMC_DATA_READ;
> > +       data.sg = &sg;
> > +       data.sg_len = 1;
> > +
> > +       sg_init_one(&sg, ext_csd, len);
> > +       mmc_set_data_timeout(&data, card);
> > +       mmc_wait_for_req(host, &mrq);
> > +
> > +       kfree(ext_csd);
> > +
> > +       if (cmd.error)
> > +               return cmd.error;
> > +       if (data.error)
> > +               return data.error;
> > +
> > +       return 0;
> 
> Why do we need to send a MMC_SEND_EXT_CSD command, exactly?
> 
> Why can't mmc_send_tuning() work here too? What does the eMMC spec
> state about this?
> 
The CMD21 is illegal under hs400 mode so that cannot use the
mmc_send_tuning(). The CMD8 is suitable because it will receive 1 block
of non-zero data.
> > +}
> > +
> > +static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct
> > mmc_card *card)
> > +{
> > +       struct msdc_host *host = mmc_priv(mmc);
> > +       struct msdc_delay_phase dly1_delay;
> > +       u32 val, result_dly1 = 0;
> > +       int i, ret;
> > +
> > +       if (host->top_base) {
> > +               sdr_set_bits(host->top_base + EMMC50_PAD_DS_TUNE,
> > +                            PAD_DS_DLY_SEL);
> > +               if (host->hs400_ds_dly3)
> > +                       sdr_set_field(host->top_base +
> > EMMC50_PAD_DS_TUNE,
> > +                                     PAD_DS_DLY3, host-
> > >hs400_ds_dly3);
> > +       } else {
> > +               sdr_set_bits(host->base + PAD_DS_TUNE,
> > PAD_DS_TUNE_DLY_SEL);
> > +               if (host->hs400_ds_dly3)
> > +                       sdr_set_field(host->base + PAD_DS_TUNE,
> > +                                     PAD_DS_TUNE_DLY3, host-
> > >hs400_ds_dly3);
> > +       }
> > +
> > +       host->hs400_tuning = true;
> > +       for (i = 0; i < PAD_DELAY_MAX; i++) {
> > +               if (host->top_base)
> > +                       sdr_set_field(host->top_base +
> > EMMC50_PAD_DS_TUNE,
> > +                                     PAD_DS_DLY1, i);
> > +               else
> > +                       sdr_set_field(host->base + PAD_DS_TUNE,
> > +                                     PAD_DS_TUNE_DLY1, i);
> > +               ret = msdc_send_cxd_data(card, mmc);
> > +               if (!ret)
> > +                       result_dly1 |= (1 << i);
> > +       }
> > +       host->hs400_tuning = false;
> > +
> > +       dly1_delay = get_best_delay(host, result_dly1);
> > +       if (dly1_delay.maxlen == 0) {
> > +               dev_err(host->dev, "Failed to get DLY1 delay!\n");
> > +               goto fail;
> > +       }
> > +       if (host->top_base)
> > +               sdr_set_field(host->top_base + EMMC50_PAD_DS_TUNE,
> > +                             PAD_DS_DLY1, dly1_delay.final_phase);
> > +       else
> > +               sdr_set_field(host->base + PAD_DS_TUNE,
> > +                             PAD_DS_TUNE_DLY1,
> > dly1_delay.final_phase);
> > +
> > +       if (host->top_base)
> > +               val = readl(host->top_base + EMMC50_PAD_DS_TUNE);
> > +       else
> > +               val = readl(host->base + PAD_DS_TUNE);
> > +
> > +       dev_info(host->dev, "Fianl PAD_DS_TUNE: 0x%x\n", val);
> > +
> > +       return 0;
> > +
> > +fail:
> > +       dev_err(host->dev, "Failed to tuning DS pin delay!\n");
> > +       return -EIO;
> > +}
> 
> [...]
> 
> Kind regards
> Uffe
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
