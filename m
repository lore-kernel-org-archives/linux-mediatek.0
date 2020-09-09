Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F21FC43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 07:37:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 491B220732
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 07:37:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wad/gtxG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="jnn3trhA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 491B220732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2OHVCi3E1iCAfj5oJN9dVvlvS1wCk5924th+3TBadlk=; b=Wad/gtxGWjn6a01OwIAMxWob3
	XL3dnwdDJ8DgaqQN5Zmwffv9JZbonSE/ZGzjN+qFtUR0g77RMevFK7L2nHYX2hAcylRanN6zCPe3X
	CQe2HTn740aDlGicvUB5gfq+vnWoVDr1z8/5gn3Ie7Rgsz3dArfafe30P9/VXqFBuO89Mg7dn0M6W
	W7cW945hsbTnJmh/dow8NypqKcl7MjaCmIrHXGfyu1hTNg4sRVVR8zZ4Wx2epnKCZUUCP7kpR4D9p
	bkIAkB3mFCdVuzoMf5kUUcC/dLWuRactUjzCcf+hX7+OOEd06yxcCloO7TyjWrRIW5GSawp2rXELa
	Xmz00AVNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFufe-0004aG-Kf; Wed, 09 Sep 2020 07:37:34 +0000
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFufc-0004Yb-2G; Wed, 09 Sep 2020 07:37:33 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f5885b20000>; Wed, 09 Sep 2020 00:35:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 09 Sep 2020 00:37:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 09 Sep 2020 00:37:29 -0700
Received: from [10.26.73.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 07:37:20 +0000
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To: Krzysztof Kozlowski <krzk@kernel.org>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Eddie
 Huang <eddie.huang@mediatek.com>
References: <20191112110330.179649-1-pihsun@chromium.org>
 <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
 <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
 <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ab35a9c7-1b33-dc75-8520-ee072ff1309f@nvidia.com>
Date: Wed, 9 Sep 2020 08:37:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599636914; bh=NRptkkFmJKN48wrOiQ7yrq/L1r5kklHTYRCDYEWsDB0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jnn3trhAfxkws/mo/0eN55qV+nx5mQCk/pzThZ7D2nd/qaWddSQWnqyb6QeJGMpgd
 q+ta3oSTu4mKCzOXtKbCT+ePy2xLNuB+QIegT9kfNP7SdOmszsOeiPMITVh8PvImwM
 uaI9owjP8fyXn3hIFiGWlL+Sl9jFS3VJaa8dgz+P/It2afJV5nEPu5t1YSi4Snj2mD
 3wzmX4o6aTDAH9n1gPe+1Hof32T3WbGJSykqx+hgO0G4T5b+JXcXDBdjQzOjCjtxto
 WrlnKWqoNxTwhOHsw6zOQByisStAh2vTJIG64NDH/SdxmrvVoYVkZZLYT2r9J/oxoc
 B22SYp58s553g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_033732_178214_92FEFE47 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Erin Lo <erin.lo@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, linux-tegra <linux-tegra@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 02/09/2020 17:23, Krzysztof Kozlowski wrote:
> On Wed, 2 Sep 2020 at 16:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>>
>>>
>>>
>>> On 12/11/2019 12:03, Pi-Hsun Shih wrote:
>>>> From: Eddie Huang <eddie.huang@mediatek.com>
>>>>
>>>> Add scp node to mt8183 and mt8183-evb
>>>>
>>>> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
>>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>>>> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
>>>
>>> Sorry I somehow oversaw this. Next time please don't doubt to ping me.
>>>
>>> Bjorn, do I understand correctly that you don't send emails to the list
>>> informing of the inclusion of a patch/series in your tree?
>>>
>>> Anyway applied now to v5.9-next/dts64 :)
>>
>> arm64 build dtbs failed on linux next 20200902.
> 
> I just hit it as well... I wish the kernel was built after applying
> patches... it would make the next a better place.


Any update on this? It is still broken as of next-20200908.

Jon

-- 
nvpublic

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
