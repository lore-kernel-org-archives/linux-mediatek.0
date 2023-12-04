Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF09C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXXmHaoFYdSWZb0rB5doFGbRDnw6Yh5au9hgDO0YvxQ=; b=zvQ2vGbXdiPU5S+mw6oenVwARH
	t30v0Up4+CFgO4lHtrDYTHyqIleQ9JwkmYL5kb2rrL2Qt3gNm50YyhLlNDA/k3pPfiw1QMM9bIOz+
	pYrr6qOMHJ4k4rOYsTjKwBRPUtUX4fQwRYhJnrXirJHQlkt0zJMI5q4W+js6QvO0NjXbMQ3zQSXY5
	V1OoP9+iP6byAaJHv7GX6n6rbz/aKkaRcRG4Ks4w7xOTyzjN4UUWnnkuVw5NHJkpNwZYjSI5B//uR
	3ATcLqW95xbGWm1HLvY/BpUkUI7TodRB6rPPBq1x3A+9vZwkOyD1Rd4y0Qalx/+6C2Wpq1KpdeLZ8
	0m2CDgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vN-004lSN-0L;
	Mon, 04 Dec 2023 14:27:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vJ-004lR2-2h;
	Mon, 04 Dec 2023 14:27:51 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E628660715D;
	Mon,  4 Dec 2023 14:27:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701700068;
	bh=d8f+uHH0ZzAQlhfNlUmTKSsNaY4TuqeSn7iPVuJ/3vU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kUue6Bc7WklHVY8YY7v+bkCUfMNyactF5IFHJoM2yPgLS1AOSEh2LtEqHrkZB3dgs
	 fgSaVUWjqec3N28dStowXIVtBv/d8/BbtVFoPxvXIhxI2+HANpW5XUw/YdIYKofFkv
	 4VmQgJfU5NF/bd7Ree89VkFEeETXDuzczlMKMxCpVr+GzcupKZ32TXvXsi8Gqh9Utp
	 fwOnYykeee303AroVheubGGqWq28DS33EhLUz8uXicuznhPmJI1vBtj3+LuGac7FxY
	 TtStjTm87zwJfuWwKoFvZxsDtp/PpqBBUXJCCY8mCkJH2akhDoumVRkNcXRcNacJBt
	 z+CphlB+ykH3A==
Message-ID: <ec4b992d-5761-44fb-bce5-91b1a8813f82@collabora.com>
Date: Mon, 4 Dec 2023 15:27:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] arm64: dts: mediatek: Add MT8186 Steelix platform
 based Rusty
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20231204084012.2281292-1-wenst@chromium.org>
 <20231204084012.2281292-9-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204084012.2281292-9-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_062750_005484_B641FF26 
X-CRM114-Status: UNSURE (   6.39  )
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

Il 04/12/23 09:40, Chen-Yu Tsai ha scritto:
> MT8186 Rusty, otherwise known as the Lenovo 100e Chromebook Gen 4, is an
> MT8186 based laptop. It is based on the "Steelix" design. Being a laptop
> instead of a convertible device, there is no touchscreen or stylus.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


