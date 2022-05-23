Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3fM4pW6nwBedWA6jwDHA1CMX2HVxyq9Wplh5+EmXgw=; b=nNRoeplY4MoW73
	yjICjja9TzzX5Ef6R/p5MyF8IAX/NWRHa4XE7JTSfqW6rARbgGLLZjwTOJjWDp5GXiRcb91Q68lsj
	axpd+boeMP8oXeJy5bPMd0WZYYhP1wP83xmDrjTCBP12IMN3HbSUG87zUPftXwLMjN+gQJZUOFvsK
	vkbj7RmPFj+MlpciRh6OUlxDb2ObR7aA0BpgtSaLBzulXtcxOGEOang9bKfYt71+Niwm2nPaDFUtW
	CK8RoAZA3+8apE5WAl/lczbcT0GnV0xMRsu8ku+Fu6Xi2gy7E9y4bHF7rKeUGEtMk8fBjmnsli/G6
	KpT6gV4bCgqPamLBMW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt36f-002Ilz-5V; Mon, 23 May 2022 08:08:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2pl-002BHI-OA; Mon, 23 May 2022 07:50:35 +0000
X-UUID: f01d83957f174c90a1079df873fac038-20220523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CFu2fMXnEln4FvFPvn1c1F8wnYFEkvIt++aVx9D3E5k=; 
 b=XH5ItWyXAyzPJqK7xac7yIRR6R/u/DMhdZWOe/HnatdAECI7xCLB60sKg8MqXYCo5s0KLHoX5AHSonyZ9I5idncasIHyAWAHzPCGI2snRy7xojMczdMGsEOpoA89kKut4BrUkK//Gf4tnDd5afyVp4KUk07ZtLh28/dD6P00Qxc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:a2d6a18d-3111-4e41-b455-ef54ee9f68f1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:f030437a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: f01d83957f174c90a1079df873fac038-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 792936284; Mon, 23 May 2022 00:50:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 00:44:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 15:44:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 23 May 2022 15:44:55 +0800
Message-ID: <8362953b3f6e5290cbba3aa06f9bfa2535efadb3.camel@mediatek.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
From: Axe Yang <axe.yang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Satya Tangirala" <satyat@google.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Eric Biggers <ebiggers@google.com>,
 <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <swboyd@chromium.org>,
 Lucas Stach <dev@lynxeye.de>, Chaotian Jing <chaotian.jing@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-mmc@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Tian Tao
 <tiantao6@hisilicon.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>,
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 <angelogioacchino.delregno@collabora.com>, Yue Hu <huyue2@yulong.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>
Date: Mon, 23 May 2022 15:44:55 +0800
In-Reply-To: <1652965539.952223.1359564.nullmailer@robh.at.kernel.org>
References: <20220519111323.14586-1-axe.yang@mediatek.com>
 <20220519111323.14586-2-axe.yang@mediatek.com>
 <1652965539.952223.1359564.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_005033_853033_C6FC5B0A 
X-CRM114-Status: GOOD (  20.86  )
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

On Thu, 2022-05-19 at 08:05 -0500, Rob Herring wrote:
> On Thu, 19 May 2022 19:13:21 +0800, Axe Yang wrote:
> > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > This feature allow SDIO devices alarm asynchronous interrupt to
> > host
> > even when host stop providing clock to SDIO card. An extra wakeup
> > interrupt and pinctrl states for SDIO DAT1 pin state switching are
> > required in this scenario.
> > 
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 53
> > ++++++++++++++++++-
> >  1 file changed, 52 insertions(+), 1 deletion(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/mmc/mtk-
> sd.example.dts:50.36-37 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:364:
> Documentation/devicetree/bindings/mmc/mtk-sd.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1401: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

I reproduced the build error, sorry for that.
And it has been fixed in v11. 

Regards,
Axe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
