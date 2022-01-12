Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F906C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 02:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfvqsmMpT2/NLsraGZu94tJB9K8FqgPhYhn2p2c9SMU=; b=QO3ij6Q74jTaMG
	Sk9rE8HrDpIrD55SxVcHFwQ/aLSM/XYjlktIDNeJj6H5/Bay9r493yR8VjYELF2opMFkEiwfjCuhT
	xoCjAgzm5M56sR/S3oWkSlLlBWcaVbiWffm5ANPMt820WessybEqZDiVC8sr5ArnmmPmaPfjH54Zi
	LhF1uVH7yjgrN2Pt270u9ohX5K0yZGV8sOtIN2qYREC/bKDc1kfpqJjSQj/Uj+mBTjabk/0y7wz4e
	WG4EAx8ervWs4wRfHV9DON2oaMHqLESWSmA2i1lkuYwL4DIcbHooDhIw9s5EJJZ3Rf9etLtGQpWfe
	jKEmToOZQr8FNueMXYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TBk-000ow8-QB; Wed, 12 Jan 2022 02:16:36 +0000
Received: from mailout.easymail.ca ([64.68.200.34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7TBh-000ouW-J8
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 02:16:35 +0000
Received: from localhost (localhost [127.0.0.1])
 by mailout.easymail.ca (Postfix) with ESMTP id B311DC81BD;
 Wed, 12 Jan 2022 02:16:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at emo01-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
 by localhost (emo01-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qn6YbSJUGugb; Wed, 12 Jan 2022 02:16:27 +0000 (UTC)
Received: from mail.gonehiking.org (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 by mailout.easymail.ca (Postfix) with ESMTPA id 5EE66C8193;
 Wed, 12 Jan 2022 02:16:27 +0000 (UTC)
Received: from [192.168.1.4] (internal [192.168.1.4])
 by mail.gonehiking.org (Postfix) with ESMTP id 755513EE4B;
 Tue, 11 Jan 2022 19:16:26 -0700 (MST)
Message-ID: <fed8a57f-8003-5759-a74a-3ddbf867152b@gonehiking.org>
Date: Tue, 11 Jan 2022 19:16:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Bug] mt7921e driver in 5.16 causes kernel panic
Content-Language: en-US
To: sean.wang@mediatek.com
Cc: greearb@candelatech.com, nbd@nbd.name, lorenzo.bianconi83@gmail.com,
 Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <c3a66426-e6a0-4fd2-dc09-85181c96b755@gonehiking.org--annotate>
 <1641948556-23414-1-git-send-email-sean.wang@mediatek.com>
From: Khalid Aziz <khalid@gonehiking.org>
In-Reply-To: <1641948556-23414-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_181633_751568_99D94747 
X-CRM114-Status: GOOD (  22.58  )
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
Reply-To: khalid@gonehiking.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/11/22 17:49, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
>> On 1/11/22 16:31, Ben Greear wrote:
>>> On 1/11/22 3:17 PM, Khalid Aziz wrote:
>>>> I am seeing an intermittent bug in mt7921e driver. When the driver
>>>> module is loaded and is being initialized, almost every other time it
>>>> seems to write to some wild memory location. This results in driver
>>>> failing to initialize with message "Timeout for driver own" and at
>>>> the same time I start to see "Bad page state" messages for random
>>>> processes. Here is the relevant part of dmesg:
>>>
>>> Please see if this helps?
>>>
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> If the nic fails to start, it is possible that the reset_work has
>>> already been scheduled.  Ensure the work item is canceled so we do not
>>> have use-after-free crash in case cleanup is called before the work
>>> item is executed.
>>>
>>> This fixes crash on my x86_64 apu2 when mt7921k radio fails to work.
>>> Radio still fails, but OS does not crash.
>>>
>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>> ---
>>>    drivers/net/wireless/mediatek/mt76/mt7921/main.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>>> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>>> index 6073bedaa1c08..9b33002dcba4a 100644
>>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>>> @@ -272,6 +272,7 @@ static void mt7921_stop(struct ieee80211_hw *hw)
>>>
>>>        cancel_delayed_work_sync(&dev->pm.ps_work);
>>>        cancel_work_sync(&dev->pm.wake_work);
>>> +    cancel_work_sync(&dev->reset_work);
>>>        mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
>>>
>>>        mt7921_mutex_acquire(dev);
>>
>> Hi Ben,
>>
>> Unfortunately that did not help. I still saw the same messages and a kernel panic. I do not see this bug if I power down the laptop before booting it up, so mt7921_stop() would make sense as the reasonable place to fix it.
> 
> Hi, Khalid
> 
> Could you try the patch below? It should be helpful to your issue
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/70e27cbc652cbdb78277b9c691a3a5ba02653afb.1641540175.git.objelf@gmail.com/

Hi Sean,

That worked! I tried 5 reboots back-to-back after applying your patch 
without powering down my laptop. There were no error messages, kernel 
came up every time and wifi worked.

Thanks,
Khalid


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
