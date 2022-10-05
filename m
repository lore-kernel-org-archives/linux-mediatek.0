Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F329C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI8V11iT32Q2jycjSqRqVQTX4d7OUvBcmL01MKyGhek=; b=Bzrtw+fIUYVf3EDU2luw0LK7GB
	EsA6/8FUb1uRBvVhuKVXCRPmMsk3YXkDd00RhfhqAblGaMohgdYjFKzMGlV876iIPrdxlFBl+JTbS
	Y+KUCT0ztqQXDFzBLJgU/GD3yOoEDe3EK3LiKxHUjWHOGIllMMOOCmsnP1/W9wZdvH4KH7O/xXhLR
	2ZAbBV/eIfFa617kReddjdif8gkTjgoReAoYhCXKY2mSF+P4b/Hw69QKI7UxWv+0OQG6gKg83VZ77
	lE+ZMhvw4KpnAUfDiVFHSBNVz7QwwIfymQPG4bS88zNTa+WetoKC5pw+iV3OlOCKBUKJDpwq0u+1n
	bJU8Tz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofz0V-00Cr4c-RL; Wed, 05 Oct 2022 07:39:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofz0L-00Cr0D-Gd; Wed, 05 Oct 2022 07:39:46 +0000
X-UUID: fef8f5782d9f4a5494c435d8dda1399d-20221005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=PI8V11iT32Q2jycjSqRqVQTX4d7OUvBcmL01MKyGhek=;
	b=mw+qhw6kSEYudPk/0CJBJoABZWHa6Os5USGIwcfWV5Nq6SePlaOU0hem2qvDpgxPKgQvBjZPGf9MGug+UiSActLg9oYDrUNE9zNwJXSX16EvXOVREMRWtHNL9RzR2klgY1B5eh+Hhvu4Fhe92MHCUO8ZmBEZ37THCi4K+ba3qhw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5799d8dc-b9dd-41e6-8fd4-96d35473672e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:b524ed69-c578-4abf-baf4-d93ecc5e701f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fef8f5782d9f4a5494c435d8dda1399d-20221005
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 87133747; Wed, 05 Oct 2022 00:39:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 5 Oct 2022 15:08:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 5 Oct 2022 15:08:57 +0800
Message-ID: <ac0a8cadf18291575d5fc798f0d6b99f5c3a4258.camel@mediatek.com>
Subject: Re: [PATCH v5 3/6] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 5 Oct 2022 15:08:57 +0800
In-Reply-To: <0e67041f-a61d-1e34-2ce4-6a199c2c9f8e@collabora.com>
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
	 <20220927152704.12018-4-jason-jh.lin@mediatek.com>
	 <0e67041f-a61d-1e34-2ce4-6a199c2c9f8e@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_003945_564374_F008C5EF 
X-CRM114-Status: GOOD (  10.53  )
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

Hi Matthias,

Do you have any comment for this binding?

Can you help us review the soc/mediatek related patches?

Regards,
Jason-JH.Lin

On Wed, 2022-09-28 at 10:14 +0200, AngeloGioacchino Del Regno wrote:
> Il 27/09/22 17:27, Jason-JH.Lin ha scritto:
> > 1. Add mt8195 driver data with compatible "mediatek-mt8195-
> > vdosys0".
> > 2. Add mt8195 routing table settings of vdosys0.
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> 
-- 
Jason-JH.Lin <jason-jh.lin@mediatek.com>


