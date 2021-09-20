Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC7BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 15:19:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E67E610F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 15:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E67E610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om1Wbpwi4IiT77c0hfvDqpwIJeeTFTVx5ZXo9APV9GI=; b=Dz+9Lp5jVwaJYV4r/X+jCjdRvT
	lFXwsvK+k2kLUxU5tgGOAgjhyDPYjczFpflp3OdcoxNr5XjQDx2+4FfAD1K7u8qsmy3BvODvdr3XW
	kEqVn20qvn05H/kZRTOXwFc026FpvWzwg4LMXx5kj2IhuJtJntdvV50il/DcOYbqlTyQOrA65+/qQ
	hpK8dG3mySb0cpW2tr+NJAhPE3CiIAD0fio2lZvaWFMDN3ufTnSv8F8w556jcuNiWOcJSxCS5NAvc
	7fu+f27IbXBBQ53YjS7Ga40P7k9JXNARrPtPg1XK5RmDsE8NrZdCqWrX91LFdkbaxQVpT3+LlrT0b
	+nFVOHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSL4r-002BYu-Pf; Mon, 20 Sep 2021 15:19:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSL4o-002BXn-4f
 for linux-mediatek@lists.infradead.org; Mon, 20 Sep 2021 15:19:27 +0000
Received: from [IPv6:2a02:810a:880:f54:34ca:272f:b5af:bab9] (unknown
 [IPv6:2a02:810a:880:f54:34ca:272f:b5af:bab9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D30571F42F71;
 Mon, 20 Sep 2021 16:19:21 +0100 (BST)
Subject: Re: [PATCH v3] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Courbot <acourbot@chromium.org>, kernel@collabora.com,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, dafna3@gmail.com,
 mchehab@kernel.org, tfiga@chromium.org, minghsiu.tsai@mediatek.com,
 houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com,
 tiffany.lin@mediatek.com, matthias.bgg@gmail.com, courbot@chromium.org,
 hsinyi@chromium.org, eizan@chromium.org
References: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
 <c1712278-8d18-2958-853b-09e5097ddce7@xs4all.nl>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8c8336ff-57aa-dac8-d4ef-5d1dd120b2db@collabora.com>
Date: Mon, 20 Sep 2021 17:19:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c1712278-8d18-2958-853b-09e5097ddce7@xs4all.nl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_081926_344090_9D2AB224 
X-CRM114-Status: GOOD (  29.98  )
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



On 01.09.21 10:50, Hans Verkuil wrote:
> On 25/08/2021 12:17, Dafna Hirschfeld wrote:
>> From: Alexandre Courbot <acourbot@chromium.org>
>>
>> When running memcpy_toio:
>> memcpy_toio(send_obj->share_buf, buf, len);
>> it was found that errors appear if len is not a multiple of 8:
>>
>> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>>
>> This patch ensures the copy of a multile of 8 size by calling
> 
> multile -> multiple
> 
>> round_up(len, 8) when copying
>>
>> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>> changes since v2:
>> 1. do the extra copy only if len is not multiple of 8
>>
>> changes since v1:
>> 1. change sign-off-by tags
>> 2. change values to memset
>>
>>   drivers/media/platform/mtk-vpu/mtk_vpu.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> index ec290dde59cf..658161ee3e4e 100644
>> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> @@ -349,7 +349,16 @@ int vpu_ipi_send(struct platform_device *pdev,
>>   		}
>>   	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>>   
>> -	memcpy_toio(send_obj->share_buf, buf, len);
>> +	if (len % 8 != 0) {
> 
> You need to add a comment here explaining why this is done (basically what
> you also say in the commit log).
> 
> Otherwise people would have to dig into the git log to figure out why this
> code is the way it is.
> 
> Is len often not a multiple of 8? If that's the case, then it might be easier
> to just always do the memset/memcpy.

I wrote a program that prints the sizes of all possible messages: http://ix.io/3zsr
compiling it to arm64 gives:

sizeof(mdp_ipi_comm) is 24
sizeof(mdp_ipi_init) is 16

sizeof(venc_ap_ipi_msg_deinit) is 8
sizeof(venc_ap_ipi_msg_enc_ext) is 164
sizeof(venc_ap_ipi_msg_enc) is 32
sizeof(venc_ap_ipi_msg_set_param_ext) is 144
sizeof(venc_ap_ipi_msg_set_param) is 48
sizeof(venc_ap_ipi_msg_init) is 16

sizeof(vdec_ap_ipi_cmd) is 8
sizeof(vdec_ap_ipi_init) is 16
sizeof(vdec_ap_ipi_dec_start) is 24

BUT, when printing the size in the kernel I got "sizeof(mdp_ipi_comm) = 20" and found out
that this is due to the macro #pragma pack(push, 4) in mtk_mdp_ipi.h

so for mdp it makes sens to always do the memset/memcpy but for mtk-vcodec it is not necessary.
In addition, if the message is one of 'venc_ap_ipi_msg_enc_ext' or 'venc_ap_ipi_msg_set_param_ext' then vpu_ipi_send
will fail in the beginning of the function since in those cases we have 'len > sizeof(send_obj->share_buf)'.
so I should send a patch that set SHARE_BUF_SIZE to e.g. 200

I also found out that adding #pragma pack(push, 4) to the definitions of the mtk-vcodec messages has no influence but
maybe this should be added since we copy those messages to hw , so might avoid future bugs.

thanks,
Dafna

> 
> Regards,
> 
> 	Hans
> 
>> +		unsigned char data[SHARE_BUF_SIZE];
>> +
>> +		memset(data + len, 0, sizeof(data) - len);
>> +		memcpy(data, buf, len);
>> +		memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
>> +	} else {
>> +		memcpy_toio(send_obj->share_buf, buf, len);
>> +	}
>> +
>>   	writel(len, &send_obj->len);
>>   	writel(id, &send_obj->id);
>>   
>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
