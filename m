Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE58C369C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q82aXZ96SkZQkHH0ZlbXPXUKG4cthRJar29R9w4dfJE=; b=tKvmqf77ztaGVh
	gdNxUJ268P3+fHMlJhfd9fQxpPWI3XSdoFwmrhYMsbi1O9A2It2yatIlrFJpziPeBpKte5PuJBnNR
	3Zejc4VpSS38to9ey4W2wptoN3/C4wz/iIn0Grc8Y11oOtUlQixLUNzT0sgaZJ94VmCaKQ2FAnkXE
	2b/nHHYZoOWHqVFNl4l9NK0seWzPyYoTgI/GL3piiHrdLkfaSys2Rt7UeLUqNS431thb23Zht9eCe
	BgbZ1djdb8NdBZg/ZD1W4Jemap1sV4R8CBCT+62MaCtqqdDggrL6eqOZQI8b1VWRAsuCprnJ+AGjk
	dS4F0k/OAX7ydqacHy9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5K6b-0000000CBrm-0HBf;
	Thu, 17 Apr 2025 07:56:17 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5K3N-0000000CB7O-1NNA;
	Thu, 17 Apr 2025 07:52:58 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id A4E8A1008FA;
	Thu, 17 Apr 2025 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744876372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q82aXZ96SkZQkHH0ZlbXPXUKG4cthRJar29R9w4dfJE=;
	b=xN4EnJrdVeEEGXY1Uw/cWRtXIx7OgNpTRak8FB9wUaT8xQr96zt6iiIs4H9BNit/k7AFpA
	b/qa0UTAJVIKjhaGbOTXYxIEWwUqXAj2F399mutRq8k0GBh+apnsVIRCShTmXp9AtFQk/0
	oZ53q8OoA7fc3ycuuJLtOCKM6Kzq6aE=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id C3E213605AA;
	Thu, 17 Apr 2025 07:52:51 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 17 Apr 2025 09:52:51 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/8] dt-bindings: phy: mtk-xs-phy: support type switch
 by pericfg
In-Reply-To: <20250417-competent-rattlesnake-of-intensity-98d6ff@kuoka>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-5-linux@fw-web.de>
 <20250417-competent-rattlesnake-of-intensity-98d6ff@kuoka>
Message-ID: <d2da81ccb6b9b267288a3d2f5b1bb977@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: ffcf56f2-7a7a-4451-b290-b3cd6b547b72
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_005257_533592_B6E3BA8C 
X-CRM114-Status: GOOD (  17.12  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82eck?= =?UTF-8?Q?i?= <rafal@milecki.pl>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

thanks for review.

basicly i used the same binding like for tphy.

Am 2025-04-17 08:56, schrieb Krzysztof Kozlowski:
> On Wed, Apr 16, 2025 at 11:53:56AM GMT, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Add support for type switch by pericfg register between USB3/PCIe.
>> 
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> ---
>>  .../devicetree/bindings/phy/mediatek,xsphy.yaml  | 16 
>> ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml 
>> b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>> index 3b5253659e6f..5033d77c1239 100644
>> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>> @@ -151,6 +151,22 @@ patternProperties:
>>          minimum: 1
>>          maximum: 31
>> 
>> +      mediatek,syscon-type:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>> +        maxItems: 1
>> +        description:
>> +          A phandle to syscon used to access the register of type 
>> switch,
>> +          the field should always be 3 cells long.
>> +        items:
>> +          items:
> 
> Missing -, because you have one phandle.

ok, then i need to drop MaxItems and indent 2 spaces more, but no 
problem

>> +            - description:
>> +                The first cell represents a phandle to syscon
> 
> Don't repeat constraints in free form text. "Foo bar system controller"
> or "Phandle to foo bar system controller"

i would write only "phandle to system controller". on mt7988 it is the 
topmisc syscon, but maybe on
other SoC it is different name.

>> +            - description:
>> +                The second cell represents the register offset
> 
> "Baz register offset"

same here, only "register offset".

>> +            - description:
>> +                The third cell represents the index of config segment
> 
> "Index of config segment", but what is index of config?

unfortunately we have no detailed documentation here, but based on 
driver (i guess daniel ported it
from SDK) this value is multiplied with BITS_PER_BYTE so it can handle 
up to 4 config-segments in
the 32bit register (maybe configuring 4 phys). But on mt7988 we use only 
the first config-segment
(last cell=0 in dts-patch).

at the end it will look like this:

       mediatek,syscon-type:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
           A phandle to syscon used to access the register of type 
switch,
           the field should always be 3 cells long.
         items:
           - items:
               - description:
                   Phandle to system controller
               - description:
                   Register offset
               - description:
                   Index of config segment
                 enum: [0, 1, 2, 3]

would this be ok?

> Best regards,
> Krzysztof

regards Frank

