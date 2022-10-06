Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 01:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9WWBc8AgT+qWmWIUrtTH/9MaL3rSQ0+cKCWP1pOwcM=; b=19oZM1kYujok2tF1nf22hYF86u
	Z4cjwHgMUFweu+hhgiUp98iNzVKX+gxph3MG3MK3EEeyTK87M8EnhIvr7CK0x2eh/1b8cboDyqXJ9
	GSp5NAQkCQ0mbikciVqwAm1HBQBzOthft3O1v4bJm/mnzWT5ILdm3Krw4t4Np0hllIjzJwSUirBAG
	rKU5k/tCZFRy0/b1ApShkV3cLYC9Qjiom2VW/7d4+sRmIZXgPMF0vm/WdHztkOaWAkHj4AwYfIOvx
	Lmi+6DLItwroo0Rk/WpzSPgR1sQPxP7pSwjMcuNa62t4V/eWJ4gCmz89h33DUWRKl1oFkcF16ZZ5I
	qt4JJoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogFwO-00Gqrz-5k; Thu, 06 Oct 2022 01:44:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogFwC-00GqnA-DP; Thu, 06 Oct 2022 01:44:38 +0000
X-UUID: be95bf511306402099362e2c68fe5889-20221005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=i9WWBc8AgT+qWmWIUrtTH/9MaL3rSQ0+cKCWP1pOwcM=;
	b=AhBW68x6WgauEajqKJiEYqaTCIyfHvXSrjPqMpj9LH8TOoi//o1T6NaS6SBjuFAb+lvFN7daNsVCJrQyzstdDBWEsa+NZo7S6c5+kzZmboSrYf/SKBz2QLgee5/X2bhC5Em7BTL/a9Rv5Hv/L0xrB4SZ349YZ4OL0mdRikNNWLs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:09abbd97-16ff-4d89-a164-ac26d2acdb82,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:c7d7a585-5312-4339-9a65-dc27c4b243b8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: be95bf511306402099362e2c68fe5889-20221005
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 894617831; Wed, 05 Oct 2022 18:44:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 6 Oct 2022 09:13:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 6 Oct 2022 09:13:46 +0800
Message-ID: <ad18266e7c3234506c850cbefd6c222c359faab3.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mediatek: vcodec: Add the platform
 compatible to schema
From: Irui Wang <irui.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maoguang Meng <maoguang.meng@mediatek.com>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>
Date: Thu, 6 Oct 2022 09:13:45 +0800
In-Reply-To: <166479591681.1661748.6265395941647267106.robh@kernel.org>
References: <20221001030752.14486-1-irui.wang@mediatek.com>
	 <166479591681.1661748.6265395941647267106.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_184436_492269_EF437CAB 
X-CRM114-Status: GOOD (  21.33  )
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

Dear Rob,

Thanks for your reviewing.

On Mon, 2022-10-03 at 08:24 -0500, Rob Herring wrote:
> On Sat, 01 Oct 2022 11:07:52 +0800, Irui Wang wrote:
> > There are venc node warnings when running dtbs_check, the clock-
> > names
> > was unexpected, missing properties '#address-cells' and '#size-
> > cells'.
> > Add the corresponding platform compatible to schema.
> > 
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,vcodec-encoder.yaml      | 12
> > +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/

Yes, it's not a new warning, the 'clock-names' in mt8192.dtsi was
already unexpected without the patch's schema, we will fix it in the
future patch.

Thanks
Best Regards
> 
> 
> vcodec@17020000: clock-names:0: 'venc_sel' was expected
> 	arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8192-evb.dtb
> 


