Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DEFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 02:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgaCAIFi73FW1gXjgUqsAXxIB80HkLF7HydLxWy1vAQ=; b=Y7DcsQYOwe/C2nhjn1LZnBFXST
	XqPokth3v2fKsFRhyJw8V21c6uO9GvFik0lbPhrbHn4KfQ6M8wZDcr/Ffrq+T7IuSTN80njdtUwjg
	x7fL7T12NYaM3IuFUel9ccvVMCV6/+1ZDSRWspgbqCeW0ptWSsuc1bD3JrEHSuRpMGn3mgaxKW0Rr
	mEQzSTUBHSjW5+NSQKAq7ZfmH+S7Hqqoq/cbaLPdSEFNlUOSNvHYrokL+9zJU3igQyedPhyfPwvc4
	8EIRCuvYX1pp/gwPIrRMEaXxZEjSQVn54xNMZ36pgdwHlp18VCDzF8nk5OWMcr32FdJiNRpF+5IXS
	uoul9ssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDd58-0044VD-5V; Tue, 19 Jul 2022 02:35:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDd53-0044Uc-RX; Tue, 19 Jul 2022 02:35:27 +0000
X-UUID: 111af4d8358e4912964a88a7e450294b-20220718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:231ecb06-3603-427e-b688-0e53bfee11f8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:4deed6d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 111af4d8358e4912964a88a7e450294b-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1070124438; Mon, 18 Jul 2022 19:35:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 19 Jul 2022 10:34:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 19 Jul 2022 10:34:58 +0800
Message-ID: <21830ca88914215c5e98aba49e2e879dcbfde1ab.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: add power-domains
 property
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, CK Hu
	<ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <hsinyi@chromium.org>,
	<fparent@baylibre.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 19 Jul 2022 10:34:56 +0800
In-Reply-To: <b2439e75-88a3-5f04-5fe6-b53e8d5232a7@collabora.com>
References: <20220718052217.29729-1-allen-kh.cheng@mediatek.com>
	 <b2439e75-88a3-5f04-5fe6-b53e8d5232a7@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_193525_924989_1648A82B 
X-CRM114-Status: GOOD (  15.43  )
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

Hi Angelo,

On Mon, 2022-07-18 at 15:59 +0200, AngeloGioacchino Del Regno wrote:
> Il 18/07/22 07:22, Allen-KH Cheng ha scritto:
> > DPI is part of the display / multimedia block in MediaTek SoCs
> > and is managed using power controller in some platforms. We add
> > the power-domains property to the binding documentation.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 
> For the contents of this commit:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> ...but I'm not sure whether this one requires a Fixes tag (because,
> effectively,
> the DPI hardware *requires* that power domain to get up) - and if it
> does,
> which commit to reference: the first commit for this file is a TXT-
> >schema
> conversion, but the TXT didn't have power-domains as well.
> 
> 
> 
> Regards,
> Angelo

For commit 9273cf7d3 "convert the dpi bindings to yaml"

We add mt8173-dpi compatible but there is no power-domains property in
binding doc.

Yes, I think it should be added Fixes tag.

Thanks for your suggestion.


Best Regards,
Allen



