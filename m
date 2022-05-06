Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5C7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 03:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3i/b15/UTaRJviHPkUZx7W2Lv44s1nkiFysr07cFsk=; b=Vw46I9Im3FF05G
	WJc08VMeAdfut6RY1Jz6P6HiMj70Pudz7iSJv/x+ZrUgL/SEIEVCXhe/YiVpsA2QzqHFDY4FFHW2O
	hreapJNVK0uXmqKSJL7LpmJWIj0VDFUVnPfjbYJ7UYai+Tsya2EoXeRDqsjDsqPt3ykZiFPYDAQCK
	1LFr/y0P9sLXWpDGmGxGHvUHRILnTRPtcIoAOppM+jc68O6mPHJkBjmfootAVFURN+Y6ug+yn4Wyc
	ygEibnjsjTO/TZQ6V1lSxM/CE1URAE5O5Cz163pZ9GsDRiH8hUqszbmbiAljMacWx7HuDYV/8Pf1t
	sF19jIEUr3bDGvERFyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmovD-001Eet-Bv; Fri, 06 May 2022 03:46:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmov1-001EdH-OR; Fri, 06 May 2022 03:46:18 +0000
X-UUID: 890b45c518d241b99243d76f9b81fa35-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7dddd1fa-724e-4c97-8423-0d4f7c46fd02, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:3def6516-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 890b45c518d241b99243d76f9b81fa35-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 870711009; Thu, 05 May 2022 20:46:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 20:36:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 6 May 2022 11:36:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 11:36:07 +0800
Message-ID: <c0c22daa5b23f662e3ce9cfda406a53dbd6a6ad5.camel@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: nvmem: mediatek: Convert efuse
 binding to YAML
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Fri, 6 May 2022 11:36:07 +0800
In-Reply-To: <e010e330-590a-780a-c9a2-0f90e5aa04b9@linaro.org>
References: <20220428132520.2033-1-allen-kh.cheng@mediatek.com>
 <20220428132520.2033-2-allen-kh.cheng@mediatek.com>
 <e010e330-590a-780a-c9a2-0f90e5aa04b9@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_204615_843308_992AE0F4 
X-CRM114-Status: GOOD (  14.20  )
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

Hi Krzysztof,

On Fri, 2022-04-29 at 08:51 +0200, Krzysztof Kozlowski wrote:
> On 28/04/2022 15:25, Allen-KH Cheng wrote:
> > Convert MediaTek eFuse devicetree binding to YAML.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  .../devicetree/bindings/nvmem/mtk,efuse.yaml  | 57
> > +++++++++++++++++++
> >  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 --------------
> >  2 files changed, 57 insertions(+), 43 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
> 
> No, we discussed it already two times, so now third time? You are
> wasting my time. Please read all my replies again.
> 

I'm sorry, It appears that for some reason I didn't notice file name is
not mediatek,efuse.yaml.

Except the file name, I think the contents of PATCH should be base on
the previous discussion.

I'll pay more attention to that next time.
Sorry again.

Best regards,
Allen

> NAK.
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
