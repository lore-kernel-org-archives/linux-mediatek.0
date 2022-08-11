Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1043EC19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu8THiThdm4sqa74s+Gdzz5kSRsTEAYG1Tfr5rbhQXQ=; b=xlC/hUy+NCs6Ou071Ogk8ZPv/7
	Fedw5U18wbplw23DkvScF0+NIqSY/vDymBYrHORVpKO9+Do7ABzFP75bWqF0rlFxDJmDnvoBoaqs8
	C2hLPvcdYDD9feXrqIywvnjgBttrySMd46EaQMHO3+xHRa3v1J+TJWafjzGwK4JFTEINaXldfNCHU
	NY5GBrPvCLqJ2xWaklXskrBFVN212MKeE3jp2VgB7Y8hOf34zgmi60eD324NT+lM1L8iq0YIYELnT
	v06Xr5joXadlcS8jVExMj9SmITzPo/jeFZ5MOBSUGlMpTdd/4x2Tmm4XcNSo/+SOEAMZH0b6tSIp3
	x6MT3jfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4f1-00Ap0Z-6c; Thu, 11 Aug 2022 09:39:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4ey-00Aouk-VG; Thu, 11 Aug 2022 09:39:26 +0000
X-UUID: 7f1bb73a98144dbf87fe6714f68c4c2c-20220811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:5458b2a8-93f7-49fa-93b8-5250896592e9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:d30d06fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7f1bb73a98144dbf87fe6714f68c4c2c-20220811
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1434669023; Thu, 11 Aug 2022 02:39:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 11 Aug 2022 17:18:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 11 Aug 2022 17:18:37 +0800
Message-ID: <f19e379d835a50c3942321b7a708b4cde65db5e3.camel@mediatek.com>
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <sen.chu@mediatek.com>, <hui.liu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
	<sean.wang@mediatek.com>, <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	zhiyong tao <zhiyong.tao@mediatk.com>
Date: Thu, 11 Aug 2022 17:18:37 +0800
In-Reply-To: <a063d48a-2096-ba5b-7f65-d55fec49d534@linaro.org>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
	 <20220728062749.18701-2-zhiyong.tao@mediatek.com>
	 <03a13ed4-e7cd-6f7d-f8f7-9b1e6193e202@linaro.org>
	 <111e1073e1ce689e289e52c645a1be2e7dc7fe12.camel@mediatek.com>
	 <86ab77f5-8beb-7237-d6e2-734f52ca176b@linaro.org>
	 <3d120fdb5d26d1211f797e5a26e8af3f34439424.camel@mediatek.com>
	 <a063d48a-2096-ba5b-7f65-d55fec49d534@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_023925_058099_A0377894 
X-CRM114-Status: GOOD (  21.61  )
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

On Thu, 2022-08-11 at 12:15 +0300, Krzysztof Kozlowski wrote:
> On 11/08/2022 12:14, zhiyong.tao wrote:
> > On Thu, 2022-08-11 at 11:58 +0300, Krzysztof Kozlowski wrote:
> > > On 11/08/2022 11:42, zhiyong.tao wrote:
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: zhiyong tao <zhiyong.tao@mediatk.com>
> > > > > > ---
> > > > > >  .../regulator/mediatek,mt6366-regulator.yaml  | 375
> > > > > > ++++++++++++++++++
> > > > > >  1 file changed, 375 insertions(+)
> > > > > 
> > > > > Subject does not match subsystem.
> > > > 
> > > > Hi Krzysztof,
> > > > 
> > > > Do you mean that we should change the title like this:
> > > > regulator: dt-bindings: mediatek: add mt6366 regulator document
> > > > is it right?
> > > 
> > > Yes. And remove redundant pieces so for example:
> > > 
> > > regulator: dt-bindings: mediatek: add mt6366
> > > or:
> > > regulator: dt-bindings: add mediatek,mt6366
> > 
> > ==>
> > Thanks for your suggestion, we will fix it in next verison.
> > > 
> > > 
> > > (...)
> > > 
> > > > > > +    patternProperties:
> > > > > > +      "^buck-
> > > > > > v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> > > > > > +        type: object
> > > > > > +        $ref: "regulator.yaml#"
> > > > > 
> > > > > No need for quotes.
> > > > 
> > > > ==>
> > > > We will remove the line "$ref: "regulator.yaml#"" in next
> > > > verison,
> > > > is
> > > > it right?
> > > 
> > > No, it is not. Why do you want to remove it?
> > 
> > ==>
> > We don't understand "No need for quotes."which means.
> > Do you mean that we should remove the quotation marks.
> > We will change it like this:$ref: regulator.yaml#
> > is it right?
> 
> Yes, remove the quotation marks. You wanted to remove entire line
> which
> is not correct. $ref should stay.
==>
Thanks for your suggestion, we will fix it in next verison.
Thanks many.
> 
> Best regards,
> Krzysztof


