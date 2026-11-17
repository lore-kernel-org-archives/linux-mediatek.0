Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD69606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ltX6T2h+;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MQI8/J6Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5EC75UY/5H1eELpwKD/MvkxcdymfjtiEp+RmePnImOw=; b=ltX6T2h+wVXvxN
	enfW1bphVUrmxKNb89NREVkbB5jKJbA7npZn93q9vgtpfMdTcdUoJqyF9LqQMQWKH3Y9LlR2ueOiW
	ySqaSkGxkTxJ09cVNOHHZGI2AAcK5+qog2NxI9ctLecS+MOLitl97lg0FPQyq6mdrPVkWe/996mxG
	TnJoqrYBR87gAC82gLU3n8ciEmCeYizb7LnFPKBVVzFjfjqIK9gvxtdttyxZvxeM28dMn37uLxZyu
	HMg9qPEmbUNpVRuandOQDs38TtjJsxwdY7gidL/5tnCKg0ewv0WklD2WQmG/v8EtlAA/2RXn83Yxi
	VPD+K8iWgIlfjMVp3EnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIgb-00000005koD-24KS;
	Tue, 17 Nov 2026 12:53:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIgV-00000005kiW-1EAv;
	Tue, 17 Nov 2026 12:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794919993;
	bh=b//NguUji4jyiZfZWVRqjJq3eBMUzebVwK8kbx1zR8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MQI8/J6QJ1PfMD3BA98v0q5scoDQZBigWJSvetgvtc2F8nyb2tb3BGrK2fGRvq+gO
	 dg1QXOEnIidiM+rfRbIyl2aTCrPLF/g6Pe+DriRDrL+bDHofYD5p7kgvvPcQ6cybwD
	 aS2hX+rvQhJxyW2IijFfK6S/HlJ3dVqhbMzlxqwSsUi5e9jhGGsfbhn0IqeVHXfpM3
	 zT0wWWi1uRFe0cASUEhQjVGdyuZu/po9hMOWDF9lNdid03kERVE0gwK9ZpP5heVmSp
	 UDGID3LALNasPD0W0MFTTDpx2nL7hTp+8BVtkZ0Kj4ZXCGYRodse0tvMdYg21FT5yh
	 S6LUwNyXUHXfg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F90817E0311;
	Tue, 17 Nov 2026 13:53:12 +0100 (CET)
Message-ID: <200ef6c1-eced-4c36-832d-3fb409aac866@collabora.com>
Date: Tue, 17 Nov 2026 13:53:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8167: Add DRM nodes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260921113914.779393-1-l.scorcia@gmail.com>
 <20260921113914.779393-5-l.scorcia@gmail.com>
 <bbefcf0b-b31e-4f74-bf79-b0ccc983f62b@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <bbefcf0b-b31e-4f74-bf79-b0ccc983f62b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045315_498679_396ECFAC 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 13:35, Krzysztof Kozlowski wrote:
> On 21/09/2026 13:38, Luca Leonardo Scorcia wrote:
>> Add all the DRM nodes required to get DSI and DPI to work on MT8167 SoC.
>>
>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8167.dtsi | 369 +++++++++++++++++++++++
>>   1 file changed, 369 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> index 27cf32d7ae35..a50bae4307c1 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> @@ -16,6 +16,22 @@
>>   / {
>>   	compatible = "mediatek,mt8167";
>>   
>> +	aliases {
>> +		aal0 = &aal;
>> +		ccorr0 = &ccorr;
>> +		color0 = &color;
>> +		dither0 = &dither;
>> +		dpi0 = &dpi0;
>> +		dpi1 = &dpi1;
>> +		dsi0 = &dsi;
>> +		gamma0 = &gamma;
>> +		ovl0 = &ovl0;
>> +		pwm0 = &disp_pwm;
>> +		rdma0 = &rdma0;
>> +		rdma1 = &rdma1;
>> +		wdma0 = &wdma;
> 
> Folks, what is happening here? Why Mediatek is adding bunch of
> undocumented aliases? This should have never been accepted to Mediatek SoC.
> 

It's always been like this on MediaTek from day 1, what's up with that!?

Btw, in this case the aliases are useless.

Cheers,
Angelo


