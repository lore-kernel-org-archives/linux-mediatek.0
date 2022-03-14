Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64D0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntAl0VyhLT6buAk1U5AL7S9Vm7779l63lFMRKLidN0M=; b=akL+P50ntMO7HG
	ikKNEAr3VTRMwkQmUrbsazyfy943XsUM9/O1KemDuFM43jfm9wVVn2t/aCk0dtC5qQddZA99ipHG4
	vNBGdsprnP7ZOxWmj0ZkY2WQYnTy43jMNdvFYuWOkaaPTOqHATnfIyfTYU7PSxee2tl0X2TrbRcxM
	m7asjymaRYjf+5GsRRjLb9WE2D+SK86u7p9LNg+gwgbauknXuI1l9y1dcpjnCmR3sM7Q+Ueu2BLcL
	ew7nuxYnT9lxSZdz6mTT2L/3TDPDx5ms2T7uOI6hGS1l8g3Lu0PIdf5yfgUy6lKwVE53WJeR1lWfr
	HL/ROP2wtt/NfhBy25Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThgN-004s9I-22; Mon, 14 Mar 2022 10:12:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThfa-004rki-7B; Mon, 14 Mar 2022 10:11:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 570641F43E0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647252677;
 bh=bh/ot0gyUXjiizNGIRbwL29lZq8POFQ8narx72tYYBk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n2Zp7NYnWcqXpGm/3VYq6d2gu9k/IgIQWVB1oDk18aQU/kEUpt3qPhZaS3ExQPCzG
 DRN60BMs1+boTWX4HgiGFDW+iIyHrhpJY2JUP5hrQ+ngco4pVDiEcv1UKwRS+kP/HU
 9RyAebdQ739o06kd3ykBbv7Ff4DGp7s769KKPlxaZbqKZEpKp/0KwPRN+VHR1zSH4a
 FV3nWTegQtNrHej2fH7oKeLFtvkvOUG07fSx8DpzZePyxjQ1jbhSmwHTRKkesiPMA5
 eRLILwkis4aHK+SSEtKKvUJY5WjgAvcBkQxvo/BRpAZI7uB2ugVvm7PBSEsM5goOUK
 PXThe59vLepmg==
Message-ID: <15fed391-a94f-aaca-906c-ffd96caead69@collabora.com>
Date: Mon, 14 Mar 2022 11:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V7 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 jassisinghbrar@gmail.com, fparent@baylibre.com, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220314090033.25773-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_031118_450624_2F6A39AB 
X-CRM114-Status: GOOD (  11.29  )
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

Il 14/03/22 10:00, Rex-BC Chen ha scritto:
> Add aal binding for MT8183.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,aal.yaml      | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 61f0ed1e388f..6c8c83988a24 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -23,6 +23,8 @@ properties:
>       oneOf:
>         - items:
>             - const: mediatek,mt8173-disp-aal
> +      - items:
> +          - const: mediatek,mt8183-disp-aal
>         - items:
>             - enum:
>                 - mediatek,mt2712-disp-aal



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
