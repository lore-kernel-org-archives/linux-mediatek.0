Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE6EC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uufnbGqVVrraozfJsmQ9d5qL2QTVxDiD2JS+QQFQuQU=; b=t6oWEL50/Loeh3gXhFgDo5+lfq
	uN1AVs9YbmSHLXxGoNvNzsP0IFGDlo3L/HzIuRshhPWZ84ciWbGbhJbeodeaet15cTa1Q5/J8EvBk
	FljWvsgTP4PQw6cYiYr3TiEEVtKgI0sS5DvZxKOQGSbW0JbvehdqJgmdrIWuIJBfT/v6N0L5fQH4C
	kfWaL4fg7uTjT1pl9kB1N9REH+48M1IDxpVhdYD/3Hv/tNSwwhTJkL6M7+FzrNp5wDk5KjwS87i4f
	XIIrnOUYAG1pI5X7z0cqM3JbQ8OTgJimVNUuEAOjLSZf6K7iI/4zFlHaa4cOdFVdi8kFno9T7ghVK
	BcNWOQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Jxe-0000000CMg3-1Vdz;
	Fri, 26 Apr 2024 11:41:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0JxZ-0000000CMei-07No;
	Fri, 26 Apr 2024 11:41:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 335FE6205D;
	Fri, 26 Apr 2024 11:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F92C113CE;
	Fri, 26 Apr 2024 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714131700;
	bh=YyiC/xKTo3XyOrHX7I63STVttfSHY4iRfLYrAalRZWo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mrhsGwcR3HpgFGasxnnDrYsBR4l9VQfKS1R0+TB8cP0Ze1By5okzAVjpWiNYBi+3+
	 i1YvuFAqPWB+vqqZ8yPp5B0mqPJZgnw4LQIEYUVb8Vi1FcPsSv4shjw1lVzpkOiGHp
	 k3Ss/qOQuMiJ/mHJEtfYwjUw3ZBOKfx7T5jikbR5tq7P3bll9s5nd72lYcaXsVs6Dd
	 WKF39POd4250TrrHvM5gpKdYweoe1DBuqTsu3AtHSKmHKBo8TyJy6yjYVP7hE2Tmit
	 V8NxEAV4VuJTQH57dJag/kMKfwM3JHs3VTzDw5WOGiNQ8/zyRaT5+36BnJKD5LZ4kx
	 arOdZ+O9DoU4g==
Date: Fri, 26 Apr 2024 06:41:39 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: "zoie.lin" <zoie.lin@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20240426102949.23057-3-zoie.lin@mediatek.com>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
 <20240426102949.23057-3-zoie.lin@mediatek.com>
Message-Id: <171413169824.1152237.3973093428639305133.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: eeprom: at24: Add support for at24c64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_044146_405921_1CFB8969 
X-CRM114-Status: UNSURE (   8.47  )
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


On Fri, 26 Apr 2024 18:29:48 +0800, zoie.lin wrote:
> From: Zoie Lin <zoie.lin@mediatek.com>
> 
> Update EEPROM bindings to include Atmel AT24C64
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/idt,89hpesx.example.dtb: idt@74: eeprom@50:compatible: More than one condition true in oneOf schema:
	{'oneOf': [{'allOf': [{'items': [{'pattern': '^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$'},
	                                 {'pattern': '^atmel,(24(c|cs|mac)[0-9]+|spd)$'}],
	                       'maxItems': 2,
	                       'minItems': 1,
	                       'type': 'array'},
	                      {'oneOf': [{'items': {'pattern': 'c00$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac402$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac602$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'spd$'},
	                                  'type': 'array'}]}]},
	           {'items': [{'const': 'belling,bl24c16a'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['rohm,br24g01', 'rohm,br24t01']},
	                      {'const': 'atmel,24c01'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['nxp,se97b', 'renesas,r1ex24002']},
	                      {'const': 'atmel,24c02'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['onnn,cat24c04',
	                                'onnn,cat24c05',
	                                'rohm,br24g04']},
	                      {'const': 'atmel,24c04'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'renesas,r1ex24016'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'giantec,gt24c32a'},
	                      {'const': 'atmel,24c32'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'atmel,24c64'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {'items': [{'enum': ['renesas,r1ex24128',
	                                'samsung,s524ad0xd1']},
	                      {'const': 'atmel,24c128'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'}]}
	from schema $id: http://devicetree.org/schemas/misc/idt,89hpesx.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/idt,89hpesx.example.dtb: idt@74: eeprom@50: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/misc/idt,89hpesx.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/idt,89hpesx.example.dtb: eeprom@50: compatible: More than one condition true in oneOf schema:
	{'oneOf': [{'allOf': [{'items': [{'pattern': '^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$'},
	                                 {'pattern': '^atmel,(24(c|cs|mac)[0-9]+|spd)$'}],
	                       'maxItems': 2,
	                       'minItems': 1,
	                       'type': 'array'},
	                      {'oneOf': [{'items': {'pattern': 'c00$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac402$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac602$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'spd$'},
	                                  'type': 'array'}]}]},
	           {'items': [{'const': 'belling,bl24c16a'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['rohm,br24g01', 'rohm,br24t01']},
	                      {'const': 'atmel,24c01'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['nxp,se97b', 'renesas,r1ex24002']},
	                      {'const': 'atmel,24c02'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['onnn,cat24c04',
	                                'onnn,cat24c05',
	                                'rohm,br24g04']},
	                      {'const': 'atmel,24c04'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'renesas,r1ex24016'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'giantec,gt24c32a'},
	                      {'const': 'atmel,24c32'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'atmel,24c64'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {'items': [{'enum': ['renesas,r1ex24128',
	                                'samsung,s524ad0xd1']},
	                      {'const': 'atmel,24c128'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'}]}
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/idt,89hpesx.example.dtb: eeprom@50: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/layouts/onie,tlv-layout.example.dtb: eeprom@56: compatible: More than one condition true in oneOf schema:
	{'oneOf': [{'allOf': [{'items': [{'pattern': '^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$'},
	                                 {'pattern': '^atmel,(24(c|cs|mac)[0-9]+|spd)$'}],
	                       'maxItems': 2,
	                       'minItems': 1,
	                       'type': 'array'},
	                      {'oneOf': [{'items': {'pattern': 'c00$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac402$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac602$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'spd$'},
	                                  'type': 'array'}]}]},
	           {'items': [{'const': 'belling,bl24c16a'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['rohm,br24g01', 'rohm,br24t01']},
	                      {'const': 'atmel,24c01'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['nxp,se97b', 'renesas,r1ex24002']},
	                      {'const': 'atmel,24c02'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['onnn,cat24c04',
	                                'onnn,cat24c05',
	                                'rohm,br24g04']},
	                      {'const': 'atmel,24c04'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'renesas,r1ex24016'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'giantec,gt24c32a'},
	                      {'const': 'atmel,24c32'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'atmel,24c64'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {'items': [{'enum': ['renesas,r1ex24128',
	                                'samsung,s524ad0xd1']},
	                      {'const': 'atmel,24c128'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'}]}
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/layouts/onie,tlv-layout.example.dtb: eeprom@56: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240426102949.23057-3-zoie.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


