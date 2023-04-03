Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB43C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 13:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9l3ozIq8+CUBEkKYPqUUs6sCAi7/VhHtAn5AS3VYhU=; b=Jgdd30fncoFHrjHzk1+HpPPK7n
	nBotdCh7gUtLh5sZQNvwi+uXadAU1Cmw+Vbh6ji1iwE0/9ya9C6CKp1Kw17WbAcEy/VRtonsUpia5
	A3NA4+0L3i29Ba/QOmG2X6C//MaMap+aUSowFpOX/TzuedecJkr6bqM9zL+uSsatAA2wtfgP8BvtZ
	zevsCv84ZlVzAgbK24NPChwon1fVgwD+ERwWSiRa7rNsB+SPUmDdSfTOCE+iuyjZV9GW7CP5arvKj
	sN+lQrLWom9cI+0pmdd4sO1UpN5CEC4iZalpVrUK5htzc21PeD9iPRQ+lLr76HKUu6jqsuwplY1g4
	1ULR9KWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKhl-00FYAD-1i;
	Mon, 03 Apr 2023 13:58:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKhh-00FY7F-0b;
	Mon, 03 Apr 2023 13:58:39 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C1E0B6601F5E;
	Mon,  3 Apr 2023 14:58:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680530313;
	bh=ixIV9Kz+uewOLYiqqFhy82v54fEkXWHbGspKjRC248k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaNTiyCxtsTBxZ/2tp3PafuYNJ2CoPgEdX+/EHgjOoY29DuraoeQcFjLkv4BZPRx7
	 B2K+3KWVoalzw5XZsD/DEL329RB1eKD8bKAMVcqdK5mVcINSysDQUlpD1menV6YwEj
	 VdBTQMAyx1oxQBGCZKe4i8FBmi7QejeIviWrQBRYA2Q7YcnFHsmxQrqkYaHJ2wke34
	 UQz1Es76KbbwB54FLQGmsNT+fqeuiL0Hoc1LPnwPhlYs1q5pMCcgaGMbQlmhDgjzFU
	 +hjK23Pi37+dRqn+waQ/LfIDKcpardjweIM003mSfJpEPEiOkGpfdePryjwzixnotU
	 DAPR0TDlkRQwA==
Date: Mon, 3 Apr 2023 09:58:23 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
	jianjiao.zeng@mediatek.com, Yunfei Dong <yunfei.dong@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
	chengci.xu@mediatek.com, youlin.pei@mediatek.com,
	anan.sun@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v6 01/14] dt-bindings: media: mediatek,vcodec: Remove
 dma-ranges property
Message-ID: <3a73c940-d97b-4d5c-a546-b5ee257a12f9@notapiano>
References: <20230403091337.26745-1-yong.wu@mediatek.com>
 <20230403091337.26745-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403091337.26745-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_065837_452030_EC2FB11B 
X-CRM114-Status: GOOD (  12.44  )
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

On Mon, Apr 03, 2023 at 05:13:24PM +0800, Yong Wu wrote:
[..]
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -76,11 +76,6 @@ properties:
>        The node of system control processor (SCP), using
>        the remoteproc & rpmsg framework.
>  
> -  dma-ranges:
> -    maxItems: 1
> -    description: |
> -      Describes the physical address space of IOMMU maps to memory.
> -
>    "#address-cells":
>      const: 2
>  
> @@ -203,7 +198,6 @@ required:
>    - reg
>    - iommus
>    - mediatek,scp
> -  - dma-ranges
>    - ranges
>  
>  if:
> @@ -236,7 +230,6 @@ examples:
>              compatible = "mediatek,mt8192-vcodec-dec";
>              mediatek,scp = <&scp>;
>              iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> -            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
>              #address-cells = <2>;
>              #size-cells = <2>;
>              ranges = <0 0 0 0x16000000 0 0x40000>;

Hi,

this change was also done in another patch [1], and it is already queued for the
media tree [2], so you'll need to remove this part of your patch in order to
avoid conflicts.

[1] https://lore.kernel.org/all/20230303013842.23259-3-allen-kh.cheng@mediatek.com/
[2] https://lore.kernel.org/all/98c48690-631d-1086-9b7c-004c61cc8dbb@xs4all.nl/#t

Thanks,
Nícolas

