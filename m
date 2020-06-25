Return-Path: <SRS0=1s7f=AG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFF5C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 08:41:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4608C20707
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 08:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTi2WPk2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4608C20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Xmb4MfAZ0R3qU4CE5bggE5ifoociHm7Mz5Ag5BbwL0=; b=dTi2WPk21RaO02N34fOSKSP8a
	TfZ9FBk8LhdDQ3S3M6gOgEQPRm62oa8UHKfVnFyJk5UK/D2I3YqUZJrWZCRbv2IMqytzLrqZdy0O9
	vai6IQec5/pMXYbHXSRfuTZheo/85/pP+/sGUOvmDf72tIYrC2hgcDDehfyug/UP3jWKnsgc+qKQL
	0QnZabHr+zuJEoPJku88RhSpcDdOuqbLrppNbGuVGXrq97fCVowwHcVfzSApWKmvzXGos4Nobsso0
	ME8ZJHD2SrrFIuubrwhsa+gR+tGb0u73d4IVqPNVPKcOK8DWtMn8VPZjdy8uqOc81XAE3o9ShDmCj
	S6xf8PUyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joNRC-00057b-Si; Thu, 25 Jun 2020 08:40:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joNR6-00054V-Gy; Thu, 25 Jun 2020 08:40:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id E8EE32A0267
Subject: Re: [PATCH 7/7] arm64: dts: mt8183: Add krane-sku176 board
To: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
References: <20200619102757.1358675-1-enric.balletbo@collabora.com>
 <20200619102757.1358675-8-enric.balletbo@collabora.com>
 <fe814ab3-c237-da9c-d391-cbd0cdbe29bf@gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <3700a9b7-195b-f8d6-de03-fc5a77beffee@collabora.com>
Date: Thu, 25 Jun 2020 10:40:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fe814ab3-c237-da9c-d391-cbd0cdbe29bf@gmail.com>
Content-Language: en-US
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: erwanaliasr1@gmail.com, drinkcat@chromium.org, devicetree@vger.kernel.org,
 Ben Ho <Ben.Ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

Thank you for your review.

On 22/6/20 12:33, Matthias Brugger wrote:
> 
> 
> On 19/06/2020 12:27, Enric Balletbo i Serra wrote:
>> Also known as the Lenovo IdeaPad Duet Chromebook.
>>
>> There are different krane boards with shared resources, hence a
>> mt8183-kukui-krane.dtsi was created for easily introduce future new
>> boards. The same happens with the baseboard codenamed kukui where
>> different variants, apart from kukui variant can take advantage of the
>> shared resources.
>>
>> Signed-off-by: Ben Ho <Ben.Ho@mediatek.com>
>> [originally created by Ben Ho but adapted and ported to mainline]
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>>  .../mediatek/mt8183-kukui-krane-sku176.dts    |  18 +
>>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 343 ++++++++
>>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 788 ++++++++++++++++++
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   1 +
>>  5 files changed, 1151 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
>>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
>>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>
> [...]
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> new file mode 100644
>> index 0000000000000..f0a070535b340
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> [...]
>> +
>> +	max98357a: codec0 {
>> +		compatible = "maxim,max98357a";
>> +		sdmode-gpios = <&pio 175 0>;
>> +	};
>> +
>> +	btsco: codec1 {
> 
> bt_sco_codec:
> is more clear, I think.
> 

Ok. I'll change that in next version.

>> +		compatible = "linux,bt-sco";
>> +	};
>> +
>> +	wifi_pwrseq: wifi-pwrseq {
>> +		compatible = "mmc-pwrseq-simple";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_pins_pwrseq>;
>> +
>> +		/* Toggle WIFI_ENABLE to reset the chip. */
>> +		reset-gpios = <&pio 119 1>;
>> +	};
>> +
> [...]> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index a1576f1b5a447..689bce13e0165 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -719,6 +719,7 @@ u3phy: usb-phy@11f40000 {
>>  			compatible = "mediatek,mt8183-tphy",
>>  				     "mediatek,generic-tphy-v2";
>>  			#address-cells = <1>;
>> +			#phy-cells = <1>;
> 
> Wrong patch?
> 

Oh yes, this should go with the USB one. Thank you to catch this, I'll fix in
next version.

>>  			#size-cells = <1>;
>>  			ranges = <0 0 0x11f40000 0x1000>;
>>  			status = "okay";
>>
> 
> Regards,
> Matthias
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
