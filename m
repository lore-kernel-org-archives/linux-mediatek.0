Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCFDC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkI2Q29NX4fYBfJbo6t6SxsmffGa04COpADeR3pZqb8=; b=too4jwAYk530cLJIC7VGr8O+35
	QOWQ+TDebNTYtdRUoVL8/UzvX+FvU4ZDesSYKfK39dOaCM3qTmGhb2WyaI9Q4K83dkNamvmMHqL4E
	WHp9/rXHPDGACeKgqgCR8JLMqs5A+vZQarupf8NSeBMJNGGhLTxOF47Hqs3VvO075DXSYwtweXUu6
	57n53RpIgkCpTOEsoCBT7b5sdHss+7g1WQAN6syr0UkY56f09cIu7Y5bs7HTBR7CZnJDGVXQYi8ag
	4Hc5534WuxSl1+WdO5qelwb/EU6YVSR5rJn2SZ6xYr1Gv2FwmPWe41u0CdoKX7zIhBrgy/76GQTiN
	u7vaH5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOboe-001cGQ-9p; Thu, 18 Aug 2022 09:27:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOboZ-001c7h-6U; Thu, 18 Aug 2022 09:27:49 +0000
X-UUID: 6f83e694241a46358a5165482f9060f2-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=GkI2Q29NX4fYBfJbo6t6SxsmffGa04COpADeR3pZqb8=;
	b=dhZzPg7/g0t8WwEC2uyGtO1YGyjH7IYxe1ShudiT9s3AjtHapN6uX+2RY+Ec9o1L/uRj8HhH/q6/oBsH8SJSOux1GZHs3zV1BwfKJ4zbNfJQlAx0K2lJdUbhatymfS+Qkkxe8QrTxqaBHHABzvwZ+r4QJQaSIy1sJy2mK2QvJ58=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:b4393b3e-b72b-4a31-91ce-6fa625507b78,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:d8d0099d-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6f83e694241a46358a5165482f9060f2-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 281951684; Thu, 18 Aug 2022 02:27:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 16:47:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Aug 2022 16:47:01 +0800
Message-ID: <61af66dd70c7a4a95072868cdf217d3747b97634.camel@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: mt8186: Fix 'reg-names' for
 pinctrl nodes
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>, Guodong Liu <guodong.liu@mediatek.com>
Date: Thu, 18 Aug 2022 16:47:01 +0800
In-Reply-To: <20220817160928.ppkjonuymr7rn4bu@notapiano>
References: <20220817052615.27153-1-allen-kh.cheng@mediatek.com>
	 <20220817160928.ppkjonuymr7rn4bu@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_022747_293963_F993A29A 
X-CRM114-Status: GOOD (  25.22  )
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

Hi Nícolas,

On Wed, 2022-08-17 at 12:09 -0400, Nícolas F. R. A. Prado wrote:
> Hi Allen,
> 
> On Wed, Aug 17, 2022 at 01:26:15PM +0800, Allen-KH Cheng wrote:
> > The mt8186 contains 8 GPIO physical address bases that correspond
> > to
> > the 'reg-names' of the pinctrl driver. The 'reg-names' entries in
> > bindings are ordered incorrectly, though. The system crashes due of
> > an
> > erroneous address when the regulator initializes.
> > 
> > We fix the 'reg-names' for the pinctrl nodes and the pinctrl-mt8186
> > example in bindings.
> > 
> > Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl
> > file and binding document")
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> 
> The sender's (your) signed-off-by should come last [1]. Also, what is
> the
> participation of Guodong in this patch? If Guodong helped in writing
> the patch
> there should also be a Co-developed-by tag for Guodong, as shown in
> [1].
> 
> [1] 
> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/submitting-patches.html*when-to-use-acked-by-cc-and-co-developed-by__;Iw!!CTRNKA9wMg0ARbw!1_mWpRIIYugoUq7AlCzsuuJoxY3jETMdZ6U3QXxh8a8FKe2mb5kCUOSAvZGqK3bUHBje7g$
>  

Guodong and I consult on this patch. I will add a Co-developed-by tag
for Guodong.

> 
> > ---
> 
> [..]
> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
> 
> [..]
> > @@ -232,12 +232,12 @@ examples:
> >              <0x10002200 0x0200>,
> >              <0x10002400 0x0200>,
> >              <0x10002600 0x0200>,
> > -            <0x10002A00 0x0200>,
> > +            <0x10002a00 0x0200>,
> 
> Also, you should avoid making changes that don't have to do with the
> patch
> itself. This patch is about fixing the reg names, so no need to touch
> the
> formatting of addresses. It just adds noise.
> 
> Other than that,
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Thanks,
> Nícolas


Ok, no problem. I will remove unrelated part.

Thanks,
Allen



