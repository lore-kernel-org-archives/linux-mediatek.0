Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55D8C3F6B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+sWa2PooQLKqQir1tblQZYSMFLwoLn6JqwP0FhUKAE=; b=xeun7MVwYJ7wgA7DUZfEXk5+sN
	rbzOihjNaOnA+sOg6V0k45ledpHWnLMYb+d4g5q386Zn5VR2vUaBXMgmiaiCaXMbRBQ00586qBzPx
	7KrWJFSKaIs0WbrtO3UvN589czZtS6VCjxiiLp9IU5nawsdc72ejJHvywPRD9RnGRuZ8xcDfteFhd
	8m20RD/H70DqfF7gUZd5y3pdDZTA2RN6XF/1SVZAcaDuHKGgl6XxAuqiqMKVKcjCmnX5O0D4WTxYq
	AvzNbUMB5/BiN8U6sWSeaBUYErsjstc917kdeG1mtLG0K4iMbfDDHJ9c9V6QHby4pBsvpne4Od5G8
	RPYgQaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLNT4-003ZGQ-Pe; Tue, 09 Aug 2022 11:32:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLNSl-003Z6c-N7; Tue, 09 Aug 2022 11:31:58 +0000
X-UUID: 4f84a33ef7a64f0c91938f238f03d927-20220809
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:42bc4e57-c353-411b-a753-fd9b7cdd0d65,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:a35bd2fc-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4f84a33ef7a64f0c91938f238f03d927-20220809
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1720711184; Tue, 09 Aug 2022 04:31:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 19:01:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Aug 2022 19:01:10 +0800
Message-ID: <6a1977971317059fcfad685869b6ccf233edcb68.camel@mediatek.com>
Subject: Re: [PATCH v5 02/20] dt-bindings: memory: mediatek: Update
 condition for mt8195 smi node
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 9 Aug 2022 19:01:10 +0800
In-Reply-To: <96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org>
References: <20220804021553.14867-1-tinghan.shen@mediatek.com>
	 <20220804021553.14867-3-tinghan.shen@mediatek.com>
	 <96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_043155_832937_619BAE5F 
X-CRM114-Status: GOOD (  11.49  )
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

Hi Krzysztof,

On Thu, 2022-08-04 at 17:12 +0200, Krzysztof Kozlowski wrote:
> On 04/08/2022 04:15, Tinghan Shen wrote:
> > 
> > It's because the 'mediatek,mt8195-smi-sub-common' compatible incorrectly
> > matches the 'else' conditions for gen2 HW without gals.
> > 
> > Rewrite the 'else' condition to specifically identify the compatibles
> > that utilizing gen2 HW without gals.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno
> >  <angelogioacchino.delregno@collabora.com>
> 
> Unfortunately, your patches got corrupted.
> 
> 
> Best regards,
> Krzysztof

Do you mean rebase to the latest linux-next?
I'll rebase in the next version, thanks!

Best regards,
TingHan


