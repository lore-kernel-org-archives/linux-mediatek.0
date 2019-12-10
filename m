Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75ADDC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 12:09:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49AB5208C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 12:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7ERopo1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IgP4vPVv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49AB5208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iz0yPJRmnpPf37zbT1K1Iln/0GXzMXbON7KDZAY2/Ts=; b=N7ERopo1Eg+6le
	HBX8gPYQTB/rAQAPUyI/MqzDBN/ht61mUsSEHsvkb6ieoo5qHUFX1FeTQFYpiWsTS+0Oyk+rJdaGF
	SLjpzKgACx9vr0Y63m+UDNpTtsfI47+HV496BUGvmmi4N7ME/sAcI944WaaqqFjVoXjeMCiVmEL6v
	B+kxiNMvgmUVmlMbyZFWhhKl79o8zdLRRqdIFxqmg6rKfE1gxc6DFd7piA8bq7OtMvADfEPCPscRI
	oly3lOzcdSsHDQUnTtFLPeR8ZxUO+4pzPhsoroAHWqwNUdYxLB2gqxaxh0jV8qv3NUHwxtI/fzTmY
	9irEHsE2EVsVi94VdMFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieeKI-0006eg-Vk; Tue, 10 Dec 2019 12:09:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieeKF-0006ds-Hb; Tue, 10 Dec 2019 12:09:13 +0000
X-UUID: bb7e297fc3954198a6704c27c628868a-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2INHnv89DngP2q6S6QSycxepChudtOI9fx0i3gt9NlY=; 
 b=IgP4vPVv26ceIPL+Ygm1rZA5CsxGk4kufMc4XnGrCLsR4lmGH9NRgYd13LspYMo6EinWcRtfbn0xkEHMYrCrhI3R3l5jxHwO9GBKDvXO1hZkDqdDpICRIvJT5/seUqrE1Rc7TNYGnBAgFzCaiPtPF81b1a3Rify8lVmyo3OmM3A=;
X-UUID: bb7e297fc3954198a6704c27c628868a-20191210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chaotian.jing@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 10239754; Tue, 10 Dec 2019 04:09:03 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 04:04:45 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 10 Dec 2019 20:03:32 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Dec 2019 20:03:29 +0800
Message-ID: <1575979419.7714.1.camel@mhfsdcap03>
Subject: Re: [PATCH] mmc: mediatek: fix CMD_TA to 2 for MT8173 HS200/HS400 mode
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2019 20:03:39 +0800
In-Reply-To: <CAPDyKFo9Z2yj7zC5VOS-iX_LyavPp1A4n73eAp7VD-Q+dpoqpw@mail.gmail.com>
References: <20191204071958.18553-1-chaotian.jing@mediatek.com>
 <CAPDyKFo9Z2yj7zC5VOS-iX_LyavPp1A4n73eAp7VD-Q+dpoqpw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_040911_592203_9B1638F1 
X-CRM114-Status: GOOD (  19.40  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hsinyi@google.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2019-12-10 at 10:51 +0100, Ulf Hansson wrote:
> On Wed, 4 Dec 2019 at 08:20, Chaotian Jing <chaotian.jing@mediatek.com> wrote:
> >
> > there is a chance that always get response CRC error after HS200 tuning,
> > the reason is that need set CMD_TA to 2. this modification is only for
> > MT8173.
> >
> > Signed-off-by: Chaotian Jing <chaotian.jing@mediatek.com>
> 
> I have applied this for fixes, however it seems like this should also
> be tagged for stable, right?
> Yes! should be tagged for stable.
> Is there a specific commit this fixes or should we just find the
> version it applies to?
> 
 this patch should be a fix to commit:
1ede5cb88a29bba1aad1b68965c5fc8e00b20ed9
> Kind regards
> Uffe
> 
> 
> 
> > ---
> >  drivers/mmc/host/mtk-sd.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index 189e42674d85..010fe29a4888 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -228,6 +228,7 @@
> >  #define MSDC_PATCH_BIT_SPCPUSH    (0x1 << 29)  /* RW */
> >  #define MSDC_PATCH_BIT_DECRCTMO   (0x1 << 30)  /* RW */
> >
> > +#define MSDC_PATCH_BIT1_CMDTA     (0x7 << 3)    /* RW */
> >  #define MSDC_PATCH_BIT1_STOP_DLY  (0xf << 8)    /* RW */
> >
> >  #define MSDC_PATCH_BIT2_CFGRESP   (0x1 << 15)   /* RW */
> > @@ -1881,6 +1882,7 @@ static int hs400_tune_response(struct mmc_host *mmc, u32 opcode)
> >
> >         /* select EMMC50 PAD CMD tune */
> >         sdr_set_bits(host->base + PAD_CMD_TUNE, BIT(0));
> > +       sdr_set_field(host->base + MSDC_PATCH_BIT1, MSDC_PATCH_BIT1_CMDTA, 2);
> >
> >         if (mmc->ios.timing == MMC_TIMING_MMC_HS200 ||
> >             mmc->ios.timing == MMC_TIMING_UHS_SDR104)
> > --
> > 2.18.0
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
