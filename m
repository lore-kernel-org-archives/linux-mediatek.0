Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B7BC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxGEm52AvJQJv4ciKECm3nSZmJWqySsuztricuVBJH4=; b=Ec9p0zv5pgAzCSl6ClqrqKdxnE
	S1fRvIbOdS6lLJH5fJQmwc1q0WpJuKRhAffnFZmlHRdd6ljVRMUn5uGfnmn7okpyGBfhUzQ9VxF/A
	pz0D84RYb415OpjILmpVNihL7MRFMYEE2lUBqU/FpWPkuhuXW7WpfrdbUzV148WeNwfIF7qQWPYaY
	VLGa0DkXOg6Po5MIOwdEq62cUBxhE2k8wRnVFBVeLqQqm9CXS1UulwWqBpOJutIXXHKJPc9s65fFE
	1HZfLWB8wRm+AzY2cHTwRZhy/yt/64k7a281+BMeJ/KqW9gyMApFa9cMGAmgLywscS9ksnfu2+oHr
	Cz0f82LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mFH-00DGLi-11;
	Wed, 24 May 2023 11:01:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mFD-00DGKn-1b;
	Wed, 24 May 2023 11:01:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D80E762E17;
	Wed, 24 May 2023 11:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593D6C433D2;
	Wed, 24 May 2023 11:01:23 +0000 (UTC)
Message-ID: <6a9db92e-a52e-c427-8a8b-fbec4715c0a9@xs4all.nl>
Date: Wed, 24 May 2023 13:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7,0/2] media: mediatek: vcodec: add hevc stateless
 decoder driver in MT8195
Content-Language: en-US
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20230524080739.17264-1-yunfei.dong@mediatek.com>
 <b5c45ac7-64ad-ddc1-a7a2-99d9d1c27ca7@xs4all.nl>
 <44558245fdfc49e33d3a6478e30069ba4b6d3b3e.camel@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <44558245fdfc49e33d3a6478e30069ba4b6d3b3e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_040127_609633_52642DFA 
X-CRM114-Status: GOOD (  25.49  )
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

Hi Yunfei,

On 24/05/2023 12:16, Yunfei Dong (董云飞) wrote:
> Hi Hans,
> 
> Thanks for your suggestion.
> 
> I don't understand your means very well, need to confirm with you
> again.
> 
> hevc(v7) --- > media: mediatek: vcodec: support stateless hevc decoder
> plt(v3)  ----> media: mediatek: vcodec: Fix decoder under flow and plt
> test fails randomly
> 
> Whether hevc and plt patches merged together?
> 
> Whether you mean I need to post v8 for hevc patch based on plt patch as
> below order?
> hevc(v7)
> plt(v3)
> media stage HEAD
> 
> I cherry pick all patches, won't get conflict.
> 
> Or I need to post hevc patch based on media stage HEAD?
> hevc(v7)
> media stage HEAD

When testing I found a problem with the plt v3 series, so I decided to
drop that and take this hevc v7 series instead.

So you can ignore this email.

I'll make a separate email describing the problem with the plt series.

Regards,

	Hans

> 
> Best Regards,
> Yunfei Dong
> 
> On Wed, 2023-05-24 at 11:27 +0200, Hans Verkuil wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Hi Yunfei,
>>
>> On 24/05/2023 10:07, Yunfei Dong wrote:
>>> Add hevc stateless decoder driver to support hardware decode in
>>> MT8195, and the driver
>>> need num_delta_pocs_of_ref_rps_idx value to parse slice header
>>> short_term_ref_pic_set().
>>>
>>> patch 1 add num_delta_pocs_of_ref_rps_idx field.
>>> patch 2 add hevc stateless decoder driver.
>>
>> This series clashes with this older series from you:
>>
>>
> https://urldefense.com/v3/__https://patchwork.linuxtv.org/project/linux-media/cover/20230424060130.18395-1-yunfei.dong@mediatek.com/__;!!CTRNKA9wMg0ARbw!ndi-6i9h2KkGhm1Sgg4aAXrI3iYVMKtyxR2bjt-HCujIL5d9-OfSzfJnlvwmVuIRCwgdZtlP4z0zNU1fvCD9WPQvpeyKDyUK$
>>
>> Can you post a v8 that sits on top of that older series?
>>
>> Regards,
>>
>>         Hans
>>
>>> ---
>>> Changed from v6:
>>> - fix AngeloGioacchino's suggestion.
>>>
>>> Changed from v5:
>>> - checkpatch/kernel-doc pass/build pass.
>>> - fix warning: struct vdec_av1_slice_fb -> struct
>>> vdec_hevc_slice_fb.
>>> - fix warning: remove unused comment for param "trans_start" and
>>> "trans_end"
>>>
>>> Changed from v4:
>>> - fix some comments according to Nathan's suggestion.
>>>
>>> Changed from v3:
>>> - add the dependency patch to this patch series for patch 1.
>>>
>>> Changed from v2:
>>> - fix one build warning.
>>> - add the dependency patch link.
>>>
>>> Changed from v1:
>>> - fix build error when build 32bit system.
>>> - hevc fluster test result: 132/147 (not support: 10bit => 11 and
>>> resolution => 4).
>>> ---
>>> Benjamin Gaignard (1):
>>>   media: uapi: HEVC: Add num_delta_pocs_of_ref_rps_idx field
>>>
>>> Yunfei Dong (1):
>>>   media: mediatek: vcodec: support stateless hevc decoder
>>>
>>>  .../media/v4l/ext-ctrls-codec-stateless.rst   |    7 +
>>>  .../media/platform/mediatek/vcodec/Makefile   |    1 +
>>>  .../vcodec/mtk_vcodec_dec_stateless.c         |   59 +-
>>>  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |    1 +
>>>  .../vcodec/vdec/vdec_hevc_req_multi_if.c      | 1097
>>> +++++++++++++++++
>>>  .../platform/mediatek/vcodec/vdec_drv_if.c    |    4 +
>>>  .../platform/mediatek/vcodec/vdec_drv_if.h    |    1 +
>>>  include/uapi/linux/v4l2-controls.h            |    6 +-
>>>  8 files changed, 1174 insertions(+), 2 deletions(-)
>>>  create mode 100644
>>> drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.
>>> c
>>>
>>
>>


