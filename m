Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72344C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boUNA3PJy0JHTiFqlN+D3b0WGWU5UawRUTjroXOg9no=; b=Li6NcCJag+H0KkpBA77+8RMdcI
	VItVO5Aos3v9HsA4CnXWI6NrIvC0yA1jTJEopoJIVI6D0/3CzckawAK/n0DskeB3FJrm+6eiVaJYd
	FmYXeWVfmHPTwZ5gJ8nfpzo65PNKMFhxCCMmmRYrM62/lobR5g8YjDMGATufp2zlJ/awQkVZOBy1D
	BbyJGOgQdqHbW7s9omZ2Qw1Zd7/6JSZfj4RDcMAMKL75++vXtilp6kBIGEDLJYJqPNt1NcMRl8RjQ
	R+UqKXMGZEVX1SMaHaL65CrcvLK9hDTU4VSF/a6PRG0FajL2RMAFa5EWuDdjC7R+apuYL0JUwvyig
	Uy65pcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRAEH-00GwZO-Qk; Mon, 07 Mar 2022 10:04:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRAE4-00GwV6-Pm; Mon, 07 Mar 2022 10:04:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 672A61F438C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646647463;
 bh=vkE1dGmQ2i4mat5nimDDteTG2DySI3ffFGm0QSlU+rA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rd8+GreErGoiKBLD+XzcSgcSayXG1eGW1o0pnS9WbP1Mwj5cbL36JkEWxWMyOY1p2
 tdKbXphTVjPxk5PUZv+ku4rKBfMhWsKB8sF3cGjL+rSurUATaqQcPtnQoQ5Wimxd6v
 a91PZz96kkxZIwJsG9UuKeToMGjIKb82pmLDTYgsBnDfBYA1yeYoGDHPKtxqan3Cet
 yQItBSLS6K59hN7fVPMXTWw8osrHw4P0/wjVH/z6XVQpxTLoghAQ5J8FhamAOWbA4v
 6cQ0j9IRrnS/fm2GZczNMtChTiWD/T7L7M5sagQV3tXlYHN0/1USSBZSplM1fFk8d6
 I7JdYrEP+lrZQ==
Message-ID: <cfab8fcc-3cb6-dc20-2c88-63884a2f7a6d@collabora.com>
Date: Mon, 7 Mar 2022 11:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v16 3/8] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307032859.3275-4-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_020425_002952_9D853759 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, CK Hu <ck.hu@mediatek.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/03/22 04:28, jason-jh.lin ha scritto:
> There are 2 mmsys, namely vdosys0 and vdosys1 in mt8195.
> Each of them is bound to a display pipeline, so add their
> definition in mtk-mmsys documentation with 2 compatibles.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6c2c3edcd443..c5ba515cb0d7 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -32,6 +32,8 @@ properties:
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
>                 - mediatek,mt8365-mmsys
> +              - mediatek,mt8195-vdosys0
> +              - mediatek,mt8195-vdosys1
>             - const: syscon
>         - items:
>             - const: mediatek,mt7623-mmsys



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
