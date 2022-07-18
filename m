Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF3CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 09:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1ro+gwKGOwojyZ/hRTBZM66j8yW8aLHjPJWH4sI0ss=; b=RgWHbXY2OddyYC56FaoA9OjHlD
	rrh+G9nUpQVcZpFGI39ymYejy7BUmSl0FMOaAJ8l5KI/UA+toJz/okIPheWCLxXt3pF98LJqlGtr1
	K3wEqc4AhV3VoZXohd/Xw6DkpPND/XDsCwsqMcnNeeIa4j+XdxfXIWi28ZF79PTmpJX6G9Wodeaff
	W0v9w63g4Bc42sIWQy+CeZqD74G7z5NoCEZ/NtoZ5iM26eH4nfFwVcTHAAHprQ0liCh2Lwo3K3pVB
	zYy09gXZfGXn9UkAOGWPV29kDUrQ6YqH70GKcB/mEEwm1nS9cDkN8TCji1cCSvGjaPpKds59Bajef
	6Mx0eU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNQf-00CGh4-BD; Mon, 18 Jul 2022 09:52:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNQF-00CGNv-FC; Mon, 18 Jul 2022 09:52:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B72466019EC;
	Mon, 18 Jul 2022 10:52:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658137922;
	bh=DwirXspN3Y3vFBnvNC+gMPwdHPw3dxPtlLcTkFzaP3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j1/vkC4OKV5+d+kGyTUqlm1aRo5n/yStDLapB2Nu23DqLAxq/V8B2NyNEUYMBumTN
	 FVGqkZ7+3xd4if9vEm1UNEx1Epb9w86rmefaRY5n7zOiCtW0rH5PTP2zb+ONP8V6V7
	 v/3NncWTF6AiJ7T/TFTMLHhlWmxQGmTk4BZVUOMYc+40FSPbC8cl9/Dg6i120dRxE2
	 NqirQABTSh387G92VSoFpQhdlDImR2dFhXL3LN5RXxIViQ3Ax522G2FzlIkG4lnfUV
	 qoh62m3IxP1hI4VisTdKX91AKSt1SrA0FAF7CZ4fPPm1Idb5XM6wcgwpHYg58Q4sQQ
	 PeVaLiVQcd6cw==
Message-ID: <9e1b51df-6d4e-5767-3111-dd1232ad22ad@collabora.com>
Date: Mon, 18 Jul 2022 11:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] dt-bindings: media: mediatek: vcodec: Add encoder
 dt-bindings for mt8188
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220716093808.29894-1-irui.wang@mediatek.com>
 <20220716093808.29894-3-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220716093808.29894-3-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_025215_652331_25E67E74 
X-CRM114-Status: GOOD (  12.97  )
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

Il 16/07/22 11:38, Irui Wang ha scritto:
> Add encoder dt-bindings for mt8188.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>   .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index d36fcca04cbc..66901118d346 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -22,6 +22,7 @@ properties:
>         - mediatek,mt8183-vcodec-enc

Please keep alphabetical order.
Add it here instead.

>         - mediatek,mt8192-vcodec-enc
>         - mediatek,mt8195-vcodec-enc
> +      - mediatek,mt8188-vcodec-enc
>   
>     reg:
>       maxItems: 1

