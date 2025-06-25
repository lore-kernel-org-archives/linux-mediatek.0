Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F72C7EE33
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NMUpzlAjkVNCDzB2vsmlQzcJw6ZBeudXGSQ7kcKWaE=; b=vaRy7J5g+KMRg5bXDr5nikFlRc
	kZ94RJsADv9NcnwU/7V6sWfYZBMHjKRTEmjrNd3MvpS7YmMbu9ojhz5hTK2mEunALzZU35OZPTF/z
	q5Y1hwHrEqC3TnsLhJDoT0SXBtLqEGBb9SSEiBkoW19B9TOAgw/RCCT5pP2T2yCsESzgrxHwGWa2n
	d5+nyU5Q1DPoNZksuEJ5f1TqclRh/slhgvis9KhQUV1iK7jfLobe8ULk7+UpQ7TSKMUd+yngakyIU
	hxqh6i3OpQTmikn7rJSznWhea7br4VPZAMgIEvD5sw1Oog14w3vbx/zOiAzJry9kUJAOI7qWLI3n0
	PGDdf7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUN3k-00000008G5v-0VL3;
	Wed, 25 Jun 2025 10:08:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULN5-00000007wHw-0yxE;
	Wed, 25 Jun 2025 08:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750839641;
	bh=X7oTNFrJswgIHuNpvVbuXC5hVcIhk6YzrRYWyDXt1A8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mGBN/kkYxKPsfPV+wFXdq2SphIgBlVWTcC6D7AJkr1jrcYwLwCmKVKxiT01KjqaGK
	 6pEpbEje9rU2Y0ybrbmIkuZVuyvMIZUlNgvTjgvXN7LgdH22O7GO6pLLJU4lLe+U+x
	 A7jL5tVuJZ1dAZ5JPxsoGf3P6yolap74oUjuPYbSd4WWF60bcr/uy1yTW4cm1pvtw5
	 8Ixf4l0SWw1US/srSN3EoE4Tjevca1Mgfhs4N77XXLavkctZ8/OV//1IUDt9Sb5XQC
	 jHHkoux7D1n49f93d2U6Ngd0z3/m87sXwbx4g9p8JqrGmNHDuJp/iFzO6DctlvQ84b
	 THjvTrOCv/nkg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CC9F17E0DD0;
	Wed, 25 Jun 2025 10:20:40 +0200 (CEST)
Message-ID: <284a4ee5-806b-45f9-8d57-d02ec291e389@collabora.com>
Date: Wed, 25 Jun 2025 10:20:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/29] dt-bindings: clock: mediatek: Describe MT8196
 peripheral clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>, Laura Nao
 <laura.nao@collabora.com>, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250624143220.244549-1-laura.nao@collabora.com>
 <20250624143220.244549-10-laura.nao@collabora.com>
 <7dfba01a-6ede-44c2-87e3-3ecb439b48e3@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <7dfba01a-6ede-44c2-87e3-3ecb439b48e3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_012043_431253_9D10BFD2 
X-CRM114-Status: GOOD (  15.48  )
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

Il 24/06/25 18:02, Krzysztof Kozlowski ha scritto:
> On 24/06/2025 16:32, Laura Nao wrote:
>> +  '#reset-cells':
>> +    const: 1
>> +    description:
>> +      Reset lines for PEXTP0/1 and UFS blocks.
>> +
>> +  mediatek,hardware-voter:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      On the MT8196 SoC, a Hardware Voter (HWV) backed by a fixed-function
>> +      MCU manages clock and power domain control across the AP and other
>> +      remote processors. By aggregating their votes, it ensures clocks are
>> +      safely enabled/disabled and power domains are active before register
>> +      access.
> 
> Resource voting is not via any phandle, but either interconnects or
> required opps for power domain.

Sorry, I'm not sure who is actually misunderstanding what, here... let me try to
explain the situation:

This is effectively used as a syscon - as in, the clock controllers need to perform
MMIO R/W on both the clock controller itself *and* has to place a vote to the clock
controller specific HWV register.

This is done for MUX-GATE and GATE clocks, other than for power domains.

Note that the HWV system is inside of the power domains controller, and it's split
on a per hardware macro-block basis (as per usual MediaTek hardware layout...).

The HWV, therefore, does *not* vote for clock *rates* (so, modeling OPPs would be
a software quirk, I think?), does *not* manage bandwidth (and interconnect is for
voting BW only?), and is just a "switch to flip".

Is this happening because the description has to be improved and creating some
misunderstanding, or is it because we are underestimating and/or ignoring something
here?

Cheers,
Angelo

> 
> I already commented on this, so don't send v3 with the same.
> 
> Best regards,
> Krzysztof




