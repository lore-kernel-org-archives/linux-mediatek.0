Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0340CD6E56
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4q6X4gIaWpnZrKyLrVc1fLreLMIAbf6tvRHXoPwnEw=; b=LyHkwa1Xw7K3DGqtdVSML891hO
	dTWhxeMv0EQok1QUl2DZhIaTxMdcmWBFH1E8hPA0R0UP0VJb8A4x7VYoEN8kctdch9y4l6h4EBY92
	+4o/mKoVpbOYsMggLr8LcTzp0Lm2k04zz8w5IPhi+d8BUC/F+42+Xqlm3zXb1peNr2Y+fKegiMujX
	Czhq/UMQZsr6JthyVMMncDeZEwIFikPu7ZvpyXsKIx0Vmx0BnZ2wU2ahrPHB8d9o6ogAaU0Yknghz
	GWQW9cWK30VxYD+VcR/sl51ScdixlghLLkzoxUBsuqIZ2H89jDq++9CWhyWl9vGCFkm5YwxGlKmb5
	1ZCEcZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVeE-00FMAo-1L;
	Wed, 11 Oct 2023 09:36:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVe8-00FM94-1N;
	Wed, 11 Oct 2023 09:36:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4E3E61B74;
	Wed, 11 Oct 2023 09:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E86C433CD;
	Wed, 11 Oct 2023 09:36:47 +0000 (UTC)
Message-ID: <07237b8b-ecd2-4717-8eda-101e52edf60c@xs4all.nl>
Date: Wed, 11 Oct 2023 11:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/54] media: videobuf2: Access vb2_queue bufs array
 through helper functions
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
 <20231003080704.43911-12-benjamin.gaignard@collabora.com>
 <bd0ba3d3-444a-4288-910f-4b8a84b90750@xs4all.nl>
 <954315b8-3e5c-4583-a904-d20fbd21aa3f@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <954315b8-3e5c-4583-a904-d20fbd21aa3f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_023652_507680_88137937 
X-CRM114-Status: GOOD (  15.23  )
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

On 11/10/2023 11:32, Benjamin Gaignard wrote:
> 
> Le 11/10/2023 à 10:44, Hans Verkuil a écrit :
>> On 03/10/2023 10:06, Benjamin Gaignard wrote:
>>> This patch adds 2 helpers functions to add and remove vb2 buffers
>>> from a queue. With these 2 and vb2_get_buffer(), bufs field of
>>> struct vb2_queue becomes like a private member of the structure.
>>>
>>> After each call to vb2_get_buffer() we need to be sure that we get
>>> a valid pointer so check the return value of all of them.
>> This needs to be extended: checking the returned pointer is a preparation
>> for when buffers can be deleted. As it is right now, checking for a
>> NULL pointer isn't needed.
>>
>> I wonder if it isn't better to drop those checks and instead apply them
>> at the tail end of this series when the actual work on deleting buffers
>> starts (before patch 49, I think).
> 
> I think that checking vb2_get_buffer() return value while removing direct
> call to queue buffers array doesn't hurt here.
> It is also needed to do that before "media: videobuf2: Add helper to get queue number of buffers" patch.

If we convert the drivers first, then there is (I think) no need to
split this patch in two parts, since then this patch is part of a much
shorter series and it is sufficient to just mention in the commit log
that the pointer checks prepare for deleting buffers.

Regards,

	Hans

> 
> Regards,
> Benjamin
> 
>>
>> Regards,
>>
>>     Hans
>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>>   .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++-----
>>>   .../media/common/videobuf2/videobuf2-v4l2.c   |  51 ++++--
>>>   2 files changed, 146 insertions(+), 56 deletions(-)
>>


