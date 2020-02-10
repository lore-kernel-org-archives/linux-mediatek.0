Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461D4C2BA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 01:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18F2220715
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 01:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PyDjQxIC";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="EiE7s8OR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18F2220715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sZZZfVy9D6plGwj+gRr1UAbCg7+R5gPcPsKz5+jHQpo=; b=PyDjQxICrpAk2+KPzgw/krgoN
	w/XzLIIqjIE10QayzqutyL1Z6sJ/r/W32QkOeFN1H8Q77uJuo0K/JAj+Wmqn4BQW9pOsw7cGPJI6+
	8Hr30MpnOcI9Wdu7A8qLETF8RR0lOhCmXHJG47PSGKoOIJRxfUjY9vmD8KV7WFitHl2Vs+N7HbNwr
	yyNkCbq2c8kFiOwHkaJbtE84DTmZxlG2YWHKyiUpLM+ndnW4tp81euYbI1OY+c+GFFlSIc09pw2iS
	/2HgG+IAjo+SxbI1cjUr5TDtyM97O1hR4P6GDo/80B7qJpT2tpW/BsTMWrZ2ejx33rJAP16bd9S3R
	Q7CdMkq9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0xsZ-00058J-Cl; Mon, 10 Feb 2020 01:28:51 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0xsW-00057H-4Z
 for linux-mediatek@lists.infradead.org; Mon, 10 Feb 2020 01:28:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1581298122; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6vYe1GUkbL8Po1/pcPili8cJnCI9H8iOTlQ55WPbG+g=;
 b=EiE7s8ORFs0nqqWv2kzhzzHte7j5e5+9WLhsLHkGQHN7WyXhsBFqXVQ7dTbjuBEt8Fyz/UAN
 B/jX5clw3a24ZtVO1zLekHoDHgblNZOJjaht5dyE4Hst0gIMJI8cIfTQb155rNi+8q0D8fcN
 dyMG4YNN+LAwC3X69ngTfNe7bOU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e40b1c9.7f8d7295d848-smtp-out-n01;
 Mon, 10 Feb 2020 01:28:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 95E42C447A3; Mon, 10 Feb 2020 01:28:39 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 16FE7C433A2;
 Mon, 10 Feb 2020 01:28:38 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 09:28:38 +0800
From: Can Guo <cang@codeaurora.org>
To: Avri Altman <Avri.Altman@wdc.com>
Subject: Re: [PATCH v7 5/8] scsi: ufs: Fix ufshcd_hold() caused scheduling
 while atomic
In-Reply-To: <MN2PR04MB6991346267CD619E823501F0FC1D0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1580978008-9327-1-git-send-email-cang@codeaurora.org>
 <1580978008-9327-6-git-send-email-cang@codeaurora.org>
 <MN2PR04MB6991346267CD619E823501F0FC1D0@MN2PR04MB6991.namprd04.prod.outlook.com>
Message-ID: <2c485ce3fac4d92ab3776daecc1af493@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_172848_244162_A65F4178 
X-CRM114-Status: GOOD (  17.37  )
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Stanley Chu <stanley.chu@mediatek.com>,
 rnayak@codeaurora.org, saravanak@google.com, linux-scsi@vger.kernel.org,
 Venkat Gopalakrishnan <venkatg@codeaurora.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Bean Huo <beanhuo@micron.com>,
 kernel-team@android.com, Bart Van Assche <bvanassche@acm.org>,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-02-06 18:28, Avri Altman wrote:
> Hi,
> 
>> 
>> The async version of ufshcd_hold(async == true), which is only called
>> in queuecommand path as for now, is expected to work in atomic 
>> context,
>> thus it should not sleep or schedule out. When it runs into the 
>> condition
>> that clocks are ON but link is still in hibern8 state, it should bail 
>> out
>> without flushing the clock ungate work.
> 
> Fixes: f2a785ac2312 (scsi: ufshcd: Fix race between clk scaling and 
> ungate work)

Sorry, missed this one, if another version is needed, I will add this 
line.

>> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
>> Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
>> ---
>>  drivers/scsi/ufs/ufshcd.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> index bbc2607..e8f7f9d 100644
>> --- a/drivers/scsi/ufs/ufshcd.c
>> +++ b/drivers/scsi/ufs/ufshcd.c
>> @@ -1518,6 +1518,11 @@ int ufshcd_hold(struct ufs_hba *hba, bool 
>> async)
>>                  */
>>                 if (ufshcd_can_hibern8_during_gating(hba) &&
>>                     ufshcd_is_link_hibern8(hba)) {
>> +                       if (async) {
>> +                               rc = -EAGAIN;
>> +                               hba->clk_gating.active_reqs--;
>> +                               break;
>> +                       }
>>                         spin_unlock_irqrestore(hba->host->host_lock, 
>> flags);
>>                         flush_work(&hba->clk_gating.ungate_work);
>>                         spin_lock_irqsave(hba->host->host_lock, 
>> flags);
> Since now the above code is shared in all cases,
> Maybe find a more economical way to pack it?
> 
> Thanks,
> Avri
> 
> 

There are only 2 of this same code pieces in ufshcd_hold() and located
in different cases, meanwhile there can be fall through, I don't see
a good way to pack it, can you suggest if you have any ideas?

Regards,
Can Guo.

>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> Forum,
>> a Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
