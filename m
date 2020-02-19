Return-Path: <SRS0=zz1H=4H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C9BC3404F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 02:35:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A39F24655
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 02:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cG3MFEB2";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="ah/Hsted"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A39F24655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XWvg5zm6d8ROc2aabp0C9UXoX988G9fhDVVpY7hyDTE=; b=cG3MFEB2OMMgCvQ8ph5kuGttJ
	9V+pbwDldVFnRtqUHCaBGMiZ+7rHXWYJyloT2r32SpwHghBy/22T4afLKQetE/42AYfx2rjasmcQw
	sYUmI8giFVL/vwNaQKJ2AB163HfYnPj9jp5rTECb4mJEHQbE011SamKvyUkG+XuOxM6mq72yzR8pU
	lHpz2MBsNodJQgu96HAbw0fVuleO7Po16sB82nG24kU4YOPWQqcqN58duvjF4WGc57jkukyi6Ji55
	MhKuyGue+UStMitBku3GMWAHkMoGTroe9jFeTOmkVtZXmTEGvlKYd2ft4oe3gn0+EpvSRBIrYbDD3
	3o4rjcW8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4FDA-0000cl-0d; Wed, 19 Feb 2020 02:35:40 +0000
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4FD1-0000UY-0g
 for linux-mediatek@lists.infradead.org; Wed, 19 Feb 2020 02:35:32 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582079730; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jXPj6BmmHK1fbvzmEuD+DaWJ8U2v+ztHn2qwHyzklAE=;
 b=ah/Hsted3BcoScRqtNcbtvKBsNOEk43E9EmsqFNr4Y3/Nwp57hNbg7msEzQPVuzpd9ztIEuJ
 LN0CHFcenaEimhADiPVbEXtRKt44bW76WkRwKkA08J5YYj+6ua5mhXVxrzsIFlkRFTl4vp8v
 UDdZj25KIgwGQMznDWES6qb7JW8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4c9ef1.7f2ecfa45d18-smtp-out-n02;
 Wed, 19 Feb 2020 02:35:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 26925C43383; Wed, 19 Feb 2020 02:35:29 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 90523C433A2;
 Wed, 19 Feb 2020 02:35:27 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 19 Feb 2020 10:35:27 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] scsi: ufs: add required delay after gating
 reference clock
In-Reply-To: <56c1fc80919491d058d904fcc7301835@codeaurora.org>
References: <20200217093559.16830-1-stanley.chu@mediatek.com>
 <20200217093559.16830-2-stanley.chu@mediatek.com>
 <c6874825dd60ea04ed401fbd1b5cb568@codeaurora.org>
 <1581945168.26304.4.camel@mtksdccf07>
 <e518c4d1d94ec15e9c4c31c34a9e42d1@codeaurora.org>
 <1581946449.26304.15.camel@mtksdccf07>
 <56c1fc80919491d058d904fcc7301835@codeaurora.org>
Message-ID: <a8cd5beee0a1e12a40da752c6cd9b5de@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_183531_115837_D264925E 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Stanely,

On 2020-02-17 21:42, Can Guo wrote:
> On 2020-02-17 21:34, Stanley Chu wrote:
>> Hi Can,
>> 
>> On Mon, 2020-02-17 at 21:22 +0800, Can Guo wrote:
>>> On 2020-02-17 21:12, Stanley Chu wrote:
>>> > Hi Can,
>>> >
>>> >
>>> >> >  			} else if (!on && clki->enabled) {
>>> >> >  				clk_disable_unprepare(clki->clk);
>>> >> > +				wait_us = hba->dev_info.clk_gating_wait_us;
>>> >> > +				if (ref_clk && wait_us)
>>> >> > +					usleep_range(wait_us, wait_us + 10);
>>> >>
>>> >> Hi St,anley,
>>> >>
>>> >> If wait_us is 1us, it would be inappropriate to use usleep_range()
>>> >> here.
>>> >> You have checks of the delay in patch #2, but why it is not needed
>>> >> here?
>>> >>
>>> >> Thanks,
>>> >> Can Guo.
>>> >
>>> > You are right. I could make that delay checking as common function so
>>> > it
>>> > can be used here as well to cover all possible values.
>>> >
>>> > Thanks for suggestion.
>>> > Stanley
>>> 
>>> Hi Stanley,
>>> 
>>> One more thing, as in patch #2, you have already added delays in your
>>> ufshcd_vops_setup_clocks(OFF, PRE_CHANGE) path, plus this delay here,
>>> don't you delay for 2*bRefClkGatingWaitTime in ufshcd_setup_clocks()?
>>> As the delay added in your vops also delays the actions of turning
>>> off all the other clocks in ufshcd_setup_clocks(), you don't need the
>>> delay here again, do you agree?
>> 
>> MediaTek driver is not using reference clocks named as "ref_clk" 
>> defined
>> in device tree, thus the delay specific for "ref_clk" in
>> ufshcd_setup_clocks() will not be applied in MediaTek platform.
>> 
>> This patch is aimed to add delay for this kind of "ref_clk" used by 
>> any
>> future vendors.
>> 
>> Anyway thanks for the reminding : )
>> 
>>> 
>>> Thanks,
>>> Can Guo.
>> 
>> 
>> Thanks,
>> Stanley
> 
> Hi Stanley,
> 
> Then we are unluckily hit by this change. We have ref_clk in DT, thus
> this change would add unwanted delays to our platforms. but still we
> disable device's ref_clk in vops. :)
> 
> Could you please hold on patch #1 first? I need sometime to have a
> dicussion with my colleagues on this.
> 
> Thanks.
> Can Guo.

Since we all need this delay here, how about put the delay in the
entrence of ufshcd_setup_clocks(), before vops_setup_clocks()?
If so, we can remove all the delays we added in our vops since the
delay anyways delays everything inside ufshcd_setup_clocks().

Meanwhile, if you want to modify the delay
(hba->dev_info.clk_gating_wait_us) for some reasons, say for specific
UFS devices, you still can do it in vops_apply_dev_quirks().

What do you say?

Thanks,
Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
