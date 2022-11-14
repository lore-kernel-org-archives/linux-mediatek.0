Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2D7C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qsBs+Kv75dt/RxGUrrDRnA1t7VzT/aujJrE6bOKkhQ=; b=a/o45fRxOoujw5XyrlLszAx4DX
	LmjfvUtnZZrr0EZXBYZIuAqWK6pY5JTUviU4GN2tbBNE0hLrAYE/a6cI6S5oFuEVa9hxY4EVtnKOC
	NXdx7OnhZOFG1RzyNpBWr0shz3/cUTgSCRMai8ZGS/jf4bHANk6+dWUd6l9WnsAaonnxdw7m0B4aX
	aOWE3Je12AnPRi7XryJ8HIB0wgcQiUTMJcDWOHdQFf/ltm0O+nmmnij7pv2JO8BcYjy4Kd9ODf5XI
	cL2o09IKG3aY66flcCi0YRDI96q9cqw/4HrZ4qVkSAnNEIvFqqRVHdJamJ7pUvFz93plZGlRq5jrg
	ELRClGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYBl-000f3s-EE; Mon, 14 Nov 2022 12:03:45 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYBW-000evA-Jy; Mon, 14 Nov 2022 12:03:32 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 8DCB14039D;
	Mon, 14 Nov 2022 12:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1668427404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+qsBs+Kv75dt/RxGUrrDRnA1t7VzT/aujJrE6bOKkhQ=;
	b=tywKneJ6RCUDygzOyvnhznh7nozSIPrqWDAkYH00M5/JOtjyaJmW6l312L3cHWckmBN2Cd
	jN5NC9KPLQAxA2Y6V3+Qx5wLNvvnU4/d7ZkOtFqSF2vFLpzyzblPq09z1t6VZIMBaDQIAb
	J0mKVrN0oI2R1yTFAqaqByqasUs/elc=
Received: from [127.0.0.1] (tmo-102-240.customers.d1-online.com [80.187.102.240])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 4DF361007BC;
	Mon, 14 Nov 2022 12:03:23 +0000 (UTC)
Date: Mon, 14 Nov 2022 13:03:18 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 10/11] arm64: dts: mt7986: add Bananapi R3
User-Agent: K-9 Mail for Android
In-Reply-To: <ee410f80-1697-6146-9755-981f2d45e88f@collabora.com>
References: <20221112091518.7846-1-linux@fw-web.de> <20221112091518.7846-11-linux@fw-web.de> <ee410f80-1697-6146-9755-981f2d45e88f@collabora.com>
Message-ID: <A22EB676-EBD4-4E07-8E8F-BC200EDBCE1A@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: e2c3e121-26ca-46ae-84d2-91c323c378b0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_040331_369937_69E8B9E7 
X-CRM114-Status: UNSURE (   4.78  )
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

Am 14=2E November 2022 12:50:40 MEZ schrieb AngeloGioacchino Del Regno <ang=
elogioacchino=2Edelregno@collabora=2Ecom>:
>Il 12/11/22 10:15, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> +/ {
>> +	model =3D "Bananapi BPI-R3";
>> +	compatible =3D "bananapi,bpi-r3", "mediatek,mt7986a";
>
>You have to add the machine compatible to devicetree/bindings/arm/mediate=
k=2Eyaml
>or you get dtb check issues=2E

Have already:

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/matthias=2Ebgg/linux=
=2Egit/commit/?h=3Dv6=2E1-next/dts64&id=3D8c80453864efea0a0ed5ca2b399fd97f2=
f55a5ae

>Regards,
>Angelo


regards Frank

