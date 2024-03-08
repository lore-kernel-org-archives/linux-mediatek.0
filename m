Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE93CC54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9boYP/5tEQVN2T62hC7F0bllwTHzNcG33ukkaklSbI=; b=olFrMD7/ZAtjpQdKKn/PIb+m08
	lq4FDYVZg6dB6TMUH+hVznSE5djQzyIOCkyBmEJNkhft2HA3WzH0KiaR7r+RhipFCEy6iN/aOhbGh
	q2V8FJYj6ye7eq0N7b05Q8fTH+85/jNoHPLkI6k9Jqbf1XdrTc8BVWaEluBRTiDhL5mcnYjSHHVko
	+InOl5d5oVqGENL65ahHtAgSFjk9BEY9nQR2AwqglxeARWTBXxzPIcZeUaNO8+5tZyVbLai7F3Gdu
	DV3LeH84c7TVvMi2byRfx167gpWYfAbljnKohqOgXC0Z+TE6eaVRbgMV9Pkh10gzwW2T8c94lIpeW
	Hhd/ATBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricrt-0000000A6U4-2e3A;
	Fri, 08 Mar 2024 16:14:45 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricrq-0000000A6Rh-13fo;
	Fri, 08 Mar 2024 16:14:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 332B140003;
	Fri,  8 Mar 2024 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709914477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s9boYP/5tEQVN2T62hC7F0bllwTHzNcG33ukkaklSbI=;
	b=OHsI/YvN5hiSrUh+JkszMXQy+YjSD0Rojo3kF6fyCKx5Zzphn0M9IN7Tt9X5vm4y041UNn
	lAB2eLe0+JNyD+OfR94tOMaGUIh/a22OFfJ5l8091aLMxl3lU2UxrcMOJr1DfcEA8sN3Y6
	4wVXO7Mivc3b4lJsp2qC+eyMU5DVkAxP4LdaDmNkIuQeQmNPIYVv8GXFH+mU66uvZ3BSw8
	DNVYEh8CTvF+6HbUD7iAvF49EtMz73wfDbRHSHyMwAm3YZcqrKTbEYicnz+sedHM9lS+TO
	M/Gav5wOWDM7EWyiyPQA7bIiHdmSSih/4HZy3OQGKONnr8edA9o11YkWr+NB5w==
Message-ID: <70822db4-d642-4180-9db8-eb0aa5728ef1@arinc9.com>
Date: Fri, 8 Mar 2024 19:14:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mips: dts: ralink: mt7621: associate uart1_pins
 with serial0
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
 <20240308155616.11742-2-justin.swartz@risingedge.co.za>
Content-Language: en-GB
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240308155616.11742-2-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_081442_452639_87FEB72E 
X-CRM114-Status: UNSURE (   6.07  )
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
> Add missing pinctrl-name and pinctrl-0 properties to declare
> that the uart1_pins group is associated with serial0.
> 
> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Please add the trailers from previous patch versions from now on.

Arınç

