Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F1DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 07:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ir05D3NHYOg29+Lqi9VM2f/+HySRze6PeldaKKTc/k=; b=yHAF9PFfU5d16/
	DaxqvHgd61K7lVibNKinRoyiCD/1bwtiFjaTOmBZwFWTbebWnJ1xAv+srQ1iRz8OUF2BPmVCBYKQb
	gl/zmqgcT4AeygYySUdy+dF/kvbeA+Apr2geIVirKekcc0tXHgM0wr8+2z4UD6kKQEowZ6FaqWnPo
	uFky252j1COKfhKqZ+WL/J9vf9DRUsZ98gApiRVHkwxLRG3tzh2EgjKDvlYucZRIxQwulNvpXJMEy
	PqrQ6WykGEGU6J7iySMkXJovsOjbjOmycu8/uX0VULbhBYToecJYaAD2R9zJUuAXQ/E8L8vfgSOxc
	qGeify8lo2vkVg10t9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZSoO-00EbJR-Lk; Wed, 30 Mar 2022 07:32:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZSoC-00EbG4-3J; Wed, 30 Mar 2022 07:32:01 +0000
X-UUID: 3da0d9c288e349ae80100e561338528e-20220330
X-UUID: 3da0d9c288e349ae80100e561338528e-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 364463634; Wed, 30 Mar 2022 00:31:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 00:25:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 15:25:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 15:25:05 +0800
Message-ID: <18f7e845660b94d5ab477de228838749385753a9.camel@mediatek.com>
Subject: Re: [PATCH v12 2/3] dt-bindings: mmc: mtk-sd: increase reg maxItems
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>
Date: Wed, 30 Mar 2022 15:25:05 +0800
In-Reply-To: <YkNuVTkTCfVJBFz+@robh.at.kernel.org>
References: <20220329114540.17140-1-tinghan.shen@mediatek.com>
 <20220329114540.17140-3-tinghan.shen@mediatek.com>
 <YkNuVTkTCfVJBFz+@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_003200_156177_D008E395 
X-CRM114-Status: GOOD (  15.41  )
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

Hi Rob,

On Tue, 2022-03-29 at 15:38 -0500, Rob Herring wrote:
> On Tue, Mar 29, 2022 at 07:45:39PM +0800, Tinghan Shen wrote:
> > Add optional host top register base for the reg binding description.
> > 
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 7032f7adf3ca..6d41bcec900f 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -40,7 +40,8 @@ properties:
> >            - const: mediatek,mt8183-mmc
> >  
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> 
> If more than 1 entry, then you need to define what each one is.

Ok. I'll add definitions at next version.
Thank you.


Best regards,
Tinghan

> 
> >  
> >    clocks:
> >      description:
> > -- 
> > 2.18.0
> > 
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
