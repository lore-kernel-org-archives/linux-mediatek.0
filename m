Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F266C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvX5P8dnGeTN2jgK1hp10eUgXAo2z+GHiFr+9Lgy7zU=; b=G0dHCRFeVnNkbr
	zSwo2ZP6pWiXB7mZ2LUAXjp894FCT0zyCXJPuhp1fjjTyJQ5uw3cenYKtZ3ZbdgiEeCc1IALYWH3J
	xtVf51ZknmRTGW3EHKhNdSwxYcSeg2cCTzXVHO86WsjNWhbhiqbyzLW82uQTo2rmUhJuYU4vwNNVw
	LT77vGBfKD3U09tEgMuq57NJ6ZCFBSSN45Kb+bb9ZfbcWxrgDY8Gr3IDBqfaL/4BTxY6n+F4Eld6V
	SV1PQAqsP8oKLScUB2v1corlUzhIeW59rQ3ulwhDFzQEWnp1G+Fy0+rzAVCipYFwH3+MvRFQCkvbR
	vdCbLqRdhEB3KxxLIlvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrycv-00BTVG-2U; Fri, 20 May 2022 09:08:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrych-00BTQ1-C3; Fri, 20 May 2022 09:08:40 +0000
X-UUID: da40a988fa6a4b47a5e09ba570abed63-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:c2ac67ff-db7b-4d5b-8435-306c181b28fe, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:cf45efe2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
 l,QS:0,BEC:nil
X-UUID: da40a988fa6a4b47a5e09ba570abed63-20220520
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1382684378; Fri, 20 May 2022 02:08:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 02:08:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 20 May 2022 17:08:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 20 May 2022 17:08:34 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chun-jie.chen@mediatek.com>, <jose.exposito89@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <p.zabel@pengutronix.de>,
 <rex-bc.chen@mediatek.com>, <sboyd@kernel.org>, <wenst@chromium.org>,
 <y.oudjana@protonmail.com>, <yassine.oudjana@gmail.com>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH 3/6] clk: mediatek: reset: Return reset data pointer on
 register
Date: Fri, 20 May 2022 17:08:34 +0800
Message-ID: <20220520090834.28515-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <5b5f6656-8694-dc78-ef42-7ce301849aa4@collabora.com>
References: <5b5f6656-8694-dc78-ef42-7ce301849aa4@collabora.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_020839_452908_F4A5C361 
X-CRM114-Status: GOOD (  26.37  )
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

> Il 19/05/22 15:47, Yassine Oudjana ha scritto:
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> > 
> > Return a struct mtk_clk_rst_data * when registering a reset
> > controller in preparation for adding an unregister helper
> > that will take it as an argument. Make the necessary changes
> > in drivers that do not currently discard the return value
> > of register functions.
> > 
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Hello Yassine,
> 
> Thanks for your efforts on helping to make the MediaTek clocks better - I agree
> (and I'm not the only one..) that there's a lot of work to do on this side.
> 
> Though... I don't think that this is the right direction: you're right about
> properly unregistering (in patch 4/6) the reset controllers on rmmod/failure
> but I'm not sure that this kind of noise brings any benefit.
> 
> Explaining:
> You definitely saw that there's a new register _with_dev, which uses devm ops
> and that's going to automatically cleanup in case of removal/failure.
> This is what we should do.
> 
> Hence, my proposal is to drop patch 3/6, 4/6, 5/6 and (slowly, steadily) migrate
> all of the MediaTek clocks from CLK_OF_DECLARE() to platform drivers (which also
> means that we can eventually change them to tristate!), so that we slowly remove
> all users of all functions that are not "_with_dev", and that we finally remove
> all of these then-unused functions as well.
> 
> Making sure that I don't get misunderstood:
>       I'm not implying that this huge migration work is on your shoulders!
> 
> P.S.: Chen-Yu, Miles: do you also agree? :-)

Agreed. 3/6, 4/6, 5/6 introduce mtk_simple_clk_controller, but we just got
ChenYu's patch merged to clk-next to switch to clk_hw_onecell_data, and
hoplefully we can test them in v5.18 or v5.19.
So I think we should wait for ChenYu's cleanup.

-	struct clk_hw_onecell_data *clk_data;
+	struct mtk_simple_clk_controller *clk_ctrl;

thanks,
Miles

> 
> Cheers,
> Angelo
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
