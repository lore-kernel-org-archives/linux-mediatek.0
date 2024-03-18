Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7447C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vE1sNJvpie6DgveB4np7m4H4BptBc37vqdO0f2mSwU=; b=kcn1NDTUMZgAbftKYI6MkLNte1
	iZAmW80HNj1fl2z0JN2HLmWeZjEmmi8ctsyrI6fw11X+Lf7n+KSKkXdPmo5Y2q9+Z+ag6u/z1dV3v
	H1T/brV9bNGmlCdqV65pigKbWUGNalKaXkh1iOdMCysCZElZyCUT2CpzvVjw2xYFTBFg79wcO/rUG
	3NFGN6prWcTU5zYSR5Il4QxalrPfoxn2xFRWAnJ6y8PeeAfhFhv96U2R6n4orYXGQF5A3uqf3sJmd
	WbwsezTZmodBktrCPCv3G4jFuao10hho+qjD4NosGSuHe5PI936CJNyw1RW3CQMvvaUBm9p4otSqw
	noLEUa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBET-00000008OCq-1wZI;
	Mon, 18 Mar 2024 11:32:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6X-000000087SL-3Z1F;
	Mon, 18 Mar 2024 10:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4vE1sNJvpie6DgveB4np7m4H4BptBc37vqdO0f2mSwU=; b=mdLlmrtPKKg4YadX//d3wjoV2+
	rTAkURHd1fcMzeXGoyM1VUzT/tMH6ZQu/Vqwv5kDI3sTfQZFpl3zJtjknCNHEhHH20+1/OBEty+YY
	yKXiBwf0RUw/C7Aa2VnyG4gBrtuXjhE4BAlhsCrIvKV8UHdF0CSgjBWLAjiuvs6GzHikWu8R52wOv
	B04EaggWFqEGVdky9YCG4scnnYAnrgbWI+R7dUBS1eKw2PPnFr4OrWXabQneqFXcDqKrz5Y7ztS9v
	zhXrNjajCHXbdr1rbwM2Gza7M7J1L3pNEfzZ+xfhFHW+I/w51kkFcEdHlX/KSxEiFmtLlhiDCtyDf
	W3bDkKJA==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6T-0000000CZvU-1rA3;
	Mon, 18 Mar 2024 10:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757224;
	bh=ex7N//6EfIYPxp81DGSU0Wzyl2Drhx/VSQDeDw8KBAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f+sylgeu+V/918HgiCgwjuvbMOf9e3bnNE8Gy5C+FHOCsks2nchgam5tJobSkcxxc
	 YjxEDYY6zrIRg/q0oEk2Fbn3zZ9/LKgZRKt99fYPQ2kraRBiG8CRILMsmXHmNZ1UbI
	 DGO1+UZA+01twwYFcixdQGAmfGrxwVngO7e2Me7OCrE4lpErENzQyF7Btsst4uU2uT
	 qnGTRuEZTdSc2ruUSz3m1sgDShUqjUciwAmEjEFQoRjvIzVMhn+7elDJaJLLePbiur
	 hMNnYRudvbYHlVgk4dg2wgfBAkWQQiXkDizDxdmbI0kI2oZ43Bnk2/nhDum5WOmOWD
	 qoAWaov3nSL0A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CBCA137820A0;
	Mon, 18 Mar 2024 10:20:23 +0000 (UTC)
Message-ID: <a6356a3a-6998-4ccd-8031-6a98478cefa5@collabora.com>
Date: Mon, 18 Mar 2024 11:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] mips: dts: ralink: mt7621: reorder cpu node
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-2-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-2-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102025_825113_771E55D5 
X-CRM114-Status: UNSURE (   5.48  )
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

Il 16/03/24 05:54, Justin Swartz ha scritto:
> Reorder cpu node attributes to fit the DTS Coding Style.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



