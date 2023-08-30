Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14692C6FA8F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 10:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPM4b5gVBItxeoPBAZTDBOvMvaoM1Fp4iM2MYkFgV1g=; b=thUa0OZi0g/cgwr+FmtZjDeF9x
	m48ePBbBg+LG02xncxSRqo1a7Jd4IGw5QI0e8TNlEHIcL6HnRwL4MB49cXTuStCcORoC/h6hJhC+K
	s67Alo6bE/sMNdEIl0Z+j7maYdCY1fL31c2UpNF3r5QkJo48hlzuT/C0PvXxnOppiE8uITxGW1byd
	1ILHc/fNGLnv9QW42+DiSMprt0eMHKGR0MkAhPJ4enNGuqBGoqAbr2OF7mbVbvVtyV7eCo3R4DyiI
	Cf7Z6CFzkPe+HJD7h+FDtGVGfUSbOOdtjUJJqC6bhy2ZBXxTVRbGnTvLa7k0n/N+WORJZwI6L3Qh+
	smiOF3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIuN-00DLr8-2p;
	Wed, 30 Aug 2023 10:58:47 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIuK-00DLqI-1H;
	Wed, 30 Aug 2023 10:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693393124; x=1724929124;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=Ba+ap190nbT9y0MOHYUH6N6N/yy00EJmGs6/T//2stI=;
  b=m5G7riCNW+dWhjsh30r/nNXoW4IvHPXskLdiw2ZAqGwgU3uPuMKKinrM
   +opwz7YK2w3P1CSTB4YqaQA8q7/6HLmJ9O7bgt/GMCffTESA2DtTBprJc
   /sapfr5Krz8ziAdRml+GIDJTNb+yEnpLWuvM4vKT4cfOYps8JAhLWF4nB
   J5lOSg8vLP2wTV09ZxoPS1uYyG9RxDqHYyapO5+twnQIp16Vfyytu8hn6
   6ZVYD10XYCsStMxLbD0Dsmu1Ggvml02KbdqZkf1RWeHjDHXh+k5TG6BsH
   jE8yw4GcezfvtyljqB2VfBrFksOj2I13tRW2b/GeGBzXsWP3tpfrUQh3A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441974432"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="441974432"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882711770"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.57.251])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:58:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Helen Koike
 <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, daniels@collabora.com, emma@anholt.net,
 robclark@freedesktop.org, gustavo.padovan@collabora.com,
 robdclark@google.com, anholt@google.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 corbet@lwn.net, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, heiko@sntech.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
In-Reply-To: <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230811171953.176431-1-helen.koike@collabora.com>
 <ZOTFfhtzzWkrQ23Y@phenom.ffwll.local>
 <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
Date: Wed, 30 Aug 2023 13:58:31 +0300
Message-ID: <87bkeo23vs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_035844_497619_11C77EF8 
X-CRM114-Status: GOOD (  39.46  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 30 Aug 2023, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Aug 22, 2023 at 04:26:06PM +0200, Daniel Vetter wrote:
>> On Fri, Aug 11, 2023 at 02:19:53PM -0300, Helen Koike wrote:
>> > From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> > 
>> > Developers can easily execute several tests on different devices
>> > by just pushing their branch to their fork in a repository hosted
>> > on gitlab.freedesktop.org which has an infrastructure to run jobs
>> > in several runners and farms with different devices.
>> > 
>> > There are also other automated tools that uprev dependencies,
>> > monitor the infra, and so on that are already used by the Mesa
>> > project, and we can reuse them too.
>> > 
>> > Also, store expectations about what the DRM drivers are supposed
>> > to pass in the IGT test suite. By storing the test expectations
>> > along with the code, we can make sure both stay in sync with each
>> > other so we can know when a code change breaks those expectations.
>> > 
>> > Also, include a configuration file that points to the out-of-tree
>> > CI scripts.
>> > 
>> > This will allow all contributors to drm to reuse the infrastructure
>> > already in gitlab.freedesktop.org to test the driver on several
>> > generations of the hardware.
>> > 
>> > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> > Acked-by: Daniel Stone <daniels@collabora.com>
>> > Acked-by: Rob Clark <robdclark@gmail.com>
>> > Tested-by: Rob Clark <robdclark@gmail.com>
>> 
>> Ok I pushed this into a topic/drm-ci branch in drm.git and asked sfr to
>> include that branch in linux-next.
>> 
>> But also I'd like to see a lot more acks here, we should be able to at
>> least pile up a bunch of (driver) maintainers from drm-misc in support of
>> this. Also maybe media, at least I've heard noises that they're maybe
>> interested too? Plus anyone else, the more the better.
>
> I'm not really convinced by that approach at all, and most of the issues
> I see are shown by the follow-up series here:

I'm not fully convinced either, more like "let's see". In that narrow
sense, ack. I don't see harm in trying, if you're also open to backing
off in case it does not pan out.

> https://lore.kernel.org/dri-devel/20230825122435.316272-1-vignesh.raman@collabora.com/
>
>   * We hardcode a CI farm setup into the kernel
>
>   * We cannot trust that the code being run is actually the one being
>     pushed into gitlab
>
>   * IMO, and I know we disagree here, any IGT test we enable for a given
>     platform should work, period. Allowing failures and flaky tests just
>     sweeps whatever issue is there under the rug. If the test is at
>     fault, we should fix the test, if the driver / kernel is at fault,
>     then I certainly want to know about it.

At least for display, where this also depends on peripheral hardware,
it's not an easy problem, really. How reliable do you need it to be?
How many nines? Who is going to debug the issues that need hundreds or
thousands of runs to reproduce? If a commit makes some test less
reliable, how long is it going to take to even see that or pinpoint
that?

It's a kind of cop out, but this is not filesystems. In many cases I
think we might be able to make things more robust by failing faster and
failing more, but the users probably want us to plunge forward despite
some errors to try to get something on screen.

(Come to think of it, perhaps we should classify tests based on whether
external hardware plays a role.)

So I'm not so concerned about the filter lists per se, but rather about
having them in kernel.

BR,
Jani.

>
>   * This then leads to patches like this one:
>     https://lore.kernel.org/dri-devel/20230825122435.316272-6-vignesh.raman@collabora.com/
>
>     Which (and it's definitely not the author's fault) are just plain
>     unreadable, reproducable or auditable by anyone not heavily involved
>     in the CI farm operations and the platforms being tested.
>
> That being said, I don't have anything better to suggest than what I
> already did, and it looks like I'm alone in thinking that those are
> problems, so feel free to add my ack if you want to.
>
> Maxime

-- 
Jani Nikula, Intel Open Source Graphics Center

