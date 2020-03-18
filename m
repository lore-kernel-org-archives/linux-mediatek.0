Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894EAC10DCE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 06:14:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D63420663
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 06:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQCN7Pjv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oQcwWiss"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D63420663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+7Oql+40bYjFLMoHigXWfqGksPdLBBXQYQYspBAVSw=; b=NQCN7PjvODQnJT
	IyCJuWbk711HKVQD76ULlKuGqgie6Yd2Ni5PrucQACbnA6JNf2tFmtxnBfVrF/Oixs4hWvd09RRLI
	ddE3q1Uu7mfUCK7DPkkJ6nwYr0MWh2JPHyG5Q83dTgTpnygjojPYJesJ+9UJPNrQKWjKVkIujoGQC
	9ihNq6u1sdC6Ww0+Is2BptOR11kZRhkm/kIO7OFc/qL+V9Wj1qoBS13zt/RQ4TPyjv6EPL6p+eKNL
	+h4JGOcrBqRgSfihwfCc8u9oAWQDrzRKvowf1ukuXC86B2qUF69sodUVgszekY119V3G+RGe5T+zK
	PZEvK+6QanPTRSi8NNYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jERyC-0000n5-GO; Wed, 18 Mar 2020 06:14:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jERxz-0000bv-6k; Wed, 18 Mar 2020 06:14:12 +0000
X-UUID: 3a744552c3874b36b44b3cd2e223c143-20200317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gv0c5/3tvz4dQesZfQxOdDx8ye9ZpCqR4KhwIKL8Yyw=; 
 b=oQcwWisshxa/A4CUOwZr8eMmCS4JoPdDTlcJ5wgYRN5yrlk+Bb8d5E7mpT7T51T9OQ3P8VZf77ecmHFZbEUNJtCIVoC0Ky1KnO5DJ02KTO0OXIo+tAOXC3CvCzeUL07nBRg2NvvDlNv1/5+vDYb1BzrXgW6snaozr7E9azAdgAM=;
X-UUID: 3a744552c3874b36b44b3cd2e223c143-20200317
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 25997053; Tue, 17 Mar 2020 22:14:10 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Mar 2020 23:14:30 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Mar 2020 14:11:49 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 18 Mar 2020 14:11:05 +0800
Message-ID: <1584512047.14250.56.camel@mtksdccf07>
Subject: Re: [PATCH v6 3/7] scsi: ufs: introduce common delay function
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>
Date: Wed, 18 Mar 2020 14:14:07 +0800
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
X-CRM114-CacheID: sfid-20200317_231411_251766_F97A3EA9 
X-CRM114-Status: GOOD (  22.56  )
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

(Sorry to resend this mail with "[SPAM]" prefix removed in title)

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
