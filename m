Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5515C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wfu9qGJ1xpm4iXxCVJDMlT0XebVPNNWbmNj/9w/YRnU=; b=oJdDgcxT4/r6Xyun6Eqq1GMuPr
	BP1ET9vwzx/dxVYeFK6FInNflWB8D9dpCY2q4YJSPPfWegAuOKuK6fq+LPda1wb5BAFUADFJkAL17
	tjRi6YgmvLDVE2vQCSre+z75fw11u1tQ4vpRRqvZZWA3A+52uEHanaV9TVV8ZB2bqw5IjlO9gZgke
	mOCTrDp8n5O6sEFisHz5l7X940SUzEeKMk+skaiGgTY5WqZ0DrUPgNTbPvc8OPCLhSDhg54FJoX68
	HA7VS1CxK5ihF5QjQNYK/xYaRk4hNTJ6Ye0HoAGSgFu/klzxv1dP2XD33SD8ULyhDnZf2ko92+57y
	u3bsN5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJLf-00FHMl-0o;
	Mon, 03 Apr 2023 12:31:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJLZ-00FHIq-0S;
	Mon, 03 Apr 2023 12:31:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 670616601F5E;
	Mon,  3 Apr 2023 13:31:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680525100;
	bh=+/Opls/14IOqe9+pE7OeA+flxTCMKU/LEO/pt7JmB5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PmpMcp7RPLYRtEkGzTGqIG1IH2vDwMO4XyKF/Vz7rq/Jii7ROjEFDQOmRJGu+3oq/
	 oCcZlmckUNSXq41yHZRxj9ZpwzsHqkt6lg6qs4XH0IPGPzqyYFVWU3kY/GFEQ7cS/J
	 u0lofYK7Emar7fJ7jOIF4GwEFbNvLFgBirfb2zzRE3JuuFR5pJqrTluKgYMXvcG8UT
	 6hPW5o0RXsyKpu3dyq5qOtczz0uHaMRQpYJkeL1HLm8ZSNTTN1xDcaUNAruvJCrGtX
	 2yTYeYpXRJbjMq+EBhV/g4ulplm/Z/yeCTijQybLY3jUw0+GKL9s9yvrg8SQINhJgO
	 sqeVn7bslBNDg==
Message-ID: <3fdc083c-4ed6-1394-d789-47d9a1acc6b4@collabora.com>
Date: Mon, 3 Apr 2023 14:31:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/7] usb: mtu3: use boolean return value
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
 <20230403025230.25035-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230403025230.25035-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_053141_305352_FC823A68 
X-CRM114-Status: UNSURE (   7.41  )
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

Il 03/04/23 04:52, Chunfeng Yun ha scritto:
> Prefer to use boolean value due to gpd_ring_empty() return true or false.
> See "16) Function return values and names" in coding-style.rst
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


