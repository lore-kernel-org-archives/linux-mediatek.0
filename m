Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC96CD6E55
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYZES4fGyj34R6AKEGOumU3GFBxW23ig6Cajj9XGJnc=; b=ivctaF/pLlRGG6aq7XylezDwYS
	Xb3g842qBX99i+eXw7E52D+HnDrurK7ZGDodjUfTpy+Oyo/OcEbQmOJoETlP//cisAitTOPOAF338
	vy6M6YPlUTbFxhs4p4QOXcWtBULmKGXIgDOooOt3J7+IUbX+FLnxWY47IbXoltf4owEw/2OJF6dLA
	05ObN2CE8P3wumsbZZGwACve81zR8zeaby0aNi+eovj3fISE5UUiTCwWHXRP6pVNwm4/gGPXA7D1J
	/lNT6CUkqVOlDAcc6fAcFuXzRPu1Q9yArOr302VEyJk6kjR6C4czMsONPKGkYCm8oq1NlI3cMa7Hd
	W7epU2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVZo-00FLY7-1A;
	Wed, 11 Oct 2023 09:32:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVZl-00FLWc-0K;
	Wed, 11 Oct 2023 09:32:22 +0000
Received: from [IPV6:2a01:e0a:120:3210:b4ac:2b31:7a66:8708] (unknown [IPv6:2a01:e0a:120:3210:b4ac:2b31:7a66:8708])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 675CB66072F1;
	Wed, 11 Oct 2023 10:32:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697016735;
	bh=5tBLJiqzOELHvhOEyitYQraoe9MQBCrZ0Va/cYbiJGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l7HDeNnyFwiGa8tcEAfmk+SXlkOW9tCJRHAXfwJVRumJnaxWMFC8o4quE1/PV7Cr4
	 PIFAOeJxFE0T7QLRoHdfX/+XqrwL3qmvZNS+veOns4PrCVd4NHZWiK8Qcc4Dw/hw1H
	 C2JBixXqLmarSHTg5PdMEbhSjcCrlmZeUFFEacCefxEl7NEgWfV6w+LmTRmKtMwfTL
	 Q8HspQmkOPgzJZoerILZ+m2mlB4sM3KltcOeZqinhuSoE4xLxuor4Pcz5/YroqkgQq
	 QIu/QdzKLyfG9MsdoP+max2m1xHJLZRApA9Ay6GFxpDarzTo78klgKRRPs6DsFOn2q
	 Jjq4OV2rglTpw==
Message-ID: <954315b8-3e5c-4583-a904-d20fbd21aa3f@collabora.com>
Date: Wed, 11 Oct 2023 11:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/54] media: videobuf2: Access vb2_queue bufs array
 through helper functions
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
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
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <bd0ba3d3-444a-4288-910f-4b8a84b90750@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_023221_350515_3FBE1AE6 
X-CRM114-Status: GOOD (  13.47  )
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


Le 11/10/2023 à 10:44, Hans Verkuil a écrit :
> On 03/10/2023 10:06, Benjamin Gaignard wrote:
>> This patch adds 2 helpers functions to add and remove vb2 buffers
>> from a queue. With these 2 and vb2_get_buffer(), bufs field of
>> struct vb2_queue becomes like a private member of the structure.
>>
>> After each call to vb2_get_buffer() we need to be sure that we get
>> a valid pointer so check the return value of all of them.
> This needs to be extended: checking the returned pointer is a preparation
> for when buffers can be deleted. As it is right now, checking for a
> NULL pointer isn't needed.
>
> I wonder if it isn't better to drop those checks and instead apply them
> at the tail end of this series when the actual work on deleting buffers
> starts (before patch 49, I think).

I think that checking vb2_get_buffer() return value while removing direct
call to queue buffers array doesn't hurt here.
It is also needed to do that before "media: videobuf2: Add helper to get queue number of buffers" patch.

Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++-----
>>   .../media/common/videobuf2/videobuf2-v4l2.c   |  51 ++++--
>>   2 files changed, 146 insertions(+), 56 deletions(-)
>

