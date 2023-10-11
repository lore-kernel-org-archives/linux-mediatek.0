Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF072E95A97
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8Tn2AEQX0AEt2ti74wq74sADfzUwxNfZTub5wY0Lww=; b=IElTp74cmCleGzXwIZZJ16Z81j
	HGuKeXc0raOXpHG9ToT8VFkX8SNxFJYJt9uHMJimdiDTnJWWMat5CHCl+GR3hW4AF8qatRMvCksi9
	OYrxykVMBQOqKGJJhX8SfIDE9QQel/XpQDpXfUzG9Pf49rfdWOKsc9LuzL6lQW76CEY6ArL9dpu0d
	f6Pw4T402ZaPsl9QAKKHZjkQ0BW2C2ciLpIXDTAPA6OYtHkEoGWQmNtUvn6u5TLL9tRw3/YGytg+h
	k76uy9wB7fguCEb9VzDSku2GVhzcWNJztx8+XiZO36VyhM1GobzTgR0gjFkw+Shu2P7AZT3aTWcTt
	NXFrGYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqUpp-00FFeK-19;
	Wed, 11 Oct 2023 08:44:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqUpl-00FFbv-2k;
	Wed, 11 Oct 2023 08:44:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A7EA61AB9;
	Wed, 11 Oct 2023 08:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52932C433C8;
	Wed, 11 Oct 2023 08:44:45 +0000 (UTC)
Message-ID: <bd0ba3d3-444a-4288-910f-4b8a84b90750@xs4all.nl>
Date: Wed, 11 Oct 2023 10:44:43 +0200
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
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231003080704.43911-12-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_014449_928911_1874ED3C 
X-CRM114-Status: GOOD (  10.98  )
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

On 03/10/2023 10:06, Benjamin Gaignard wrote:
> This patch adds 2 helpers functions to add and remove vb2 buffers
> from a queue. With these 2 and vb2_get_buffer(), bufs field of
> struct vb2_queue becomes like a private member of the structure.
> 
> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer so check the return value of all of them.

This needs to be extended: checking the returned pointer is a preparation
for when buffers can be deleted. As it is right now, checking for a
NULL pointer isn't needed.

I wonder if it isn't better to drop those checks and instead apply them
at the tail end of this series when the actual work on deleting buffers
starts (before patch 49, I think).

Regards,

	Hans

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++-----
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  51 ++++--
>  2 files changed, 146 insertions(+), 56 deletions(-)


