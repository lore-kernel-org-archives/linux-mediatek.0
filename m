Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAB0C41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G82hudDSGLw6AtSQ1T4Z7nqRvn920200QYy8PFech4Q=; b=mTXzG51rEuOmBZa1vAAkK/G1k1
	YTzPm5z26XmcWyKFaPCpjkn/9mh4T8Hl1OQmXeOvD5/MBafYtY4O+M55TMwQOezvoJwjyU/JUd7oj
	SqVRrctEF2IK2X7dVl657m4DlVmPOPREy2alpuiVMVCnBHm4F+iSkdQNppJ6GyoJLVxHRU/G4s1zE
	597CmvOJvR+umoPH/aj93PK8UgeSRL88k5L33B+9uziHvdn6YhtZjQfxWCNnOnNPnbSLUvcBsnYic
	4rHMdS6jFwfHn1agEN1tM/aN4gOCBgU9DmOSWDyRAHsT4wJ00wMHBqNiFG7qpHbZV4Icg2LHkcYcj
	AmbwSJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFXmF-00DcmA-1G;
	Tue, 19 Dec 2023 10:56:43 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFXmB-00DclQ-2P;
	Tue, 19 Dec 2023 10:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702983398;
	bh=E6SsGnEMQ5sQgGiV6jGfWzSqHuxNI3tqz6LYjcZqyto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SnZH+wvtXP/GDQpXtBpr6B06nuYwgID2MgVv83MO2PFYFvCRdaDS4P+bE87L8txKt
	 RoyiRqFbVhDQPx5AkWDyVDaTP1C/+6RjX6EM8EATNNe/kEk/VVzo460gYKNNl3uf+h
	 Z+zANvIvh14t56VGrNHm9Ib7EAx1ZPIorZaMWb4ZDWKFz4c4CAbkw5J9WUknEK7P+K
	 B7AfteaDmOitMNkbE0JdgIUwsTMehGLyt20I3ShIFFkacKwyca1lcelLd92qpahoe6
	 BvIoFdwvydjowZo1gVXSsF/SnaV7woUSYfhCiNu0Wd7p0T5UMFN8MTrKtHdWHQOxx0
	 3A16LWwIN13Hg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E8E3337814A3;
	Tue, 19 Dec 2023 10:56:37 +0000 (UTC)
Message-ID: <e23ebdd8-7fbe-435b-a850-0ef18a51b020@collabora.com>
Date: Tue, 19 Dec 2023 11:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fix overflow in idle exit_latency
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: yongdong.zhang@mediatek.com, C Cheng <C.Cheng@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231219031444.91752-1-bo.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231219031444.91752-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_025639_915666_D22A50E7 
X-CRM114-Status: GOOD (  10.94  )
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

Il 19/12/23 04:14, Bo Ye ha scritto:
> From: C Cheng <C.Cheng@mediatek.com>
> 
> In detail:
> 
> In C language, when you perform a multiplication operation, if
> both operands are of int type, the multiplication operation is
> performed on the int type, and then the result is converted to
> the target type. This means that if the product of int type
> multiplication exceeds the range that int type can represent,
>   an overflow will occur even if you store the result in a
> variable of int64_t type.
> 
> For a multiplication of two int values, it is better to use
> mul_u32_u32() rather than s->exit_latency_ns = s->exit_latency *
> NSEC_PER_USEC to avoid potential overflow happenning.
> 
> Signed-off-by: C Cheng <C.Cheng@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



