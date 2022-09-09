Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BD7ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 05:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2FnCSlbbHJWQKxN7AYhUkZiYtVMd3brjjKFw4/ArqE=; b=w2GMXYcDuFDY1PL/6VXUjmEh0o
	Uw/NMlxZYOqv7kNyMllr4PjjKh40LIjFhd0Wm5vuu5RM1A/mlZsoUcNVyxIv3gWXAIxllFH6VrmwZ
	8e+/lVEnpaUSJu6hGP7HcVYJOS9nIrLNw5KAg/tCsqCxtziq8Upg41bNU7GJqTbgwrd1kZNRlpDdW
	3iyhVlxjgKaFJSOmLTbDNJ3x1NuN9+n7ZlCAq2ZVeT/gLeIP5tBNbShM+s5BGkYiPVw6qu7zCz3Kt
	LE4R98Nysr59nct8xtl9AngrnzC2BZ7GK1lgXU3d8aPcaZ5OWjGPn77uyRKpoCmZ4/Os2xn6b8Imq
	6s61VYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWWlN-00CrtB-Bb; Fri, 09 Sep 2022 05:41:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWWlK-00Crs0-H3; Fri, 09 Sep 2022 05:41:11 +0000
X-UUID: 55863464a4ee474ab9435df31a25a8c1-20220908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/2FnCSlbbHJWQKxN7AYhUkZiYtVMd3brjjKFw4/ArqE=;
	b=q1cuJR/qtzPATR7rUQc0MzhC7c2e/pkm7o31Zjkyn8HbFL7DN7gS3feJjurMgBT+EbvM1xPdTuxO+1Tmr1D7o5D3CDvDLmbkGK8OSiiqwf2vTmCp5krezWjY7+HvwPoLF7lZ1pk9BbeItCYGl/UQE6F5GpL9sFctC9A0ZuaCDcU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:80889701-51a0-4d22-a662-e78161ed7a42,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:c0e2daf5-6e85-48d9-afd8-0504bbfe04cb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 55863464a4ee474ab9435df31a25a8c1-20220908
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1802452729; Thu, 08 Sep 2022 22:41:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 9 Sep 2022 13:40:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 9 Sep 2022 13:40:29 +0800
Message-ID: <d67e27ae5779cfa4782af3a425546659465aeb2c.camel@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add definition for mt8188
From: elvis.wang <elvis.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 9 Sep 2022 13:40:28 +0800
In-Reply-To: <20220803222553.GA2727128-robh@kernel.org>
References: <20220729084319.6880-1-Elvis.Wang@mediatek.com>
	 <20220729084319.6880-2-Elvis.Wang@mediatek.com>
	 <20220803222553.GA2727128-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_224110_598139_718FBC42 
X-CRM114-Status: GOOD (  19.49  )
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

Hello Rob,

The "mediatek,gce.yaml" file will be added in the next version.

Thanks
BRs
Elvis

On Wed, 2022-08-03 at 16:25 -0600, Rob Herring wrote:
> On Fri, Jul 29, 2022 at 04:43:18PM +0800, Elvis Wang wrote:
> > Add dt-binding header for mt8188.
> > 
> > Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > index c2aeba63bd47..50f97f6feeef 100644
> > --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > @@ -41,9 +41,9 @@ Optional properties for a client mutex node:
> >    defined in 'dt-bindings/gce/<chip>-gce.h'.
> >  
> >  Some vaules of properties are defined in 'dt-bindings/gce/mt8173-
> > gce.h',
> > -'dt-bindings/gce/mt8183-gce.h', 'dt-bindings/gce/mt8186-gce.h'
> > -'dt-bindings/gce/mt8192-gce.h', 'dt-bindings/gce/mt8195-gce.h' or
> > -'dt-bindings/gce/mt6779-gce.h'.
> > +'dt-bindings/gce/mt8183-gce.h', 'dt-bindings/gce/mt8186-gce.h',
> > +'dt-bindings/gce/mt8188-gce.h', 'dt-bindings/gce/mt8192-gce.h',
> > +'dt-bindings/gce/mt8195-gce.h' or 'dt-bindings/gce/mt6779-gce.h'.
> >  Such as sub-system ids, thread priority, event ids.
> 
> What about a new compatible string?
> 
> Really, this needs to be converted to schema...
> 
> Rob


