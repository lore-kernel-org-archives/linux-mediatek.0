Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B97AC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2Y1o+uYycCqSvA2lA2BYOb2R5VCnaQF0O+nCD4PffM=; b=FxyI22JNvg1DxhMwzD4TDeG4J9
	Arv2TGmtgB/geRk4DUnbFhnN593qcP+LmUcbARnPYEWhEGo9IHjGn9LfpYbtos+HzDWxd/nialgze
	rlqHAY4ttnXUgJ7CrAcCb2gUjJdP6i/UQHpUZfFEh2y9gQ2o0zUkQxg+vxjXQasNEQvlIdKTLcdHZ
	J04WuRy3fbb9K7UQZBCTkazoC0ni4E3GLRmnXniFmxMJwvrkyWGtC4Mrjz2h9L2VAYQkT8BaBV5TV
	DSt7XTtGsZfooSanggK7FYYWxOeEkXPUqOW2Rf5Y25Xg4rdkpjfE/6ITAYVUrf+A6ayv3yn7nWZbA
	MfUykb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHTN-00CG9g-Qc; Tue, 26 Jul 2022 10:07:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHTK-00CG1K-08; Tue, 26 Jul 2022 10:07:27 +0000
X-UUID: a470264cac874711ae2c3c541a622308-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:77287625-8b65-449f-9640-58a8693310a2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:209988b3-06d2-48ef-b2dd-540836705165,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a470264cac874711ae2c3c541a622308-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1622118685; Tue, 26 Jul 2022 03:07:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 18:06:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 26 Jul 2022 18:06:51 +0800
Message-ID: <c70db24fb66f844a2b53c229fff6e943e99398db.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
	<deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
CC: "msp@baylibre.com" <msp@baylibre.com>, "granquet@baylibre.com"
	<granquet@baylibre.com>, "Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?=" <jitao.shi@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "LiangXu Xu
 =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?=" <LiangXu.Xu@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 26 Jul 2022 18:06:50 +0800
In-Reply-To: <80f223c8ecf262a62feb047d39b9ea2d8655fd14.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
	 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
	 <378f904a445e90d65048ed07a1a55fd8c633f934.camel@mediatek.com>
	 <9c5b85034ec77be80d771ce3a17260453f007728.camel@mediatek.com>
	 <80f223c8ecf262a62feb047d39b9ea2d8655fd14.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_030726_098454_1C156504 
X-CRM114-Status: GOOD (  38.09  )
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

On Tue, 2022-07-26 at 17:34 +0800, CK Hu wrote:
> On Tue, 2022-07-26 at 14:42 +0800, Rex-BC Chen wrote:
> > On Mon, 2022-07-25 at 17:16 +0800, CK Hu wrote:
> > > Hi, Bo-Chen:
> > > 
> > > On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> > > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > 
> > > > This patch adds a embedded displayport driver for the MediaTek
> > > > mt8195
> > > > SoC.
> > > > 
> > > > It supports the MT8195, the embedded DisplayPort units. It
> > > > offers
> > > > DisplayPort 1.4 with up to 4 lanes.
> > > > 
> > > > The driver creates a child device for the phy. The child device
> > > > will
> > > > never exist without the parent being active. As they are
> > > > sharing
> > > > a
> > > > register range, the parent passes a regmap pointer to the child
> > > > so
> > > > that
> > > > both can work with the same register range. The phy driver sets
> > > > device
> > > > data that is read by the parent to get the phy device that can
> > > > be
> > > > used
> > > > to control the phy properties.
> > > > 
> > > > This driver is based on an initial version by
> > > > Jitao shi <jitao.shi@mediatek.com>
> > > > 
> > > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > ---
> > > 
> > > [snip]
> > > 
> > > > +
> > > > +static int mtk_dp_training(struct mtk_dp *mtk_dp)
> > > > +{
> > > > +	short max_retry = 50;
> > > > +	int ret;
> > > > +
> > > > +	do {
> > > > +		ret = mtk_dp_train_start(mtk_dp);
> > > > +		if (!ret)
> > > > +			break;
> > > > +		else if (ret != -EAGAIN)
> > > > +			return ret;
> > > > +	} while (--max_retry);
> > > 
> > > mtk_dp_train_start() would never return -EAGAIN, so drop this
> > > while
> > > loop.
> > > 
> > > Regards,
> > > CK
> > > 
> > 
> > Hello CK,
> > 
> > the function will not return -EAGAIN, but we still want to retry 50
> > times if mtk_dp_train_start() is failed. If we retry 50 times and
> > it
> > is
> > still failed. We can confirm there are some issues for the device.
> > 
> > I will remove the else if of -EAGAIN and keep th while loop.
> 
> In this version, it never retry. And I believe you've tested this no-
> retry version. If this no-retry version works fine, why do you insist
> on retry? If you really need retry, merge this retry into
> mtk_dp_train_start() because mtk_dp_train_start() have already retry.
> 
> Regards,
> CK
> 

Hello Ck,

There are many different devices we are not testing for DP devices.
I think we need to keep this.
This retry is for restart with init state.

I think it's better to keep it here and it's more clear.

I will remain the comments above, and I think it's enough.

BRs,
Bo-Chen

> > 
> > BRs,
> > Bo-Chen
> > > > 
> > > > +	if (!max_retry)
> > > > +		return -ETIMEDOUT;
> > > > +
> > > > +	ret = mtk_dp_video_config(mtk_dp);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +	mtk_dp_video_enable(mtk_dp, true);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > 
> > > 
> > 
> > 
> 
> 


