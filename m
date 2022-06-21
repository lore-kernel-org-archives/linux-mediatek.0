Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BECC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4QZlXJW+zuiE5yRBLx7xMlGPP/R1nTVq7Rn+xjjtQs=; b=uXtiYLRAwO4/fsxKYtJnLUgi2g
	grnt7hY375EqmUaP/vsP6y5Xlw+3EHoGhn7P8GbU4x3Bc7Eh6DvPra+1W/ZpSRIXLWSPccAgK8n1r
	cQtux902o1qTz2i+w1FCjzGTqG7AGrbSwhuvuNbStoVrQlVgoA1lwWTm95cOD4t+6X1GPUtGeKPyL
	uvAtivT+vYo5Mc2z86iNIw+3EyM9KBnc0t8cPjpsakCTYCKMlBbXOqss/wXZGQFdC2wHCG3uI2mM6
	xxIklPPFs6pxgUiU3Vq1znJBgyDYS01QLxWZDKdcqBDJbzxTTFp7PaE1iBKHJdnSWZaXXoI2bNJ/P
	uOgBnLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3clF-005Fgo-DZ; Tue, 21 Jun 2022 12:13:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cjd-005ElB-LP; Tue, 21 Jun 2022 12:11:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 68146660174F;
	Tue, 21 Jun 2022 13:11:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655813516;
	bh=eoqC+ap4P2hb2zlxPni+x1COpwjVm+TE+Yg1s60B24o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UuLs3CyL4DP3wA3w/BLytMrh3d+ohdDT7bB541UNpQ/xTyw0GngZf1uy4FRYbx6fT
	 ZJmlaEREL65aQTK0IVMVzCojsQQuihyF2LvjhUNWXpX1t/W6Uuo1PMODXKuhKk9op+
	 nZCKlbJWHMc/z4nUgk7yke1eCMl2t/ODiUuyh+HoB5oi8sxcoFxbhQj2yn2B8Ojh5H
	 YJ4h0OUfHHrMH0xWLpeNoKhMYc+vt4Tn0s3cGw2w8VLZxKKY+nSrHDgy03vDbWCT/Z
	 GjcwZw6T8r/pSwKzNPQHo1w/pgEpmkKoGys2G3lhGWGndd3QitxDUFDKr6nnNveQou
	 B1MraZh3CPq0A==
Message-ID: <7e4ce7cc-365c-82ad-3517-f54e18589a74@collabora.com>
Date: Tue, 21 Jun 2022 14:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 01/14] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220621113732.11595-2-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_051157_893302_7D272A63 
X-CRM114-Status: GOOD (  11.51  )
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

Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> In this patch, we also do these string replacement:
> - s/mediatek/MediaTek/ in title.
> - s/Mediatek/MediaTek/ in description.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


