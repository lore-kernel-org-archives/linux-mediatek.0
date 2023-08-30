Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE92FC83F14
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsFY9QnDV3SXoUKpbw/yVs/UE7R2esycueuRQlHVD9A=; b=iYkTeiNRygvOO+gH1H8XbsFluz
	9ccuCTGGrgr2VRLyzEkDhCcU1AgFr1KGoDI05FMMypc+Cj+/8YT7qkfrHdE6PGWcMKTLuL7/G8wps
	Z1RkTwYamz4Av0FGaiLt694M2Smjo8KGRJZFwMzrhxs4aN4tzUVXN3fKe/zk3DWbBB481U7uKWt/V
	FGMrpHi2ADVeaBgPfcmSSnP986mEk7pq7kAgvrcHLvD4PHKvHQFVo6nG1o2uA9oWhhLGtMGeuMW7X
	H/kJsS/YllV2hXjrQ4gL4Zwq4YT45Fh9ZZgRvekmvDhyBoh5MtvspVnvZH3AljyT5mHY0RsyOWAv0
	qpGKs59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLCB-00DZRr-2K;
	Wed, 30 Aug 2023 13:25:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLC7-00DZKJ-00;
	Wed, 30 Aug 2023 13:25:17 +0000
Received: from [192.168.68.123] (unknown [177.134.102.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36740660722B;
	Wed, 30 Aug 2023 14:24:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693401903;
	bh=G/DHKFUG7s0qMAoyav81I+mbhLCoFwsZk7/P9oL6Tkg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eE5ohWBLy6eMUr8erFWuKbia8CRNxVUorscR+ubvEICkLpG53tedgk83frCQ+ekwT
	 rRZXOPhonx8dZ0R3nhDaH5PyrfAVJqY3zbgXI/34LITcqHgj4tkT8k+FaDEAdnY8PQ
	 18ebb8g0aCiinTB3Xixb9FHoe8VPfnbKBXp5YXySHK2UuVE/LFLJ0KIJoKa8sH3Nae
	 Y5Fw5mfYfncBZxgoIWp/AiiqHfNFwH3n0dtcQtX3i1c0mhiwc9amSfzTXus7/TPRKv
	 4SBJ8ovIxii+kDnpBI0cmJzi65sPSNDzxnnTWWV0x4dvLv5z6M0mdw9a1VRbthFpoM
	 73ERVurapcECw==
Message-ID: <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com>
Date: Wed, 30 Aug 2023 10:24:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 david.heidelberg@collabora.com, dri-devel@lists.freedesktop.org,
 jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, anholt@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, alyssa@rosenzweig.io, vignesh.raman@collabora.com
References: <20230811171953.176431-1-helen.koike@collabora.com>
 <ZOTFfhtzzWkrQ23Y@phenom.ffwll.local>
 <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
 <87bkeo23vs.fsf@intel.com>
 <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062515_329324_7B94A799 
X-CRM114-Status: GOOD (  52.10  )
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

Hi all,

Thanks for you comments.

On 30/08/2023 08:37, Maxime Ripard wrote:
> On Wed, Aug 30, 2023 at 01:58:31PM +0300, Jani Nikula wrote:
>> On Wed, 30 Aug 2023, Maxime Ripard <mripard@kernel.org> wrote:
>>> On Tue, Aug 22, 2023 at 04:26:06PM +0200, Daniel Vetter wrote:
>>>> On Fri, Aug 11, 2023 at 02:19:53PM -0300, Helen Koike wrote:
>>>>> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>>>
>>>>> Developers can easily execute several tests on different devices
>>>>> by just pushing their branch to their fork in a repository hosted
>>>>> on gitlab.freedesktop.org which has an infrastructure to run jobs
>>>>> in several runners and farms with different devices.
>>>>>
>>>>> There are also other automated tools that uprev dependencies,
>>>>> monitor the infra, and so on that are already used by the Mesa
>>>>> project, and we can reuse them too.
>>>>>
>>>>> Also, store expectations about what the DRM drivers are supposed
>>>>> to pass in the IGT test suite. By storing the test expectations
>>>>> along with the code, we can make sure both stay in sync with each
>>>>> other so we can know when a code change breaks those expectations.
>>>>>
>>>>> Also, include a configuration file that points to the out-of-tree
>>>>> CI scripts.
>>>>>
>>>>> This will allow all contributors to drm to reuse the infrastructure
>>>>> already in gitlab.freedesktop.org to test the driver on several
>>>>> generations of the hardware.
>>>>>
>>>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>>> Acked-by: Daniel Stone <daniels@collabora.com>
>>>>> Acked-by: Rob Clark <robdclark@gmail.com>
>>>>> Tested-by: Rob Clark <robdclark@gmail.com>
>>>>
>>>> Ok I pushed this into a topic/drm-ci branch in drm.git and asked sfr to
>>>> include that branch in linux-next.
>>>>
>>>> But also I'd like to see a lot more acks here, we should be able to at
>>>> least pile up a bunch of (driver) maintainers from drm-misc in support of
>>>> this. Also maybe media, at least I've heard noises that they're maybe
>>>> interested too? Plus anyone else, the more the better.
>>>
>>> I'm not really convinced by that approach at all, and most of the issues
>>> I see are shown by the follow-up series here:
>>
>> I'm not fully convinced either, more like "let's see". In that narrow
>> sense, ack. I don't see harm in trying, if you're also open to backing
>> off in case it does not pan out.
>>
>>> https://lore.kernel.org/dri-devel/20230825122435.316272-1-vignesh.raman@collabora.com/
>>>
>>>    * We hardcode a CI farm setup into the kernel


These could be out of tree.

There is a version outside the kernel tree where you just point the CI
configuration to a url:
https://gitlab.freedesktop.org/gfx-ci/drm-ci/-/merge_requests/1

We were discussing it here 
https://www.linuxtv.org/cgi-bin/mailman/private/linuxtv-ci/2023-August/000027.html

(I guess Sima's reply didn't got into the mailing list) but the argument 
of not having out of tree repo is due to historical bad experience of 
having to sync the kernel with the code and it can become messy.


>>>
>>>    * We cannot trust that the code being run is actually the one being
>>>      pushed into gitlab


We can improve this if this is a requirement.
For DTS configuration we can work with overlays (which is the current 
modification on that patchset). For other changes that are not suitable 
to upstream (and should be rare) we can see if we work with the 
`-external-fixes` approach or another approach, we can check it case by 
case to understand why it is not suitable for upstream.


>>>
>>>    * IMO, and I know we disagree here, any IGT test we enable for a given
>>>      platform should work, period. Allowing failures and flaky tests just
>>>      sweeps whatever issue is there under the rug. If the test is at
>>>      fault, we should fix the test, if the driver / kernel is at fault,
>>>      then I certainly want to know about it.


I believe we need a baseline and understand the current status of tests. 
If you check the xfails folder in the patch you can see that I had to 
add a few tests on *-skips.txt since those tests crashes the system and 
other on *-fails.txt that are consistently not passing.

Since the "any IGT test we enable for a given platform should work" is 
not a reality atm, we need to have a clear view about which tests are 
not corresponding to it, so we can start fixing. First we need to be 
aware of the issues so we can start fixing them, otherwise we will stay 
in the "no tests no failures" ground :)


>>
>> At least for display, where this also depends on peripheral hardware,
>> it's not an easy problem, really.
> 
> Aside from the Chamelium tests, which tests actually rely on peripheral
> hardware? On EDID and hotplug, sure, but that can easily be set up from
> the userspace, or something like
> 
> https://www.lindy-international.com/HDMI-2-0-EDID-Emulator.htm?websale8=ld0101.ld021102&pi=32115
> 
>> How reliable do you need it to be? How many nines? Who is going to
>> debug the issues that need hundreds or thousands of runs to reproduce?
>> If a commit makes some test less reliable, how long is it going to
>> take to even see that or pinpoint that?
> 
> I mean, that's also true for failures or success then. How many times do
> you need a test to run properly to qualify it as a meaningful test? How
> do you know that it's not a flaky test?
> 
> Ultimately, it's about trust. If, for a given test that just failed, I
> can't be certain that it's because of the branch I just submitted, I
> will just ignore the tests results after a while.
> 
> This is already what plagues kernelci, and we should do better.


This is something that is really nice on Mesa3D, a patch only gets 
merged if tests passes, which forces people to not ignore it, which 
forces the code to be fixed and the CI to be constantly maintained.

Of course there are bad days there, but there is real value. Nice thread 
to check: https://gitlab.freedesktop.org/mesa/mesa/-/issues/8635 (thanks 
Alyssa for the feedback).


> 
> And I'm sorry, but if some part of the kernel or driver just isn't
> reliable, then we shouldn't claim it is (except for all the times it
> isn't). If no-one has the time to look into it, fine, but flagging it
> under a flaky test doesn't help anyone.


At least we would know what is there that isn't reliable.
We could also define policies like: failing one out of 10 is fine. And 
we can have scripts that do a stress test and report back.
It is really nice for users to know this kind of status of drivers.


Thanks for your feedback, please keep them coming :)

Regards,
Helen


> 
> Like, from that patch, how can I know what is the issue with
> kms_hdmi_inject@inject-4k or kms_addfb_basic@addfb25-bad-modifier on
> mt8173. I certainly can't. And neither of those have anything to do with
> peripheral hardware.
> 
> Maxime

