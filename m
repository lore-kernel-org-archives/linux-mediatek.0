Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF06C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 02:17:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E1A21582
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 02:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zYW1QG2q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="MLPshQkc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="TUiWNhyH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E1A21582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xGPGW0EKa76Jerl4AfebXu1KkA5oNp8iASElntgSrvs=; b=zYW1QG2q8SUFKbdYDe8zShxrs
	HWsQ/XTaOsqyJdSAi7yAQe1ix7sZuGUq58D/d7W148Rt6zxPkkyDqRlJYsCDU7noxGOyEnLHDV/fC
	YJg2M+8D8R24zKxHn0+oxjeSuKFnI3L7GbW0PG8WZ94hoin8JNxuSOnmYUo5L21mKibWHsMgFVHyl
	T4lsWJ3a6HJq/CJyZMQWeHfS0csZ6BxUqyzthnrhSzT1yRnOFEpA0yS7545GjZLQOSmroU+RlILhB
	AYMPLOehzHLujadNpQMCNlgQvq5ZmStlC8oGYec94qRE0jC0rnQrO7zFO2JFLqjeGHy0DCWluu9AN
	PC4DKhCbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGYcX-0004Z9-Ut; Fri, 11 Sep 2020 02:17:02 +0000
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGYcV-0004Ya-CQ; Fri, 11 Sep 2020 02:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599790615;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=YMEAwuxsKMbLrfJEl/H5qAgOFNr352yvsM3+o99v2c4=;
 b=MLPshQkcwzsTN0J74wXAWncaYXejbahAfQ1fb2WkDy27ntxS/tCds8VUnbujzTvd
 oS6xYfg0p5wN6f76OSOLNgBl7o28qzhdtYv5ZUmcyewnXNEr0TFIwITg/Sa7nWTDwZ0
 m414FGqqN/dwvmiPGou0RUeeXLZ3evtdCy1MUR6g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599790615;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=YMEAwuxsKMbLrfJEl/H5qAgOFNr352yvsM3+o99v2c4=;
 b=TUiWNhyHJOoI6fghXmGQ6ibXU/PDVBdbUyOBqpkZU06crB+Q4udrkEqQaTUf5A5Z
 3gZ5YnwJ+ShGlytfHnv+M1yNxZyH1QfKqBsp2aiXZPINYLEcgFCrpwRXChfCn+TJLu7
 UyDYtV9ahnlJCWXH1ij+ewEOHjJ3h9CLEOzwBptM=
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 02:16:55 +0000
From: Can Guo <cang@codeaurora.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Abort tasks before clear them from
 doorbell
In-Reply-To: <1599754148.3575.4.camel@HansenPartnership.com>
References: <1599099873-32579-1-git-send-email-cang@codeaurora.org>
 <1599099873-32579-2-git-send-email-cang@codeaurora.org>
 <1599627906.10803.65.camel@linux.ibm.com>
 <yq14ko62wn5.fsf@ca-mkp.ca.oracle.com>
 <1599706080.10649.30.camel@mtkswgap22>
 <1599718697.3851.3.camel@HansenPartnership.com>
 <1599725880.10649.35.camel@mtkswgap22>
 <1599754148.3575.4.camel@HansenPartnership.com>
Message-ID: <010101747af3897c-af76490f-29e5-4187-a515-001ffbfcbc2f-000000@us-west-2.amazonses.com>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_221659_882388_AC3D455B 
X-CRM114-Status: GOOD (  15.65  )
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
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 open list <linux-kernel@vger.kernel.org>, saravanak@google.com,
 nguyenb@codeaurora.org, ziqichen@codeaurora.org,
 Avri Altman <avri.altman@wdc.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 Bart Van Assche <bvanassche@acm.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi James and Stanley,

On 2020-09-11 00:09, James Bottomley wrote:
> On Thu, 2020-09-10 at 16:18 +0800, Stanley Chu wrote:
> [...]
>> > + 	if (!err) {
>> >  +cleanup:
>> 
>> Yeah, considering Bean Huo's patch "scsi: ufs: No need to send Abort
>> Task if the task in DB was cleared", "cleanup" label shall be added
>> back here.
>> 
>> So your resolution looks good to me.
>> 
>> Thanks so much : )
> 
> You're welcome ... but just remember I have to explain this to Linus
> when the merge window opens.  It would be a lot easier if this hadn't
> happened so please don't make it any worse ...
> 
> James

Sorry that my changes got you confused and thank you for help resolve 
the
conflicts. My change ("scsi: ufs: Abort tasks before clearing them from
doorbell") is to serve my fixes to ufs error recovery which only got 
picked
up on scsi-queue-5.10. So I checked out to scsi-queue-5.10 and made my
changes on the tip of scsi-queue-5.10, below 2 changes were not even
present in scsi-queue-5.10 back that time.

scsi: ufs: Clean up completed request without interrupt notification
scsi: ufs: No need to send Abort Task if the task in DB was cleared

Is there anything wrong with my work flow above? Please let me know the
right process so that I can avoid such conflicts in my next changes, 
which
also touch the func ufshcd_abort(). Thanks!

Regards,

Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
