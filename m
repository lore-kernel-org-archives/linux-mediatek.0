Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B964C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtsIq1uDUUFshftfGHmMdF9c6lD7cY1mGwUtoM45Wk0=; b=x4z0aFwiMIDNbl860ptJ8z3J41
	K73LBaIfbcAWYPc8jWypFJMgolu/bDbkAHV21zeVKprB6jzJokiY91y3hZM5exsO429h1ei/QdXJB
	NbdgPvmLIjyy+XNzEoVLoNQXFsycNz7VTSbchFVF6OUTkvG3b+CJCpkktgNBcvjuwYWm7rxiqi7O2
	ATsygYQ5vqOHqJLD382VjE0zKtwQJtEsgTcAPTCybA0o3RCfYFLWKx6B6FInUg+gW0vHkE2gAeGmy
	SISH6R017m1De018sazJLLbLJjHQdI2dB/EgRM6wp5pUAj/MjMy8L7iz7Xj9QXqnH5ET1c/OkLBaq
	XbvJW8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNx3M-0035vU-6s; Tue, 16 Aug 2022 13:56:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNx3J-0035rm-6Y; Tue, 16 Aug 2022 13:56:18 +0000
X-UUID: 58ed207b720347bcbacaeb419cbc6353-20220816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xtsIq1uDUUFshftfGHmMdF9c6lD7cY1mGwUtoM45Wk0=;
	b=umskDh4KLwOww2AjUZFXJtoiQWH/M6Elhg7G3saKU7Y4HW/CrgmMKbK/yI0knE5bvpJtws+jfMCG+uNGAqKTiMvuDZURMdkg60jKxwk6q3xB+WoyqWouq7req2OhXcD/CPdgdyC5hPdSbsnqd+dNZ8w5UZ2xfjvCRAdbXFt2SBs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:b64efa76-2d23-4a09-bdc9-2788a194c491,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:91b7faae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 58ed207b720347bcbacaeb419cbc6353-20220816
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2049308287; Tue, 16 Aug 2022 06:56:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 20:55:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 16 Aug 2022 20:55:30 +0800
Message-ID: <51abb54a5d5bea76a855f20d3e28e90a3eb0efba.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8186: Fix 'reg-names' for
 pinctrl nodes
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Guodong
 Liu <guodong.liu@mediatek.com>
Date: Tue, 16 Aug 2022 20:55:29 +0800
In-Reply-To: <c411c5c5-0a8b-c85c-2d57-1a387eb0d28f@linaro.org>
References: <20220815122503.2768-1-allen-kh.cheng@mediatek.com>
	 <c411c5c5-0a8b-c85c-2d57-1a387eb0d28f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_065617_299464_05183ED2 
X-CRM114-Status: GOOD (  19.03  )
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

Hi Krzysztof,

On Tue, 2022-08-16 at 10:14 +0300, Krzysztof Kozlowski wrote:
> On 15/08/2022 15:25, Allen-KH Cheng wrote:
> > There are 8 GPIO physical address bases in mt8186, corresponding to
> > the
> > items of 'reg-names' with the pinctrl driver. but the order of
> 
> New sentences start with capital letter.
> 
> > 'reg-names' is not correct. The mt8186 pinctrl driver would get the
> > wrong address, causing the system to restart when regulator
> > initializes
> > . we 
> 
> ^^^ Something is missing. Sentence looks unfinished, full stop is in
> new
> line, next sentence does not start with capital letter.
> 
> 

Thanks for your kind reminder.
I'll update in the next version.

Best regards,
Allen

> > fix 'reg-names' for pinctrl nodes and the pinctrl-mt8186 example
> > in bindings.
> > 
> > Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl
> > file and binding document")
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> > ---
> 
> Best regards,
> Krzysztof


