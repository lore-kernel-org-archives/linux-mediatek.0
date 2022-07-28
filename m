Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412BBC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 11:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ar3cdrc3BAdnMfeQzL4f8DMCASPxUdcDXmYPg7AA04=; b=gfAMfeQu026htgTaKWUmpnN70F
	Hitf4jxA6eIxO9o62Bs/QTKo4aV0ihaumXbxa8kPX8+DjDlEcAXRt7OhLp1ScON+YNXKWGone7OXD
	SS9PJ013PR3SF8MMlcBf/gXVd3fSMUaVqswq1UsqdSE/nzFDzGWkV5NiwNmsT1f73dwF55RsZukES
	zFFtw+U5hvGToh1w1LLyuP/owPuXB9aQrURQtrXxBWiudpBAqF5DKjhxT/vNNlDBL85t3BvvvJx2T
	Z1/fPHDqojHnoR+3Y6KS0OT/CncWlP/bhaYbGOtoy4RiYIEFqa67M2N7J/NWV9WoFycYkksdihqkH
	3/Tdzn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1hv-008iYp-OZ; Thu, 28 Jul 2022 11:29:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1hl-008iVB-9o; Thu, 28 Jul 2022 11:29:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2839A6601B43;
	Thu, 28 Jul 2022 12:29:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659007763;
	bh=uNWcE5HfgFGFIQScfXTCaroVaJZ+sGnKlroMwrEXQRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fhPaUsX32oN2Zv+HMQErEyWkgFTSLph5msyPBzP5gXlQodELxkRpJmMQW6bGUsLn3
	 Qpiw3k1mxW+S1ZJI1K4JyNT6zWYicwdubvggyLSplfHCBAlFAu5DsgaydNwM8g6cfl
	 BnuHxCvPkY+78d+ccyYmKYueWEkONobkIZd34M4MZt+JacksXUB880jqoWJCL5n6Dx
	 DEGkHvfJ+2HTkEbsiOtLKy7UdINeDvN8+kH4GOA188+cKTWeoeJg5YWPCKIUKP0hj2
	 +3wVDUgm54X8LJPim0kcg3Rs2eUJ0C+OLo0oSs+2AOxxOf5lbboiuylVnyIn9XojL1
	 8yoqdAEAveNYQ==
Message-ID: <d0d24ba1-e870-2ba0-8259-c405cb029d2f@collabora.com>
Date: Thu, 28 Jul 2022 13:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: spmi: add compatible for mt8188
Content-Language: en-US
To: Sen Chu <sen.chu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Hui Liu <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220726103729.24525-1-sen.chu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726103729.24525-1-sen.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_042925_497453_FE62ED57 
X-CRM114-Status: GOOD (  13.52  )
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

Il 26/07/22 12:37, Sen Chu ha scritto:
> Add dt-binding documentation of spmi for Mediatek MT8188 SoC platform.
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> index 2445c5e0b0ef..05801e0199f9 100644
> --- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> +++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> @@ -20,6 +20,7 @@ properties:
>     compatible:
>       enum:
>         - mediatek,mt6873-spmi
> +      - mediatek,mt8188-spmi

I think that you'll be adding a SPMI node that will have:

compatible = "mediatek,mt8188-spmi", "mediatek,mt8195-spmi";

Which means that this is actually wrong, so, please fix it by
adding items...

Regards,
Angelo

>         - mediatek,mt8195-spmi
>   
>     reg:
> 


