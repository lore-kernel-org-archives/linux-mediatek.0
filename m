Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0A0C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iH+BCkWuyzEprew3PF01/uBudjXoxuLxJGSDgAZQKOc=; b=rcuPomp5QQOuM4rprG/KR4+64S
	mZ06tlNXFA079MrYNWAmW7apMD2h1uSI+TuoURFPESZhyVCbR55/GCIzbFlzsRY5HDsyCgkAlAs+g
	VjYA5OT21ZVir097h7coxKcG64UdYg7fJvDOOam3TcV5bPZ50eRxdS5cIsk0Xg8Ss0fdFmzyruivF
	uFM73gNxyEKrLCSoIZMc7DimIIknw3Q5PAelv5G2P1ZrNGhf2iVf06mVcEw1/sm6SAvbyfpK9w8/c
	1vI4h+WkSylGcBJCnhatpXrLQ0LiqpcBfVH2AT2L4g0I1AqxRiuZUn4Mgg2BxX/tWbL7cTInAV5gQ
	n4zDZkVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r118G-005kWo-0i;
	Thu, 09 Nov 2023 09:15:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r118D-005kVN-0K;
	Thu, 09 Nov 2023 09:15:22 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 31F126607410;
	Thu,  9 Nov 2023 09:15:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699521319;
	bh=7E495mU7BugXetHo15jEPw07igwc/8Jw3mgxbekLybc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XfBLTN+CXU+gg+KTN2BCtfLv3c4NautMO+PV5X0bavRwxKLeKIICb+XDy4dcR97nI
	 HNtrfoRI9D8GQvH1n7rg8+dm05v0EwSJwLYP80DTf1/4Xu/D5C891IOFmUGKPH1WvY
	 umOnA8ejsNAylamAhHk8g48Zrc3gHv6Ru+xqWX6Ysd8eREKFjD8QHS9+tXGh/xL/5i
	 Ba2zo2ctz8ChQ+tPWVyOAXUHP2G49XISME1ZuVLnFHzeYO/6dHt4HESs4wPDeFTwkK
	 8ACzW1pc2qYfquXs6ire8pi1D3vjnfXy0OX/jJoiP9VGjxfLbUgge/sjg+qMvdts2O
	 XVDvyFmkXsFeg==
Message-ID: <c28c99b8-36f8-479a-adbf-442c87062ca2@collabora.com>
Date: Thu, 9 Nov 2023 10:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: clock: mediatek: Remove compatible for
 MT8188 VPPSYS
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>
Cc: Nathan Lu <nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231109082201.7698-1-yu-chang.lee@mediatek.com>
 <20231109082201.7698-3-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231109082201.7698-3-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_011521_269348_B12E3A6A 
X-CRM114-Status: GOOD (  10.72  )
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

Il 09/11/23 09:22, yu-chang.lee ha scritto:
> Remove VPPSYS0, VPPSYS1 compatible on Mediatek MT8188.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

The mail recipients are wrong/incomplete. This patch cannot ever possibly get
upstream if you don't Cc the right people/lists.

Please use scripts/get_maintainer.pl to get the right list of recipients and
resend.

Thanks,
Angelo

> ---
>   .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml        | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> index d7214d97b2ba..860570320545 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -43,8 +43,6 @@ properties:
>         - mediatek,mt8188-vdecsys
>         - mediatek,mt8188-vdecsys-soc
>         - mediatek,mt8188-vencsys
> -      - mediatek,mt8188-vppsys0
> -      - mediatek,mt8188-vppsys1
>         - mediatek,mt8188-wpesys
>         - mediatek,mt8188-wpesys-vpp0
>   



