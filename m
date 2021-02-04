Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFE3C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 13:05:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3705664E34
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 13:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3705664E34
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WDzUqLvmzDmK4+kGfLv/hTCkKnZN07Myg1U6TczBIyk=; b=t0ICyEtxZRXDUB8iuUiSMooxz
	PmbmjWxPu6Z0QSIFrkAJXOppaGO6ubbFWC2b8BtgmU+qSs+ZVfuWEKLrDKx5ACHxymtd+OMzvZ1VQ
	WHH3E5WTAbd9eyhfF896NjUmQSc/kVUuzaSAyu5Vww5Yc6Ma/buxomR7rViNwp3H+bInqZzG0ZDNM
	aAr1n8Vx0W1Rs3I2Elcpmzo+ODM2L06pe/ebPz5Hs2BBaqIt+lIH5n+ipQCIW7a8+P9POZMQSqq5I
	6it/f0u41zorBuSujaD3LyzY7ZKJFPrAbdzdhWEcJlwIeWaTgxiOJpv/zYUIrvzFvucpfdwYWG12D
	jl+cxs3IQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7eKJ-0004h6-1q; Thu, 04 Feb 2021 13:05:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7eKE-0004fl-Oe; Thu, 04 Feb 2021 13:05:36 +0000
X-UUID: f9452441fa3b40b8aa52074271c78708-20210204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xjPlZsUgJ8zWKx32syTlMFFWZeRIUmfEgX2pBjQv40w=; 
 b=afrLmZvNlDKffq4yrhcTZuJ9N84I3H93yxx8Vsj1JwuOAZ0KXVuiskN0QoyHRmf4Ov5t/J32K/Txy67eaZgZ7xy9UhGOOni/zP7IB9+TE/LiY8d2DncqN0oxqRDE69VpjEH5NjeWtiyW1c5vIbqoicp4vvi7t8g8M68GxnaQKsw=;
X-UUID: f9452441fa3b40b8aa52074271c78708-20210204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1507283195; Thu, 04 Feb 2021 05:05:30 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Feb 2021 05:05:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Feb 2021 21:05:22 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Feb 2021 21:05:22 +0800
Message-ID: <1612443922.32298.3.camel@mtksdaap41>
Subject: Re: [PATCH v4 4/5] soc: mediatek: pwrap: add pwrap driver for
 MT6873/8192 SoCs
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 4 Feb 2021 21:05:22 +0800
In-Reply-To: <CANMq1KBXKQOj=qUMULeJsqy8bvsJLgRniuF2kqzhxpKTWCVq1w@mail.gmail.com>
References: <1605700894-32699-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1605700894-32699-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <CANMq1KBXKQOj=qUMULeJsqy8bvsJLgRniuF2kqzhxpKTWCVq1w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_080534_997977_7F8DA02D 
X-CRM114-Status: GOOD (  24.47  )
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

Hi,

On Mon, 2020-12-21 at 10:42 +0800, Nicolas Boichat wrote:
> On Wed, Nov 18, 2020 at 8:08 PM Hsin-Hsiung Wang
> <hsin-hsiung.wang@mediatek.com> wrote:
> >
> > MT6873/8192 are highly integrated SoCs and use PMIC_MT6359 for
> > power management. This patch adds pwrap master driver to
> > access PMIC_MT6359.
> >
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-pmic-wrap.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > index 5678f46..d1cd050 100644
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -632,6 +632,17 @@ static int mt6797_regs[] = {
> >         [PWRAP_DCM_DBC_PRD] =           0x1D4,
> >  };
> >
> > +static int mt6873_regs[] = {
> > +       [PWRAP_INIT_DONE2] =            0x0,
> 
> I don't have the datasheet for the PWRAP interface, is this register
> at offset 0x0 real?
> 
> If so, I'm concerned that mt6873_regs only defines very few registers
> offsets, so the init code will do a _lot_ writes at register address
> 0x0 (e.g. for all the undefined values in this array: PWRAP_WACS0_EN,
> PWRAP_WACS1_EN, PWRAP_WACS2_EN, etc, etc.)
> 

The register for the init_done is 0x0.
However, the pwrap driver of mt6873 only checks this register in the
beginning and wouldn't check it again.
In other words, the  register is the first register we check, so I think
there is no problem for it.

> > +       [PWRAP_TIMER_EN] =              0x3E0,
> > +       [PWRAP_INT_EN] =                0x448,
> > +       [PWRAP_WACS2_CMD] =             0xC80,
> > +       [PWRAP_SWINF_2_WDATA_31_0] =    0xC84,
> > +       [PWRAP_SWINF_2_RDATA_31_0] =    0xC94,
> > +       [PWRAP_WACS2_VLDCLR] =          0xCA4,
> > +       [PWRAP_WACS2_RDATA] =           0xCA8,
> > +};
> > +
> >  static int mt7622_regs[] = {
> >         [PWRAP_MUX_SEL] =               0x0,
> >         [PWRAP_WRAP_EN] =               0x4,
> > @@ -1050,6 +1061,7 @@ enum pwrap_type {
> >         PWRAP_MT6765,
> >         PWRAP_MT6779,
> >         PWRAP_MT6797,
> > +       PWRAP_MT6873,
> >         PWRAP_MT7622,
> >         PWRAP_MT8135,
> >         PWRAP_MT8173,
> > @@ -1512,6 +1524,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
> >         case PWRAP_MT7622:
> >                 pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
> >                 break;
> > +       case PWRAP_MT6873:
> >         case PWRAP_MT8183:
> >                 break;
> >         }
> > @@ -1948,6 +1961,19 @@ static const struct pmic_wrapper_type pwrap_mt6797 = {
> >         .init_soc_specific = NULL,
> >  };
> >
> > +static const struct pmic_wrapper_type pwrap_mt6873 = {
> > +       .regs = mt6873_regs,
> > +       .type = PWRAP_MT6873,
> > +       .arb_en_all = 0x777f,
> > +       .int_en_all = BIT(4) | BIT(5),
> > +       .int1_en_all = 0,
> > +       .spi_w = PWRAP_MAN_CMD_SPI_WRITE,
> > +       .wdt_src = PWRAP_WDT_SRC_MASK_ALL,
> > +       .caps = PWRAP_CAP_ARB,
> > +       .init_reg_clock = pwrap_common_init_reg_clock,
> > +       .init_soc_specific = NULL,
> > +};
> > +
> >  static const struct pmic_wrapper_type pwrap_mt7622 = {
> >         .regs = mt7622_regs,
> >         .type = PWRAP_MT7622,
> > @@ -2026,6 +2052,9 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
> >                 .compatible = "mediatek,mt6797-pwrap",
> >                 .data = &pwrap_mt6797,
> >         }, {
> > +               .compatible = "mediatek,mt6873-pwrap",
> > +               .data = &pwrap_mt6873,
> > +       }, {
> >                 .compatible = "mediatek,mt7622-pwrap",
> >                 .data = &pwrap_mt7622,
> >         }, {
> > --
> > 2.6.4
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
