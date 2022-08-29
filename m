Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A980ECAAA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 02:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZCbnQUGWLOCqHWfxj7itKEOu0C0ZKtB5vMcJ5exP10=; b=1tSwvBKgiMVnWI
	Gk1ZMU6ZzQUW0qB0w1qb7IvYtHKp0RH3qCHgxIx2FnaY338ItBZEmCtVGrd/GyymGxJ1HI/erGxyn
	ILOo7pOCFDJgeYIyxpe0jpW1x9UQqThsVpxwfOp9zs/4HyA10LyPqFK8eLj0wMiONSiiEtSaAT3dC
	QWTEto7YbNHhZrTn0lEXDyOy9rZ+o5UVuX1n4CJOfqfrOn5xZ+O6b0N/WHHA1mZ9QV9+16fp2WDSJ
	YNk+8Qhw6sRWZCjpo1r2hAkbBbTsnnudyzhjIgOOavwBjr3nlzvyj5wP1F6KAck0DSwSK8IQ1ympC
	arvHNb3GEgGcjQn8aS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSUwa-003tuh-NT; Mon, 29 Aug 2022 02:56:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSUwV-003trK-Nd; Mon, 29 Aug 2022 02:56:06 +0000
X-UUID: 927a889a3a064491bd165b3fe9113b94-20220828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pZCbnQUGWLOCqHWfxj7itKEOu0C0ZKtB5vMcJ5exP10=;
	b=LyDx6bl7jMB+r8fulNJg+oJUvTUhBB/N4LE/lAgHKOA+0qPflgSw0DHGlYfAVBvcnhjdu6T12k3eo7byhm3uVoqxeie9cvc/z+nMdt9b23tQSitwYrhTvtpg2A7Qgw9DJLt51xJin/ERuN9iPUuDoYyusztyqW0KTFABTTkXJQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:4c69b733-9266-4cbf-92b1-d031a033c2fe,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:5bd7d455-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 927a889a3a064491bd165b3fe9113b94-20220828
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1954172628; Sun, 28 Aug 2022 19:55:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 10:15:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Aug 2022 10:15:11 +0800
Message-ID: <a574ece24e1704f4a5634e9f9e25f3dae8485cca.camel@mediatek.com>
Subject: Re: [PATCH v4] regulator: dt-bindings: mediatek: add mt6366
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 29 Aug 2022 10:15:10 +0800
In-Reply-To: <20220823184705.6fdpczguait2la4v@notapiano>
References: <20220823123745.14061-1-zhiyong.tao@mediatek.com>
	 <20220823184705.6fdpczguait2la4v@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_195604_537915_C54CBC85 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: alexandre.belloni@bootlin.com, allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-rtc@vger.kernel.org, wen.su@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, sean.wang@mediatek.com, hui.liu@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, sen.chu@mediatek.com, lgirdwood@gmail.com, broonie@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-08-23 at 14:47 -0400, Nícolas F. R. A. Prado wrote:
> On Tue, Aug 23, 2022 at 08:37:45PM +0800, Zhiyong Tao wrote:
> > Add mt6366 regulator document
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> 
> [..]
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-
> > regulator.yaml
> 
> [..]
> > +      "^buck-(vcore)-sshub$":
> 
> The parentheses here don't serve any purpose, so drop them.
Hi nfrapardo,

we will fix it in v5.

> 
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> 
> [..]
> > +      "^ldo-vcn(33)-wifi$":
> 
> Ditto.
we will fix it in v5
> 
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo-vsram-(others)-sshub$":
> 
> Ditto.
we will fix it in v5
> 
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> 
> [..]
> > +      "^ldo-vsim[2]$":
> 
> Based on the example, should be [12].
we will fix it in v5

Thanks
> 
> Thanks,
> Nícolas
> 
> > +        type: object
> 
> [..]
> > +            mt6366_vsim1_reg: ldo-vsim1 {
> > +                regulator-enable-ramp-delay = <540>;
> > +            };
> 
> [..]
> > +            mt6366_vsim2_reg: ldo-vsim2 {
> > +                regulator-enable-ramp-delay = <540>;
> > +            };
> 
> [..]


