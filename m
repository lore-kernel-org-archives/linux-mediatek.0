Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3D6CEF141
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vM+joxsNNo8QdvFu6YjUTs/qL2HO5K3/81RFLN6aK2s=; b=peSrM/IjA9tZyQ8C79LbXvrnMR
	zcHpF8Q5J2XFIRC+CmlrCp7XHrepf7R2cWqUPhU2DZCQiSSSrSBYb2UMk8v8rsF8UHH18e2p0P6l8
	PBe4o/DuNgg8SS7AsFgy80TyUBMj0/66XmsWKyTV60k0wux21ORQQWNRBZ0yspVTMFSUl9JBdhgGe
	STUQod5cV1ES8bX8hnQiqmP0wtJt7P4JjVhl6i5QFA6qQvp2Bs/zTZW5MvycNaNDmLKKtUvkMdfxS
	nE+wbqls0b8w7u4/ODOpS6WZK2J274wd3tnEWdhdEwgBGNQ2aoKCIBopBjUplBE3aokmpW4KK/DjC
	K6rHGkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6Qu-00000005Hdz-37rH;
	Tue, 08 Oct 2024 09:23:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6Km-00000005GOy-2FIN;
	Tue, 08 Oct 2024 09:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728379006;
	bh=3WVuhvfAxsFrYqhGWJmOo57Ctm0VK0hxRBOs1VjAuSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oKXDUW/vCw07J1riK+a5FQTJoTPDUgpwEvCd+4leq5unmf9c5CZc6VhbTrvrPZSK3
	 AI9xAEX2+PEp3bz1uLu/JRjJVWnvn4Gho3onQIlj9X0/TSgcL2kpIC/4LV5GfVvAVG
	 xJxi29ZIcH4atpzcebr4AW89Eu1hc3lCvUbxEXEVEY1ogWarPUlrCtAE27UhSJBjOY
	 wKFDCgljD3I4phJlI9cfzJSf6nWaw41HzytXYv3q4rjzPDusR5a3Kw9+Eol5FM+Xpe
	 /wuUBa5aLw2ME0fOvWjNyweQndm0FC9/YrQEtQesYiqBe81gECJ99YpgtHUDCNOJZS
	 RkIO3K4qsbNPg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3761117E10D6;
	Tue,  8 Oct 2024 11:16:46 +0200 (CEST)
Message-ID: <9ab422c4-e4f8-4827-a296-a10270ab11d5@collabora.com>
Date: Tue, 8 Oct 2024 11:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: mt8390-genio-700-evk: update
 regulator names
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20241007090244.1731-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241007090244.1731-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_021648_790340_30752145 
X-CRM114-Status: UNSURE (   8.58  )
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

Il 07/10/24 11:02, Macpaul Lin ha scritto:
> Update regulator names to match schematics, replacing generic terms.
> 1. Add system wide 'reg_vsys' node for 4.2V power rail.
> 2. Add 'reg_vsys' node as 'vin-supply' for the following nodes
>   - common_fixed_5v, edp_panel_fixed_3v3, gpio_fixed_3v3, sdio_fixed_3v3,
>     touch0_fixed_3v3, usb_hub_fixed_3v3, usb_p0_vbus, and usb_p1_vbus.
> 3. Update regulator names according to the stable output name on
>     schematics.
>   - vdd_5v, vedp_3v3, ext_3v3, vio18_conn, wifi_3v3, vio33_tp1, vhub_3v3,
>     vbus_p0, vbus_p1.
>   - vcn18_pmu, vcn33_2_pmu, dvdd_proc_l, dvdd_core, vpa_pmu, dvdd_adsp,
>     va12_abb2_pmu, vsim1_pmu, vufs18_pmu.
> 4. Remove usb_hub_reset_1v8. Use 'hub' node to probe USB HUB
>     in subsequent patches.
> 
> Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



