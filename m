Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006C7C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:24:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF2823359
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBF2823359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jIV5pumotglep9bChUc6uzDKJAzoV5e+rL7x1CSvTNM=; b=WzPwgxhaChfyzuOWLS6VZ8vVo
	wU/0rGR13U6Mh5TzYn61H+fzOrbf8vGlb9L2hH8gCbwUuqTgMA5l1te5F52bq1IfG3gqyzD3jnyVH
	SlD5oSL4rkmlmZ9tC+dWRX+HAuNUqk4uJINM3R/x6EMSkizakgfocdybWvhPDGv2opCxGmC/RKP3i
	Y68FGq1OHTPvapMqOEMTZ0lFNU8qtEzHOz7P5e3NXOSpG+yhvMZCZXB6/ORhA7MzA/gnT21iIBUpP
	Rc+pM8CCuSgIoG3FI5jnQwdRmKHui2CoVwq942+yw8tr/In0DF2VrsGbeSovJT8p0S5r6x0Rwfatr
	gKdx+/fzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzyru-0003of-IK; Thu, 14 Jan 2021 09:24:38 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzyrs-0003nd-3k
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 09:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2uqg5pSRojZBo6w/FGO6uS669NIaxCuaEwl+DtcVLgI=; b=MZMILskZu+w7kBlmRGoaNKncmM
 y1maASYjvLIo6Bp3jZNfXsd7014BWXk649R8jFm5IYA99cb6JJ2OoVsOhPWvEQir5k2uB7MTZMEoj
 v1DLlNQo2/Bmqe2+jmlHhsK92jcO6zJEukKJ0OrqGZdP4kc9kStxqAAUVfCLjpjV3jtQ=;
Received: from p54ae91f2.dip0.t-ipconnect.de ([84.174.145.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kzyrn-0004T9-UU; Thu, 14 Jan 2021 10:24:31 +0100
Subject: Re: [PATCH] mt76: Fix queue ID variable types after mcu queue split
To: Kalle Valo <kvalo@codeaurora.org>, Lorenzo Bianconi <lorenzo@kernel.org>
References: <20201229211548.1348077-1-natechancellor@gmail.com>
 <20201231100918.GA1819773@computer-5.station> <87k0sjlwyb.fsf@codeaurora.org>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <9af48c35-c987-7eb4-e3a1-5e54555f988b@nbd.name>
Date: Thu, 14 Jan 2021 10:24:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87k0sjlwyb.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_042436_434806_DA69AAE9 
X-CRM114-Status: GOOD (  15.09  )
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
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-01-11 09:06, Kalle Valo wrote:
> Lorenzo Bianconi <lorenzo@kernel.org> writes:
> 
>>> Clang warns in both mt7615 and mt7915:
>>> 
>>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:271:9: warning: implicit
>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>                 txq = MT_MCUQ_FWDL;
>>>                     ~ ^~~~~~~~~~~~
>>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:278:9: warning: implicit
>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>                 txq = MT_MCUQ_WA;
>>>                     ~ ^~~~~~~~~~
>>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:282:9: warning: implicit
>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>                 txq = MT_MCUQ_WM;
>>>                     ~ ^~~~~~~~~~
>>> 3 warnings generated.
>>> 
>>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: warning: implicit
>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>                 qid = MT_MCUQ_WM;
>>>                     ~ ^~~~~~~~~~
>>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: warning: implicit
>>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>>                 qid = MT_MCUQ_FWDL;
>>>                     ~ ^~~~~~~~~~~~
>>> 2 warnings generated.
>>> 
>>> Use the proper type for the queue ID variables to fix these warnings.
>>> Additionally, rename the txq variable in mt7915_mcu_send_message to be
>>> more neutral like mt7615_mcu_send_message.
>>> 
>>> Fixes: e637763b606b ("mt76: move mcu queues to mt76_dev q_mcu array")
>>> Link: https://github.com/ClangBuiltLinux/linux/issues/1229
>>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>>
>> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> I see that Felix already applied this, but as this is a regression
> starting from v5.11-rc1 I think it should be applied to
> wireless-drivers. Felix, can you drop this from your tree so that I
> could apply it to wireless-drivers?
Sure, will do.

- Felix


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
