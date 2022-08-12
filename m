Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695C1C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+FTuluiWmDsVQOUqUaDNHxDaF82USCHWPcShjP7BSg=; b=4yJUtua/MWejMoNV5L7Aljy33A
	UMmUIiK7gzPcDKeB/uKXpaDDOIzSw9q0zYDEPwdN+9gudmgDeePyGLI2gtrKdgQVegd9WbJV9C1me
	sOqYmbzI3fzHSRzHT8Wqnl4AN8aADW/ZryZRwgFjcrz/BPeOFDys5jz6/va75bmLB1nmnU5XtseMv
	m7nXDJbr60IMPqxMiz5f/2VWdAAvp2nyRUbG2ni72p/gJAbCacyLauy1Rv7gY3zWp+/nnv/wCzqh+
	/R7tENp01vHoEXFlPoJM3r0zz2t3hvOyQmOoJrzOcLCJHdl68lcG3reVIpVOCXJBXP8gzumLyB22a
	kHQIs1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMSXG-005viC-AK; Fri, 12 Aug 2022 11:09:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMSXD-005vIg-IA; Fri, 12 Aug 2022 11:09:00 +0000
X-UUID: 7aaedf42847344f787d279cfdcb68b90-20220812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:bde73d9b-cb3d-4e45-890f-43eb1399db27,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:5
X-CID-META: VersionHash:3d8acc9,CLOUDID:ced97d9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7aaedf42847344f787d279cfdcb68b90-20220812
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 246980299; Fri, 12 Aug 2022 04:08:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 12 Aug 2022 18:18:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 12 Aug 2022 18:18:16 +0800
Message-ID: <9173e1755f76d1fc34e3822eda138749ebbc7f73.camel@mediatek.com>
Subject: Re: [PATCH 3/3] dt-bindings: nvmem: mediatek: efuse: Add support
 for MT8188
From: Johnson Wang <johnson.wang@mediatek.com>
To: <broonie@kernel.org>, <srinivas.kandagatla@linaro.org>,
	<matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 12 Aug 2022 18:18:16 +0800
In-Reply-To: <20220715120114.4243-3-johnson.wang@mediatek.com>
References: <20220715120114.4243-1-johnson.wang@mediatek.com>
	 <20220715120114.4243-3-johnson.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_040859_632395_BBDB86E4 
X-CRM114-Status: GOOD (  16.24  )
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

On Fri, 2022-07-15 at 20:01 +0800, Johnson Wang wrote:
> Add compatible for MT8188 SoC.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
> This patch is based on "linux-next"[1].
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index b5a1109f2ee1..75e0a516e59a 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -30,6 +30,7 @@ properties:
>                - mediatek,mt8173-efuse
>                - mediatek,mt8183-efuse
>                - mediatek,mt8186-efuse
> +              - mediatek,mt8188-efuse
>                - mediatek,mt8192-efuse
>                - mediatek,mt8195-efuse
>                - mediatek,mt8516-efuse

Hi Srinivas,

Just a gentle ping on this.
Could you please give me some suggestion on this patch?

Thank you very much.

BRs,
Johnson Wang


