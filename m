Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60224C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 10:42:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F6123A3B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 10:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F6123A3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dMwypEeXbZhfIqpemtUwmrQ4Ipz99j5k7arkSG/12JU=; b=BnG7fs1uQyTOQtNn7JDhIRZ0J
	ovl3gAedxsFNyKLeB98vfqZv/eDi0era6YXxOIRf2z3omtYc4iK20LoB2DKOtkby3yILaSpUyejrA
	lGH2E4ek0Ua3dsuv5sewoILCpY4PmW20UayNAELmPo80JuDlxqDHBEntAQ4hNVt3COuUDLP5tUpCN
	vHYpVp9abRpcS8+DYULZsp9THVwy/kGG1BW1oN5hb0U7b0JwxEDXKUQ3JGWV18wN4GG3nj99h9qsn
	OYQdCWjamx01Da+kC9nTnBelDu/3wa+cupewT+OSOBjaXGhXIPW1HsxWDegm8qdZKvRnrsIDI+VyH
	SbWnE55nA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l004t-0001hF-Gd; Thu, 14 Jan 2021 10:42:07 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l004p-0001eN-Rl
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 10:42:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610620922; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Ewr4qiPEPbjem+/JZM1UEucGnjWoLnUoMQkWOHKR93M=;
 b=mvs3q7058oG8Df7jq3kWqbvRIVVCNlAjG+N7uhMid1+Lq85ecthHeDhB1nuGtg7ImO56D5/4
 qhu9otAlzfpIn2niC2Cxl8kziz+pLWOlPv71L3zn/y2LTcMjOVHyd3ZAsWnTnA7X+L5kbEXW
 awXTqo1tENuDf+E7e5V9K/FGHCQ=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60001ff44104d9478d4ac04c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 10:41:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9E8F1C43462; Thu, 14 Jan 2021 10:41:56 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 55118C433CA;
 Thu, 14 Jan 2021 10:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 55118C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: Fix queue ID variable types after mcu queue split
References: <20201229211548.1348077-1-natechancellor@gmail.com>
 <20201231100918.GA1819773@computer-5.station>
 <87k0sjlwyb.fsf@codeaurora.org>
 <9af48c35-c987-7eb4-e3a1-5e54555f988b@nbd.name>
Date: Thu, 14 Jan 2021 12:41:51 +0200
In-Reply-To: <9af48c35-c987-7eb4-e3a1-5e54555f988b@nbd.name> (Felix Fietkau's
 message of "Thu, 14 Jan 2021 10:24:30 +0100")
Message-ID: <87v9bzhkb4.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_054203_939581_C51546C3 
X-CRM114-Status: GOOD (  15.00  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Felix Fietkau <nbd@nbd.name> writes:

> On 2021-01-11 09:06, Kalle Valo wrote:
>> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>> 
>>>> Clang warns in both mt7615 and mt7915:
>>>> 
>>>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:271:9: warning: implicit
>>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>>                 txq = MT_MCUQ_FWDL;
>>>>                     ~ ^~~~~~~~~~~~
>>>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:278:9: warning: implicit
>>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>>                 txq = MT_MCUQ_WA;
>>>>                     ~ ^~~~~~~~~~
>>>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:282:9: warning: implicit
>>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>>                 txq = MT_MCUQ_WM;
>>>>                     ~ ^~~~~~~~~~
>>>> 3 warnings generated.
>>>> 
>>>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: warning: implicit
>>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>>                 qid = MT_MCUQ_WM;
>>>>                     ~ ^~~~~~~~~~
>>>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: warning: implicit
>>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>>                 qid = MT_MCUQ_FWDL;
>>>>                     ~ ^~~~~~~~~~~~
>>>> 2 warnings generated.
>>>> 
>>>> Use the proper type for the queue ID variables to fix these warnings.
>>>> Additionally, rename the txq variable in mt7915_mcu_send_message to be
>>>> more neutral like mt7615_mcu_send_message.
>>>> 
>>>> Fixes: e637763b606b ("mt76: move mcu queues to mt76_dev q_mcu array")
>>>> Link: https://github.com/ClangBuiltLinux/linux/issues/1229
>>>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>>>
>>> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> 
>> I see that Felix already applied this, but as this is a regression
>> starting from v5.11-rc1 I think it should be applied to
>> wireless-drivers. Felix, can you drop this from your tree so that I
>> could apply it to wireless-drivers?
>
> Sure, will do.

Thanks. I now assigned to me in patchwork and will apply to
wireless-drivers soon.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
