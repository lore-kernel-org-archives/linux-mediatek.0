Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C935E7C4F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+vM+2eok4AC4+e7hiNzHtbEfo28spSIzsZ5rR7YFM4=; b=VgRz9gZjoJV/vS4vbmT5bj7ORw
	G2Mimz8ZNl9XfvfiLqhqqJFmmOtGP0Ncf6AawyAyPHVQNuWtT2S023Te0Mql7Izgi9dsRPmUDO/ll
	ZoYFvkCZNxgcLBm0ufEezR/IPL5LdRZh1XbikJ1+clBVHuEJ2dMgSYs8JcNshsV0S15oArWkRaFv6
	dsfH8rDtbJJR4nPMWdjP9J/1kXCkCtCIP8A+AksdmBA4qRZYWz2GRYjSn9aZnCq8gJWjQFy/ANlVX
	z6REbDB02CdMa3CwkEwl9A/Fb3ZgKeKGxSQ61CjhEA1LWszrD0w9XLGtZygY+Rircg+pNiRA8mh4p
	7HhMUCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJzw-001huv-2L;
	Thu, 05 Oct 2023 08:46:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJzt-001ht4-0g;
	Thu, 05 Oct 2023 08:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6AD0617F4;
	Thu,  5 Oct 2023 08:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E053EC116B0;
	Thu,  5 Oct 2023 08:46:13 +0000 (UTC)
Message-ID: <ef1d5a63-6a83-46fc-b593-2d507a1ce097@xs4all.nl>
Date: Thu, 5 Oct 2023 10:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: mediatek: vcodec: Fix encoder access NULL
 pointer
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Irui Wang <irui.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20230926101909.15030-1-irui.wang@mediatek.com>
 <36356e37-9abd-4dec-a716-9822b67bd0fa@xs4all.nl>
 <54962983-fa23-4ecc-9874-f59a1387cf70@xs4all.nl>
In-Reply-To: <54962983-fa23-4ecc-9874-f59a1387cf70@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_014617_309675_F7B24BC3 
X-CRM114-Status: GOOD (  12.00  )
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

On 04/10/2023 08:54, Hans Verkuil wrote:
> Ping! Is this a fix for 6.6 or not?
> 
> Regards,
> 
> 	Hans
> 
> On 02/10/2023 12:24, Hans Verkuil wrote:
>> On 26/09/2023 12:19, Irui Wang wrote:
>>> Need to set the private data with encoder device, or will access
>>> NULL pointer in encoder handler.
>>>
>>> Fixes: 1972e32431ed ("media: mediatek: vcodec: Fix possible invalid memory access for encoder")
>>>
>>> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>>> ---
>>>  drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
>>> index d299cc2962a5..ae6290d28f8e 100644
>>> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
>>> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
>>> @@ -138,7 +138,8 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
>>>  	vpu->ctx->vpu_inst = vpu;
>>>  
>>>  	status = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
>>> -					    vpu_enc_ipi_handler, "venc", NULL);
>>> +					    vpu_enc_ipi_handler, "venc",
>>> +					    vpu->ctx->dev);
>>>  
>>>  	if (status) {
>>>  		mtk_venc_err(vpu->ctx, "vpu_ipi_register fail %d", status);
>>
>> Is this a fix that should go to 6.6?

This looks like a real bug, so I'll queue this up for 6.6.

Regards,

	Hans

