Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D654C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPpe3uLSfsQlcTc/HStwdXwQSNVpaeuqe1/Wvq9vVcM=; b=0ZGkHDbHndSt7CvbJUtHiJ5RNh
	bclxdlmiRZfDG1X+C9SHGe68aDc32UHkpfwFMX8A+5JgWhOXdQJeQIBwDBnblKjh1To+pLSu5u8GD
	+VGQ42It6msNO5ieQk28GpSveDTuXMNgVIpx0HiP966Wcwdm1R71tFB7bpQSyhctDzDtGyMsl3tnu
	DCBX7LGm9SL5Oi5CTk9sKMP/U1+veQINA6cP3/96CZ+1QEyP9dkbinW7Yt/QYJX45p6EYsV3gZ8Ie
	QVzv3A5K4xA5UP7lxUP6dDXWiyRwJVAnGB0o2gRzJMxY40P4RIDdvRcjC5xP6Kcoakh+xpvSkBdfO
	Iyy0Y8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofcl-0000000G8XN-1y5l;
	Mon, 25 Mar 2024 08:24:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofcg-0000000G8Uv-3W07;
	Mon, 25 Mar 2024 08:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711355040;
	bh=FxeJBW8SRhWP/KtNW8MieDakXdayiD+/WVoSml7b8l0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k0TiPAfGSgiIx1WnbJvOpKq7uVHspIBm69VBmNfa1dmMUr+dkN4zSASKiw5MtDD7z
	 WXmrj/V2LsPSU73F6+W9xs9Q5U9H3/KJLunK8SHalbg9SX/gocuDwGqhAerUohj2Fk
	 nZaucggQ1R0vO+Dn0USpHSFWw6B/taFk9/NJea9uUHYioH/aGW1/uIgj4Cs6JU3VYC
	 w2Ie/hTHkOcstcEWRy0L9DIK5b5wIGXxMyYBvQhcHfPoYlm4Lp21jz9uBZPD3frbkj
	 1zuyVO38akjU8l1lxCzTiwV/NDzvrWN/YBH1PBOKlzHedu3br1JN4YHg7i/GvHwbHo
	 G6xjvlMmSis2A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3F0E137813B7;
	Mon, 25 Mar 2024 08:23:59 +0000 (UTC)
Message-ID: <f90b2c8b-6eb3-46dc-abcc-600248218b4e@collabora.com>
Date: Mon, 25 Mar 2024 09:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: soc: mediatek: Add support for MT8188
 VPPSYS
To: Conor Dooley <conor@kernel.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, amergnat@baylibre.com, moudy.ho@mediatek.com,
 hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com,
 u.kleine-koenig@pengutronix.de, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
 <20240322092845.381313-2-angelogioacchino.delregno@collabora.com>
 <20240322-lugged-tabloid-3d5a85dc58d0@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240322-lugged-tabloid-3d5a85dc58d0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_012403_062603_B7D284F7 
X-CRM114-Status: GOOD (  13.75  )
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

Il 22/03/24 18:42, Conor Dooley ha scritto:
> On Fri, Mar 22, 2024 at 10:28:42AM +0100, AngeloGioacchino Del Regno wrote:
>> Add compatible for MT8188 VPP mutex.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> You should at least mention the difference between this any anything
> else.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

It's exactly always the same difference for MuteX blocks: different bits to
activate mute for some IP ... but yeah, you're right, I'll shoot a word about
this in the commit description on v2 (waiting a bit before doing that anyway).

Thank you!

Cheers,
Angelo

> 
> Thanks,
> Conor.
> 
>> ---
>>   .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> index ba2014a8725c..a10326a9683d 100644
>> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> @@ -33,6 +33,7 @@ properties:
>>         - mediatek,mt8186-disp-mutex
>>         - mediatek,mt8186-mdp3-mutex
>>         - mediatek,mt8188-disp-mutex
>> +      - mediatek,mt8188-vpp-mutex
>>         - mediatek,mt8192-disp-mutex
>>         - mediatek,mt8195-disp-mutex
>>         - mediatek,mt8195-vpp-mutex
>> -- 
>> 2.44.0
>>



