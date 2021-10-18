Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF22BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 07:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F9F60F46
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 07:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42F9F60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5uqNisCUzpSbWtoNlvWl4EjlWwIjYSBFGNIBdxxYcQ=; b=VZVyGx3EU2Y/SKweuuA41ClRHp
	7+DbzPiM+MR9UIGbOuPZfTD0SlbkCgER//5Xz9V4a1FlOjrJN1e73KgQEkmGvWVCkIoRhXFmusxTZ
	UEKMWO+ebqwutdBjwoSTxw5Aoa+GFpS7fbh138Twi+3R4HSjsjFQC0m1rz3Bp4Xv++toy0eTsBamY
	GTKQMFYTz+5qHHjcvJkWff9Ic9lE/IzsoUXoCz7gqquRks1+ilgUqVfWoqtEH/Z8hDP5YTL6lmSc6
	p577Qb3oVTi3+I2APD80uNTJ4hktgmXKbCvjqpabUvC8k0OGLEZv7fJ85UE4DiDrmNtHxpnm3s4xz
	5g2tiX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcMjx-00EQVJ-JW; Mon, 18 Oct 2021 07:07:21 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcMju-00EQTL-Ue
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 07:07:20 +0000
Received: from [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6] (unknown
 [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 06E181F42612;
 Mon, 18 Oct 2021 08:07:13 +0100 (BST)
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 kernel@collabora.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Dafna Hirschfeld <dafna3@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, minghsiu.tsai@mediatek.com,
 houlong.wei@mediatek.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
 <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
 <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
Date: Mon, 18 Oct 2021 09:07:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_000719_154367_0A223CBE 
X-CRM114-Status: GOOD (  28.17  )
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



On 18.10.21 03:16, Alexandre Courbot wrote:
> Hi Hans!
> 
> On Mon, Oct 4, 2021 at 6:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 20/09/2021 19:04, Dafna Hirschfeld wrote:
>>> From: Alexandre Courbot <acourbot@chromium.org>
>>>
>>> When running memcpy_toio:
>>> memcpy_toio(send_obj->share_buf, buf, len);
>>> it was found that errors appear if len is not a multiple of 8:
>>>
>>> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>>
>> Why do errors appear? Is that due to a HW bug? Some other reason?
> 
> MTK folks would be the best placed to answer this, but since the
> failure is reported by the firmware I'd suspect either a firmware or
> hardware limitation.
> 
>>
>>>
>>> This patch ensures the copy of a multiple of 8 size by calling
>>> round_up(len, 8) when copying
>>>
>>> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
>>> ---
>>> changes since v3:
>>> 1. multile -> multiple
>>> 2. add inline doc
>>>
>>> changes since v2:
>>> 1. do the extra copy only if len is not multiple of 8
>>>
>>> changes since v1:
>>> 1. change sign-off-by tags
>>> 2. change values to memset
>>>
>>>   drivers/media/platform/mtk-vpu/mtk_vpu.c | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>> index ec290dde59cf..1df031716c8f 100644
>>> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>> @@ -349,7 +349,20 @@ int vpu_ipi_send(struct platform_device *pdev,
>>>                }
>>>        } while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>>>
>>> -     memcpy_toio(send_obj->share_buf, buf, len);
>>> +     /*
>>> +      * when copying data to the vpu hardware, the memcpy_toio operation must copy
>>> +      * a multiple of 8. Otherwise the processing fails
>>
>> Same here: it needs to explain why the processing fails.

Is writing 'due to hardware or firmware limitation' enough?
If not, then we should wait for mediatek people's response to explain if they know more

>>
>>> +      */
>>> +     if (len % 8 != 0) {
>>> +             unsigned char data[SHARE_BUF_SIZE];
>>
>> Wouldn't it be more robust if you say:
>>
>>                  unsigned char data[sizeof(send_obj->share_buf)];
> 
> Definitely yes.

I'll send v5 fixing this

> 
>>
>> I also think that the SHARE_BUF_SIZE define needs a comment stating that it must be a
>> multiple of 8, otherwise unexpected things can happen.
>>
>> You also noticed that the current SHARE_BUF_SIZE define is too low, but I saw
>> no patch correcting this. Shouldn't that be fixed as well?
> 
> AFAICT the firmware expects this exact size on its end, so I don't
> believe it can be changed that easily. But maybe someone from MTK can
> prove me wrong.
> 

I looked further and noted that the structs that are larger than 'SHARE_BUF_SIZE'
(venc_ap_ipi_msg_enc_ext venc_ap_ipi_msg_set_param_ext)
are used by drivers that don't use this vpu api, so actually SHARE_BUF_SIZE is
not too low and as Corurbot worte probably not changeable.


Thanks,
Dafna

> Cheers,
> Alex.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
