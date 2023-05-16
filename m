Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC68C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvgHDkbdrwHJTK1jgZYgeD2BgB0VnryxKOYAL2DTR0Y=; b=ofiWQxekiWx9aUCvgjd241kXq3
	2V0L73INxIKU3lJWQ6T5E+79VkH9mm3kFLHEn/Uf3bD6x9N5SxZoLthJ1vux+6zABSggCM01g+2+s
	b0ven8GoFvwzm9cA+TaVBlGZ2kA5r4aKycUbzjTl/Eu9jxzTLkDYVCJa/Tm/ZQ13NtWCuSzVt7HZV
	4bKSjtxbXLwn0aeXv2yyY6NRS2fG3usHui6TiCnMYfRqO/mKmrVcQO75oOLGdvKW4SOZlVIMu50KW
	LviGxwR8SvdWmpT5u/ultxFZXvUo3tJHKgKY+n8NvaHLXEEwoRTvtRhBceihHMIW6tEScaWNSVhDs
	MvUd793g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuZd-005t1M-2x;
	Tue, 16 May 2023 13:18:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuZY-005suk-0Y;
	Tue, 16 May 2023 13:18:38 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9C0766058B4;
	Tue, 16 May 2023 14:18:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684243111;
	bh=t9Kdd+ftrVf+98JRQ5scJajdzMyG4EsoKDWUzsOSgkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aV4WHRkBVAax9gXKnxurhQbdZsJaCgGIKpXiomK1PTiEQcDAXUov7urX3I/d5UEi+
	 UH79OhgDZKTd7GPWCRDvU+E1YvGTAEKX7egE8BxXhd32zhZLMESmjdB+FJjgpwXfHS
	 ZZ+zuPtPF9n3T4QFYK1BdPaBvGm3R3mUwO5ViGgM9JpxjqDMKrtMWbngEj5+Pky6gm
	 nv0/Fdp8rrMyTJ7CEjUpMUsHWH70+OYsdSJ6ft+QjDROFTNDG1ibaeWrIrYRzkkUEx
	 d3ed0jOlbuBvjpnJ/dqxkJ2Oxkkgpl1dkB+ZX8Z6HbjlT8l4LUBqRsLCq37jW0QiVD
	 CzirzyXEFG1wA==
Message-ID: <eba30975-16b5-f30f-d4a2-253f41688000@collabora.com>
Date: Tue, 16 May 2023 15:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 4/5] arm64: dts: mediatek: mt8192: Add
 mediatek,broken-save-restore-fw to asurada
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
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20230515131353.v2.cover@dianders>
 <20230515131353.v2.4.Ie7e600278ffbed55a1e5a58178203787b1449b35@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515131353.v2.4.Ie7e600278ffbed55a1e5a58178203787b1449b35@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_061836_349303_DD28DEE8 
X-CRM114-Status: UNSURE (   9.16  )
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

Il 15/05/23 22:13, Douglas Anderson ha scritto:
> Firmware shipped on mt8192 Chromebooks is affected by the GICR
> save/restore issue as described by the patch ("dt-bindings:
> interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
> broken FW"). Add the quirk property.
> 
> Fixes: 331fae2fc922 ("arm64: dts: mediatek: Introduce MT8192-based Asurada board family")
> Reviewed-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



