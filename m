Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqAPjwwTjBQnsW+VdnZ73+PzUI1WHstnhOB6Tt6sBK8=; b=jmArQvUytMVnIq7ljTPY+kbybk
	YjCzqvZgrsnhzmGTskBXVeZNaBFAEdPJs+DUH4xBf3LRL3B/n4gn+UAXYNVd8UVEhenssgI7JvdQ+
	ap097adcT+m/co4ZkBCWWfMYkUREVBni0M2D08oNSBk9S9+jtyEisFxrfGKEqvzvpIxmwuFf9QYrt
	rvM8wetLsx7Ty3p7EktqEB4XH4vd5/xl+0yc4URrT0pLT7c7r9RIJBDS0de3vs10/to56zLmkdaHe
	rqrJw5aKeGevn4m8GWppGnLmx+mso2Q4gqW+c5rTBM2Ym6ICGcTVBOBRtCkrLX2kGqNzG+vPBtgHY
	LCh0s6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fcP-00Aq36-BG; Tue, 04 Jan 2022 08:56:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fPs-00AmmC-4U; Tue, 04 Jan 2022 08:43:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3F94B1F4249A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641285811;
 bh=6czgHBiRQWjFv98xZ1bJ4pRe2e0hJGJ99fDABVVfRgo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BVEh+dAtAyOl7ZEI1T0JGt8JbXxXQ/wJJ+D6HkThzCHlYBHft7kmA2mXntvdP9ued
 seODqJJ4k30DGs1qDpCjJ0SsmH8Fm/Wng5ma9zmZffAB7qDziLSBCSIgAL9GxTUfWf
 iRfM/mZIkZDVxc+qFzdqChcyFuz4CIB8AasK2GznzNriVb+ABjzjTUB1sBRlrlMHvv
 mY6P3/UODBVMgq6o08BYijWKZQecMesInuTW7AUeh3TeofiOdu2DlCJvqd+LkJD9GT
 IA4LYowgCQvNF3IGnQxl3G2uHByfqwgS1Aw/NH7UtcBdAWv/53ito4hKspb0rWwiR/
 s96LYQbvuxOsg==
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Add binding for
 mt8186 scp
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-remoteproc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220103075854.10438-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1e729a4f-8cc1-7f7f-eddb-fc7ba1df7f32@collabora.com>
Date: Tue, 4 Jan 2022 09:43:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220103075854.10438-1-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_004336_375969_D0CB5C6E 
X-CRM114-Status: GOOD (  15.35  )
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

Il 03/01/22 08:58, allen-kh.cheng ha scritto:
> Add mt8186 compatible to binding document.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index d21a25ee96e6..5b693a2d049c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -17,6 +17,7 @@ properties:
>     compatible:
>       enum:
>         - mediatek,mt8183-scp
> +      - mediatek,mt8186-scp
>         - mediatek,mt8192-scp
>         - mediatek,mt8195-scp
>   
> 

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
