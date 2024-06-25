Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF607C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 06:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQhW0YrsoS77fHFLhKP51Iz2UDrcYungvJwShyjCUiQ=; b=CS7SY95c7/ZZLExZ96C7G93TK2
	kROb5vqPSedESLvJfXzapllnla9kZW+LIH9bXbcFqEA9hUf5acsVa0Jg+9KeJvbbDpMllbn0sgoBf
	mk6YWhEu/xoAsxM/YdRQ+wlNqVsO/fTKGlIlqp48regjRYd0PSHJy5CicHTZdMyZN2UifztifdTJ7
	OTB9XY3tt25q/MdJUnedBZ7/HtZcFv1mCYpGC8D75nNGU1zgLWhb1ILdszJlZoMVlwgzY2LDIbKlV
	n9hHZNQhHVzv2dAo1180yv890dOaQIAyiruM4JleUyjNQbcoVapIGzFH278ZRgakPVGP++94j3nHK
	oGNQh1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLzI8-00000001koH-107T;
	Tue, 25 Jun 2024 06:04:32 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLzHz-00000001knI-3cVM;
	Tue, 25 Jun 2024 06:04:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D1D420004;
	Tue, 25 Jun 2024 06:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1719295459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQhW0YrsoS77fHFLhKP51Iz2UDrcYungvJwShyjCUiQ=;
	b=D7jplpiD1B0DcMM2VYZqchOGz0Q0UqY0bDaMVhb1DwIIQTATvsKp1HGovIAb0rWGNAwlA5
	vYvy0yW/M30pH24fan4wJzMQbjxeKHMQZV+uowidLojsXsV7gaWd3F0c6ehCMIhfkvJnAW
	ofxrMXnQr3EineuiPcwD2/T7PdrQDXDhQ8ETuiIguzGR6/bQGUXVQvrOXHQuIUe3NvTcyj
	jyW8CbF+9Ux6NwaDZupxNfQ2GXm109g1Vy31TsO3k5ajuZ+/TfztCuiwQawOjGYHgYwryE
	ws1Y/MgWFk/jSrqZ6goskxyNjlOuPVc+fGgldn3+yp6Dc9d5S55Z1jGO24kWSA==
Message-ID: <3f487664-e2dd-4283-8731-4f17d408511b@arinc9.com>
Date: Tue, 25 Jun 2024 09:04:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: net: dsa: mediatek,mt7530: Minor wording
 fixes
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, andrew@lunn.ch,
 f.fainelli@gmail.com, olteanv@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
References: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_230424_079881_2D715E6D 
X-CRM114-Status: GOOD (  11.43  )
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

On 25/06/2024 00.18, Chris Packham wrote:
> Update the mt7530 binding with some minor updates that make the document
> easier to read.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>      I was referring to this dt binding and found a couple of places where
>      the wording could be improved. I'm not exactly a techical writer but
>      hopefully I've made things a bit better.
>      
>      Changes in v2:
>      - Update title, this is not just fixing grammar
>      - Add missing The instead of changing has to have

Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

