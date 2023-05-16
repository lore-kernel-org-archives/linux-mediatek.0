Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC5EC77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 13:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5psxX8wg+MCSt4dzXyM4qws0LpcGQ9MF/dCSf7DFQk=; b=24GzyqPID/fVm+aGpKPnXpsk12
	I/E6WXKNGc6kWElhh6lWoTZCREJUWzNOBqCFX4bxQ1Af+P30JXlx60XJiZy4IXW9JN45w6KYB9T3D
	EDNgB/WOunzIAYZcVSPrF0pNIz4OFGbtmiijAX+ph9406Kvpu83kFlVgey72boEP6pYI9Xb7u81lC
	po7CrC08TSCiRhAH0iBJT/bkV5i3Xw/b04qznydQTRKOsA/Y+APWWwpgB7RkUnYZ87BJkMuvcMhyh
	fJb+pkTspkFJ2Elmn1JcPAKfVPcBhBMCbEsN6dt/AmA5vO9KVafbWLhae+nKgh4m0yPem8OHK0GdM
	AKZJ0BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyufC-005uKg-0S;
	Tue, 16 May 2023 13:24:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuf9-005uJB-0o;
	Tue, 16 May 2023 13:24:24 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C93206603232;
	Tue, 16 May 2023 14:24:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684243461;
	bh=kZjlYIWkTqRt7pjdy6yVknojMTh71KUX07DtZxaZFeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AlNyUv33cm7cTtCPAC5VhsL9rLAu+rshug94Z/kKXtfkHwFkT/kcV5pom6hexnktM
	 6GuytHOUwQCeYxamlzmPWe15twkt9Fo2HDxhCt1uGWVBJ6M4Uy1MJuYyQGSnKA8rqD
	 mzBh+4N7mr4z9dHHuqxBn2nQq32Wk4R7+BIJIlBmD49vZ7Y2VmKbjih2O+E6dL7IVM
	 3wnFIHmoMRHDL6h0UvHZ2/1CGvM+ja5+ecIVjrOFiMTKCV+nc+7bp866ISp1vP2Z3x
	 hpOmMLOuwBhO05UNSxUppCtyz2OrNZBMN2AmvufNv1DqtM7f8/EjSfCBEvcg70xhT2
	 KY4Ra07dIx7uw==
Message-ID: <30766850-b4c7-3ea2-fadf-3d67855107e1@collabora.com>
Date: Tue, 16 May 2023 15:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: arm,gic-v3: Add
 quirk for Mediatek SoCs w/ broken FW
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, wenst@chromium.org,
 yidilin@chromium.org, Tinghan Shen <tinghan.shen@mediatek.com>,
 jwerner@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20230515131353.v2.cover@dianders>
 <20230515131353.v2.1.Iabe67a827e206496efec6beb5616d5a3b99c1e65@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515131353.v2.1.Iabe67a827e206496efec6beb5616d5a3b99c1e65@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_062423_416810_2D1B1778 
X-CRM114-Status: GOOD (  24.84  )
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

Il 15/05/23 22:13, Douglas Anderson ha scritto:
> When trying to turn on the "pseudo NMI" kernel feature in Linux, it
> was discovered that all Mediatek-based Chromebooks that ever shipped
> (at least ones with GICv3) had a firmware bug where they wouldn't save
> certain GIC "GICR" registers properly. If a processor ever entered a
> suspend/idle mode where the GICR registers lost state then they'd be
> reset to their default state.
> 
> As a result of the bug, if you try to enable "pseudo NMIs" on the
> affected devices then certain interrupts will unexpectedly get
> promoted to be "pseudo NMIs" and cause crashes / freezes / general
> mayhem.
> 
> ChromeOS is looking to start turning on "pseudo NMIs" in production to
> make crash reports more actionable. To do so, we will release firmware
> updates for at least some of the affected Mediatek Chromebooks.
> However, even when we update the firmware of a Chromebook it's always
> possible that a user will end up booting with old firmware. We need to
> be able to detect when we're running with firmware that will crash and
> burn if pseudo NMIs are enabled.
> 
> The current plan is:
> * Update the device trees of all affected Chromebooks to include the
>    'mediatek,broken-save-restore-fw' property. The kernel can use this
>    to know not to enable certain features like "pseudo NMI". NOTE:
>    device trees for Chromebooks are never baked into the firmware but
>    are bundled with the kernel. A kernel will never be configured to
>    use "pseudo NMIs" and be bundled with an old device tree.
> * When we get a fixed firmware for one of these Chromebooks, it will
>    patch the device tree to remove this property.
> 
> For some details, you can also see the public bug
> <https://issuetracker.google.com/281831288>
> 
> Reviewed-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


