Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15256C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 17:42:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB93961A2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 17:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB93961A2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nHpyt7YpdRgTCJJTdpv0pc20LzdTqXHYzStSAb/ZLnQ=; b=dFvy7O6RfqFMngpxub5woc+h3
	ZKKsZz5pfv9c7h2H7L91Db9TqBw0YD9RVp4Qvb+fCSDgYqtXXhjNzxgVizlPweNHSmPOkHlWDDqhy
	9sjU5E71DZfaGNip2Q5SPrNTEHiocgEVM4ej7eFZXOf0U00JrOFlOwO4prY24TYp2wJAUxONemDSp
	Dsyxcl2FKrr3o5KWqOnklACJGjsstkQl15B7utXkw9qifw6+Rthj4vTWhxvuGTkWwZ1MBf7WXjgqs
	h/15ULcsOM93KbkIM2tTB7osO3aIV6JM/KyZ5e2AUljuK81tHbvxixR9rWmLZOsq8cjQEyBm/1znL
	fuhLtKDXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPU0G-001wiJ-Ch; Thu, 25 Mar 2021 17:42:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lPTzu-001wZf-4E; Thu, 25 Mar 2021 17:42:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20CB5143D;
 Thu, 25 Mar 2021 10:42:17 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CED793F718;
 Thu, 25 Mar 2021 10:42:14 -0700 (PDT)
Subject: Re: [PATCH 1/2] iommu/mediatek-v1: Alloc building as module
To: Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@chromium.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Krzysztof Kozlowski <krzk@kernel.org>,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 anan.sun@mediatek.com, chao.hao@mediatek.com
References: <20210323055801.16885-1-yong.wu@mediatek.com>
 <20210325171614.GA15433@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6fb1f2b1-3b85-ee91-a447-8aca8f4057d6@arm.com>
Date: Thu, 25 Mar 2021 17:42:09 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325171614.GA15433@willie-the-truck>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_174218_581996_71FB5B66 
X-CRM114-Status: GOOD (  18.67  )
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

^^Nit: presumably you meant "Allow" in the subject.

On 2021-03-25 17:16, Will Deacon wrote:
> On Tue, Mar 23, 2021 at 01:58:00PM +0800, Yong Wu wrote:
>> This patch only adds support for building the IOMMU-v1 driver as module.
>> Correspondingly switch the config to tristate.
>>
>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>> ---
>> rebase on v5.12-rc2.
>> ---
>>   drivers/iommu/Kconfig        | 2 +-
>>   drivers/iommu/mtk_iommu_v1.c | 9 ++++-----
>>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> Both of these patches look fine to me, but you probably need to check
> the setting of MODULE_OWNER after:
> 
> https://lore.kernel.org/r/f4de29d8330981301c1935e667b507254a2691ae.1616157612.git.robin.murphy@arm.com

Right, furthermore I would rather expect these patches on their own to 
hit the problem that my patch tries to avoid - where since mtk_iommu_ops 
is const, the current version of iommu_device_set_ops() is liable to 
blow up trying to write to rodata.

In fact I do wonder a little why that wasn't happening already - maybe 
the compiler is clever enough to tell that the assignment is redundant 
when THIS_MODULE == 0, and elides it :/

Robin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
