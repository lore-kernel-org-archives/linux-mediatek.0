Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F4EC4363A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 07:32:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C14D20790
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 07:32:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jqXZK1I5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FGF1MSWB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C14D20790
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RlwXzximAayG2Avr3sdVNSPmRyuI1KhDEjLZJYpu6tM=; b=jqXZK1I5YLmxoPmI8SBUpNFfp
	Nl3aQyyeT0eqioDXpuNVkAlNP0VIB93pulNXXRmWrFIUrTXKCQzsaWJEb9K0U4+wbN8IVNN60NGb7
	otc60JDJ2trmt/t3tt3eudlOdyt7cYgEvtDePkIfxI2QQDbCsCmhlsYeh9rHSz4USguQ0Lq8h1+2r
	x0L52LGpt6KYsJ1Z778jpLOAcVygCtpm/nNwpEiGmIk1Naj3jwHTumGmpkd9foSIXjFV7eDKRp9hq
	znbNB+j7MqMdrm4lzsE+jcgS2MIeiXby2Mnqez1upNwUQ/XhkjvbOhQaGzU0Xebmws6b3cGZc/rYS
	CiSbqRNvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXfwI-0002hn-JY; Wed, 28 Oct 2020 07:32:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXfwF-0002gz-9G; Wed, 28 Oct 2020 07:32:09 +0000
X-UUID: e3206ab907ea4cfe8b6d97027571c9a3-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qgD7EpUS5w7TfXJzeM4yPos8NMat/wPBsYIHUdJw5x0=; 
 b=FGF1MSWBv3Gpuh7Y6hzXl9oUh4e6CjisD4wZdhv9S2IRW9iFnfFfayBsvy3iL/9H+fMYAQ9Rr8uYYWruqwSmaI9Tk9ScTtlVVbVBRkTkSt8yG6qzgN2Q9GDSC3prLYTmDp6IBwcOPEzY9VMaCplaFo4weWbv2Hy5B7ZwDXXdY5k=;
X-UUID: e3206ab907ea4cfe8b6d97027571c9a3-20201027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 309969242; Tue, 27 Oct 2020 23:31:59 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 00:21:56 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 28 Oct 2020 15:21:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Oct 2020 15:21:22 +0800
Message-ID: <1603869682.6198.23.camel@mhfsdcap03>
Subject: Re: [PATCH] mmc: host: mtk-sd: enable recheck_sdio_irq for MT8516 SoC
From: "yong.mao@mediatek.com" <yong.mao@mediatek.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 28 Oct 2020 15:21:22 +0800
In-Reply-To: <87wnzbg7on.fsf@baylibre.com>
References: <20201023122950.60903-1-fparent@baylibre.com>
 <CAPDyKFrMwLeuQoFDgXYo_-T_e2AzfqM-rgp3-SgeuC6Qn6rxMA@mail.gmail.com>
 <87wnzbg7on.fsf@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DDBA109A30CE42A1EECF9E09EC7D82ED57DB957A29035ECF11641C3B41E268132000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_033207_534758_5E0F5263 
X-CRM114-Status: GOOD (  30.60  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-10-27 at 13:44 +0100, Mattijs Korpershoek wrote:
> Hi Ulf,
> 
> Ulf Hansson <ulf.hansson@linaro.org> writes:
> 
> > + Yong Mao, Chaotian Jing
> >
> > On Fri, 23 Oct 2020 at 14:29, Fabien Parent <fparent@baylibre.com> wrote:
> >>
> >> MT8516 SoC suffers from sometimes losing SDIO IRQs, this makes SDIO
> >> devices sometimes unstable. Make use of the new property
> >> recheck_sdio_irq to fix the SDIO stability issues on MT8516.
> >>
> >> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> >
> > Maybe this is a common problem, thus I am thinking that potentially we
> > should enable the workaround for all variants?
> Not sure if this is of any help, but: we use the btmtksdio driver on a
> MT8183 soc with an Android kernel based on upstream.
> 
> With that kernel, we did not to apply this work-around in order to
> have a stable bluetooth experience (pairing with a remote controller)
> 
> However, on the MT8516 SoC, it's impossible for us to use btmtksdio
> without Fabien's fix.
> 
Yes. For mt8516 SoC,recheck_sdio_irq should be set to true for avoiding
SDIO dat1 irq lost issue. But for mt8183 SoC, it does not need recheck 
sdio irq mechanism.

> >
> > I have looped in Yong Mao (who invented the workaround) and Chaotian
> > Jing, to see if they can advise us how to proceed.
> >
> > In any case, I think we should add a stable tag and a fixes tag.
> >
> > Kind regards
> > Uffe

Hi Ulf,
Sorry. On the patch "mmc:mediatek:fix SDIO irq issue", I only consider
fixing the issue on mt8173 SoC.But for the whole MTK upstream SoC,
mt8183, mt2712, mt6779 and mt8192 does not need this mechanism,
but the other upstream Soc such as mt8135, mt8173, mt2701, mt7622, 
mt8516 and mt7620 need this recheck mechanism. And all future SoC of our
company does not need this mechanism.
If it's convenient for you, please help me to revise it.
Or I will submit a new patch to correct the value of setting.
Thanks.
> >
> >> ---
> >>  drivers/mmc/host/mtk-sd.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> >> index a704745e5882..3dc102eefe49 100644
> >> --- a/drivers/mmc/host/mtk-sd.c
> >> +++ b/drivers/mmc/host/mtk-sd.c
> >> @@ -524,7 +524,7 @@ static const struct mtk_mmc_compatible mt7622_compat = {
> >>
> >>  static const struct mtk_mmc_compatible mt8516_compat = {
> >>         .clk_div_bits = 12,
> >> -       .recheck_sdio_irq = false,
> >> +       .recheck_sdio_irq = true,
> >>         .hs400_tune = false,
> >>         .pad_tune_reg = MSDC_PAD_TUNE0,
> >>         .async_fifo = true,
> >> --
> >> 2.28.0
> >>
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
