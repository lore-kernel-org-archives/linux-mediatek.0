Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090E4EA4FBA
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nwkizms9ifnZyJWzOsCvtsqDtIyvUslzvpRvHRnyUE=; b=nZjp5mmnb83wtlKJYKGzCDP6Jb
	l17OkU6oNawmPhgXZ7YuyfbZO35wVFiaQU/qkFVwk01sj7k3sphzQNQzpG6zFFG4flCG94978urQA
	4oc5Y54BghIEwVyAFnh6FABunHeiENKu1q4y54Qz2q95QVWDSe6NIGGTkYyS6DCLcTa8Kwd+YlMMR
	dmf+ADjI8eIK6tQr2GQd/EZzmb76U66uLZ38yGU9NQX4VXCMs2R/cB71qyyyhBtwygJqHg6OJHgIP
	uF8TCEGQK4j19/gbbRwFS4aRbUiczOBAWoP5LEGC2QEroMraaJmQiP2Dnmlzq8RygpPuvM+t3M6oe
	AJyaW5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWEv-00000000OyR-1dh1;
	Mon, 23 Feb 2026 13:44:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWEs-00000000Oxy-2a2k;
	Mon, 23 Feb 2026 13:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771854278;
	bh=acMrGJNdojnzZ6jicbdncch2AzpkhBiFzlmsdz3QkPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vd7OLWX8Dc+Jh5op1aOlT/jS9Tv3AqwTrgGspy28Lr1Hdb84hQxzeyP0TxZVhGRdd
	 vQsMl/Ndvb6U4cNDCZvLBFiXagTI9sgpQhsDZ9zy/4YssDuf1Y7zbbfUmDi3SmnUzR
	 6zKF6hRoDNA36EZENTeizb+spvgdhudrAt8tOJiBQbfg9vhu+uOBNTpeWINWJV86mC
	 qCo1Xd10VylZovA5RBP0OW45IQQRNMnJs0z9c7sO6LIB6nMRhCfEnVlZibIN6+QwCr
	 84rwVmAY0ab+52lSE8siQlir1P8fiqUVfySKPFzcSXynLZrccysINCG8NeQjn80Uiy
	 UlUeEeUhk+wAw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D04B17E04C4;
	Mon, 23 Feb 2026 14:44:38 +0100 (CET)
Message-ID: <663a0322-1a9b-45e7-9233-93592878bbaa@collabora.com>
Date: Mon, 23 Feb 2026 14:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt6359: give regulators unique
 names
To: David Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
 <20260219-mtk-mt6359-fix-regulator-names-v1-1-ee0fcebfe1d9@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260219-mtk-mt6359-fix-regulator-names-v1-1-ee0fcebfe1d9@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_054442_856510_55C374FF 
X-CRM114-Status: UNSURE (   6.78  )
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

Il 19/02/26 23:55, David Lechner ha scritto:
> Change the regulator-name properties to be unique for all regulators.
> U-Boot cannot handle duplicate names.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Okay, makes sense.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



