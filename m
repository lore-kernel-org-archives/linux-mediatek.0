Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2F5C54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 16:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0S6dSKiB8zFSBf1O2VOcQH4KdQm9Wkws/HG1/AEyaY8=; b=s+S7629UUHnRHC0qq4jGFMcozR
	T42WkcK1kmbp1RcXV8z5LY5tH4yH3LNVGEPuEV7qOdduodSRDV2lxDUcdPFoe6ppqEvqMBu5zhzNN
	u7TmAzkvNp09uDqjjhi6uPz1Gco5tc8eyhdqCZM+UOwCUrzuC8kJRtOmsKj/N4NvyQAw+IWQmVFbp
	NwPloOqo08hVX2AoTTdl8GaDTkzZReZPBdyPdQkUjOPLfjxmNOLlBPqc0LsaSFEmSbXDj+3U/+Lep
	f9YcT3Xi2NiLbhAmVleGe4Zu3GwkR7T6+4ipaw5enqfBDfOce1Pj1euxKyqIQn5vgTLUuZZocOd8M
	suiaEdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricvL-0000000A7SK-1yhW;
	Fri, 08 Mar 2024 16:18:19 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricvH-0000000A7QZ-3hrL;
	Fri, 08 Mar 2024 16:18:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43189FF807;
	Fri,  8 Mar 2024 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709914691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0S6dSKiB8zFSBf1O2VOcQH4KdQm9Wkws/HG1/AEyaY8=;
	b=dl/SRWriu4aZz/xXON+51qcKE3Wa9xX44fyBVTqwjx62WLp2cPcwmcB4rol6BG9SDlZCgu
	qb5/tY0+A100U8vav/gMSdEYGamy5nYAZq66AiSAj9iZfH/uMBvjTTF75H/YVGOfupO2rF
	iT6ITCb4MA6mGilxDFIiM74BCTaz4aUE5rKWQ5/5LAV0yfIvQuLlt3orv6ptTlKtnffZOm
	nayMa5MdBxBTLMpEIzB9MwlFgE8eCPaCrBMuC/2mJBaR+yk346cuP5S/u5pMvi/6534opV
	PcR92F3GD/hg5OA3MLlRduW9Oi11a8kLJStD5Fcu2fIQevrAg7uy4aA+Rv7pZQ==
Message-ID: <1a76dc7d-d0d2-4f11-8408-f60d7fd8b6d6@arinc9.com>
Date: Fri, 8 Mar 2024 19:18:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] mips: dts: ralink: mt7621: reorder serial0
 properties
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
 <20240308155616.11742-3-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240308155616.11742-3-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_081816_173451_FE0B5B9F 
X-CRM114-Status: UNSURE (   5.18  )
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
> Reorder serial0 properties according to the guidelines laid
> out in Documentation/devicetree/bindings/dts-coding-style.rst
> 
> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

