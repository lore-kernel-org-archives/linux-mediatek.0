Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8562CE79AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ai0B7pvnahQeTuzDoAQyEITHzk3QjxVqwWfL4yexaTM=; b=cs4JKMyZ6UpAAeJz5G/44IJkEv
	jPY0MiR8MzzLVUIdrE9LF6pIkW7Km9gshvceDsgjBRnBy+nnHQqzQvMtwUSudk8clXxiioTWEmP0b
	7VTw4D4FeS3XspWj6wBjeILXtDtYTTAQSvxD0TZ7b4mWjwBNPmlQFiWcbGhYtz/MqkeNK8dLV3UiD
	JWxJEYHDdt0UkvjELmMVy2XM8DFmDxzRkJDw89gC8VPDEeZT6R9h2Hu9OxhSsx73fAkN/HS/cx0rk
	gZ2HPgblNps1qBh4HLfvdps4tPfYcvQvyIOPi5dAAfvklW6I8p/lB1XBOV1psP5WS8AfOE7Hq828t
	8EM57VfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qis8u-002DHY-2G;
	Wed, 20 Sep 2023 08:01:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qis8q-002DGO-1R;
	Wed, 20 Sep 2023 08:01:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D36766028F5;
	Wed, 20 Sep 2023 09:00:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695196858;
	bh=PsIofxIPZNjYZmIKPLLXiYlycMUtqIzWITre7uRwShk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UfP3WtYgSXYxgzyyDcqokruv6kxMz2WhLkLxTKLYFi/4J3N2j1k+PRH+DhiX4ysiX
	 QXjww+1y1DOE5Y3C/xYAfeudfxwC+f7tjyJfeGMWNyC9w2XfF56Wyc6DsQONoEAXKQ
	 xAEZbxt3+n9j2hBa9n/dPD4XTaBwmwfcYP5d+jG+JEKIsjnWAu5w3ttGyGT7/Twp6+
	 RX90spJ54bO667w96pVKjBrJa+nS4fhbXug66JmleygAzjXiuLdrtYhThBH1rVBDBD
	 rbfNJ0ij6VwhFJn3omnzkf7RjRnBM21PzMtuyrq66kmcyHUs/VW2kjZN4TEIOVl0YZ
	 MKZO/XdpPikjw==
Message-ID: <a068c2d1-6ddf-2090-b6e7-f6135a5e1af1@collabora.com>
Date: Wed, 20 Sep 2023 10:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 05/12] regulator: dt-bindings: mt6358: Add MT6366 PMIC
To: Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230919104357.3971512-1-wenst@chromium.org>
 <20230919104357.3971512-6-wenst@chromium.org>
 <20230919195752.GA85007-robh@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919195752.GA85007-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_010100_705325_BC34AF35 
X-CRM114-Status: GOOD (  18.78  )
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

Il 19/09/23 21:57, Rob Herring ha scritto:
> On Tue, Sep 19, 2023 at 06:43:48PM +0800, Chen-Yu Tsai wrote:
>> From: Zhiyong Tao <zhiyong.tao@mediatek.com>
>>
>> The MediaTek MT6366 PMIC is similar to the MT6358 PMIC. It is designed
>> to be paired with the MediaTek MT8186 SoC. It has 9 buck regulators and
>> 29 LDO regulators, not counting ones that feed internally and basically
>> have no controls. The regulators are named after their intended usage
>> for the SoC and system design, thus not named generically as ldoX or
>> dcdcX, but as vcn33 or vgpu.
>>
>> The differences compared to the MT6358 are minimal:
>> - Regulators removed: VCAMA1, VCAMA2, VCAMD, VCAMIO, VLDO28
>> - Regulators added: VM18, VMDDR, VSRAM_CORE
>>
>> Add a binding document describing all the regulators and their supplies.
>>
>> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
>> [wens@chromium.org: major rework and added commit message]
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>> ---
>> Changes since v2:
>> - Merged all the propertyPatterns together; the if-then sections now
>>    only block out invalid properties
>>
>> Changes since v1:
>> - Replaced underscores in supply names to hyphens
>> - Merged with MT6358 regulator binding
>> - Added MT6358 fallback compatible to MT6366 regulator
>>
>> Changes since Zhiyong's last version (v4) [1]:
>> - simplified regulator names
>> - added descriptions to regulators
>> - removed bogus regulators (*_sshub)
>> - merged vcn33-wifi and vcn33-bt as vcn33
>> - added missing regulators (vm18, vmddr, vsram-core)
>> - cut down examples to a handful of cases and made them complete
>> - expanded commit message a lot
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/20220823123745.14061-1-zhiyong.tao@mediatek.com/
>>
>>   .../regulator/mediatek,mt6358-regulator.yaml  | 120 +++++++++++++++---
>>   1 file changed, 104 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
>> index c5f336318ec2..05e381899d08 100644
>> --- a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
>> @@ -16,14 +16,18 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: mediatek,mt6358-regulator
>> +    oneOf:
>> +      - const: mediatek,mt6358-regulator
>> +      - items:
>> +          - const: mediatek,mt6366-regulator
>> +          - const: mediatek,mt6358-regulator
> 
> Would the mt6366 regulator driver(s) function with the mt6358 driver
> unchanged? If not, then not really much point in having the fallback.
> 

It would, because there's chip id verification inside and would still
automatically select the right regulator info, even if there's no mt6366
specific compatible.

Cheers,
Angelo


