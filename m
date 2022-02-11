Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7007AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 03:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hq+aBfAX1ZCi299RFm0ISz3gDENMK5i7vttmou+Xh0M=; b=4PXAB2A3y4uN9D
	wCSmL4Y0bz975PsBr8zJPNWvEmaUQKYJmbu0eXrLgXfWfQvGrgIGmtDoJGovBR4ld1ihaJxqApdh4
	D77gnqUSgjThk16qC4v0OGEoar/R0OhV5Dn4vS+2Rc/EnxA6UOLvoOwuzTBKqNFTFyKDMnmiMvPoA
	SHW8G35RpUmLnAvdWuENMvnTnfXUu8AYMkKUE6PGHRw0Swf5u99Co33/WObbjdWrDMyYndsB9eBpq
	E7OnEm9qZcWP572JQOzjJZ60svy1K0AJw4rEaJXbMC/izqwn2kpOYddzL94GZbc6diT5uIurEeWbL
	uQZivRFMpR8JryKusAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIN1m-005hIq-IU; Fri, 11 Feb 2022 03:55:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIMxK-005epW-1E; Fri, 11 Feb 2022 03:50:47 +0000
X-UUID: c6de8d974fa04d59ac8c763c8283e013-20220210
X-UUID: c6de8d974fa04d59ac8c763c8283e013-20220210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1727918307; Thu, 10 Feb 2022 20:50:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 19:50:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Feb 2022 11:50:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Feb 2022 11:50:41 +0800
Message-ID: <1e1262cdc9ee0f4ad1782a4ad29f1fd2c6234be7.camel@mediatek.com>
Subject: Re: [V11,PATCH 05/19] soc: mediatek: add support for mt6873
From: Dawei Chien <dawei.chien@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>,
 "James Liao" <jamesjj.liao@mediatek.com>, Henry Chen
 <henryc.chen@mediatek.com>
Date: Fri, 11 Feb 2022 11:50:41 +0800
In-Reply-To: <586066f9-c201-ff37-3e77-28ab3eb1c733@collabora.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-6-dawei.chien@mediatek.com>
 <586066f9-c201-ff37-3e77-28ab3eb1c733@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_195046_145856_5FA6E95F 
X-CRM114-Status: GOOD (  13.89  )
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

On Thu, 2022-02-03 at 16:13 +0100, AngeloGioacchino Del Regno wrote:
> Il 12/08/21 10:58, Dawei Chien ha scritto:
> > From: Henry Chen <henryc.chen@mediatek.com>
> > 
> > add support for mt6873
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> 
> You forgot to add your Signed-off-by tag here. Even if this patch is
> not yours, you're the sender, so you have to sign it.
> 
> Besides, can you please fix the title?
> 
> soc: mediatek: mtk-dvfsrc: Add support for MT6873

I would add signed-off tag and fix the title on next version, thank
you.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
