Return-Path: <SRS0=SHoq=2V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04BDC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 08:06:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B815206D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 08:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XQjTZC+P";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="W0HYANFW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B815206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nhr1IrJdsTbAYBxNvCdzksJfYHIkfejEEyKv1ouj4WY=; b=XQjTZC+Pe4iuBft7uGykknz5S
	bJFhAr+4/x8ImoEsa2+D0loveFf/MD5YdXDiB3aYsBYWK+E/IGzq2ldFpX6SvFprR4EGspDKjvRGD
	sc78qlQe9d8nsaECQRn78pPXZ1C7BhVJzEH76pbl6nr13uM0ADZDSNerPNw8R23pOWrD+Nm7zZQp7
	gy8xDOMeLnOc+j72Scnyv1wejhvGz8xp8skiOCErni7K+yC5+znUbE7PntWEe1IrgLEE18HBfOxw/
	oXbtu2tjKNO+GjaJR/Eq0Yga6wQ5F0UXZwMy811mwWk+KTvYQl00J5B1/hbUnV8BYQE0U/CzyKeOn
	ljDutK5gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imCXj-0004ON-Ks; Tue, 31 Dec 2019 08:06:19 +0000
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imCXX-0004FH-Nh
 for linux-mediatek@lists.infradead.org; Tue, 31 Dec 2019 08:06:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1577779569; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BbUFBKLuGvpwFWTaBaOIbSVqQ9CkH2lY2UR83lDpcCo=;
 b=W0HYANFWsngESK2FAS28NFio0FD4M5ZS7J6GEjwceMoEZhhjZFSAYb9h/5FrFV07kL2HFOaU
 UctyvYfPcCcWzvISg3IuktJ6WPpDWe90ljciQLaxxv2j/8O4w46sgWIFhpKS+K/DK3xQdtZL
 hoeCfpeWon8dzB1W54tIAleM/M8=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0b0168.7f89f30c46c0-smtp-out-n01;
 Tue, 31 Dec 2019 08:06:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 221D0C433A2; Tue, 31 Dec 2019 08:06:00 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25D52C43383;
 Tue, 31 Dec 2019 08:05:59 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 31 Dec 2019 16:05:59 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] scsi: ufs: set device as default active power mode
 during initialization only
In-Reply-To: <1577766179.13164.24.camel@mtkswgap22>
References: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
 <1577693546-7598-2-git-send-email-stanley.chu@mediatek.com>
 <fd129b859c013852bd80f60a36425757@codeaurora.org>
 <1577754469.13164.5.camel@mtkswgap22>
 <836772092daffd8283a97d633e59fc34@codeaurora.org>
 <1577766179.13164.24.camel@mtkswgap22>
Message-ID: <cf94a0e8f8e0746ae5f8434631207ea4@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_000609_758106_549D2829 
X-CRM114-Status: GOOD (  18.06  )
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 linux-scsi-owner@vger.kernel.org, subhashj@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, pedrom.sousa@synopsys.com,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2019-12-31 12:22, Stanley Chu wrote:
> Hi Can,
> 
> 
>> Hi Stanley,
>> 
>> I see skipping ufshcd_set_ufs_dev_active() in ufshcd_probe_hba()
>> if it is called from ufshcd_resume() path is the purpose here.
>> 
>> If so, then ufshcd_set_dev_pwr_mode() would be called, meaning
>> SSU command will be sent. Why is this SSU command needed to be
>> sent after a full host reset and restore? Is ufshcd_probe_hba()
>> not enough to make UFS device fully functional?
> 
> After resume (for both runtime resume and system resume), device power
> mode shall be back to "Active" to service incoming requests.
> 
> I see two cases need device power mode transition during resume flow
> 1. Device Power Mode = Sleep
> 2. Device Power Mode = PowerDown
> 
> For 1, ufshcd_probe_hba() is not invoked during resume flow,
> hba->curr_dev_pwr_mode = SLEEP, thus ufshcd_resume() can invoke
> ufshcd_set_dev_pwr_mode() to change device power mode.
> 
> For 2, ufshcd_probe_hba() is invoked during resume flow, before this
> fix, hba->curr_dev_pwr_mode will be set to ACTIVE (note that only this
> flag is set as ACTIVE, but device may be still in PowerDown state if
> device power is not fully shutdown or device HW reset is not executed
> before resume), in the end, ufshcd_resume() will not invoke
> ufshcd_set_dev_pwr_mode() to send SSU command to make device change 
> back
> to Active power mode.

Hi Stanley,

Isn't below change fixing the problem you are saying above?
With it, after ufshcd_link_startup(), UFS device's power mode will
become Active anyways. Do you mean below change is not working properly
and you are removing it?

commit 7caf489b99a42a9017ef3d733912aea8794677e7
Author: subhashj@codeaurora.org <subhashj@codeaurora.org>
Date:   Wed Nov 23 16:32:20 2016 -0800

     scsi: ufs: issue link starup 2 times if device isn't active

     If we issue the link startup to the device while its UniPro state is
     LinkDown (and device state is sleep/power-down) then link startup
     will not move the device state to Active. Device will only move to
     active state if the link starup is issued when its UniPro state is
     LinkUp. So in this case, we would have to issue the link startup 2
     times to make sure that device moves to active state.

Thanks,

Can Guo

> 
> But if device is fully reset before resume (not by current mainstream
> driver), device can be already in "Active" power mode after power on
> again during resume flow. In this case, it is OK to set
> hba->curr_dev_pwr_mode as ACTIVE in ufshcd_probe_hba() and SSU command
> is not necessary.
> 
> Thanks,
> Stanley
> 
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
