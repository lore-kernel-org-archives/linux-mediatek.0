Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24219CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwHCphsi36RTnakXSLl0C5XXKpgKHzlzIaOFJWpYV+c=; b=0TDAwFhdIEflreI7wyNG1Dwefg
	XzqDlCJJiSag8s0HmKzaDCRhIBdswu+hcaDCX4Mua1wODhwJzjEXAlth8yUE12caB4gW5JqnFREVe
	FS56GQAydWgtXn6dopkz52JhCVuU50wwGsIVFdH0Vf4Aw+JZAiMLzdIUvPkTI9QBfXYeXAvOBqa+Z
	Rk1UggDIKdIXzaUcn50w5OTM9eEWtRbY9UdHv6sswBGjBV3vbscoOn6i+RZvWqK6Gq/543k+o/4xX
	fqU9lU/1IAnYr/puHFSjPiRVyFN3P8zJwy6UHxZkezeQsLF5SY2RCECbpXu+m0BJX3hu/AUXCBflt
	zlZl5Cgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJnY-008yWy-0O;
	Mon, 16 Oct 2023 09:22:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJnU-008yWV-2P;
	Mon, 16 Oct 2023 09:22:02 +0000
Received: from [172.20.10.2] (unknown [185.53.196.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 53EC066072AF;
	Mon, 16 Oct 2023 10:21:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697448119;
	bh=/HyiQc3Pfw/ocS0/hyAvyF5PeWrpiR7koV+Tb8YIRYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J0t4X0l+BraT0SLc66RgbRJ31VYEk95rSLsdr49kIY4Srk6sHiA7W7oQSlgSHhYkB
	 +RS/HMUeE+toZ1RSR0oLKP01a/m1sY/49A+eP2/asudK6lK+eTGCRWN5w/Y9olFZvu
	 SuZquLurSfwT9RM2Btxgj068QfKe6PD1BrJKLWeHKmO1/OZTZHDLNOe6A+z7RW2pLu
	 tQjSLyfBwSqoTs35/nkp8F9sw25FYiIlihmOt21ADG8kYH9l3ZYJvTy6A8yyqsGM2i
	 hfxx1EovXEiDA1kRZ5Ij5q1RhWlWN92eR2ftONV79CvtCtyHVxvb4z0s8WMuzyhAYH
	 3MjDfHbjUIrhg==
Message-ID: <318016c7-8ceb-4c96-8784-597fac8d194b@collabora.com>
Date: Mon, 16 Oct 2023 12:21:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-7-wenst@chromium.org>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20231012230237.2676469-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022200_934562_9E223AED 
X-CRM114-Status: GOOD (  14.23  )
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

On 10/13/23 02:02, Chen-Yu Tsai wrote:
> Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> Krabby design.
> 
> Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> convertible device with touchscreen and stylus.
> 
> Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> device. It does not have a touchscreen or stylus.
> 

Hi Chen-Yu,

The Krabby design has the touchscreen ? if the touchscreen is for 
Tentacruel ,then the touchscreen should be described in the tentacruel 
dtsi, not in the Krabby and then deleted for tentacool.

Or is there any reason for describing the touchscreen for Krabby ?
One additional way to solve this is to have the touchsreen as separate 
dtsi and only include it for the boards that have it, e.g. tentacruel .

Eugen
> The two devices both have two variants. The difference is a second
> source touchpad controller that shares the same address as the original,
> but is incompatible.
> 
> The extra SKU IDs for the Tentacruel devices map to different sensor
> components attached to the Embedded Controller. These are not visible
> to the main processor.
> 
[...]


