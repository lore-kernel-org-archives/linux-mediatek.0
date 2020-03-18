Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A037C10DCE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 06:03:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD2F20663
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 06:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mmK9Bpts";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lkfUPx7g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD2F20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mL5OIvSll9wI1o5Npjx/G/UOwtEMYSDoMGenFmCwXrw=; b=mmK9BptstAAiqp
	oV9VVBzQ/x1tWXiPAW5a136HLfDX4HJiDsrlmRaaCyVJHv5cwqT05Gn6FyN2I5o002u3MkL3VjRO2
	yl9miLXCFyrXjEzyB8Ff8piNmQSIUj1UoZtr2fSdDgcU3fWF0XnLW3m11aErvWQkbUaUjuCHvo/fv
	ZoffjmYGGJtYJMr2HayF5Yf53fzlcoddjOZgroUZN34n97UdH8/jjNfUk2s3lA3zHMLdPCCi1jfXb
	lZpzd7/+Lb+mhZA+vmbdGm1XAJ5ndOz9NZG5eUASVQ5iiIVRgQrixrNbrjA5TPX9HysbJqoNYN0ax
	shHo+Et3BgWH9iBr3KMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jERnP-0005sH-R2; Wed, 18 Mar 2020 06:03:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jERnE-0005bx-Gg; Wed, 18 Mar 2020 06:03:05 +0000
X-UUID: 0010e68ef9d542c4a1e19e54408ef303-20200317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JtfsImJ1VhBceXif49tzk/48LaZcVQ1FVbSnBovfdT8=; 
 b=lkfUPx7g/8ZbGbhJ0ml3nUUU84sJF8s40F748F1YqvxvRENnG6VQ28Jss4VnhdnvKJNiFJAamenKri+7x95wDhVVt3tmDwLCnsMJYaQ3imIVTXO6aG3uRNoOY0ORo4MuIth6ti1ye759IJ7r5JWhp9zE7cUJ8hrJnWiJ1HyHLak=;
X-UUID: 0010e68ef9d542c4a1e19e54408ef303-20200317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1401561184; Tue, 17 Mar 2020 22:03:01 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Mar 2020 23:02:59 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Mar 2020 14:00:40 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 18 Mar 2020 14:03:37 +0800
Message-ID: <1584511378.14250.55.camel@mtksdccf07>
Subject: Re: [SPAM]Re: [PATCH v6 3/7] scsi: ufs: introduce common delay
 function
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Wed, 18 Mar 2020 14:02:58 +0800
In-Reply-To: <b7a6045e-9615-0cd2-9812-2871bf9ba44c@acm.org>
References: <20200316085303.20350-1-stanley.chu@mediatek.com>
 <20200316085303.20350-4-stanley.chu@mediatek.com>
 <fdf91490-9c7d-df34-1c1f-e03e12855378@acm.org>
 <1584404000.14250.28.camel@mtksdccf07>
 <b7a6045e-9615-0cd2-9812-2871bf9ba44c@acm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_230304_568610_5FEF7174 
X-CRM114-Status: GOOD (  22.65  )
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
Cc: linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

On Mon, 2020-03-16 at 20:59 -0700, Bart Van Assche wrote:
> On 2020-03-16 17:13, Stanley Chu wrote:
> > On Mon, 2020-03-16 at 09:23 -0700, Bart Van Assche wrote:
> >> On 3/16/20 1:52 AM, Stanley Chu wrote:
> >>> +void ufshcd_wait_us(unsigned long us, unsigned long tolerance, bool can_sleep)
> >>> +{
> >>> +	if (!us)
> >>> +		return;
> >>> +
> >>> +	if (us < 10 || !can_sleep)
> >>> +		udelay(us);
> >>> +	else
> >>> +		usleep_range(us, us + tolerance);
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(ufshcd_wait_us);
> >>
> >> I don't like this function because I think it makes the UFS code harder 
> >> to read instead of easier. The 'can_sleep' argument is only set by one 
> >> caller which I think is a strong argument to remove that argument again 
> >> and to move the code that depends on that argument from the above 
> >> function into the caller. Additionally, it is not possible to comprehend 
> >> what a ufshcd_wait_us() call does without looking up the function 
> >> definition to see what the meaning of the third argument is.
> >>
> >> Please drop this patch.
> > 
> > Thanks for your review and comments.
> > 
> > If the problem is the third argument 'can_sleep' which makes the code
> > not be easily comprehensible, how about just removing 'can_sleep' from
> > this function and keeping left parts because this function provides good
> > flexibility to users to choose udelay or usleep_range according to the
> > 'us' argument?
> 
> Hi Stanley,
> 
> I think that we need to get rid of 'can_sleep' across the entire UFS
> driver. As far as I can see the only context from which 'can_sleep' is
> set to true is ufshcd_host_reset_and_restore() and 'can_sleep' is set to
> true because ufshcd_hba_stop() is called with a spinlock held. Do you
> agree that it is wrong to call udelay() while holding a spinlock() and
> that doing so has a bad impact on the energy consumption of the UFS
> driver?

Thanks for your positive suggestion.

Indeed using udelay() with spinlock held may have performance or power
consumption concerns. However the concern in ufshcd_hba_stop() could be
ignored in most cases since the execution period of changing bit 0 in
REG_CONTROLLER_ENABLE from 1 to 0 shall be very fast. In my local
environment, it could have only several 'ns' latency thus udelay() was
never executed during the stress test. The delay here may be required
for rare cases that host is under an abnormal state.


> Has it already been considered to use another mechanism to
> serialize REG_CONTROLLER_ENABLE changes, e.g. a mutex?

I think mutex is not suitable for REG_CONTROLLER_ENABLE case because
stopping host (by what ufshcd_hba_stop does) will reset doorbell bits in
the same time by host, and those doorbell bits are looked up by UFS
interrupt routine for request completion flow as well.

I agree that "can_sleep" can be improved and may have other optimized
way but this is beyond this patch set. I would like to remove the
"can_sleep" related modification from this patch set first.

Thanks,
Stanley Chu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
