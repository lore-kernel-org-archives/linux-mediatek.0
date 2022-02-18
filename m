Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727ADC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYej4vkb9auFI5eE+0Hel8b9M3P6oRbHYTyINlzkcJw=; b=uygi+Mu70kt8Om
	G3XbG3ZTA4PBjrII89pWBIX7phFRvl8xDkMJdLOzGilzWcapnoHYZhmPz1uSSfbQiNWMHPJ2kK1/S
	va6Z9Cet4SA4kTTm1mYeIMK3XKR9lvCtrHzwWP+LZoKJpp4ugF0kAzSusNe3kVkzBkUv6FlLz3rRS
	0i+00LuiuF+HCX0ykTBNCE7aIZ19kN1gvvZLzUKWHcsl3XmjJTAnq2qItZl9KIKmf+m4rMyEFYdIJ
	4FR7VtIk/j7H9g7SYX6HYm89E6njAOIEXlgrm2u+C7DfOppYgobXZWI+0NiC/l7xzGulJUMnpQQCo
	uBh4ItcUoMQPQWaC4nNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL389-00EUlx-Fe; Fri, 18 Feb 2022 13:17:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2kd-00EKIY-5m; Fri, 18 Feb 2022 12:52:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8FB211F46910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188761;
 bh=7bVmllsSdo+zEWIfNE+5yNbesylSATeKRH84GE8XJgE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n0/DAjtxFTgTEf0bWouyCh2A3lkCBOWFQdTJkWoafSl7oIAzgiSpDM8Jr3N3wPkpm
 cvjyL/C3QpVE4cCm/sJxaDj6tmLopwNOwhbrdFqXoNTEpH9dr3HSXXmA/ObhAPbRFX
 7bJNy0HqO2YA8CNEPXZW/NEyC36qqgt4vv9BzZzlvGbs/rfNRYIvGGnSZ/4Mcw82RE
 EZQDW9ihRPTketCFdo2fwNRfDI0SnamcobthmwBNzgRLs8YrbrYfpcdOOQu9vmfl8f
 3oCCmpoalIvSYmyADkRseoS0jgMPZc73OtTahhJavj6RRGmG/zWy7GlnJJ2s1Gew3L
 /8tDPN2MnzCwA==
Message-ID: <d138f7b9-bfa1-8628-5c5c-aca5c9af48a6@collabora.com>
Date: Fri, 18 Feb 2022 13:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 32/34] iommu/mediatek: Initialise/Remove for multi bank
 dev
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <20220217113453.13658-33-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220217113453.13658-33-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045243_425114_4149B2C5 
X-CRM114-Status: GOOD (  10.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/02/22 12:34, Yong Wu ha scritto:
> The registers for each bank of the IOMMU base are in order, delta is
> 0x1000. Initialise the base for each bank.
> 
> For all the previous SoC, we only have bank0. thus use "do {} while()"
> to allow bank0 always go.
> 
> When removing the device, Not always all the banks are initialised, it
> depend on if there is masters for that bank.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
