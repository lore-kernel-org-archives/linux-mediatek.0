Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BB5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 08:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zo86744IKTBrKRscq9BwCwhu9pFTdBjUQnYXIKaItFU=; b=HfipHbUn6UJqo8
	A49FQGzS2I42Cm4iHdwUikGoDhU6+qr7CD+YQUUVqSZK30tWhh/tLBlx9RUrC/i23s6Rzaz+A9T8Y
	z1YY71Jz9AIH/FKbSCvLaQayqLefBd6r+P59o8IZXT055oUxjD7JsjTJCfxh0JZ/VaV8oBmdPThZK
	leasOpVbCeUvb/aB6oFy51si1jjTZyoWcWAhn0C3iVgwdJdoWI0uaWvMSIV8KzxRsQUDYcy8LVlJp
	lwWd/KVNiCwK0mB9HBcg61FpxEeIsUqdud1sZEjxsu/vtPVl02WYHi5qdG2BzzIDojxltWDG4NNJf
	hMo8GmEZgdb1UYiXEklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvay5-0019PQ-SZ; Fri, 10 Dec 2021 08:09:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvaxs-0019OC-Im; Fri, 10 Dec 2021 08:09:14 +0000
X-UUID: 9c95eb3a19de47adbca14ad4a6bf1944-20211210
X-UUID: 9c95eb3a19de47adbca14ad4a6bf1944-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <james.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1520812893; Fri, 10 Dec 2021 01:09:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 00:08:38 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 10 Dec 2021 16:08:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Dec 2021 16:08:36 +0800
Message-ID: <a8275c2ee2a7fad619605b433d61077a03ed4796.camel@mediatek.com>
Subject: Re: [PATCH v16 0/4] Add SPMI support for Mediatek SoC IC
From: James Lo <james.lo@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 10 Dec 2021 16:08:37 +0800
In-Reply-To: <20211210021215.0EE19C004DD@smtp.kernel.org>
References: <20211119034613.32489-1-james.lo@mediatek.com>
 <20211210021215.0EE19C004DD@smtp.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_000912_658878_0F56B6A5 
X-CRM114-Status: GOOD (  11.02  )
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

On Thu, 2021-12-09 at 18:12 -0800, Stephen Boyd wrote:
> Quoting James Lo (2021-11-18 19:46:09)
> > This series adds support for new SoC MT6873/MT8192/MT8195 to the
> > spmi driver.
> > This series is based on Chun-Jie's patches[1].
> > 
> > [1] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=521655__;!!CTRNKA9wMg0ARbw!ycJplySfH-hTtYCIdjkF0VvfKgtq2B1NeOaBAOw5GU05898X6B7FN21KLkKTZiPC$
> >  
> 
> This isn't needed though right? I've picked these four patches up
> into
> spmi-next.

Yes. You are right.
It's just for notice the patch dependency.
Many Thanks!


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
