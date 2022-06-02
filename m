Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D5C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B11xrEmc2AMj3261+J8AoRv3dIUXO5sKhuxiQp7j/Is=; b=e+nQSzCdvghFMp
	DzXudWM88ikN2TECk+Z85jWy/7K4O4EdnZ3H8yAVKt1XyNJY+XhicluQo7O6Zs6cLmptsMHOK5CF6
	HWLyleInunctW6beicyRhbiX/xlT8RheiYkkW0QNbpuhF9G0Psi9pe3iffTRrVqil4WQKsNYEbjN6
	jQA3lTvm47eCTB9RH9RGXxKWt88JVlUIMNBYgO/1KeqkQ/PTBP28iDnnd8KSg7co67iARDo8CWNn+
	V76qb3eS+8uFpBU/6t4qPI/H/lab84tom/A3WNAOBtlqlxq44hZ9xs3bEdce5kY7uJivw+iz5Ofdu
	DCW7+Qrc+xuY8RjgwX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhvq-002lln-3E; Thu, 02 Jun 2022 10:19:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhvd-002liN-6Y; Thu, 02 Jun 2022 10:19:48 +0000
X-UUID: 329b05e967d24d10ac99f7f1d8054b9e-20220602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:49895afe-9580-4338-aab0-3f66d52d9e70,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:ad5daf6e-b02c-4af4-b838-5c14aaa063c7,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 329b05e967d24d10ac99f7f1d8054b9e-20220602
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1077168541; Thu, 02 Jun 2022 03:19:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jun 2022 03:19:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 18:19:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 18:19:36 +0800
Message-ID: <774c075ca4ad815c88be755cfb51889a171e835d.camel@mediatek.com>
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 2 Jun 2022 18:19:36 +0800
In-Reply-To: <591767ee-e349-7a17-a9e9-b95d0500c7c1@linaro.org>
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
	 <c0a188e5-8a8c-d4a3-5a3d-9b9dd85d8f44@linaro.org>
	 <eb4deff1a01c09783518bbaff8fe4e4c4ca6fa5b.camel@mediatek.com>
	 <591767ee-e349-7a17-a9e9-b95d0500c7c1@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_031945_295050_FA17E226 
X-CRM114-Status: GOOD (  23.36  )
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

On Thu, 2022-06-02 at 09:40 +0200, Krzysztof Kozlowski wrote:
> On 02/06/2022 08:44, Tinghan Shen wrote:
> > > > +  mbox-names:
> > > > +    items:
> > > > +      - const: mbox0
> > > > +      - const: mbox1
> > > 
> > > These should be rather some meaningful names, e.g. "rx" and "tx".
> > 
> > The mbox name has to align with the adsp ipc driver.
> > The adsp ipc driver is using 'mbox%d' for mailbox channels.
> > 
> > 
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=9db69df4bdd37eb1f65b6931ee067fb15b9a4d5c__;!!CTRNKA9wMg0ARbw!1TmempNkQhC5QuLBhyfWo_AC97MoLuWipsGV-LPaW9RKNPheU7Bgc-eboNi1JA1nC5I$
> >  
> > 
> > 	chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> > 
> > 	/* ...snip... */
> > 
> > 	adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
> > 
> > Is it ok to continue using these names?
> 
> It is a bit confusing... how did that driver got merged recently without
> bindings? Why bindings are separate?
> 
> The bindings always come together in one patchset with the driver
> implementing them. Bindings are though a separate patch, yet still
> followed by the driver which uses them.
> 
> I do not see any compatibles in that driver, which suggests there is no
> other binding using it. If that's correct, then you need to change the
> driver.
> 

The mtk-adsp-ipc driver's sole function is to encapsulate the operations 
of mailbox framework from adsp ipc users. The mtk-adsp-ipc is not defined 
in the dts file and we don't need it to be defined. The creation of mtk-adsp-ipc 
device is requested by adsp ipc users via the use of 'platform_device_register_data'[1].

the driver implemented the mailbox framework is 'mtk-adsp-mailbox'[2]. it has 
corresponding hardwares and a yaml file[3] to describe it.

I'll send a patch to change the mbox name at next version.
It's better to have some meaningful names as you said.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=e0100bfd383c7d994d2e957e85ca56a5fe5a3f43
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=af2dfa96c52d042df5deb29fb6e32d3ff4d76a61
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=afa092e1e8824363d3174fef329c034445c111d5

Thanks,
TingHan



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
