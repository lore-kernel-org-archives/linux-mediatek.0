Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCD5C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 01:33:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87FB221F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 01:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D87FB221F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qHQR6dqftHfyEg2wisb8YVPcWkW1hl09xh5xBjcrgfw=; b=fiJ4UVH0uCwFDY9bmSvZFkVpa
	C1CeJqrtL27S9sfXz2vmptcU3ySt0VIKeU+zIGRMog4kDQvUqgsX5sAxt8FA3xxYFYyWsBUegsg0E
	IlmHlys1GqPypEI+lmPfNfJe85tWR1HCYWobFMMFtFWcXN51ZG7iesO+XrBaDBt2wzxXfixytm/ql
	2DMIlR+7Gahz9+6Wic8knHjFvALtJlA69ucvsPjigMTCdoShS1S3BnAPn0Ho2PZCt3185y6nEeDkB
	SfAzes6DVbN05pEGgz8MYz8NxX5XQMG3us3/CLTWycdVzQlzDmcLr2iRUjHqv1ZKKaBR3N3fwnNQN
	yKo3oK13A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kthP3-0000UV-4I; Mon, 28 Dec 2020 01:32:53 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kthOz-0000Sn-0W
 for linux-mediatek@lists.infradead.org; Mon, 28 Dec 2020 01:32:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609119169; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5izmRUaFyiNbQJAkrmtwoShw5y9ugaVMj3WX1TS+BDw=;
 b=RfSzfCrdq1q8PaEMqbE9WVZ6VsNq19+vX6SaVGwT2Ri5ZSuuBKGiRRCABNVIzGmjYFyVl+S3
 1hzQ7Bxhz4trHq5Gx0h1Sp7K5v1Dz7cUiLFfGK3zTwoxLeOquLSn+A1k92mx1D0kgOBDd95N
 7LDPgk78QWk2Yjx6W1VT5eglY9k=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fe935b5cfe5dd67db893379 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Dec 2020 01:32:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D1A33C43466; Mon, 28 Dec 2020 01:32:37 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A2AF9C433CA;
 Mon, 28 Dec 2020 01:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2AF9C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
To: Stanley Chu <stanley.chu@mediatek.com>, Bean Huo <huobean@gmail.com>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
 <ff8efda608e6f95737a675ee03fa3ca2@codeaurora.org>
 <1608796334.14045.21.camel@mtkswgap22>
 <DM6PR04MB6575D0DD2C04692AEF771494FCDD0@DM6PR04MB6575.namprd04.prod.outlook.com>
 <5eb12622222bd9ba5e705801a204f3160ba3966b.camel@gmail.com>
 <1608817657.14045.30.camel@mtkswgap22>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <d77a22a9-ea8b-0785-4a9b-62056d8e8e56@codeaurora.org>
Date: Sun, 27 Dec 2020 17:32:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1608817657.14045.30.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201227_203249_530625_87390A73 
X-CRM114-Status: GOOD (  26.84  )
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
Cc: "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 Avri Altman <Avri.Altman@wdc.com>, Can Guo <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/24/2020 5:47 AM, Stanley Chu wrote:
> Hi Avri, Bean,
> 
> On Thu, 2020-12-24 at 13:01 +0100, Bean Huo wrote:
>> On Thu, 2020-12-24 at 11:03 +0000, Avri Altman wrote:
>>>>> Do you see any substantial benefit of having
>>>>> fWriteBoosterBufferFlushEn
>>>>> disabled?
>>>>
>>>> 1. The definition of fWriteBoosterBufferFlushEn is that host allows
>>>> device to do flush in anytime after fWriteBoosterBufferFlushEn is
>>>> set as
>>>> on. This is not what we want.
>>>>
>>>> Just Like BKOP, We do not want flush happening beyond host's
>>>> expected
>>>> timing that device performance may be "randomly" dropped.
>>>
>>> Explicit flush takes place only when the device is idle:
>>> if fWriteBoosterBufferFlushEn is set, the device is idle, and before
>>> h8 received.
>>> If a request arrives, the flush operation should be halted.
>>> So no performance degradation is expected.
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
> 

Have you actually seen this happening? I've not come across any random 
performance degradation concerns, hence asking.

 From what I've observed is the handling of WB buffer flush depends on 
how flash vendors implement it. Some vendors that I've seen just create 
a separate WB buffer in an instant. I don't know the intricacies of 
their implementation, but I guess the new WB buffer handles the requests 
while the previous one is being flushed.
Anyway, for Qualcomm platforms we plan to have 
fWriteBoosterBufferFlushEn=1 by default.

> Since the configuration, i.e., enable
> fWriteBoosterBufferFlushDuringHibernate only with
> fWriteBoosterBufferFlushEn disabled, has been applied in many of our
> mass-produced products these yeas, we would like to keep it unless the
> new setting has obvious benefits.
> 
> Thanks,
> Stanley Chu
> 
>>
>> Bean
>>
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
