Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC5FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 02:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZ/e/1zqXvbTxeRflY7Kv7NMWWGb66PbeQUqrjGccYY=; b=CN+jebps/oz89r
	1GmolRXR/YVFXKdsc6T6/JkttiMXjWok+BWvyiLIswnowO+bT6hfnDaloQf2t3jvnBbuw3nReznYH
	mkmjPI2vtmWF8GxmtTFdjhRQEU8nHbLb2OzTpzJzuhwDmXMRUBTRK/g5m02/nDVWzshXgRFGDEOTS
	KHC3yXBawGLoe5MZbXxRK67taVGDshhj4bE+P1c/NhhJIDIstgSsITHzzELXbi8wo9APEqIbXoyJr
	iTWsfYUd3Gx1WqutSFQ6wnaxzcXdWLl2oMUUijO2Kp0cgvj3XojeFndAWUukYlgbXHk0whHi6WgUs
	UbCRuHB6O7qJKyqukfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noy97-009LY2-GI; Thu, 12 May 2022 02:01:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noy8w-009LVn-0r; Thu, 12 May 2022 02:01:31 +0000
X-UUID: f176c00af0d349a79f34000dfa78167c-20220511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6nYDcaJCcIYR23pRLi1a1auimYGYkrRCoRA7PnOQx18=; 
 b=cwKcHEVumfBtRK4vmhTEGbv8gvrLaX/Y1kNKQSlms5s0YWJA/exD1HRTVMvtfyeRtxQvf+P/m1JDFkE3g1ZkfuOtNZ3GciJBlXkfThnQwxxM6RVuNnS9KvCJyADTrE8De/P6jAkaWrAGChTPcQFeovW5RZVHEhiCbq2+2epISd0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3a48050c-9861-4756-9418-3b37fb4f09a0, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:faefae9, CLOUDID:b15c8727-a01c-4223-8f5a-12d972216e7b,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f176c00af0d349a79f34000dfa78167c-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1781367604; Wed, 11 May 2022 19:00:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 19:00:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 10:00:42 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 12 May 2022 10:00:40 +0800
Message-ID: <40c12cdf833113405fce1146234db26e883eaf35.camel@mediatek.com>
Subject: Re: [PATCH v4] dt-bindings: nvmem: convert mtk-efuse.txt to YAML
 schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Date: Thu, 12 May 2022 10:00:40 +0800
In-Reply-To: <20220511151733.GA313710-robh@kernel.org>
References: <20220509014521.10248-1-chunfeng.yun@mediatek.com>
 <20220511151733.GA313710-robh@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_190130_109517_155FD240 
X-CRM114-Status: GOOD (  13.77  )
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

On Wed, 2022-05-11 at 10:17 -0500, Rob Herring wrote:
> On Mon, May 09, 2022 at 09:45:21AM +0800, Chunfeng Yun wrote:
> > Convert mtk-efuse.txt to YAML schema mediatek,efuse.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v4: fix duplicated unit-address in example;
> >     drop reviewed-by Rob, due to changes;
> > 
> > v3: add reviewed-by Rob
> > 
> > v2:
> >    1. remove description of subnodes which is covered by nvmem.yaml
> > suggested by Rob
> >    2. change the example which is commoner than mt8173's
> 
> I'm assuming this will be resent with all the changes from the other 
> conversion posted[1].
Yes, I'm doing it now, thanks

> 
> Rob
> 
> [1] 
> https://lore.kernel.org/all/73b1feab3ecb20fef0339b322a61d63146b5790a.camel@mediatek.com/
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
