Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50663C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:33:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D416820A8B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:33:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ExbtQSHo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Nu6XJ2Vo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D416820A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xy+TSf/4Q7SVXEn0cwcuOOSZaXRAZ38ANxb9U940hD0=; b=ExbtQSHohL1KLflbAbMNujaym
	wHXActpQrhAQ7fkYm25LHuVBuoC/ahw4Wd/ObH3Zfphhk8scU52Opa9Tpsc9+OBF72XgoCuxw2xfa
	PNLICBgd7JmaMSKPUXqY9NnwpGRuvLP3ftS1xINJOgDlqJe/9L8EsuienPXK0m7GZUFTy+qRWMgx5
	kjXe551Bf/VlUwUNM2jEbGvSotn2QfbPzA2JNI/PL91JW98dDcMTP9j/GW6Fs1xPE1lpAfSbXYEkK
	YF+CZp+5flf/rTPfuxXXmQd04cDR6c7ncJIQPgMpIL7z5DrQOiGmefORTumgFd+/JnvmJb3eVnsTe
	FR2ZQotQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaW1h-0001Vc-Oe; Thu, 05 Nov 2020 03:33:29 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW1e-0001UH-0x; Thu, 05 Nov 2020 03:33:26 +0000
Received: from [192.168.0.114] (unknown [49.207.198.216])
 by linux.microsoft.com (Postfix) with ESMTPSA id E10CF20B4905;
 Wed,  4 Nov 2020 19:33:20 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E10CF20B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1604547204;
 bh=Oe/MfzqV2v9zkGZtZkogWbchmVLqgIEFJ/RW772EC/c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Nu6XJ2VormhUSq9kLwFfSbjzHyC68StGlGoTNgXV+mwIaCsOe5JAOdRQgx3i/5hQ2
 GgPMRq4avNV/vXNXYCGRoml/CspyCPj033Yz6s3SMvg4XtehZgIKysuxvq6NFFJlri
 UA8dXYoP3hB+GLehJy4OQovzioUu3lSZFZlHbub0=
Subject: Re: [PATCH v2 0/3] wireless: convert tasklets to use new
To: Kalle Valo <kvalo@codeaurora.org>
References: <20201007103309.363737-1-allen.lkml@gmail.com>
 <c3d71677-a428-f215-2ba8-4dd277a69fb6@linux.microsoft.com>
 <87blgdqdpb.fsf@codeaurora.org>
From: Allen Pais <apais@linux.microsoft.com>
Message-ID: <9e9219d9-fab7-404b-0f40-f5721f781a1d@linux.microsoft.com>
Date: Thu, 5 Nov 2020 09:03:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87blgdqdpb.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_223326_145873_927952C3 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 davem@davemloft.net, lorenzo.bianconi83@gmail.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org,
 ath11k@lists.infradead.org, nbd@nbd.name
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>>>
>>> This series converts the remaining drivers to use new
>>> tasklet_setup() API.
>>>
>>> The patches are based on wireless-drivers-next (c2568c8c9e63)
>>
>>   Is this series queue? I haven't seen any email. This is the last
>> series as part of the tasklet conversion effort.
> 
> They are queued in linux-wireless patchwork, see the link below. I have
> lots of patches pending but hopefully I'll tackle most of them soon.
> 

Thank you very much.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
