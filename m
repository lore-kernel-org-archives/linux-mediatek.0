Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1757C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuMBTa61v12hxeI656aASwJ4F5QwcXNXM+uc4JAhj6A=; b=KjFdPQqNifthPM
	vQUvJRpJIrIYQIo5VgyF2N5WrcoWCGXfyg+Q5PnOgV4KKu39omnDK3s32wwSEHkPcqDW8DRRIUi86
	AA2vAMCEUBiRQNujZW2lrNsg9tDTsqo+qPe/sgA5duLXDmGnG8JK8CL6Yyx2SDa5zr2J6R4n9AlzF
	Iq/8HUE4GdzFZuCc+bA/6SSFOjsCEtB5mIK6TBBfqWeBmrNF/JeLIqRMYci7IHVCiQB+6j5lsmoXZ
	nv+/+RXz3aJCio397LuZgrgkJSbavTJLDzQPNV7EH4btgiXa5M4un5ru/HHN3lq5T0hXK9UOgsyZg
	j6bYyXUk7J6GIkIJ8zOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrI0l-001cHx-Qm; Wed, 18 May 2022 11:38:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrHwb-001Zqy-5b; Wed, 18 May 2022 11:34:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 552F960C94;
 Wed, 18 May 2022 11:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CA7C385A5;
 Wed, 18 May 2022 11:34:15 +0000 (UTC)
Message-ID: <31992c67-400e-8e14-38c2-4655995886f5@xs4all.nl>
Date: Wed, 18 May 2022 13:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6, 6/7] media: mediatek: vcodec: prevent kernel crash
 when scp ipi timeout
Content-Language: en-US
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220513092526.9670-1-yunfei.dong@mediatek.com>
 <20220513092526.9670-7-yunfei.dong@mediatek.com>
 <ea9a04fb-368d-daca-96ae-9366253a5e91@xs4all.nl>
 <f26d5225fc8c499226c297ed86feb5ee20e8f3d3.camel@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <f26d5225fc8c499226c297ed86feb5ee20e8f3d3.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_043421_367311_D72721B6 
X-CRM114-Status: GOOD (  23.30  )
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



On 5/18/22 13:29, yunfei.dong@mediatek.com wrote:
> Dear Hans,
> 
> Thanks for your review.
> On Wed, 2022-05-18 at 11:37 +0200, Hans Verkuil wrote:
>> Hi Yunfei,
>>
>> On 5/13/22 11:25, Yunfei Dong wrote:
>>> When SCP timeout during playing video, kernel crashes with
>>> following
>>> message. It's caused by accessing NULL pointer in
>>> vpu_dec_ipi_handler.
>>> This patch doesn't solve the root cause of NULL pointer, but merely
>>> prevent kernel crashed when encounter the NULL pointer.
>>
>> Is the root cause being addressed as well? Where is the root cause?
>> Is it
>> in this driver or in the scp (i.e. the remoteproc) driver?
>>
>> I need a bit more information to decide whether this series is ready
>> to
>> be merged for 5.20 or not.
>>
>> Regards,
>>
>> 	Hans
>>
> Vpu will be NUll when scp(micro processor) is hang or crash. Need to
> keep kernel works well , so add this patch.

OK, I think this should be stated in the commit log, and also in the code
(see below).

> 
> Best Regards,
> Yunfei Dong

<snip>

>>> diff --git a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
>>> b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
>>> index 35f4d5583084..1041dd663e76 100644
>>> --- a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
>>> +++ b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
>>> @@ -91,6 +91,11 @@ static void vpu_dec_ipi_handler(void *data,
>>> unsigned int len, void *priv)
>>>  	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
>>>  					(unsigned long)msg-
>>>> ap_inst_addr;
>>>  
>>> +	if (!vpu) {
>>> +		mtk_v4l2_err("ap_inst_addr is NULL");

E.g., either add a comment here or perhaps change the error message to:

"ap_inst_addr is NULL, did the SCP hang?"

Or something along those lines.

Shouldn't there be a \n at the end of this message as well? Or does
mtk_v4l2_err add that?

Regards,

	Hans

>>> +		return;
>>> +	}
>>> +
>>>  	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
>>>  
>>>  	vpu->failure = msg->status;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
