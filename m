Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9398C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9xU3HtNxDa0bN8qGjpGrwVg2nU91VYKb0N8x3BrWzw=; b=zgx0kyxzQnRAPK
	Cj9ah4SJ/quprQGqC1XLiVxTJS0ld4jrdMRRYOWfI1SLKU/bsVNxf8q2pfOkeVR1HZSs6tL1O49bz
	VLX3DFexd4Y1QGhg5k8VwBaO0gsqeEJPSXRaRWHnh1Fk3atSQgr+GtcMvGuB0Qg7E/NkSbg2g23++
	2lmTMw3P6w0mcCe4/A9UaKN8jFUMqXVmqUgRC8SioYaf/dIZFmfz+nKDYKocWpARTZvKl521+3v2l
	YPmd6LXTgIr2hoTaPiavzcri4arwtAqzd2yCrK+wUJjczgJepTslvX/P/YXEBajD12tG1HQbbg+0x
	jPwe2agv9Jf49LbHLYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjP6-0032vl-Cg; Thu, 02 Jun 2022 11:54:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjOt-0032rJ-WA; Thu, 02 Jun 2022 11:54:05 +0000
X-UUID: 149db77288e34ae8bec693529834b51e-20220602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:c33adde9-9dce-40f7-9208-0731c8437a97,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:5c2fb26e-b02c-4af4-b838-5c14aaa063c7,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 149db77288e34ae8bec693529834b51e-20220602
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 552656323; Thu, 02 Jun 2022 04:53:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jun 2022 04:53:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 2 Jun 2022 19:53:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jun 2022 19:53:53 +0800
Message-ID: <a1140bd47cbd68436d0b9e147c2d6d6327ac092e.camel@mediatek.com>
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 2 Jun 2022 19:53:54 +0800
In-Reply-To: <9e3f5586-59fa-42cc-770c-b8694b4f2bf3@linaro.org>
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
	 <c0a188e5-8a8c-d4a3-5a3d-9b9dd85d8f44@linaro.org>
	 <eb4deff1a01c09783518bbaff8fe4e4c4ca6fa5b.camel@mediatek.com>
	 <591767ee-e349-7a17-a9e9-b95d0500c7c1@linaro.org>
	 <774c075ca4ad815c88be755cfb51889a171e835d.camel@mediatek.com>
	 <9e3f5586-59fa-42cc-770c-b8694b4f2bf3@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_045404_093120_5C79FF49 
X-CRM114-Status: GOOD (  32.11  )
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

On Thu, 2022-06-02 at 12:45 +0200, Krzysztof Kozlowski wrote:
> On 02/06/2022 12:19, Tinghan Shen wrote:
> > Hi Krzysztof,
> > 
> > On Thu, 2022-06-02 at 09:40 +0200, Krzysztof Kozlowski wrote:
> > > On 02/06/2022 08:44, Tinghan Shen wrote:
> > > > > > +  mbox-names:
> > > > > > +    items:
> > > > > > +      - const: mbox0
> > > > > > +      - const: mbox1
> > > > > 
> > > > > These should be rather some meaningful names, e.g. "rx" and "tx".
> > > > 
> > > > The mbox name has to align with the adsp ipc driver.
> > > > The adsp ipc driver is using 'mbox%d' for mailbox channels.
> > > > 
> > > > 
> > > > 
> > 
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=9db69df4bdd37eb1f65b6931ee067fb15b9a4d5c__;!!CTRNKA9wMg0ARbw!1TmempNkQhC5QuLBhyfWo_AC97MoLuWipsGV-LPaW9RKNPheU7Bgc-eboNi1JA1nC5I$
> > > >  
> > > > 
> > > > 	chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> > > > 
> > > > 	/* ...snip... */
> > > > 
> > > > 	adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
> > > > 
> > > > Is it ok to continue using these names?
> > > 
> > > It is a bit confusing... how did that driver got merged recently without
> > > bindings? Why bindings are separate?
> > > 
> > > The bindings always come together in one patchset with the driver
> > > implementing them. Bindings are though a separate patch, yet still
> > > followed by the driver which uses them.
> > > 
> > > I do not see any compatibles in that driver, which suggests there is no
> > > other binding using it. If that's correct, then you need to change the
> > > driver.
> > > 
> > 
> > The mtk-adsp-ipc driver's sole function is to encapsulate the operations 
> > of mailbox framework from adsp ipc users. The mtk-adsp-ipc is not defined 
> > in the dts file and we don't need it to be defined. The creation of mtk-adsp-ipc 
> > device is requested by adsp ipc users via the use of 'platform_device_register_data'[1].
> > 
> > the driver implemented the mailbox framework is 'mtk-adsp-mailbox'[2]. it has 
> > corresponding hardwares and a yaml file[3] to describe it.
> 
> I don't understand how is this related. We talk here about the
> mbox-names for this bindings file. You replied, that these bindings are
> already used by something, but now you say that they are not? So why do
> you need to change anything in any driver?
> 
> Simple question - do the bindings here "add mt8186 dsp document" are
> used by any specific Linux driver already?

This bindings, 'add mt8186 dsp document', are used by the SOF sound driver of MT8186[1]. 

I'm sorry for miss leading you in previous reply. I was thought that you're 
asking why the mtk-adsp-ipc driver got merged without bindings. So, I tried 
to explain why mtk-adsp-ipc doesn't have bindings.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=1f0214a86de87011ecb96f22545dd6e5c7324cd7

Thanks,
TingHan


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
