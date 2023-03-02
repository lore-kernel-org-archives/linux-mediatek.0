Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C68C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYCaVol20kQHkFETFD4mArtAB0cnEJYONKYAdxXu5lA=; b=SViUP4c551KAz6Ih/2YAnv7piu
	qr+lS+oNE7EetTRfu9GNGIDURqQNuGYtp+mq3lfGuLu6a3484ZXjyRMiTQsXhnymnMHpq9JF9owTy
	gvFjVOvp47fYbBf89wrjRbiJmAk4FjJAFaAHt/06aFILcRTzJHnzu8YsNFQhP/FOS0K7tUhy5FKq1
	AU3zvzAlgLEt4wUn2MQ78QehOUrmiLNZNz/MuvX/UAFWdJcBmN0tGc4M9YybT8DB4mhKmk+igBEay
	86wef8heDUbqMultZ3zSuxbJrC3Pe2C47uH6rPHg4fYXzwFLvjMBGfEknteqKak8IXOhzbr54978t
	l4DVNlLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXftp-001cvo-EN; Thu, 02 Mar 2023 10:10:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXftf-001ct9-3V; Thu, 02 Mar 2023 10:10:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C32146602E5A;
	Thu,  2 Mar 2023 10:10:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677751842;
	bh=t5eq3uAkekcEAZLBKAQk76E2Y4WVk9vwCEg+Zuvuy/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TwfYYIGRNFbj7TPJk8Ku+1d9YuhYyvePwH1DX2afzhjlg6jJEMN4myG0NdEkWLmEU
	 drlSjra9QWW7BP3MZzga8G8+gHSk/kLTaD3GswwLAMa9+5U3Nnio2o4SsmOQtoHslN
	 DdloZtIB7ZpZhKuGvH6Gb/vvpYFam4m9kHsGmAtFK0hIwXJHv5IH3/KqvkNPr+xIUN
	 Jejx3aPfQIjKWrNeGlLGcq2oebGHRBY4JwO4KK45rTVYq94XrajBjB7oKbNCDmd2U2
	 KoIv8ZZyQcgJnVqnXPfuN5gS7vdwQzfeCxGUd4J27Tfn+HHPnOJa4EO//V3JUMB5MH
	 GmVGJGSdYlfbQ==
Message-ID: <895abaa2-5fd3-9928-4e53-86ce160fbad8@collabora.com>
Date: Thu, 2 Mar 2023 11:10:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 00/19] Enable GPU with DVFS support on MediaTek SoCs
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <b4fc6bd8-e300-0f40-4216-8b99589c21cc@gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b4fc6bd8-e300-0f40-4216-8b99589c21cc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_021047_530891_0D7C18CE 
X-CRM114-Status: GOOD (  20.82  )
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

Il 02/03/23 10:36, Matthias Brugger ha scritto:
> Series looks good but from my understanding has a dependency on:
> [PATCH v4 00/12] Panfrost: Improve and add MediaTek SoCs support 
> (https://lore.kernel.org/linux-mediatek/20230228102610.707605-1-angelogioacchino.delregno@collabora.com/)
> 
> Did I get that right?
> 

Yes you got it right - without the mentioned series, this one will do nothing
at all (and will also fail binding checks, as the bindings are introduced in
that other series).

Cheers,
Angelo

> Regards,
> Matthias
> 
> On 01/03/2023 10:55, AngeloGioacchino Del Regno wrote:
>> Changes in v4:
>>   - Added a fix for MT8192 Vgpu voltage constraints
>>   - Changed constraints for MT8192 VSRAM-GPU to reflect the maximum
>>     achievable voltage as per the actual vsram-vgpu relation constraint
>>
>> Changes in v3:
>>   - Changed MT8186 compatibles for new bindings
>>   - Added min/max voltage overrides for vgpu/vsram_gpu on
>>     mt8183-pumpkin and evb as suggested by Chen-Yu
>>   - Cosmetic fixes for "arm64: dts: mediatek: mt8192: Add GPU nodes"
>>
>> Changes in v2:
>>   - Changed MT8186 to use only two power domains for the GPU.
>>
>> We finally have working GPU DVFS on MediaTek SoCs.
>> On Panfrost.
>> For real.
>> ...and the best part is that it's going upstream.
>>
>> In order to get GPU DVFS working, it was necessary to satisfy a
>> specific constraint (which is different, depending on the SoC)
>> between two regulators: GPU VCORE and GPU SRAM.
>> This was done through adding the mtk-regulator-coupler driver,
>> which transparently manages the voltage relation between these
>> two vregs, hence completely eliminating the need to manage these
>> regulators in the Panfrost driver; this solves the long standing
>> issue with devfreq+opp tables not supporting managing voltages
>> for two regulators per opp entry out of the box, due to which
>> we never got GPU DVFS on those SoCs, often locking them out to
>> a low GPU frequency.
>>
>> This changes. Right now!
>>
>> Tested on MT8192, MT8195 Chromebooks.
>>
>> This series depends on [1].
>>
>> [1]: 
>> https://lore.kernel.org/lkml/20230228102704.708150-1-angelogioacchino.delregno@collabora.com/
>>
>> Alyssa Rosenzweig (2):
>>    arm64: dts: mediatek: mt8192: Add GPU nodes
>>    arm64: dts: mediatek: mt8192-asurada: Enable GPU
>>
>> AngeloGioacchino Del Regno (16):
>>    arm64: dts: mediatek: mt8183-kukui: Couple VGPU and VSRAM_GPU
>>      regulators
>>    arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu
>>      constraints
>>    arm64: dts: mediatek: mt8183: Remove second opp-microvolt entries from
>>      gpu table
>>    arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
>>    arm64: dts: mediatek: mt8183-evb: Couple VGPU and VSRAM_GPU regulators
>>    arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU
>>      compatible
>>    arm64: dts: mediatek: mt8192: Add mfg_ref_sel clock to MFG0 domain
>>    arm64: dts: mediatek: mt8192-asurada: Assign sram supply to MFG1 pd
>>    arm64: dts: mediatek: mt8192-asurada: Fix voltage constraint for Vgpu
>>    arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER
>>      regulators
>>    arm64: dts: mediatek: mt8195: Add mfg_core_tmp clock to MFG1 domain
>>    arm64: dts: mt8195: Add panfrost node for Mali-G57 Valhall Natt GPU
>>    arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
>>    arm64: dts: mediatek: mt8186: Add GPU node
>>    arm64: dts: mediatek: mt8183-pumpkin: Override vgpu/vsram_gpu
>>      constraints
>>    arm64: dts: mediatek: mt8183-evb: Override vgpu/vsram_gpu constraints
>>
>> Nícolas F. R. A. Prado (1):
>>    arm64: dts: mediatek: mt8192-asurada: Add MFG0 domain supply
>>
>>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  17 ++-
>>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  17 ++-
>>   .../boot/dts/mediatek/mt8183-pumpkin.dts      |  17 ++-
>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  34 ++---
>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  17 +++
>>   .../boot/dts/mediatek/mt8192-asurada.dtsi     |  24 +++-
>>   arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 116 +++++++++++++++++-
>>   .../boot/dts/mediatek/mt8195-cherry.dtsi      |   5 +
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  95 +++++++++++++-
>>   9 files changed, 315 insertions(+), 27 deletions(-)
>>

-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


