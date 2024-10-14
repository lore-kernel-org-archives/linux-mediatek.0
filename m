Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EC9CF2591
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAag1S21Z1gHDVDNe23qT+m4glnYDNeR6ftE02IJyY8=; b=g8yKAzOM7XwItKvmCETRmrxH4S
	++eP/0DwvRclv1zjNwu0Ihx5EIy4IPNvzYnWTANMcg7TdzSxiaBm+kSYH0/w36VLmynR63S1UFsrv
	jEBWEKyfZI7DX/2o2MTevQA1bc+ku5TNu+expW+MeBqLxhW/8c/WfZlwnKDu1fva2zDVMzFx0jLMm
	kVZk5yf8JbPxIUVozR5x4MyZPmWlCIdcMoy/BFGiVhqPZT3vSQ9UY6YXMivgXVeSHjWw8s7uiopJn
	CHRdPZQ7/uKqBCzxLSQw3BbN/9XtL8KE7tsgZmMm0Jg8fBZrK5hCODqWM0SOirpxom05PCxOF0QQ4
	AUADLqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0IZF-00000004jV5-42oW;
	Mon, 14 Oct 2024 10:44:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0IXn-00000004j5V-31Xg;
	Mon, 14 Oct 2024 10:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728902597;
	bh=TO+fsH/eUQ60nwauDDyn9iX3cCBxGqwedbX5VWj2Sa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UbfoJSZzSxK9B/c9I5V+BRUXd++1Atv6hIKf1JAt3nJncKI8W9+7EFSYL6c3ZHRox
	 NkEtAjRCaIaaqy5iTzNvmh2j1mrVEpj5sf882PuP/upLXR5G7yFX8Skslhkye8Aov+
	 Znbk+Xj83wDPO5HkoNoZaQhCv2TL/Z/B0qX6ZgUVDjfnvxw+CJkRMubl4Dw5O6fXG+
	 iVPX87i7V1OblkRYLLzxFyhqGA2N+3sRedsp3NK/WF+ibv9YsmMrdhzJDojX38WRTJ
	 IjRrDAo8IZqntMeiFZNpg5M8s3chzBqzmm7smDCRTowrSx22abjkz7Jzbj6uZ18J1S
	 tVQnmwxGEaVpg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F5EC17E1395;
	Mon, 14 Oct 2024 12:43:17 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20241007090244.1731-1-macpaul.lin@mediatek.com>
References: <20241007090244.1731-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: mt8390-genio-700-evk:
 update regulator names
Message-Id: <172890259705.119414.11953532411383385450.b4-ty@collabora.com>
Date: Mon, 14 Oct 2024 12:43:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_034319_945575_416AA89E 
X-CRM114-Status: UNSURE (   7.89  )
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

On Mon, 07 Oct 2024 17:02:43 +0800, Macpaul Lin wrote:
> Update regulator names to match schematics, replacing generic terms.
> 1. Add system wide 'reg_vsys' node for 4.2V power rail.
> 2. Add 'reg_vsys' node as 'vin-supply' for the following nodes
>  - common_fixed_5v, edp_panel_fixed_3v3, gpio_fixed_3v3, sdio_fixed_3v3,
>    touch0_fixed_3v3, usb_hub_fixed_3v3, usb_p0_vbus, and usb_p1_vbus.
> 3. Update regulator names according to the stable output name on
>    schematics.
>  - vdd_5v, vedp_3v3, ext_3v3, vio18_conn, wifi_3v3, vio33_tp1, vhub_3v3,
>    vbus_p0, vbus_p1.
>  - vcn18_pmu, vcn33_2_pmu, dvdd_proc_l, dvdd_core, vpa_pmu, dvdd_adsp,
>    va12_abb2_pmu, vsim1_pmu, vufs18_pmu.
> 4. Remove usb_hub_reset_1v8. Use 'hub' node to probe USB HUB
>    in subsequent patches.
> 
> [...]

Applied to mediatek-next, thanks!

[1/2] arm64: dts: mediatek: mt8390-genio-700-evk: update regulator names
      commit: 54a1168b1a0adf9ee033b29bf32affca6059be7e
[2/2] arm64: dts: mediatek: mt8390-genio-700-evk: add keys and USB HUB
      commit: 46c2803425543deff4cb9be01da0cbd4bd6045a7

Cheers,
Angelo



