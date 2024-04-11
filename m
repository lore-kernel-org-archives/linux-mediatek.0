Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DE7C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41ZIEzlNhZ8qusE5wYyv1myvnfmgi28f8GyiSJTWeAw=; b=E55ElgIgvYNVu65NGkiHq9e2Vd
	vaBtjVujYp2K3YwfdqCKgmfaC49DwdyidDBVNnxsMTRJjvVq291yFvkMPrqVbdcvlH6sF3Q7TAiQZ
	4A1V02plfb6x89xNJ7oQrqk2K+V8uIBFokJgT8BdUVExscPYsngMonzMUw1W4eUzMVPH542lLPrEd
	oBCIfdcft/mEBdiNDJ9UFlwfgr2P140tDDV5v/IuEryo8kmX7qPAfhZ9OcVZVJP4dgs6VXjlOu7dY
	XVqAvpRhHvaHTZm+OkguDW8VhjyTiOeaTbTn3PmdH2h6U9opqQkQExAYnKA7zbx5gxrp7xF+VqLc/
	dK/l5S2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw53-0000000Cfnp-00ji;
	Thu, 11 Apr 2024 15:11:13 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw4x-0000000Cflb-3m4h;
	Thu, 11 Apr 2024 15:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712848262;
	bh=RsqRhsbh+ql74xg+OGS8w63Yx5baDe14/QMzlPFyRdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ze59wmX4SgV+C5LpyhnKcn2+dlVu/odsRx8HhOk566qpSLEIPzHn6nctxweg5VywM
	 A44+nhTjaM2QLBPWabdKnqPY2smWLSZlYYEulN6AP8Oc6qo04CWgcGWjOiRYmQZmlP
	 VLTnxjR2eWPfLzSsX+wL6ZokZpxq5CEKt9LiMpwswSa/HPkuq6voNxTDJ1NssovkRH
	 ThHw8SbBO/Uvr4b4FpfM5zFFYh4BcbqabpzM5RF5aMl5yq7LIngSeVc48f5BQTEsOS
	 XKX/w6JxEyMZH1yj5dSa1hPvDG06SbCGErjnYM6nHQvqFFsCmtb2de8CxNRtSZU5qs
	 gD/QYSR2vijWA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B756937813C0;
	Thu, 11 Apr 2024 15:11:01 +0000 (UTC)
Message-ID: <0e0da850-e810-4559-8086-99333e775d9b@collabora.com>
Date: Thu, 11 Apr 2024 17:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] dt-bindings: ufs: mediatek,ufs: Document MT8192
 compatible with MT8183
To: Conor Dooley <conor@kernel.org>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
 bvanassche@acm.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, peter.wang@mediatek.com, chu.stanley@gmail.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, lgirdwood@gmail.com,
 broonie@kernel.org, matthias.bgg@gmail.com, stanley.chu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
 <20240411114300.169055-6-angelogioacchino.delregno@collabora.com>
 <20240411-owl-euphemism-955ca43b5190@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240411-owl-euphemism-955ca43b5190@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_081108_360770_3EE78EAA 
X-CRM114-Status: GOOD (  15.37  )
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

Il 11/04/24 17:07, Conor Dooley ha scritto:
> On Thu, Apr 11, 2024 at 01:42:57PM +0200, AngeloGioacchino Del Regno wrote:
>> The MT8192 UFS controller is compatible with the MT8183 one:
>> document this by allowing to assign both compatible strings
>> "mediatek,mt8192-ufshci", "mediatek,mt8183-ufshci" to the UFSHCI node.
>>
>> In preparation for adding MT8195 to the mix, the MT8192 compatible
>> was added as enum instead of const.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/ufs/mediatek,ufs.yaml        | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>> index 32fd535a514a..adcd13023866 100644
>> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>> @@ -14,9 +14,15 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt8183-ufshci
>> -      - mediatek,mt8192-ufshci
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8183-ufshci
>> +              - mediatek,mt8192-ufshci
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8192-ufshci
>> +          - const: mediatek,mt8183-ufshci
> 
> It's a bit more distruptive since you'll have to modify a dts, but why
> permit both of these ways of describing the mt8192? Could we drop it
> from the original enum and no longer allow it in isolation? There
> shouldn't be any compatibility concerns with doing so.

Yes, will remove that in v3 :-)

Thanks!
Angelo

