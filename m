Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4955D1CDC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRfqxnoK/KLTdp/ck4/0XIblrGEl3H6NYMSAWeEIXNk=; b=QSLRHQnPvUFrlM/QAMTAdrxzZW
	uOT5PaGPN8b+SADjxh953TAshW4abw1+w1nnro26NXVatj+lj8Yo5c7tH9m26K3crkBqQBXTCxhv8
	x8zWzNMq6iog1EzTZJk7rURNQsqyxeon1+OvJrOpHJmMc2rXVmmcsqnzrGs8Ec16XyRMdklyrrXRL
	X9+ACDPCC+5LV2YPkLnmbw5RtJ/U79h+xBc87XsrMviNp6USfP9se0G5mRGUYLbyT3PJOxfW2ZlFl
	gMS/4LUgSV8nvAVf2Dck3wWOcGJSHXcXfu/fA/BIV0ib7SPm3ldsA8lBpmKr0KdtIpsSRRjyDhFU1
	7YCCLuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B0W-0000000AJ9q-2GBY;
	Tue, 22 Oct 2024 09:16:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ap5-0000000AHPV-1CDD;
	Tue, 22 Oct 2024 09:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729587901;
	bh=5iu6JqvvAtNgyBgmiOLgxENxQr9OSKzp8LjyujT2ZTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RrPFZbvgm/IfWOJmUOAv8ZJB4bNUTP+Tfu7cUrikht4HUak/YTmWQ/P09iheSjDQQ
	 lPyiywZQZCdzbBHILAEWKTyYuLsN1AJcb3fWTN6b9KzZaXYTnSZB83mMGCY/ximD3N
	 oaxSRnNdrZAqQGJoA3Fah5xgEUlafcxPzQc2QDRVTQc4O3JGA9Qsh6x5ZiZ27jadkh
	 lF9t+MmbLjO15+ONNL7ZRlLF2nU2KSik8NfZl7pZzAYScTGdmbN15z40r7xMzyXv8G
	 gkzpwGu6Dbb2bN+OysdBltqDNn3DyPzY98+uVvJ9tLr1ezFo3cV6TVsTpLTY5LMu6v
	 dabizLxHPp6BQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53F3417E124E;
	Tue, 22 Oct 2024 11:05:00 +0200 (CEST)
Message-ID: <3a550c82-7099-4544-bdff-e1ea411b1636@collabora.com>
Date: Tue, 22 Oct 2024 11:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: Add bindings for MT6735
 syscon clock and reset controllers
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241021121618.151079-1-y.oudjana@protonmail.com>
 <20241021121618.151079-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241021121618.151079-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_020503_520211_697050F6 
X-CRM114-Status: GOOD (  14.89  )
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

Il 21/10/24 14:16, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add device tree bindings for syscon clock and reset controllers (IMGSYS,
> MFGCFG, VDECSYS and VENCSYS).
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   .../bindings/clock/mediatek,syscon.yaml           |  4 ++++
>   MAINTAINERS                                       |  6 ++++++
>   .../dt-bindings/clock/mediatek,mt6735-imgsys.h    | 15 +++++++++++++++
>   .../dt-bindings/clock/mediatek,mt6735-mfgcfg.h    |  8 ++++++++
>   .../dt-bindings/clock/mediatek,mt6735-vdecsys.h   |  9 +++++++++
>   .../dt-bindings/clock/mediatek,mt6735-vencsys.h   | 11 +++++++++++
>   .../dt-bindings/reset/mediatek,mt6735-mfgcfg.h    |  9 +++++++++
>   .../dt-bindings/reset/mediatek,mt6735-vdecsys.h   | 10 ++++++++++
>   8 files changed, 72 insertions(+)
>   create mode 100644 include/dt-bindings/clock/mediatek,mt6735-imgsys.h
>   create mode 100644 include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
>   create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
>   create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vencsys.h
>   create mode 100644 include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
>   create mode 100644 include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
> 

..snip..

> diff --git a/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h b/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
> new file mode 100644
> index 0000000000000..90ad73af50a3f
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_RESET_MT6735_VDECSYS_H
> +#define _DT_BINDINGS_RESET_MT6735_VDECSYS_H
> +
> +#define MT6735_VDEC_RST0_VDEC			0
> +

Since you anyway have to send a new version, please remove this extra and
unneeded blank line for v2.

Anyway...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



