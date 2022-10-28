Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE52C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzFISnOJoxeZRNek4kJWueyVz+SxWc263Mc65Fe+C0k=; b=eAxDq2p4jNhL4/9DEB8SIaPBU1
	MVm35zpKQ3b02vFimg3uVjylBhs6hJ+71ad8HrHcDX8YecOLKuoWoqlxb/KTOq06CNfPRwErKt+R6
	fh1LZe6QC4bJAbOzt3+sFKTUPoCm6RuKkMuxQBguZJAbBBE8DS8TLM7oOzg4oIRxv83ryVShRs5KR
	Z8wL82TVC7jDJ7xQ65HFf3um6+XAVB6NdHn4/+7dmJMGna98Lalrt8HiHAXopPK5yllSu1HeEDG8E
	A7uWG5XbQV71uCjFqMNiTtsximvASXHLIBvouJCff+9g8q/ICGrzMHNhaaYAZ/co7qU0Hpr764Rd0
	gpmc189w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPVk-00HNF8-Ak; Fri, 28 Oct 2022 13:35:00 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPVU-00HN8W-TT; Fri, 28 Oct 2022 13:34:46 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id A100D100635;
	Fri, 28 Oct 2022 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666964079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzFISnOJoxeZRNek4kJWueyVz+SxWc263Mc65Fe+C0k=;
	b=dmtU8EPwtQLf5a73mPMAmG02+P5UgUFSWCKWMng8FvxNEks4Kb6588A1MTDodk4404mVUb
	skCBCNy8tKeQB0VdwdL9tLIxxKtGrOKCy2gaRm1FqzqTjddxh1t0P1sZDxbvwu6i/qu/qO
	L2boYyviSzI09jdkAg85R1xN6bwTcO0=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox3.masterlogin.de (Postfix) with ESMTPA id 11A78360392;
	Fri, 28 Oct 2022 13:34:39 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 28 Oct 2022 15:34:38 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v2 7/7] arm64: dts: mt7986: add Bananapi R3
In-Reply-To: <64daf96b-b2b5-6f02-91aa-58d19083ee01@collabora.com>
References: <20221026093650.110290-1-linux@fw-web.de>
 <20221026093650.110290-8-linux@fw-web.de>
 <64daf96b-b2b5-6f02-91aa-58d19083ee01@collabora.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <022c1168b9ca2f6a3ca8a60a1379dee6@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 6f306042-60dc-4209-a341-0b506d1c4009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_063445_293792_ED14C5D8 
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

Hi

looked now on the keys and regulators comments...

Am 2022-10-28 11:19, schrieb AngeloGioacchino Del Regno:
> Il 26/10/22 11:36, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> +&mmc0 {
>> +	//sdcard
> 
> C-style comments please

i drop it completely if still using the way of an separate sd dts.

>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		factory-key {
> 
> I'd say that this is not "factory-key" but "reset-key"?
> 
>> +			label = "reset";
>> +			linux,code = <KEY_RESTART>;
>> +			gpios = <&pio 9 GPIO_ACTIVE_LOW>;
>> +		};

i kept definition similar to mt7622-bpi-r64,in shematic it is defined as 
"reset/factory default" and openwrt wants to use it for "factory" 
function (afair booting some kind of rescue-system for reflashing 
nand/nor). basicly it is a gpio connected to different reset-lines 
(including m.2 slot where it has some side-effects in my board-version).

>> +	};
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "fixed-1.8V";
> 
> This is "avdd18", isn't it?

no it is the 1.8VD used for emmc.

>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> All these regulators have a vin-supply: please fill it in.
> Moreover, in the schematics, I can also see other LDOs: 0.9VD (input 
> +12VD),
> AVDD12 (input 1.8VD), DDRV_VPP (input 3.3VD)...

i have not looked for which the others are defined in shematic only 
added the ones i need to get the board running.

> Of course, this means that you have one more 1.8V regulator, called 
> 1.8vd.

this is the right one

>> +	};
>> +
>> +	reg_3p3v: regulator-3p3v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "fixed-3.3V";
> 
> regulator-name = "3.3vd";
> 
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> vin-supply = <&dcin>; (dcin: regulator-12vd { ... })
> 
>> +	};
>> +
>> +	reg_5v: regulator-5v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "fixed-5V";
> 
> regulator-name  = "fixed-5p1";

why this regulator name and not regulator-name = "5.1vd"; here (or 5vd)?

>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
> 
> Schematics say "+5V: 5.1V/3A", so this is not 5000000.
> 
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> 
> vin-supply = <&dcin>;

basicly i will change the regulator to this:
/* dcin above gpio-keys to preserve alphabetic order - or should i name 
it reg_dcin to have all regulators together? but dcin should be always 
above the others which breaks ordering */

	dcin: regulator-12vd {
		compatible = "regulator-fixed";
		regulator-name = "12vd";
		regulator-min-microvolt = <12000000>;
		regulator-max-microvolt = <12000000>;
		regulator-boot-on;
		regulator-always-on;
	};

/* as far as i see in my shematic all regulators here are powered from 
+12v */
	reg_1p8v: regulator-1p8v {
		compatible = "regulator-fixed";
		regulator-name = "1.8vd";
		regulator-min-microvolt = <1800000>;
		regulator-max-microvolt = <1800000>;
		regulator-boot-on;
		regulator-always-on;
		vin-supply = <&dcin>;
	};

	reg_3p3v: regulator-3p3v {
		compatible = "regulator-fixed";
		regulator-name = "3.3vd";
		regulator-min-microvolt = <3300000>;
		regulator-max-microvolt = <3300000>;
		regulator-boot-on;
		regulator-always-on;
		vin-supply = <&dcin>;
	};

	reg_5v: regulator-5v {
		compatible = "regulator-fixed";
		regulator-name  = "fixed-5p1";
		regulator-min-microvolt = <5100000>;
		regulator-max-microvolt = <5100000>;
		regulator-boot-on;
		regulator-always-on;
		vin-supply = <&dcin>;
	};

using a different naming sheme for reg_5v (regulator-name) does not 
makes sense to me.

regards Frank

