Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18771C07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 11:43:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC94560FDB
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 11:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC94560FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLuFAHfuvE6fBf+fvbkqgpzjb+I91Op3X40k/Llh5vI=; b=2wfLusSgyKNs3jB3tsgoj0VPfY
	Nh9TXhOug2TH5VI5YSzAtW53JGBDBR1ND/gAlaZEkV5Ud5GWlPp2NY1345vgF4zW01eJQxohNDKXa
	zHIofw4J++Z8rH7/YP8vdQPOzwciXjeQMl4dRVxvvcF6JohADXVH6zLDOQ7TKinr587+jNDPpQ1Kt
	FfiYVThrlS2dX9V0v0SLotF67zsadiXbpki6RfmPl9YhV/c7USUrLH5loh1y4Q4gFpHAnc+DACWy6
	BLVp0SJTwMGgGJ6U/BY8Vq22KIKvU9ULdP72gSoOlbW8pK4oIwZlJbPg4qpZQKJfoxvTSBZVS2ZDO
	L+wE0ATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5RgQ-009WdQ-PI; Mon, 19 Jul 2021 11:43:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5RgM-009WcV-P5
 for linux-mediatek@lists.infradead.org; Mon, 19 Jul 2021 11:43:37 +0000
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown
 [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 46FA31F41A99;
 Mon, 19 Jul 2021 12:43:30 +0100 (BST)
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>, Tomasz Figa
 <tfiga@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <976d420c-b4fc-bc23-c398-9b3a7ab4ffc9@collabora.com>
 <CAPBb6MVcnei2OLFYG-2YyqZrY8JvA-CJN6SUv=vGRmOZ2Af47g@mail.gmail.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <dc3e6d05-39cd-9124-a452-1a72348c33ea@collabora.com>
Date: Mon, 19 Jul 2021 13:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MVcnei2OLFYG-2YyqZrY8JvA-CJN6SUv=vGRmOZ2Af47g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_044335_020683_6F7016DD 
X-CRM114-Status: GOOD (  35.86  )
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



On 13.05.21 10:21, Alexandre Courbot wrote:
> Hi Dafna,
> 
> On Thu, Apr 29, 2021 at 9:07 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> Hi,
>>
>> On 27.04.21 13:15, Alexandre Courbot wrote:
>>> This series adds support for the stateless API into mtk-vcodec, by first
>>> separating the stateful ops into their own source file, and introducing
>>> a new set of ops suitable for stateless decoding. As such, support for
>>> stateful decoders should remain completely unaffected.
>>>
>>> This series has been tested with both MT8183 and MT8173. Decoding was
>>> working for both chips, and in the case of MT8173 no regression has been
>>> noticed.
>>
>> I am trying to test the decoder with this patchset using v4l2-ctl on mt8173.
>>
>> I am trying to decode an h264 file into V4L2_PIX_FMT_MT21C format.
>> I am not able to do it. It seems that the driver expects each buffer to start
>> with a nal starting code, and the v4l2-ctl command just read the files into
>> buffers without any parsing.
>>
>> Can you share the command and the files you used for testing?
> 
> I have been using the Chromium test suite (aka
> video_decode_accelerator_tests). I had doubts after reading your email
> but I tested the series again using this tool and confirmed it was
> working.

Hi, I have a chromeos userspace that I compiled. I use it to test the codec drivers on latest 5.14.
Could you share the exact command you use for your tests?

I used the command:
tast -verbose run -build=false 10.42.0.175 video.DecodeAccel*h264*

With that commands, all the tests that ends with 'VD' fail , the other tests pass.

The docs in [1] says that the command video_decode_accelerator_tests  does not require the "full Chrome browser stack",
does that mean that it can be compiled and run on userspace other than chromeos?
I could not find the instructions of how to compile and install that command. Could you instruct me to it?

The mt8173 doc [2] says that the supported video decoders are "H.264,  H.265 / HEVC,  MPEG-1/2/4"
But running 'v4l2-ctl --list-formats-out -d0' shows:

ioctl: VIDIOC_ENUM_FMT
     Type: Video Output Multiplanar

     [0]: 'H264' (H.264, compressed)
     [1]: 'VP80' (VP8, compressed)
     [2]: 'VP90' (VP9, compressed)

So the source code shows support for vp8, vp9 which is not stated in the official doc.
Do you know the explanation for that difference? Do you know if elm device should support vp8, vp9?

[1] https://chromium.googlesource.com/chromium/src/+/HEAD/docs/media/gpu/video_decoder_test_usage.md

[2] https://www.mediatek.com/products/tablets/mt8173

Thanks,
Dafna

> 
> Unfortunately this test is not easy to build, but maybe if you have a
> Chromium environment ready you can run it. mtk-vcodec does expect the
> input buffers to be split by NAL units (as per the spec [1] IIUC), so
> that would explain why v4l2-ctl failed (I assume that it also fails
> without this series?).
> 
> Maybe ffmpeg can also be used to exercice this driver with properly
> split NAL units, but I am not familiar with its use with V4L2. I'm
> also not sure it would be happy about the MT21C format that the driver
> outputs, or that it could pick the MDP to convert it to something
> readable...
> 
> Cheers,
> Alex.
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-compressed.html#compressed-formats
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
