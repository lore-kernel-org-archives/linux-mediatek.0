Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CFDC54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEi4vkq4/ZbcRnurVhVV+qrtb49Z3GiZi5T9t3PQDgU=; b=LUgrBJgoZYLDqMCbyfJHwPCDKA
	GG8Y011IsKKRjJPmBBBsjF3dCF4BqmYHhLaM90FwYY2matqJ0K61eOmnwE6y0kw1Yw0Wimk4F/haJ
	aCU3uZ58eiiPwi75u0xOYmDeUB3FA704ER/2yZJ+vBvdsQMpesmt5YQx7QH0BG3FlKP0/GmttYolO
	JDJB7NQQ0xZU4OZ73JTjZGwrDW9FJqafBwRzd5B8ZY6lmPE+JhaIlVH7INt4mT7xF+sXvhnies1kk
	6PIrC6x8GVsWyU6aKeXfmcxX5t/vRewRChNJghHJLXyVuxylFTToOkkpXl5H3Clih7Wk9fcmtY3ks
	KYmPzlpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricwo-0000000A7pK-3XK7;
	Fri, 08 Mar 2024 16:19:50 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricwk-0000000A7mO-0yXs;
	Fri, 08 Mar 2024 16:19:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E5C6E0005;
	Fri,  8 Mar 2024 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709914782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AEi4vkq4/ZbcRnurVhVV+qrtb49Z3GiZi5T9t3PQDgU=;
	b=SeJ+Jjd04YicsVMPPsq3yMAae+MZmdCgBaC88fTaJGH4yCwwvKSIwONCbdy4RZx9RS4X8j
	i1iGTnnDqvB6JR7x9I0kAN0XgK8ELIF1xGLOvPKujDDqSTP0AH/2q1cYUuO3WqeTNROLII
	ieZ+k9ses3PiMEMcuOWTvXwwwoB74B6fDkFR5d+Pe2Ln8ULLmP796ZQFXsBvsSaViBLOg/
	J/J830YF0onRfWo2y9OXd2LjqoAYxruDKQZ79nsiK5Ws2htDp/TQWVlXdYzKHAQZn9CFu4
	tkY/UUReoLZhOyfoILsZHbZ0PfwaXAZhO8OBkcthZKDtN5nJ6VBkYM+4rDKIOA==
Message-ID: <88c2035f-bddf-4dad-8aa4-1d8f02631af0@arinc9.com>
Date: Fri, 8 Mar 2024 19:19:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] mips: dts: ralink: mt7621: add serial1 and serial2
 nodes
Content-Language: en-GB
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240308155616.11742-1-justin.swartz@risingedge.co.za>
 <20240308155616.11742-4-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240308155616.11742-4-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_081946_434431_93507AAA 
X-CRM114-Status: UNSURE (   5.22  )
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

On 08/03/2024 18:56, Justin Swartz wrote:
> Add serial1 and serial2 nodes to define the existence of
> the MT7621's second and third UARTs.
> 
> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

