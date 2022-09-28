Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995DBC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GieXnlVvR54bbbCdQzQgCeA/fLqS0xzSZNnGbpKmuQ=; b=A0w9i6n9VbQxnmJ2jRwcAMPnAG
	fEsrVYK2GcB3GTfTnIAl2+w9rOvE9P2B5NvwmDTIkFGQKY/bLECkc/8JU+034ou82EKkl1kzJK4/u
	hc42QYSeqUb7Ke1Ue6fVEKBce0XcWQrEwpcd+DKDwxuo1DTYYHy3AwuZiNek+Upm5e5yI1J62XeBa
	tM6i177YXkgTpFYmuJfl8a3e8quVgiX9bjx7TDSOVlbpBmGDo2X9NYBFhqZxO4i7bDGLb9jjJN07N
	rPaD74XMjOEosTyvkL+SMBXAlau+lprUV4jrXz4TVfuAoKJ9e47fpJaGxNLHHlFI30S2rrt/9kJUt
	vVOK1Flw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSqU-00F1lg-Js; Wed, 28 Sep 2022 08:55:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSqJ-00F1if-IX; Wed, 28 Sep 2022 08:55:00 +0000
X-UUID: 3b1acb950e204aa090a2b371e213e87e-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1GieXnlVvR54bbbCdQzQgCeA/fLqS0xzSZNnGbpKmuQ=;
	b=AP6jG3JuuEhAMcYnGO32YP5zfyXop7QkcwEdB3rYzBhTSOGEbGaoCK3xaGqViDbJKWywVNO8RaD/BCV2i5pzEQz2SEFDpvmbzuYJ6kaCQ3YMCtffTXcXlu81bPztdI2FJ7q/D+lBtEsKnkvYvO1+aRBP6wcu3ah3v1dkw7Tl15c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e44299cd-41f5-42fd-ac77-9fb12c4e05c0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:09124d07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3b1acb950e204aa090a2b371e213e87e-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 218821916; Wed, 28 Sep 2022 01:54:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 16:53:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 28 Sep 2022 16:53:48 +0800
Message-ID: <60f6c190bc1bb99b982f5b1a60d73969343d8387.camel@mediatek.com>
Subject: Re: [V15,01/15] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc
 compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Irui Wang <irui.wang@mediatek.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Mauro Carvalho Chehab"
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tzung-Bi
 Shih <tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, Rob Herring
	<robh@kernel.org>
Date: Wed, 28 Sep 2022 16:53:47 +0800
In-Reply-To: <b9874b8f-b40f-f48d-856a-c5fc91384042@kernel.org>
References: <20220926091433.18633-1-irui.wang@mediatek.com>
	 <20220926091433.18633-2-irui.wang@mediatek.com>
	 <b9874b8f-b40f-f48d-856a-c5fc91384042@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_015459_622949_2C649C2E 
X-CRM114-Status: GOOD (  12.98  )
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

On Mon, 2022-09-26 at 16:07 +0200, Krzysztof Kozlowski wrote:
> On 26/09/2022 11:14, Irui Wang wrote:
> 
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/memory/mt8195-memory-port.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        jpgenc-master {
> > +                compatible = "mediatek,mt8195-jpgenc";
> 
> Use 4 spaces for example indentation. You have it quite inconsistent.

Hello Krzysztof,

Thanks for the comments. I will fix it.

Regards,
Kyire.

> 
> Best regards,
> Krzysztof
> 


