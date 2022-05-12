Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2109FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 02:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upA9CEZxFIS4s1q9q6zWvsHas3u8q+swZaQENWeuLc4=; b=NJdj1k5iiuEXtv
	L8WfIWrltDkxY6JXaIUxnFuSH2q1TvPWUDORo6foeGh4SlmlfPA8Sb/7k9kqa5VBhuHHjEmZrNsRk
	ZFF6gMsHis/z3C2pHmWlnOeGMFLeafcvY7o3l78fMa6OlXKBXz0fwPoqLDBoCarc4AkTKE0l6chtC
	UDPFouaHcV5fMHjCtld5R2LZOaPjE5y94MO4RIf130/ng4NRj6rHSX9S8GDo5AznpDerHgAq0dZ65
	EPsIBkfIq8kDfUE1P8GRihJ/UPpZU8WLgGVaSaEh33jd6cro9fNhG79PEX8yCBR0UkNA1SVUJRSAB
	155jbFMf89xjTTLCBmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noyCR-009M4z-Ap; Thu, 12 May 2022 02:05:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noyCF-009M2g-RZ; Thu, 12 May 2022 02:04:57 +0000
X-UUID: 925e7c71d6c24262974e27aff43dd894-20220511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fy4ej/8z35mFFZDkDoYjvV7KwreP1FPdvGAnvfbucXE=; 
 b=mDmlXiDxq1JkXOD33sUwqSSc65SvRv8VojXj+YcX9i15oueRp+r6A96uPdrpiZhutZov50mP7LGoy9lqslzh7eLn0SFWcxtPQA2l+OsLiRSi2qIulWYuHjE6XuCm1ZEeYgXnYVuTX5x2OG/n/O+nkqY34okSaS2xLeICse06zTI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:05ffb772-271b-4a57-93b9-1cd41fbeaff9, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:b68a3de1-3d43-4d8c-a04f-687bd61b0fb1,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 925e7c71d6c24262974e27aff43dd894-20220511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1300830940; Wed, 11 May 2022 19:04:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 19:04:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 10:04:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 12 May 2022 10:04:43 +0800
Message-ID: <b9c49e8e8ccbd01a51db63dfe545744d6160886f.camel@mediatek.com>
Subject: Re: [PATCH v4] dt-bindings: nvmem: convert mtk-efuse.txt to YAML
 schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Date: Thu, 12 May 2022 10:04:42 +0800
In-Reply-To: <5847417d-921c-7fca-f5de-00e8a550dcb8@linaro.org>
References: <20220509014521.10248-1-chunfeng.yun@mediatek.com>
 <5847417d-921c-7fca-f5de-00e8a550dcb8@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_190455_933367_E2CE6653 
X-CRM114-Status: GOOD (  17.61  )
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

On Wed, 2022-05-11 at 17:39 +0200, Krzysztof Kozlowski wrote:
> On 09/05/2022 03:45, Chunfeng Yun wrote:
> > Convert mtk-efuse.txt to YAML schema mediatek,efuse.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v4: fix duplicated unit-address in example;
> >     drop reviewed-by Rob, due to changes;
> 
> That's a small change, you should keep his review tag.
Ok.
> 
> > 
> > v3: add reviewed-by Rob
> > 
> > v2:
> >    1. remove description of subnodes which is covered by nvmem.yaml
> > suggested by Rob
> >    2. change the example which is commoner than mt8173's
> > 
> > ---
> >  .../bindings/nvmem/mediatek,efuse.yaml        | 86
> > +++++++++++++++++++
> >  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ----------
> >  2 files changed, 86 insertions(+), 43 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-
> > efuse.txt
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > new file mode 100644
> > index 000000000000..abb8b85655fe
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek efuse device tree bindings
> 
> s/device tree bindings//
Will remove it, thanks

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
