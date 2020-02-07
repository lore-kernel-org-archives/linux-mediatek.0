Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03686C352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 08:14:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA02B21741
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 08:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CfAzjnTu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA02B21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ihxR7pQaaibG4a4MGWFloN4kDQApwkNgvbbMj4If0ds=; b=CfAzjnTuHk1qf2M0QLhGztjQX
	rCyPoldV/cTBkBrOTSmCnk42EfjCKOYinQbqxRPI19Ou62tVBVQOXTX/WPmPhsYygmzdQbLMT4dEI
	1BO0em8JQiWjw90AI8MfGeuzYnt6ww6KOgvmRaWT+w8h0F0XHtT7uxbwwdbsoboe8IlYmnaib8jE8
	4RLAI7QWFY1Mt1oGnCaJicu1DlG/wJaBM5AJVbtdRYKwNPclEowDOhojySbcpuaT+o3ILWTN3YWZM
	i3eXMk3FQH6AUm6WqSxGHdsnbtwlgzt9Uv5fwX45Zv92vnLOmtf9bdna4hJoR8YhzEOcDO8MJLoG3
	zfis76eeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izylu-0005cG-0u; Fri, 07 Feb 2020 08:13:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izylk-0005TZ-Mm; Fri, 07 Feb 2020 08:13:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 736D92959E5
Subject: Re: [PATCH v4 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <5237381b-c232-7087-a3d6-78d6358d80bf@collabora.com>
 <CANMq1KCD1U7iym_fFWAd-Xa6ipxHmF_FAYxDL5WqGzDnA0KKLw@mail.gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <93aec9ae-00fc-bf55-1d6c-9bd715b78344@collabora.com>
Date: Fri, 7 Feb 2020 09:13:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CANMq1KCD1U7iym_fFWAd-Xa6ipxHmF_FAYxDL5WqGzDnA0KKLw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_001345_000379_6D2CB903 
X-CRM114-Status: GOOD (  19.09  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/7/20 8:42 AM, Nicolas Boichat wrote:
> On Fri, Feb 7, 2020 at 2:18 PM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>>
>> On 2/7/20 6:26 AM, Nicolas Boichat wrote:
>>> Hi!
>>>
>>> Follow-up on the v3: https://patchwork.kernel.org/cover/11331343/.
>>>
>>> The main purpose of this series is to upstream the dts change and the
>>> binding document, but I wanted to see how far I could probe the GPU, to
>>> check that the binding is indeed correct. The rest of the patches are
>>> RFC/work-in-progress, but I think some of them could already be picked up.
>>>
>>> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
>>> backports to get the latest panfrost driver (I should probably try on
>>> linux-next at some point but this was the path of least resistance).
>>>
>>> I tested it as a module as it's more challenging (originally probing would
>>> work built-in, on boot, but not as a module, as I didn't have the power
>>> domain changes, and all power domains are on by default during boot).
>>>
>>> Probing logs looks like this, currently. They look sane.
>>> [  501.319728] panfrost 13040000.gpu: clock rate = 511999970
>>> [  501.320041] panfrost 13040000.gpu: Linked as a consumer to regulator.14
>>> [  501.320102] panfrost 13040000.gpu: Linked as a consumer to regulator.31
>>> [  501.320651] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
>>> [  501.320954] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
>>> [  501.321062] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
>>> [  501.321734] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
>>> [  501.321741] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
>>> [  501.321747] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
>>> [  501.321752] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
>>> [  501.324951] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2
>>>
>>> Some more changes are still required to get devfreq working, and of course
>>> I do not have a userspace driver to test this with.
>>
>> Have you tried the Panfrost tests in IGT? They are atm quite basic, but
>> could be interesting to check that the different HW units are correctly
>> powered on.
> 
> I haven't, you mean this right?
> https://gitlab.freedesktop.org/tomeu/igt-gpu-tools/tree/panfrost

Yes, though may be better to use the upstream repo:

https://gitlab.freedesktop.org/drm/igt-gpu-tools

> Any specific test you have in mind?

All the panfrost ones, but looks like panfrost_prime:gem-prime-import is 
failing atm:

https://lava.collabora.co.uk/scheduler/job/2214987

Cheers,

Tomeu

> Thanks,
> 
>> Regards,
>>
>> Tomeu
>>
>>> I believe at least patches 1, 2, and 3 can be merged. 4 and 5 are mostly
>>> useful in conjunction with 6 and 7 (which are not ready yet), so I'll let
>>> maintainers decide.
>>>
>>> Thanks!
>>>
>>> Nicolas Boichat (7):
>>>     dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>>>     arm64: dts: mt8183: Add node for the Mali GPU
>>>     drm/panfrost: Improve error reporting in panfrost_gpu_power_on
>>>     drm/panfrost: Add support for multiple regulators
>>>     drm/panfrost: Add support for multiple power domains
>>>     RFC: drm/panfrost: Add mt8183-mali compatible string
>>>     RFC: drm/panfrost: devfreq: Add support for 2 regulators
>>>
>>>    .../bindings/gpu/arm,mali-bifrost.yaml        |  25 ++++
>>>    arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 +
>>>    arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 +++++++++++++++
>>>    drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
>>>    drivers/gpu/drm/panfrost/panfrost_device.c    | 123 +++++++++++++++---
>>>    drivers/gpu/drm/panfrost/panfrost_device.h    |  27 +++-
>>>    drivers/gpu/drm/panfrost/panfrost_drv.c       |  41 ++++--
>>>    drivers/gpu/drm/panfrost/panfrost_gpu.c       |  11 +-
>>>    8 files changed, 326 insertions(+), 30 deletions(-)
>>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
