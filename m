Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450B0C47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 21:19:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68EE613E9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 21:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E68EE613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4L8Qano+vxkHU2b763IQphBhRqQD2xy1uvuSke4jNM=; b=uDVymsZ5NfLBNXpe8bGBRBtSaC
	Mio6chBMyT8b5zm7YFhQluDQYgX8h2KCVW5KrO94NwR8gvbJcfwYwYwgtTws4gIOOUBJNq1IXBU4p
	WkNR9z1BNrvyOHdRKEa8r7CelIoqwNyqQruA3Qg3y+7bMooaKkRJM1zcf73F0wsTbTzi8Mlh1Z0xg
	3aDWmUjXssRynvN19Y8XGrH0SB42V/Oef4O0dptbLswiM8RK3I8m+gZ6YRmZQ8lFAL6Skr4pHS1Et
	2wPZrIG9S4F4hQtFCF66Y14kI6fs0d9VrTRBC/H8uJmccPtctxTyoeJLuYB2HJFaBxt1dAaK79iqI
	OfBZbU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loYGN-006Esg-Mb; Wed, 02 Jun 2021 21:18:55 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loYGK-006EsE-BH
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 21:18:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622668732; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+CMCzWdXYW36gvLhqspzCb5O76RlF7D5cgvfnUD5vAs=;
 b=a0BW3C5HhAnd4sF3sAYpmYyYRuEvM8a+MAIJ8brvqE9P0Blkkr2xO0eQjzAkkI7H+zsOadjh
 8/XcyFUQ+5HjgafRSI1/kun8SCpVY9L2x+8J9+yCWZsVRIuaFFxLtdKANMf445saUjebYbDI
 XMfEgiSHfMGnPmmy5dgZWKg+u90=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60b7f5b0e27c0cc77f7e5b05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 21:18:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0F276C43145; Wed,  2 Jun 2021 21:18:39 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BD5CC433D3;
 Wed,  2 Jun 2021 21:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1BD5CC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
To: Avri Altman <Avri.Altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 Can Guo <cang@codeaurora.org>,
 "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
 "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "kernel-team@android.com" <kernel-team@android.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
 <41a08b3e-122d-4f1a-abbd-4b5730f880b2@acm.org>
 <d4ff8e1a-f368-6720-798a-a2a31a4d41fb@codeaurora.org>
 <DM6PR04MB65752DD2F442C178B2D0233AFC259@DM6PR04MB6575.namprd04.prod.outlook.com>
 <DM6PR04MB657525D67B70FF3418511694FC229@DM6PR04MB6575.namprd04.prod.outlook.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <e7605343-5785-e708-751b-72a66e4e0b67@codeaurora.org>
Date: Wed, 2 Jun 2021 14:18:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR04MB657525D67B70FF3418511694FC229@DM6PR04MB6575.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_141853_126706_2CB8C572 
X-CRM114-Status: GOOD (  16.37  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/28/2021 12:30 AM, Avri Altman wrote:
>>> Hi Bart,
>>> No it's not necessary to serialize both the paths. I think this series
>>> attempts to remove this serialization to a certain degree, which is
>>> what's giving the performance improvement.
> Btw, Is this performance improvement is on top of rq_affinity 2 or 1?
> 
It's on 1.

> Thanks,
> Avri
> 
>>>
>>> Even if multiqueue support would be available in the future, I think
>>> this change is apt now for the current available specification.
>> I agree - this looks like the harbinger of a major change,
>> And going further with respect of hw queues,
>> will need the spec support - e.g. doorbell per lane, etc.
>>
>> Thanks,
>> Avri
>>
>>>> Thanks,
>>>>
>>>> Bart.
>>>>
>>>
>>>
>>> Thanks,
>>> -asd
>>>
>>> --
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>>> Forum,
>>> Linux Foundation Collaborative Project


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
