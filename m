Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8F4C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 03:14:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BEA320897
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 03:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BsYtbEOg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="MQyvxSE0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BEA320897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yAFeoBU9klaYRqf404Bq+AaTB5R71fAqTRVcOfJa+gY=; b=BsYtbEOgwKnjOSYegY1ZX9y8Z
	tMZuHC291FLe3DGfjSZy0F4YWYEWlpDh0MUR4Q+nkjcklfiWECMOpo81DiblXvOQVRJjQxAUoGBqW
	QPDjVyBX80UpUryJVG5fZgUYGaV1KLNusNewZuqI++kNeDtFvi4iGQ+7zNp5Ev9HCw+GsfOd9T2ZA
	ouIjtC+I+iLnVs9ErEPpmydyyQGNR05KvDhpgZoBGDLzfrZfHuglbuiKn0K+Dv0oAQ09UwWasDwpH
	MXR1Fxpz/C8LxedOc68UDch0gjPfXzhHJsmjjWTO31nbVKXYM/leTOeI9qlbq8iTYyhGnBSImikLj
	sOjklx50g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI1QP-00042k-RT; Tue, 15 Sep 2020 03:14:33 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI1QL-00041b-5p
 for linux-mediatek@lists.infradead.org; Tue, 15 Sep 2020 03:14:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600139670; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QxjINoDGZVmrQAg4UwCNgFbElvBYGScfRzCvwRPrrLA=;
 b=MQyvxSE0Nc2DDt7RS2Xym72cc4dspaQ3fqJoSUyCeBFFBHvoFjUYeuSIVPEoABE+zcoj4dNF
 g0XxMgTN5vkGPsRjkU0WDvhhSe0Xhnx0mdZrYLj4csct4YUPoc/wksiZeNg60xU6a/WHPA6k
 WF2PloXuiCIdbO16Zv7WkuS/Jio=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f60318a7f21d51b30df4c33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 03:14:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A95DC43385; Tue, 15 Sep 2020 03:14:18 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E316C433C8;
 Tue, 15 Sep 2020 03:14:17 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 15 Sep 2020 11:14:17 +0800
From: Can Guo <cang@codeaurora.org>
To: Bean Huo <huobean@gmail.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Abort tasks before clear them from
 doorbell
In-Reply-To: <d151d6a2b53cfbd7bf3f9c9313b49c4c404c4c5a.camel@gmail.com>
References: <1599099873-32579-1-git-send-email-cang@codeaurora.org>
 <1599099873-32579-2-git-send-email-cang@codeaurora.org>
 <1599627906.10803.65.camel@linux.ibm.com>
 <yq14ko62wn5.fsf@ca-mkp.ca.oracle.com>
 <1599706080.10649.30.camel@mtkswgap22>
 <1599718697.3851.3.camel@HansenPartnership.com>
 <1599725880.10649.35.camel@mtkswgap22>
 <1599754148.3575.4.camel@HansenPartnership.com>
 <010101747af387e9-f68ac6fa-1bc6-461d-92ec-dc0ee4486728-000000@us-west-2.amazonses.com>
 <d151d6a2b53cfbd7bf3f9c9313b49c4c404c4c5a.camel@gmail.com>
Message-ID: <4017d039fa323a63f89f01b5bf4cf714@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_231431_159321_0D166B97 
X-CRM114-Status: GOOD (  21.08  )
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
 James Bottomley <James.Bottomley@hansenpartnership.com>,
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

Hi Bean,

On 2020-09-11 17:09, Bean Huo wrote:
> On Fri, 2020-09-11 at 02:16 +0000, Can Guo wrote:
>> > >
>> > > So your resolution looks good to me.
>> > >
>> > > Thanks so much : )
>> >
>> > You're welcome ... but just remember I have to explain this to
>> > Linus
>> > when the merge window opens.  It would be a lot easier if this
>> > hadn't
>> > happened so please don't make it any worse ...
>> >
>> > James
>> 
>> Sorry that my changes got you confused and thank you for help
>> resolve
>> the
>> conflicts. My change ("scsi: ufs: Abort tasks before clearing them
>> from
>> doorbell") is to serve my fixes to ufs error recovery which only got
>> picked
>> up on scsi-queue-5.10. So I checked out to scsi-queue-5.10 and made
>> my
>> changes on the tip of scsi-queue-5.10, below 2 changes were not even
>> present in scsi-queue-5.10 back that time.
> 
> I mentioned here https://patchwork.kernel.org/patch/11734713/

Do you know when can this change be picked up in scsi-queue-5.10?
If I push my fixes to ufshcd_abort() on scsi-queue-5.10, they will
run into conflicts with this one again, right? How should I move
forward now? Thanks.

Regards,

Can Guo.

> 
> this change (scsi: ufs: Abort tasks before clearing them from doorbell)
> has conflicts with the scsi-fixes branch. I don't know which branch is
> the main branch we should focus on.
> 
> 
> Bean

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
