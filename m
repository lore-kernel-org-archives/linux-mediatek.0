Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE65C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1d9Skf1faLsPgrWD8ubmAWPoSmsvbG7+9KMsFAitPWk=; b=hXsCtRn8GcEopV
	eIo64JzExTA/2xT6XJGqJ3qXMHIxkiEBWQyrNUzPUOnLYYfV3u/xkMp305BRH3qLJXTh/8KYMcJRa
	7Mp0+zTFgV4AdVFN+VMq5OXycmZjamhzU1v7kc6Yc0JTazVYSTbKKtYwOe8w95XayBCFT+Wxgc3hs
	ZhGpj2mEcGLNMfemLQnPVEdXbad4esncKiPXeucaWdn2SuW3zNcJS18EqGraiZD2p1g4YLExxrgd9
	JWsFOlAIwcV2nJBrJfnKqGDonpjS5gDAf2EmVYPyeDd96tFFsFBVOF3K+Fbmi8w3jEJkPsdSZ9wj3
	2TT/Bs2rekmwnP8DMnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquXk-00D8BS-Pa; Tue, 17 May 2022 10:35:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquXi-00D89C-0y; Tue, 17 May 2022 10:35:07 +0000
X-UUID: 179573a3711c451e9e8f245a4c28c438-20220517
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:5bc90349-99f7-4bbf-8b96-54fe32dd388c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:ce768d79-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 179573a3711c451e9e8f245a4c28c438-20220517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 210287056; Tue, 17 May 2022 03:34:58 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 03:30:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 18:30:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 May 2022 18:30:32 +0800
Message-ID: <b7c080dfcdc3488b5b58badbff8396a8604b5969.camel@mediatek.com>
Subject: Re: [PATCH v6 00/16] Cleanup MediaTek clk reset drivers and support
 MT8192/MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, Runyang Chen
 =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 17 May 2022 18:30:31 +0800
In-Reply-To: <20220517072329.D367AC385B8@smtp.kernel.org>
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
 <445ef1e3ef9d62934e1b84d4fb207705a90d4f34.camel@mediatek.com>
 <20220517072329.D367AC385B8@smtp.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_033506_100229_996973D5 
X-CRM114-Status: GOOD (  17.70  )
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

On Tue, 2022-05-17 at 15:23 +0800, Stephen Boyd wrote:
> Quoting Rex-BC Chen (2022-05-08 22:35:55)
> > 
> > The drivers of this series are reviewed.
> > The binding of this series are also acked.
> > Could you spare some time and give us some suggestion?
> 
> Have you considered using the auxiliary bus to split the Mediatek clk
> and reset device up into a clk device and a reset device? The idea
> would
> be to move the reset related code into drivers/reset and have the clk
> code in drivers/clk. It's purely an organizational thing and it can
> certainly be done later but it may be a good idea to do this to
> clearly split out the two different functionalities.

Hello Stephen,

Thanks for your advice.
The purpose of this series is to clean up the drivers and we can apply
new socs for it.

I didn't use the auxiliary bus before. However, I can study to the
implementation of auxiliary bus for this reset drivers in another
series. Is this ok for you?

Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
