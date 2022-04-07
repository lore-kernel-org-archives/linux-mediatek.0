Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C5CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tk0IbRwzP/sEVV90LBH2JpYrh+LLiAP4vhUBu7f08Qg=; b=FPAEVOOBq2fVXc
	m82u+vbYIK+GZfNr7Tg4u6xeDMB24W9xNbJ7hamxLsIrZqM6CAwikOA9Rkd/3vPh+Bj9r85TKYpSh
	tso1iAwKCfG3lEM6j0elTCIjzBHBQNEUgO/WN1kUZ5nvGYOVGfwhMNdBLMYKt3ly0CoyXD4qIIxJq
	IZs/1nliguGXXm8DRrArCfICng6s6Nd6WMvO9+e/ALEnZow2JA1Znqqw6a+jwCLtgrzhuQs8wjy1A
	BAEM70JtZnGzv9j9S6be11NYr+YdP/GxrJKXvU5fwxB0AjUVnOApwCceJaK6IOOW4Smt0poVy/0MR
	Z3bd5ibmlUG9iww3+WeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncO3K-00Ag14-Il; Thu, 07 Apr 2022 09:03:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncNhc-00AVUm-U8; Thu, 07 Apr 2022 08:41:18 +0000
X-UUID: 19c48315ff1d4639b0acc2127062342c-20220407
X-UUID: 19c48315ff1d4639b0acc2127062342c-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1381464820; Thu, 07 Apr 2022 01:41:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 01:38:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 7 Apr 2022 16:38:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 16:38:50 +0800
Message-ID: <e8f85610ab27403aa2b0689ecb70714c5a33e479.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <chunkuang.hu@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <yongqiang.niu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 7 Apr 2022 16:38:50 +0800
In-Reply-To: <594c124d-403f-56f1-b9fb-f48042d7056b@linaro.org>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
 <397e30c2-18c3-93d6-16f5-b113be77f51a@linaro.org>
 <c9a54f1c9350d63489a0f85443f5623fe5d7fe1d.camel@mediatek.com>
 <594c124d-403f-56f1-b9fb-f48042d7056b@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_014117_019224_D66F89F2 
X-CRM114-Status: GOOD (  26.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-04-07 at 08:49 +0200, Krzysztof Kozlowski wrote:
> On 07/04/2022 08:22, Rex-BC Chen wrote:
> > On Wed, 2022-04-06 at 16:44 +0200, Krzysztof Kozlowski wrote:
> > > On 06/04/2022 11:46, Rex-BC Chen wrote:
> > > > The driver data of MT8183 and MT8173 are different.
> > > > The value of has_gamma for MT8173 is true while the value of
> > > > MT8183
> > > > is
> > > > false. Therefore, the compatible of disp_aal for MT8183 is not
> > > > suitable
> > > > for the compatible for MT8173.
> > > 
> > > Just because one feature is not supported, it does not mean they
> > > are
> > > incompatible, which you claim in the patch below. Are you sure
> > > they
> > > are
> > > really incompatible and MT8173 fallback cannot be used?
> > > 
> > > 
> > > Best regards,
> > > Krzysztof
> > 
> > Hello Krzysztof,
> > 
> > Thanks for your review.
> > 
> > The difference of disp_aal for each MediaTek SoCs is "has_gamma".
> > And we only control this variable for different MediaTek SoCs.
> > 
> > The value of has_gamma for MT8173 is true.
> > The value of has_gamma for MT8183 is false. (Moreover, the driver
> > data
> > is null for MT8183)
> > 
> > From this situation, I think it's not compatible between MT8173 and
> > MT8183.
> 
> You repeated the commit msg without bringing any new information...
> but
> let it be, I assume setting gamma on MTT8183 is incorrect or produces
> wrong results.
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Sorry for this.
I can explain more detailed.

For MT8173, the gamma module is inside disp_aal. When we need to adjust
gamma value, we need to use "has_gamma" to control gamma function
inside disp_aal to adjust gamma value.

Since MT8183 (MT8192/MT8195/MT8186), display gamma is seperated from
disp_aal. We just need to control disp_gamma directly and we don't need
to control gamma function inside disp_aal.

I will add these comments to commit message in next version to explain
it.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
