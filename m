Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE656C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 08:06:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57FE022A84
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 08:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57FE022A84
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QTpugskBwTH8R6IKfXA5uxW7VXMTqbXM3toQ+q5PERk=; b=1RHOFPWS8FtgOxYZtVnsu1J/u
	JY2hn7x7BK3mcFd2u4ADyh+/axN1YVWChYnEoDBgQ3s59X2L3KXdImsIN5LzDDxP2JpTybTYeKceZ
	bSBL0/4HEH1gqoxty8xb8yzCL8E2DKYNKipLBIWpvSKd3Ct9J9MVr5LujJitFHVgA/9D7GSqSG1/E
	RBUNDpTbntpLa7fYZKw+9yA+650AhtqwiDrUqcR2dpzW6jwH6wdealTkz4lod6DCYAEZnLDFAJ0Ch
	oBriUMv2FxLnhKSw80u4+GnJWZhvsf64Vkh4YIco+Y/CJ3nOp7iCDAdGSECCKkl3aYQTyMgCddcyp
	JzMbogFjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kysDW-0001yD-ET; Mon, 11 Jan 2021 08:06:22 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kysDS-0001vq-1k
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 08:06:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610352378; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=q6HVAxk/hQzZS5AhQvky+aYNydoq0obr1IZUR/g5mjQ=;
 b=xJrLL9eFmA5Vdzi97BL7Mq3GurFRh1KZtlB6K8lGcT6dy5cL7TCiAGlbRrSlmWJSn6vfj7lM
 xzS5qAh5vxVbxz+oevK0Po2jTKCtP0nZn2vEM1djWRey5x3eYK2bFUUPK6SS0rn735rMU8sm
 ixJf/HE7i7cGQGNp7mWjG+7tzXY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5ffc06f24dcca12475ea079a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 08:06:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 76A39C43461; Mon, 11 Jan 2021 08:06:09 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44E4BC433C6;
 Mon, 11 Jan 2021 08:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44E4BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH] mt76: Fix queue ID variable types after mcu queue split
References: <20201229211548.1348077-1-natechancellor@gmail.com>
 <20201231100918.GA1819773@computer-5.station>
Date: Mon, 11 Jan 2021 10:06:04 +0200
In-Reply-To: <20201231100918.GA1819773@computer-5.station> (Lorenzo Bianconi's
 message of "Thu, 31 Dec 2020 11:09:18 +0100")
Message-ID: <87k0sjlwyb.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_030618_464371_4C02B7D8 
X-CRM114-Status: GOOD (  14.01  )
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
 Nathan Chancellor <natechancellor@gmail.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Lorenzo Bianconi <lorenzo@kernel.org> writes:

>> Clang warns in both mt7615 and mt7915:
>> 
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:271:9: warning: implicit
>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>                 txq = MT_MCUQ_FWDL;
>>                     ~ ^~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:278:9: warning: implicit
>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>                 txq = MT_MCUQ_WA;
>>                     ~ ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:282:9: warning: implicit
>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>                 txq = MT_MCUQ_WM;
>>                     ~ ^~~~~~~~~~
>> 3 warnings generated.
>> 
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: warning: implicit
>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>                 qid = MT_MCUQ_WM;
>>                     ~ ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: warning: implicit
>> conversion from enumeration type 'enum mt76_mcuq_id' to different
>> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>>                 qid = MT_MCUQ_FWDL;
>>                     ~ ^~~~~~~~~~~~
>> 2 warnings generated.
>> 
>> Use the proper type for the queue ID variables to fix these warnings.
>> Additionally, rename the txq variable in mt7915_mcu_send_message to be
>> more neutral like mt7615_mcu_send_message.
>> 
>> Fixes: e637763b606b ("mt76: move mcu queues to mt76_dev q_mcu array")
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1229
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

I see that Felix already applied this, but as this is a regression
starting from v5.11-rc1 I think it should be applied to
wireless-drivers. Felix, can you drop this from your tree so that I
could apply it to wireless-drivers?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
