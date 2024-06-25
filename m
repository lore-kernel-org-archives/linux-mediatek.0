Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FC8C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAjpvwr1/jgh6UyW1p1dhJNmAbUi5v13hU7EV0lbSHI=; b=ENFxmw+llAPIhCpUuOPCbrycSa
	mV09KS64Zx2nZ6kCgWbyUfSjVhjOuLwSdzm4aVukCogyG1lLMkQ10swt+vTLuahbt0OFlbQguQ4uL
	cot8qGDVaro5QmxMYmDKjlYOQBX79P/A8dlOT9rQ4r4yn3LtKtUrYJAljKsvmLH6HlTqfciJk/MA3
	LNnkhOAUQPpmrm7drCcVVG9GwHdF/Wc4+RJAJG+X2JLxkL6XhOGqgakq9eq0F6g8xM/XIuW17cYs/
	N6+GjdkxVFOu5X2155vWDmJhqUJf6UAT8nyCqIKHU7RM+hPv1iWzqK6YTMUgLYXqGeKY0J3MLCTV5
	rfAnLNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9Fy-00000003jyt-3nXc;
	Tue, 25 Jun 2024 16:42:58 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9Fv-00000003jyK-1c7h
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jun 2024 16:42:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4W7rH022Xrz6Cnk9F;
	Tue, 25 Jun 2024 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1719333757; x=1721925758; bh=sAjpvwr1/jgh6UyW1p1dhJNm
	AbUi5v13hU7EV0lbSHI=; b=LIYF5uJdWitfHtvZuWidNmtesPBlfGPnKrcAMTKH
	cvb90tnfF1Lu3kL0zfyXYckr8hNXHP1QTCNaMf9QezjQlOdTI7E0QRaYvsnjAIcC
	PIVfKY6V13l5DgtJ4KJJHZ3ELLy2nv1xJwyWPfKqHt3EA/CEf3RhJoquvPdlnIre
	SBHdLwxjEbUdpvZxinxYjvGU+rRjx2Ui2+oors3hwKMVQsFY8QEKBkqt5A8XLS1q
	JkbkkC0gxMFKZ/jDh+S2J3f5WV6GJp6Ig32ymcJvlI6NWSl7iV7asIWi/wyzwvbB
	FmILgtNFpDBbru4wBrF6lHX0QR0mtP6s6vL+pHE5muRc+w==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id nKsHhbovsQ9L; Tue, 25 Jun 2024 16:42:37 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4W7rGd6x2cz6Cnk97;
	Tue, 25 Jun 2024 16:42:33 +0000 (UTC)
Message-ID: <795a89bb-12eb-4ac8-93df-6ec5173fb679@acm.org>
Date: Tue, 25 Jun 2024 09:42:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: fix ufshcd_abort_all racing issue
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20240624121158.21354-1-peter.wang@mediatek.com>
 <eec48c95-aa1c-4f07-a1f3-fdc3e124f30e@acm.org>
 <4c4d10aae216e0b6925445b0317e55a3dd0ce629.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <4c4d10aae216e0b6925445b0317e55a3dd0ce629.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_094255_464483_5E22EB43 
X-CRM114-Status: GOOD (  20.13  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/25/24 1:29 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Mon, 2024-06-24 at 11:01 -0700, Bart Van Assche wrote:
>>   On 6/24/24 5:11 AM, peter.wang@mediatek.com wrote:
>>> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-
>> mcq.c
>>> index 8944548c30fa..3b2e5bcb08a7 100644
>>> --- a/drivers/ufs/core/ufs-mcq.c
>>> +++ b/drivers/ufs/core/ufs-mcq.c
>>> @@ -512,8 +512,9 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba,
>> int task_tag)
>>>    return -ETIMEDOUT;
>>>   =20
>>>    if (task_tag !=3D hba->nutrs - UFSHCD_NUM_RESERVED) {
>>> -if (!cmd)
>>> -return -EINVAL;
>>> +/* Should return 0 if cmd is already complete by irq */
>>> +if (!cmd || !ufshcd_cmd_inflight(cmd))
>>> +return 0;
>>>    hwq =3D ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(cmd));
>>>    } else {
>>>    hwq =3D hba->dev_cmd_queue;
>>
>> Does the call trace show that blk_mq_unique_tag() tries to
>> dereference
>> address 0x194? If so, how is this possible? There are
>> only two lrbp->cmd assignments in the UFS driver. These assignments
>> either assign a valid SCSI command pointer or NULL. Even after a SCSI
>> command has been completed, the SCSI command pointer remains valid.
>> So
>> how can an invalid pointer be passed to blk_mq_unique_tag()? Please
>> root-cause this issue instead of posting a code change that reduces a
>> race window without closing the race window completely.
>=20
> blk_mq_unique_tag() tries to dereference address 0x194, and it is null.
> Beacuse ISR end this IO by scsi_done, free request will be called and
> set mq_hctx null.
> The call path is
> scsi_done -> scsi_done_internal -> blk_mq_complete_request ->
> scsi_complete ->
> scsi_finish_command -> scsi_io_completion -> scsi_end_request ->
> __blk_mq_end_request ->
> blk_mq_free_request -> __blk_mq_free_request
>=20
> And blk_mq_unique_tag will access mq_hctx then get null pointer error.
> Please reference
> https://elixir.bootlin.com/linux/latest/source/block/blk-mq.c#L713
> https://elixir.bootlin.com/linux/latest/source/block/blk-mq-tag.c#L680
>=20
> So, the root-casue is very simple, free request then get hwq.
> This patch only check if reqesut not free(inflight) then get hwq.
> Thought it still have racing winodw, but it is better then do nothing,
> right?
> Or, maybe we get all cq_lock before get hwq to close the racing window.
> But the code may ugly, how do you think?

Please include a full root cause analysis when reposting fixes for the
reported crashes. It is not clear to me how it is possible that an
invalid pointer is passed to blk_mq_unique_tag() (0x194). As I mentioned
in my previous email, freeing a request does not modify the request
pointer and does not modify the SCSI command pointer either. As one can
derive from the blk_mq_alloc_rqs() call stack, memory for struct request
and struct scsi_cmnd is allocated at request queue allocation time and
is not freed until the request queue is freed. Hence, for a given tag,
neither the request pointer nor the SCSI command pointer changes as long
as a request queue exists. Hence my request for an explanation how it is
possible that an invalid pointer was passed to blk_mq_unique_tag().

Thanks,

Bart.


