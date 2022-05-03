Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDF4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeGFICIFcZTvpXR54WiLo5EwqsQaPxlhpNMLI/YkqcQ=; b=T8DxERS+LGxai8
	DrpCisRKe6zIhO3sCn64/+YVUH1d/YbOGGMeeIOouUlfHi1udxcd3Al68NRd9+cHb4/Vul8zSf5w/
	j9PmQ6B8HffuRZS91Fse0Kk3EjrsGwm/VTzzfou5UBGmsGluiXFRf5rSDWwwqt797uY0QTIeegsPM
	wgEVDba+VbmWoSV6N3PwfukkOMmQ/hHSjZ6mhI5ieNgFltEiKEDb50t30eGCSXrR4NUl8FG3Tbz1+
	GEhBu2DfQhoZKb6NKCRvLI1PnVRyfYH2ja+aL/fLdghO7D/cbCXb8Fli7w02MI7duGP2lCorOTiNq
	0t9DCt9e6kspjPQt+yYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrnC-005pTH-Q8; Tue, 03 May 2022 12:38:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrmf-005p8t-5u; Tue, 03 May 2022 12:37:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2979D1F43170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651581460;
 bh=gkpWSmq24BqLq0ZoHGy5upa/fdOzSaEOqF5ZfViHAhc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gcD5AZTNVVRHoiMYbP/G1FZjWnwQhhc6nLBrqFS7Bf7y3MbiBRoAtV3lsk3AWbUFk
 7OYfwUpyYE7/9gTlo8W/Hh2imHGzvA+mkPjYcWqUx93bYrUrLwOzjXwsenQ4v+A6eY
 Nb0NZUhnK+b0SfS4o3slZo4NzHxkiaUvIiVNa4Jpfpnsy64CgbVc24OlejBaMnpZG4
 Y49ZNjspDj2EBh2xcVYEDegFbecRDRx/putCncrHfsab0MajeRh8ys4IVXhpKuVbtS
 bh/FDAh8164B9N4zq3lYnzxsUUMZdO7vxMVWrvl1uYIK9xL/h+rgViViS4XBhY7CoT
 OoUcBIzi3bp/g==
Message-ID: <c3f96188-7e17-d332-6789-175fd0a84411@collabora.com>
Date: Tue, 3 May 2022 14:37:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 08/16] clk: mediatek: reset: Support inuput argument
 index mode
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
 <20220503093856.22250-9-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503093856.22250-9-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_053741_380992_1B9AA687 
X-CRM114-Status: GOOD (  13.36  )
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

Il 03/05/22 11:38, Rex-BC Chen ha scritto:
> There is a large number of mediatek infra reset bits, but we do not use
> all of them. In addition, the proper input argement of reset controller
> soulde be index.
> Therefore, to be compatible with previous drivers and usage, we add
> description variables to store the ids which can mapping to index.
> 
> To use this mode, we need to put the id in rst_idx_map to map from
> index to ids. For example, if we want to input index 1 (this index
> is used to set bank 1 bit 14) for svs, we need to declare the reset
> controller like this:
> 
> In drivers:
> static u16 rst_ofs[] = {
>          0x120, 0x130, 0x140, 0x150, 0x730,
> };
> 
> static u16 rst_idx_map[] = {
>          0 * 32 + 0,
>          1 * 32 + 14,
>          ....
> };
> 
> static const struct mtk_clk_rst_desc clk_rst_desc = {
>          .version = MTK_RST_SET_CLR,
>          .rst_bank_ofs = rst_ofs,
>          .rst_bank_nr = ARRAY_SIZE(rst_ofs),
>          .rst_idx_map = rst_idx_map,
>          .rst_idx_map_nr = ARRAY_SIZE(rst_idx_map),
> };
> 
> In dts:
> svs: {
>          ...
>          resets = <&infra 1>;
>          ...
> };
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
