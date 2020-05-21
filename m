Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9933C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 12:36:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4F22070A
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 12:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="StJ8xltx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E4F22070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7M5i+02exmNAeddyLoCZ/02YqEZlKDZQ0yxIkNNc0Q=; b=StJ8xltxjf8hU3
	mfzGzvMUn+GA8r3b7okj67WOv2Jv8oVXnLDgmINGpwfu8IpdT2kvuC5XKstJPSUNAXqo9IgWna4vL
	Uz9lOjqTtl8yzVkF0QNA+y0dzcTfHajEspvoGVk1aZWRzkqJh5CXqd56yNqWT3va8r0PylkJpmOvp
	wE5W8dNbtxr2+WcS3hxDWW/Dd2LaBVNaRADLX5i/fNeCIltTHvtnH1iU2Nb21HdVR6+qsJeOvGQz0
	Cm8ASIAaTG6MObf2HqFoclsn8OTN84lbf+Guv6NncWvc6RHI6PoRo+pFVlSqZ6js3iTmkyie/cSfi
	Ixc1Tb50SS5DWmnuwvMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbkQV-0008Au-29; Thu, 21 May 2020 12:35:55 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbkQH-0007zq-0E; Thu, 21 May 2020 12:35:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 929EF30E;
 Thu, 21 May 2020 05:35:36 -0700 (PDT)
Received: from [192.168.0.110] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3591B3F305;
 Thu, 21 May 2020 05:35:34 -0700 (PDT)
Subject: Re: [PATCH 0/3] arm64: perf: Add support for Perf NMI interrupts
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
 Mark Rutland <mark.rutland@arm.com>, Lecopzer Chen <lecopzer@gmail.com>
References: <20200516124857.75004-1-lecopzer@gmail.com>
 <CAFA6WYNwp+_ENiS8QDao5+RXyt5ofJZyq6c5CKG_d0CNEmBNYg@mail.gmail.com>
 <CANr2M19unLW8n0P2DiOYEZ=GZcaD-L2ygPht_5HNtNZ6e4h6xQ@mail.gmail.com>
 <20200518104524.GA1224@C02TD0UTHF1T.local>
 <a9002b5e-aec5-b6e0-7174-87b93351d60c@arm.com>
 <8a1022c0-da2b-c83d-81cd-44b11149496b@arm.com>
 <B926444035E5E2439431908E3842AFD24B2728@DGGEMI525-MBS.china.huawei.com>
From: Alexandru Elisei <alexandru.elisei@arm.com>
Message-ID: <1d615c32-89f0-d9ba-43db-3d90c7d53e15@arm.com>
Date: Thu, 21 May 2020 13:36:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <B926444035E5E2439431908E3842AFD24B2728@DGGEMI525-MBS.china.huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_053541_130364_775F1002 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Jian-Lin Chen <lecopzer.chen@mediatek.com>, Will Deacon <will@kernel.org>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "yj.chiang@mediatek.com" <yj.chiang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "acme@kernel.org" <acme@kernel.org>, Linuxarm <linuxarm@huawei.com>,
 Peter Zijlstra <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "namhyung@kernel.org" <namhyung@kernel.org>,
 "jolsa@redhat.com" <jolsa@redhat.com>,
 "julien.thierry.kdev@gmail.com" <julien.thierry.kdev@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 5/21/20 4:00 AM, Song Bao Hua (Barry Song) wrote:

>
>> -----Original Message-----
>> From: linux-arm-kernel [mailto:linux-arm-kernel-bounces@lists.infradead.org]
>> On Behalf Of Alexandru Elisei
>> Sent: Wednesday, May 20, 2020 10:31 PM> 
>> Hi,
>>
>> On 5/18/20 12:17 PM, Alexandru Elisei wrote:
>>> Hi,
>>>
>>> On 5/18/20 11:45 AM, Mark Rutland wrote:
>>>> Hi all,
>>>>
>>>> On Mon, May 18, 2020 at 02:26:00PM +0800, Lecopzer Chen wrote:
>>>>> HI Sumit,
>>>>>
>>>>> Thanks for your information.
>>>>>
>>>>> I've already implemented IPI (same as you did [1], little difference
>>>>> in detail), hardlockup detector and perf in last year(2019) for
>>>>> debuggability.
>>>>> And now we tend to upstream to reduce kernel maintaining effort.
>>>>> I'm glad if someone in ARM can do this work :)
>>>>>
>>>>> Hi Julien,
>>>>>
>>>>> Does any Arm maintainers can proceed this action?
>>>> Alexandru (Cc'd) has been rebasing and reworking Julien's patches,
>>>> which is my preferred approach.
>>>>
>>>> I understand that's not quite ready for posting since he's
>>>> investigating some of the nastier subtleties (e.g. mutual exclusion
>>>> with the NMI), but maybe we can put the work-in-progress patches
>>>> somewhere in the mean time.
>>>>
>>>> Alexandru, do you have an idea of what needs to be done, and/or when
>>>> you expect you could post that?
>>> I'm currently working on rebasing the patches on top of 5.7-rc5, when
>>> I have something usable I'll post a link (should be a couple of days).
>>> After that I will address the review comments, and I plan to do a
>>> thorough testing because I'm not 100% confident that some of the
>>> assumptions around the locks that were removed are correct. My guess is
>> this will take a few weeks.
>>
>> Pushed a WIP branch on linux-arm.org [1]:
>>
>> git clone -b WIP-pmu-nmi git://linux-arm.org/linux-ae
>>
>> Practically untested, I only did perf record on a defconfig kernel running on the
>> model.
>>
>> [1]
>> http://www.linux-arm.org/git?p=linux-ae.git;a=shortlog;h=refs/heads/WIP-pm
>> u-nmi
> Fortunately, it does work. I used this tree to perf annotate arm_smmu_cmdq_issue_cmdlist() which
> is completely disabling IRQ. Luckily, it reports correct data. Before that, it reported all time was spent by
> the code which enabled IRQ .

That's good news that it works for you, thanks for letting me know.

Alex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
