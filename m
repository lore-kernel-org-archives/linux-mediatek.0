Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B179C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 11:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XH8eqwYWLoIGK8nUECWvNaLBdP+KL4mMUQcmsc+Hrgc=; b=dsagrvb+tfnqP7c6Uhy9TrNQrU
	F1//g1udoimskJ9y5yowIwy667Dt00oG6RKe4uGbxGfR12CZabOkJpFYG5Oyc91xYnDnHZgM3gFp9
	NK3J8wlLnjj7EwEy1iAhluw2KeupAD+YtLFdiSU30ZorNoWRQgxKDgRLWb/OAHvL95s4c70dVZYNI
	Cm4LbSw18kPjAd0rRkuGhZhp1bmDoe71SdYN/iSzzVNlyrQQPxNO7g9ZZsN9DC/8tf1z60/5KpcvS
	URWPW8fq5IBNTjzRBYcIsYzXj6Y+Vbz/eYnFfMl/B67ZaRktzF3bMbxadzUkSrwYo8fuFqpzXYkhh
	Tbp3aDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvv6-008eFw-0W; Mon, 25 Jul 2022 11:06:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvv3-008eDU-If; Mon, 25 Jul 2022 11:06:38 +0000
X-UUID: 3466745c2d7d478d96abc0a88618cadc-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e1d58626-9204-497b-8de2-0ee97c59ef64,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:832cc329-fd69-41f1-91fc-8b8a329d3a88,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3466745c2d7d478d96abc0a88618cadc-20220725
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1392393246; Mon, 25 Jul 2022 04:06:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 19:05:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 25 Jul 2022 19:05:54 +0800
Message-ID: <9f26dd805d58dec9cf66277713be8543175c3d7d.camel@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mt8186: Add and use
 drive-strength-microamp
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>
Date: Mon, 25 Jul 2022 19:05:54 +0800
In-Reply-To: <b52caf77-7fdc-8496-3087-e4d392c93853@collabora.com>
References: <20220725100253.10687-1-allen-kh.cheng@mediatek.com>
	 <20220725100253.10687-3-allen-kh.cheng@mediatek.com>
	 <b52caf77-7fdc-8496-3087-e4d392c93853@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_040637_648363_291FDF70 
X-CRM114-Status: GOOD (  13.29  )
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

On Mon, 2022-07-25 at 12:35 +0200, AngeloGioacchino Del Regno wrote:
> Il 25/07/22 12:02, Allen-KH Cheng ha scritto:
> > Commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
> > PIN_CONFIG_DRIVE_STRENGTH_UA") added support for using
> > drive-strength-microamp instead of mediatek,drive-strength-adv.
> > 
> > Similarly to the mt8192 and mt8195, there's no user of property
> > 'mediatek,drive-strength-adv', hence removing it is safe.
> > 
> > Fixes: 338e953f1bd1(dt-bindings: pinctrl: mt8186: add pinctrl file
> > and binding document)
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 
> The fixes tag format is wrong... Please fix that:
> 
> Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file
> and binding 
> document")
> 
> (sorry about wrapped line if you see it, that's supposed to be one
> line!).
> 
> After which:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Thanks for your comments, Will update in next version.

BRs
Allen


