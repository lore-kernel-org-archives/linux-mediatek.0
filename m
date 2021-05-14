Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8F1C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 15:27:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF19E60C3D
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 15:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF19E60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w/fC82LmYeNXt+FsKyvcK7aCl7inz9Th06t8+Vf3cxw=; b=jt7nhyIHJ6S3gn8npFRXyVHJp
	5xpIy5lbE5lmLXgf1VdjThJhMFGgpn3z9J1cXKa7JtHnqFuIe5Q4DpqGmOrHoj2no0IfewIMXTCgB
	HBV0xcJ+s4hSwGIDuTNJMg5Pqq1q3vQTaD9FH/GH/gsCyjXuVJVIuzg50v9N+qWykDvDgpg3VgESl
	+Zu74JXESMrcjC2I56tGCOi6gYWgw2KTnYRkgunQlDo3UdZaTMjdMfErnLWFi9rzQEJXb9uXlDxIo
	nKjFAxE131DPeuuP0g75O1ELwdIjwLi8s6kej301Wb5M7QQAt9AC74vZjlglQaKbtOTheOsKs4LFp
	ipauxf2zg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhZiu-008OeP-Uv; Fri, 14 May 2021 15:27:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhZii-008OcI-9X; Fri, 14 May 2021 15:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=swYrVy4kpBBJEjC/Hd6FJ6QumSu/RFpoHoG/dt3MbD0=; b=rFCY4GsATqOlyJO+W+wzXsGqo3
 HsssknN+5LeqK78Os4FzQoDL+tj04+Ia4mjoTAwIrf+Ge4xfA5FgVQLUK3z3tfKwZxCnvPfxfOlYv
 rZLeP5cqLa/U40TTqGoMj/5QK6Bjn95C1eYkOBxR1wyZXLWUY3xMdi640QFTeUNRXT4IXCcX8jfA8
 6KQiUluaZSd6pj0kKACyaY7AEv1jiVzLtLLxcqmzdleRamngGGH/MJVn7MzB0kWGRwiYH+rqf5IN1
 H0lhPOlPi1//NLkBBW6SgIL3MyhMjjh24Fw/rdQHxqmQ4kJywKm+XavZPNez7bKL4olrli1MMtwqC
 QZxZ/utQ==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lhZif-00C4zM-5P; Fri, 14 May 2021 15:27:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6FEA1713;
 Fri, 14 May 2021 08:27:11 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D6293F718;
 Fri, 14 May 2021 08:27:09 -0700 (PDT)
Subject: Re: [PATCH v13 0/4] drm/panfrost: Add support for mt8183 GPU
To: Neil Armstrong <narmstrong@baylibre.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 devicetree <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <c91746ce-88b6-5612-74a5-74600c7761e8@baylibre.com>
 <CAAEAJfD3i+L4w1NuE5pUkMuH=R3CfBztDn-ZLcYR=onkcZ4Gxg@mail.gmail.com>
 <373d0803-8658-9413-2f51-1e9804c39126@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <ce401ca2-e285-4fcf-0583-c1dae94dba6a@arm.com>
Date: Fri, 14 May 2021 16:27:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <373d0803-8658-9413-2f51-1e9804c39126@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_082717_338660_CCE8492B 
X-CRM114-Status: GOOD (  25.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 14/05/2021 15:48, Neil Armstrong wrote:
> On 13/05/2021 16:55, Ezequiel Garcia wrote:
>> Hi Neil,
>>
>> On Mon, 26 Apr 2021 at 06:59, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>
>>> Hi,
>>>
>>> On 21/04/2021 07:28, Nicolas Boichat wrote:
>>>> Hi!
>>>>
>>>> This is just a rebase of the v11, untested (but it seems like
>>>> Neil Armstrong recently tested it), with small changes in
>>>> binding and dts. v11 cover follows:
>>>>
>>>> Follow-up on the v5 [1], things have gotten significantly
>>>> better in the last year, thanks to the efforts on Bifrost
>>>> support by the Collabora team (and probably others I'm not
>>>> aware of).
>>>>
>>>> I've been testing this series on a MT8183/kukui device, with a
>>>> chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
>>>> mesa 20.3.2 (lots of artifacts though).
>>>>
>>>> devfreq is currently not supported, as we'll need:
>>>>  - Clock core support for switching the GPU core clock (see 2/4).
>>>>  - Platform-specific handling of the 2-regulator (see 3/4).
>>>>
>>>> Since the latter is easy to detect, patch 3/4 just disables
>>>> devfreq if the more than one regulator is specified in the
>>>> compatible matching table.
>>>>
>>>> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
>>>> [2] https://crrev.com/c/2608070
>>>>
>>>> Changes in v13:
>>>>  - devfreq: Fix conflict resolution mistake when rebasing, didn't
>>>>    even compile. Oops.
>>>>
>>>> Changes in v12:
>>>>  - binding: Fix min/maxItems logic (Rob Herring)
>>>>  - Add gpu node to mt8183-pumpkin.dts as well (Neil Armstrong).
>>>>
>>>> Changes in v11:
>>>>  - binding: power-domain-names not power-domainS-names
>>>>  - mt8183*.dts: remove incorrect supply-names
>>>>
>>>> Changes in v10:
>>>>  - Fix the binding to make sure sram-supply property can be provided.
>>>>
>>>> Changes in v9:
>>>>  - Explain why devfreq needs to be disabled for GPUs with >1
>>>>    regulators.
>>>>
>>>> Changes in v8:
>>>>  - Use DRM_DEV_INFO instead of ERROR
>>>>
>>>> Changes in v7:
>>>>  - Fix GPU ID in commit message
>>>>  - Fix GPU ID in commit message
>>>>
>>>> Changes in v6:
>>>>  - Rebased, actually tested with recent mesa driver.
>>>>  - Add gpu regulators to kukui dtsi as well.
>>>>  - Power domains are now attached to spm, not scpsys
>>>>  - Drop R-B.
>>>>  - devfreq: New change
>>>>  - Context conflicts, reflow the code.
>>>>  - Use ARRAY_SIZE for power domains too.
>>>>
>>>> Changes in v5:
>>>>  - Rename "2d" power domain to "core2"
>>>>  - Rename "2d" power domain to "core2" (keep R-B again).
>>>>  - Change power domain name from 2d to core2.
>>>>
>>>> Changes in v4:
>>>>  - Add power-domain-names description
>>>>    (kept Alyssa's reviewed-by as the change is minor)
>>>>  - Add power-domain-names to describe the 3 domains.
>>>>    (kept Alyssa's reviewed-by as the change is minor)
>>>>  - Add power domain names.
>>>>
>>>> Changes in v3:
>>>>  - Match mt8183-mali instead of bifrost, as we require special
>>>>    handling for the 2 regulators and 3 power domains.
>>>>
>>>> Changes in v2:
>>>>  - Use sram instead of mali_sram as SRAM supply name.
>>>>  - Rename mali@ to gpu@.
>>>>
>>>> Nicolas Boichat (4):
>>>>   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>>>>   arm64: dts: mt8183: Add node for the Mali GPU
>>>>   drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
>>>>   drm/panfrost: Add mt8183-mali compatible string
>>>>
>>>>  .../bindings/gpu/arm,mali-bifrost.yaml        |  30 ++++-
>>>>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
>>>>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
>>>>  .../boot/dts/mediatek/mt8183-pumpkin.dts      |   5 +
>>>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>>>>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
>>>>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
>>>>  7 files changed, 168 insertions(+), 1 deletion(-)
>>>>
>>>
>>> Seems this version is ready to be applied if we get a review on the DT ?
>>>
>>> Mathias ? could you have a look ?
>>>
>>
>> Given Rob has Acked the DT bindings, I think it's OK to apply patches
>> 1, 3 and 4 via drm-misc, letting Mediatek people sort out the DT changes.
>>
>> My two unsolicited cents :-)

You make a convincing point - and if everyone is happy for the DT
changes to be handled separately I don't see a reason for the other
patches to be held up.

> Yeah sure, is there a panfrost maintainer in the room ? I can apply them if you ack me.

I seem to be applying most Panfrost changes these days, so I'll save you
the effort and push 1,3,4 to drm-misc-next.

Thanks,

Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
