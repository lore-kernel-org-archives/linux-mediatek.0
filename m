Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DFEC5ACB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAIbtQVq3/h1ixrAMpfMklhlNT49iaEWEzKlWqxp+Ag=; b=ZrP8qiTfxryQT4qz10oxlmhT6W
	6uMo5+6Se0FK2rmVKCarBZrOOPk9oL+5GejitAzNeyK0NrsqNCo24jp694X5HhHDYWiSPSUAtQ3OK
	6HJjhAtdt9/kXAA5JCEjLMxmknul8pWl7/fcHLTooxwSqr43Z4QQOgXnpe08D9r/Ynu6rW8M7aWt7
	CIf2Bkrzrskt0rTq+u50XnzpE0+pamTJtAcW2/Ikdu1SYmfRXbbsAJnSyIljYYzTTmxpjUdwysIX6
	nvKP3UkzTzeDdMj2j5h0B/byiOJeV1a3LmwMBkJspI3Y4DmI4HltFJI+Wd4B2UyRGQOXHzgnMZQyY
	Lh6+uvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3dEK-003ftR-0Y;
	Thu, 16 Nov 2023 14:20:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3dEG-003fsm-1w;
	Thu, 16 Nov 2023 14:20:25 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 91DA5660734A;
	Thu, 16 Nov 2023 14:20:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700144423;
	bh=ZMRVAirW+Pu2sFESR0obPaFqwe7OSdUCQUq2ssj/2yQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JObB02V8WU+UpDz1JIJ+vhbd6xHmLx0ZPw2KUzl5TrGm0RAYNe68af6NSnnD7a9KJ
	 YCfJgZIY/QWfYWIWt5gwHUvHYqahT3DDvbQ/o7P9st16hj8OfMHeJ43ZMJ4+sLYeuQ
	 JvPdbfPuF4xbudSvACvRzXnvjYPMMSQpj+VO8XzUTQb48IDpIBB3Pn2K+bshuOfXaP
	 eoUx9X9BbUF2ZfDATL3R6FyYpJAk/AqTNcZVNMzC4rBgtsRiJimpfFfNr6JyjrW9Fh
	 4NVtvIi3K1odj6+qXlDQZ0qFfvVRjc2yAcJggUf9iwNMj4LkiIGPgmRxf+RybYUfsM
	 U9zME0yMW3Dxw==
Message-ID: <4118d15a-a70c-457d-8f62-d4f61f1157de@collabora.com>
Date: Thu, 16 Nov 2023 15:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuidle: idle exit_latency overflow
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: yongdong.zhang@mediatek.com, mtk24676 <C.Cheng@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231116132619.69500-1-bo.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116132619.69500-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_062024_769517_E789D778 
X-CRM114-Status: GOOD (  17.48  )
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

Il 16/11/23 14:26, Bo Ye ha scritto:
> From: mtk24676 <C.Cheng@mediatek.com>
> 
> In detail:
> In kernel-6.1, in the __cpuidle_driver_init function in
> driver/cpuidle/driver.c, there is a line of code that causes
> an overflow. The line is s->exit_latency_ns = s->exit_latency
> * NSEC_PER_USEC. The overflow occurs because the product of an
> int type and a constant exceeds the range of the int type.
> 
> In C language, when you perform a multiplication operation, if
> both operands are of int type, the multiplication operation is
> performed on the int type, and then the result is converted to
> the target type. This means that if the product of int type
> multiplication exceeds the range that int type can represent,
> an overflow will occur even if you store the result in a
> variable of int64_t type.
> 
> Signed-off-by: mtk24676 <C.Cheng@mediatek.com>

It all makes sense, but "mtk24676" is not the name of a person, what's going on?

> Signed-off-by: bo.ye <bo.ye@mediatek.com>

That's the same, you perhaps wanted to write "Bo Ye", not "bo.ye".

Regards,
Angelo

> ---
> 
> diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
> index d9cda7f..631ca16 100644
> --- a/drivers/cpuidle/driver.c
> +++ b/drivers/cpuidle/driver.c
> @@ -187,7 +187,7 @@
>   			s->target_residency = div_u64(s->target_residency_ns, NSEC_PER_USEC);
>   
>   		if (s->exit_latency > 0)
> -			s->exit_latency_ns = s->exit_latency * NSEC_PER_USEC;
> +			s->exit_latency_ns = (u64)s->exit_latency * NSEC_PER_USEC;
>   		else if (s->exit_latency_ns < 0)
>   			s->exit_latency_ns =  0;
>   		else


