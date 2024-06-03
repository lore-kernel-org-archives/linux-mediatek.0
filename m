Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C9EC25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 07:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/B0WPRd/rWNMNtoKEcRb1adDn0yyjmqn8/GjSvxGF4=; b=3D47Jv0D8tUWUqLcMZYD7TyXe1
	RnAob6L1n6fS2zxudMx8xqPqKqXblmMTeoF+/V8XRrZIagP4Oplwfj0LqajfMrQ/3pzvpCp10wRCL
	vwsDvj9t2vlceS4jWON/2iMowhwEfNA6jfU51ahrkBeeXhpXtAqbriE6QIVtZVLjpUIQWkOVlVYol
	hSK904A2vcTwu5XEC7sZd9xLm24Kk2PbWa8uUIe3TAhuB35HI85c+2LVftZJk3ecYJWX7kimLYBBW
	Ohh+yqgsyEKul7Y4XYScyp0qJOuIFTdltQ3Rk/Ms3ua4l/5+cP3kWvnrEbORDPoMxLGJozw2puXcU
	h1boZZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2NV-0000000Fwc8-49r1;
	Mon, 03 Jun 2024 07:45:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2NR-0000000Fwb8-33z0;
	Mon, 03 Jun 2024 07:45:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C66D81042;
	Mon,  3 Jun 2024 00:45:28 -0700 (PDT)
Received: from [10.57.39.221] (unknown [10.57.39.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522F83F762;
	Mon,  3 Jun 2024 00:45:00 -0700 (PDT)
Message-ID: <ebcbc9c6-d858-4774-be48-857b7d446e15@arm.com>
Date: Mon, 3 Jun 2024 08:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/imagination: Add compatible string entry for
 Series6XT
To: Chen-Yu Tsai <wenst@chromium.org>, Frank Binns <Frank.Binns@imgtec.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-5-wenst@chromium.org>
 <efdacd820d13368816973f57c4a817e039ec4a2d.camel@imgtec.com>
 <CAGXv+5EMMNCbxaBqiBSQwGrQt-0KXWAtJU54K20sUU8PBh8faQ@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAGXv+5EMMNCbxaBqiBSQwGrQt-0KXWAtJU54K20sUU8PBh8faQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_004509_982117_D1E4AB86 
X-CRM114-Status: GOOD (  23.56  )
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

On 03/06/2024 04:29, Chen-Yu Tsai wrote:
> On Fri, May 31, 2024 at 7:18 PM Frank Binns <Frank.Binns@imgtec.com> wrote:
>>
>> On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
>>> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
>>> of the Series6XT, another variation of the Rogue family of GPUs.
>>>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>>  drivers/gpu/drm/imagination/pvr_drv.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
>>> index 5c3b2d58d766..3d1a933c8303 100644
>>> --- a/drivers/gpu/drm/imagination/pvr_drv.c
>>> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
>>> @@ -1475,6 +1475,7 @@ pvr_remove(struct platform_device *plat_dev)
>>>
>>>  static const struct of_device_id dt_match[] = {
>>>       { .compatible = "img,img-axe", .data = NULL },
>>> +     { .compatible = "img,powervr-6xt", .data = NULL },
>>
>> I assume that by adding this to the list of supported devices we're essentially
>> freezing the existing uapi. This concerns me, as we've not yet started running
>> Vulkan conformance on any Series6XT GPUs and there's a chance we may need to
>> make some tweaks.
>>
>> I'm not really sure what the accepted approach is to hardware enablement /
>> experimental support. I'm not sure if it's sufficient to hide support behind a
>> Kconfig option and/or module parameter or whether we just have to hold this
>> patch back for the time being.
> 
> I guess this is more of a question for the DRM maintainers.
> Added a couple Panfrost/Panthor folks for ideas.

I'm not sure quite what scale of "tweaks" you are expecting. Obviously
adding new uAPI is possible at any time - the only requirement is "don't
break user space" - i.e. don't remove old uAPI. Although obviously you
want to be careful about adding it because that means supporting it
forever more.

Panfrost has had an "unstable_ioctls" module parameter that we've hidden
performance counters behind. (Performance counters are hard from a uAPI
perspective - Panthor has similar issues).

We've also added support for GPUs in a deliberately "crippled" manner
(e.g. only one core group - see panfrost_get_core_mask()). I think we're
mostly just hoping those 'awkward' GPUs are not interesting enough and
we'll never implement full support for them - but if we did I expect
we'd implement support by providing a new uAPI for enabling the second
core group so old user space can continue working with just the single
core group.

Of course if the support for this platform is actually 'broken' (the
talk of GPU resets makes me think so - on Mali requiring a reset is a
"should never happen" situation, but we do have errata...) then it's
probably best holding off merging this until you've got something which
is minimally functional and then add support as necessary. For Vulkan
you can always have user space require a particular DRM kernel version
if you discover extra uAPI is needed.

Steve


