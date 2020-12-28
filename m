Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1733DC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 01:34:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F9C208BA
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 01:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F9C208BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LzjimB73NAsQmOcAZ1phACYZfGVeqw4H9tLkcsasC6Q=; b=DRhVxU0jsTm9Y4Ejti+m6Hnyw
	jTo15XsqApYqf+LOyseSSOaFALTuHvv1DISK6LyICC3Xa18WL1laqm9Tmv4LVL/Nhh4BYR2sscWjG
	lZinideXYy8j5OzMXIEo5EAcsOW0+8mxTt3wY1Htcn294zrAT+OkxZquveHHK6pEUlb9fbVoVMtAG
	CklQANVc7H0NhYraRKnrHCqM/UsfZ5/DfCYgAMGqvgJi5iTnWj0wrLossVLPzrUGsy4h29P0qLZ/d
	gFbONYCug5vRSyJvtQYwmP1Ta2F37QUVqqW4zvB6wfd2nhIFA51wJY3eMTMVFA9AxTLIMSeSrtA7x
	pbmjWeQrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kthPy-0000fX-2l; Mon, 28 Dec 2020 01:33:50 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kthPu-0000Sn-4k
 for linux-mediatek@lists.infradead.org; Mon, 28 Dec 2020 01:33:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609119227; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eZTjBgbTUfr1OVRJYpoYf8PCujArXTjn/09ZaCNxY/w=;
 b=TMVI8oTBrgSaQlL50XDabgFO7GHzcWKf/wzfzTqC0ZkxOWYlwPZjTaEkV/FfY6ulHYwncAgf
 +pHVlBlsDY6tM82g15UKtdmKrUVvhpCFeRR4bdbLWesYLLB5NA/FTtNn8xLDmOoGVmHa+geK
 psIlcb8oV5cdnBxd6S3U7HTvWUs=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fe935f9db8e07fa6cf72fe3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Dec 2020 01:33:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C7D6C43461; Mon, 28 Dec 2020 01:33:44 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 434FDC433CA;
 Mon, 28 Dec 2020 01:33:44 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 28 Dec 2020 09:33:44 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
In-Reply-To: <1608817657.14045.30.camel@mtkswgap22>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
 <ff8efda608e6f95737a675ee03fa3ca2@codeaurora.org>
 <1608796334.14045.21.camel@mtkswgap22>
 <DM6PR04MB6575D0DD2C04692AEF771494FCDD0@DM6PR04MB6575.namprd04.prod.outlook.com>
 <5eb12622222bd9ba5e705801a204f3160ba3966b.camel@gmail.com>
 <1608817657.14045.30.camel@mtkswgap22>
Message-ID: <ed467feb9c692896ddffe3c36e0dbced@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201227_203347_318213_32323F13 
X-CRM114-Status: GOOD (  25.29  )
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
Cc: jiajie.hao@mediatek.com, Bean Huo <huobean@gmail.com>,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com,
 Avri Altman <Avri.Altman@wdc.com>, alice.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-24 21:47, Stanley Chu wrote:
> Hi Avri, Bean,
> 
> On Thu, 2020-12-24 at 13:01 +0100, Bean Huo wrote:
>> On Thu, 2020-12-24 at 11:03 +0000, Avri Altman wrote:
>> > > > Do you see any substantial benefit of having
>> > > > fWriteBoosterBufferFlushEn
>> > > > disabled?
>> > >
>> > > 1. The definition of fWriteBoosterBufferFlushEn is that host allows
>> > > device to do flush in anytime after fWriteBoosterBufferFlushEn is
>> > > set as
>> > > on. This is not what we want.
>> > >
>> > > Just Like BKOP, We do not want flush happening beyond host's
>> > > expected
>> > > timing that device performance may be "randomly" dropped.
>> >
>> > Explicit flush takes place only when the device is idle:
>> > if fWriteBoosterBufferFlushEn is set, the device is idle, and before
>> > h8 received.
>> > If a request arrives, the flush operation should be halted.
>> > So no performance degradation is expected.
>> 
>> Hi Stanley
>> 
>> Avri's comment is correct, fWriteBoosterBufferFlushEn==1, device will
>> flush only when it is in idle, once there is new incoming request, the
>> flush will be suspended. You should be very careful when you want to
>> skip this stetting of this flag.
> 
> Very appreciate your the clarification.
> 
> However similar to "Background Operations Termination Latency", while
> the next request comes, device may need some time to suspend on-going
> flush operations. This delay may "randomly" degrade the performance
> right?

That can be case by case (or vendor by vendor), but generally I agree
with you on this.

> 
> Since the configuration, i.e., enable
> fWriteBoosterBufferFlushDuringHibernate only with
> fWriteBoosterBufferFlushEn disabled, has been applied in many of our
> mass-produced products these yeas, we would like to keep it unless the
> new setting has obvious benefits.

Thanks for sharing the info. I will leave the decision to Asutosh on 
this.

Thanks,
Can Guo.

> 
> Thanks,
> Stanley Chu
> 
>> 
>> Bean
>> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
