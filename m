Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F897C2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 07:10:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29732206A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 07:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="irtNCu50";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qQyRzcIq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29732206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0+Ihg1/Lqu1j3vwe/VJP1TZ2NJd/A+tMpxcWw8aKdw=; b=irtNCu50tIKD/+
	ecAhqzgV90E62WfPQRWlVr4YDY6zp89zFuTE9F8NdnaJBImHCjK0u61RcxQ9Fn+SSeir7ehwrgZM0
	VNbSXR27GYWheKOtayjaLxT0Y4FV1zYHlEGKEvCFm8OfZdy6f3wj920tYjYih1wUbiqkapG3T9f/x
	xygirz91hgi7r/sdipYJbIrRV0YevVAwmmD0uwWzCFbrGQQYkL3+p1piUHiXNTv01/eC8LFSS3uHG
	Wmq1dz9s3nddOFsZuV4LRblixC5PSjPMRcx4xRO8Fy4KR1kcy3+DCznR7Kz9jq0WPPO2BLEOxMh0b
	W4ighoBrgzO7naIR0/bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQn2S-0001ye-Kh; Tue, 21 Apr 2020 07:09:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQn2B-0001qu-FB; Tue, 21 Apr 2020 07:09:40 +0000
X-UUID: 80ea96f0d91648b696b8037f2d820c1b-20200420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NUYr9270NMzbhd1XCbptanlSHaINIQJqwQxsC0bp9ig=; 
 b=qQyRzcIqZJQiYep7THGlYIwzTYdaY3ohbGzBWoQhoKmV9leWB3zwcOR6RYWq3OsrsdmEiBl+oYm36FsqJ1/OgFgyAZQTsaGvOQDysIYGCGLU6owgo9o14skNxpN6JTfaw6gnrcxETq/63OT2RAzJw8Qu5DGPBE56C66J9NnwURA=;
X-UUID: 80ea96f0d91648b696b8037f2d820c1b-20200420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 868164485; Mon, 20 Apr 2020 23:09:16 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 00:04:06 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 21 Apr 2020 15:04:03 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Apr 2020 15:04:02 +0800
Message-ID: <1587452609.19579.14.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] mmc: core: need do mmc_power_cycle in
 mmc_sdio_resend_if_cond
From: "yong.mao@mediatek.com" <yong.mao@mediatek.com>
To: Matthias Kaehlcke <mka@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Apr 2020 15:03:29 +0800
In-Reply-To: <20200420191518.GG199755@google.com>
References: <1586835611-13857-1-git-send-email-yong.mao@mediatek.com>
 <1586835611-13857-2-git-send-email-yong.mao@mediatek.com>
 <20200420191518.GG199755@google.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4D8631C23FF72E8651899E91F592EA4CAD41B7629A83C7A9F5136694A8EFCF822000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_000931_516446_BA347589 
X-CRM114-Status: GOOD (  21.04  )
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
Cc: srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-04-20 at 12:15 -0700, Matthias Kaehlcke wrote:
> Hi,
> 
> On Tue, Apr 14, 2020 at 11:40:09AM +0800, Yong Mao wrote:
> > From: yong mao <yong.mao@mediatek.com>
> > 
> > When mmc_sdio_resned_if_cond is invoked, it indicates the SDIO
> > device is not in the right state. In this condition, the previous
> > implementation of mmc_sdio_resend_if_cond can't make sure SDIO
> > device be back to idle state. mmc_power_cycle can reset the SDIO
> > device by HW and also make sure SDIO device enter to idle state
> > correctly.
> > 
> > Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> > ---
> >  drivers/mmc/core/sdio.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> > index ebb387a..ada0a80 100644
> > --- a/drivers/mmc/core/sdio.c
> > +++ b/drivers/mmc/core/sdio.c
> > @@ -546,6 +546,7 @@ static int mmc_sdio_init_uhs_card(struct mmc_card *card)
> >  static void mmc_sdio_resend_if_cond(struct mmc_host *host,
> >  				    struct mmc_card *card)
> >  {
> > +	mmc_power_cycle(host, host->card->ocr);
> 
> My MMC/SDIO background is limited, but it seems this isn't needed for the
> vast majority of SDIO devices, otherwise it probably would have been added
> earlier. I wonder if it would make sense to make the power cycle
> conditional through a quirk, to limit it to the devices that need it.
> 
	
Thanks for your comment.
mmc_sdio_resend_if_cond API is not for normal initialization flow, but
for error handle flow. If mmc_sdio_resend_if_cond is invoked, it
indicates there is something wrong with the SDIO device. HW power cycle
is the basic guarantee for device to back to idle state.
Therefore this patch will not affect the normal initialization for the 
vast majority of SDIO devices, but it is very helpful for error cases
for all SDIO devices.
In my opinion, we don't need that quirk.
Could Ulf help to give some advises on this?
Thanks.

> >  	sdio_reset(host);
> >  	mmc_go_idle(host);
> >  	mmc_send_if_cond(host, host->ocr_avail);
> > -- 
> > 1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
