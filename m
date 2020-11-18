Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E80C56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 11:42:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2164722244
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 11:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ky9Hvm9F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ujTmcymN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2164722244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=thZfNrDwjRvn21umr9uZ4QB3eU5eQiumjahTpSblCgc=; b=ky9Hvm9FY2f77XilNwse55mKv
	l1u2ohO7j+82L3fXQL4g9/Qs5O5/MZZCBMMSQlA7nGTRAFQ5XBGs86d7Ez2v4LLhXHEr1JMXK3rtj
	ViiHZPDFWwgN+PzQRpwHevUs9MMgPH9G+GpacNBsdX5A48eAkslmrqFi8Bitd3nYAbmMgiIbqosVF
	41hjRAOOptIAVaLzinnCQjO/wd7JZEpO/abPQL2wWgBx+XtvRlFtbf7Ms+ovPVd5UxSJkqpf0cSNc
	CLZ1J1A6+7LajkGCuDdtl/4b8EwQnkABRoIDTTziDRqLHiFPLc2W9ePQHc2C7S6NPK1OajFSH7UaC
	MeBCebvjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfLqm-0003Ma-LK; Wed, 18 Nov 2020 11:42:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfLqg-0003LC-3f; Wed, 18 Nov 2020 11:42:08 +0000
X-UUID: e24ce24c7a8e4fccb30ad3622d89d186-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TsP3P6+jsD2R9/50TQeqW2f928Hda5KezmSySNP5YZI=; 
 b=ujTmcymNeKqa8BInRcAtNURiLmZ79nuecQPKK3XgC4laFZzBIhn0wg7lT3tBB2lcrT4q/vQheRTAu/YPHOygFdc2ZErqT3/1+3lDF2q8DLM+iK63lOXSzFQGODLjsHTra75XZWrN4Ni0WiYVRB/WB+54nksSgqt1OfQMzTGR1G8=;
X-UUID: e24ce24c7a8e4fccb30ad3622d89d186-20201118
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 468054334; Wed, 18 Nov 2020 03:41:52 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 03:42:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 19:42:01 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 19:42:00 +0800
Message-ID: <1605699721.24420.4.camel@mtksdaap41>
Subject: Re: [PATCH v3 4/4] soc: mediatek: pwrap: add pwrap driver for
 MT6873/8192 SoCs
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Fei Shao <fshao@chromium.org>
Date: Wed, 18 Nov 2020 19:42:01 +0800
In-Reply-To: <CAJ66y9HCTEYcuGpd_C4bZdD3PDOytUW00-PK6u9F6=v67CCXAg@mail.gmail.com>
References: <1600686235-27979-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1600686235-27979-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <CAJ66y9HCTEYcuGpd_C4bZdD3PDOytUW00-PK6u9F6=v67CCXAg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_064206_299257_EC600AE5 
X-CRM114-Status: GOOD (  20.79  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Argus Lin <argus.lin@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsin-hsiung.wang@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, 2020-09-22 at 17:49 +0800, Fei Shao wrote:
> On Mon, Sep 21, 2020 at 11:03 AM Hsin-Hsiung Wang
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
> > index 149bf02..c73e92b 100644
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -632,6 +632,17 @@ static int mt6797_regs[] = {
> >         [PWRAP_DCM_DBC_PRD] =           0x1D4,
> >  };
> >
> > +static int mt6873_regs[] = {
> > +       [PWRAP_INIT_DONE2] =            0x0,
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
> > +static struct pmic_wrapper_type pwrap_mt6873 = {
> static const struct.
> 

Thanks, I will update it in next patch.

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
