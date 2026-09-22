Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3428EC982FF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgkNle4ZDIO7P3OfFsmsnETZ+z7P2LZ7rt6uFLxsBnc=; b=MTUkGIDu8faAHFvKY8fXkP4dlg
	P25CmgB1mXBqptbJ0WZnH4cRzwWXLK8p/dD6czeeqT2linmzZX5uPNz7ity1P6XOWv4j89JGlav37
	gjK18MC6ePXbyGIXJYeOxoEudw9HbeuAEcC873w8jZNyvps9I0um22hyIOyu4y0c88nCIETiOV9rq
	ulv9O6+mqet2A8nCTLWsUqgvMDniatWmk78apth/XNgIVYDHUwswqvg9zp2HkwH1OLY08nkNnvR0v
	34VW8/09HOvFnd747uWFb2aUAuacVU67XiUD+JISA3X9l32oKhOVaGUZsBjhq3y2WQODKJz2iCJoJ
	b7Ml2GkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yrV-00000005Cjq-360L;
	Tue, 22 Sep 2026 11:40:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yr4-00000005CJa-3QkQ;
	Tue, 22 Sep 2026 11:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=MgkNle4ZDIO7P3OfFsmsnETZ+z7P2LZ7rt6uFLxsBnc=; b=pWasLPa/g+9Jp4FsnSMEPOotpR
	q9JiVLNt0T+zPtYqRWxYTzPBZxVBwAT+f+pm0uL0ZzIHzdAiGkSb5wStsxw3sRdFCJAirN/u4+nok
	Bi2O//KOPMY71b8rNPSkortHt5BA588D3v5vCHx/2f5ntO8xfCCYqjhNF790cefIdDQ5Kf9PKtjQP
	4uS8GKcm2G4Cs9H8G0j3GCpa1H9K6FJm38yifqFOmqCh0I/+oMSm4nYQFs2/QYETtvECOxBApvbTH
	BR4lQxX/10XmdyIPUfP3pvROjiQLQJcwvPvhH6uj2OTU56Q8VcxqVhv5aisP84GIMHZ5huDKd9ZpY
	6t9UWu4w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8yr1-0000000DV9r-0tSK;
	Tue, 22 Sep 2026 11:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077206;
	bh=fJ5W03CdrVHqnQmqgbVhhu5CXlxZnw6kNwoOjKn9RAs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PqgcwSVshNgexOhnXxSdiccsCSNKYe2WU5oqhvZlrRO5ooSPjfXAum5Ty7r73KUlF
	 jMW8YVYirzlHevEEm9uwDpbRdN81CqTHUv96Wp1hKfpJwJGmswxrXb8X/r0gPy2bXE
	 Me2Hi7HLPawytPLNupBnwvZucRxF6ttVon2uGkBZNRGbwFf4caMrhOVaABLmB4bOj1
	 ONV5GKcwTTYtJ36wMQi3TK4X3sVJ8Fhc4hVK4+3PJLztzKh0x+M5rmcG84gR9sSt5S
	 6mQobtoOneOOJNeojbw5FFbrTR5cf+Vht4f9DuLRh1CKWFp1JZBwz/6iY8iG4K8QbQ
	 5+bi6CB0YNOaQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BEC617E0A66;
	Tue, 22 Sep 2026 13:40:05 +0200 (CEST)
Message-ID: <14ca0af6-0c5e-47ff-b7e1-08144eb338a2@collabora.com>
Date: Tue, 22 Sep 2026 13:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/12] media: mediatek: jpeg: fix jpeg buffer payload
 size setting
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-3-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_124007_411750_08A70DC7 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On 9/22/26 11:15, Kyrie Wu wrote:
> For multi-core jpegdec, if one core gets resolution change event,
> the payload size, representing the size of Y/C data, needs to change.
> But others are decoding at the same time and it can not be changed
> immediately, which results in the payload size not matching the real
> buffer length.
> The payload size must be less than the real buffer length to avoid
> warning logs.
> 
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


