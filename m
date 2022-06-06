Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B90C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 02:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4ggHsycWxHstiMmYXl9So9RnCTBx1U5AnPjwoHuw7c=; b=IKkTECP4d7s/cJ
	1BEye2dMlGqVQ2J5yOaGBVaAPyCOPtkngRueJ5x44rh73fvrecht2m/dyPkLxbNxvhrofPectT5GS
	bKnh1cB4mMQDLhfjb+vLzKkvOTb6aCL9VD4Zht0ekbHapTWMegu6WcMIP+6NbQ9nz94Z2jQcYY8Ba
	ZH+VqjGl/uwoqO0TXL2+DMEM9uoOQHkVE7koOw6xBXse/0HSxRHSDKhiuLGGjEFC0DkbRU+a4YMTw
	YTdibdTvX6z4gcjIU54TJrZfuZaP+sn/AH+du2KZwFVVvW9nAtOP6DuryI80/P5GXQcWgm2kap4/t
	JfDdMuGXL2zP7GpxVxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny2tc-00GYMe-Cf; Mon, 06 Jun 2022 02:55:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny2tN-00GYL1-Ob; Mon, 06 Jun 2022 02:55:00 +0000
X-UUID: cd90ef72ccd44084920fb39c3ecd823f-20220605
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:1a91b9f7-2da9-4e38-a83b-a37c5909fe9f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:c0123f7e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: cd90ef72ccd44084920fb39c3ecd823f-20220605
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 237751123; Sun, 05 Jun 2022 19:54:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jun 2022 19:51:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 6 Jun 2022 10:51:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 6 Jun 2022 10:51:56 +0800
Message-ID: <fa71cdebe09b7939bccc3b4b4f40d62afdb09158.camel@mediatek.com>
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 6 Jun 2022 10:51:56 +0800
In-Reply-To: <2c610d82-65bf-60c8-05f3-434eaa1cfc8b@linaro.org>
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
	 <c0a188e5-8a8c-d4a3-5a3d-9b9dd85d8f44@linaro.org>
	 <eb4deff1a01c09783518bbaff8fe4e4c4ca6fa5b.camel@mediatek.com>
	 <591767ee-e349-7a17-a9e9-b95d0500c7c1@linaro.org>
	 <774c075ca4ad815c88be755cfb51889a171e835d.camel@mediatek.com>
	 <9e3f5586-59fa-42cc-770c-b8694b4f2bf3@linaro.org>
	 <a1140bd47cbd68436d0b9e147c2d6d6327ac092e.camel@mediatek.com>
	 <2c610d82-65bf-60c8-05f3-434eaa1cfc8b@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_195457_860066_C8D0C14F 
X-CRM114-Status: GOOD (  40.56  )
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

On Thu, 2022-06-02 at 14:26 +0200, Krzysztof Kozlowski wrote:
> On 02/06/2022 13:53, Tinghan Shen wrote:
> > Hi Krzysztof,
> > 
> > On Thu, 2022-06-02 at 12:45 +0200, Krzysztof Kozlowski wrote:
> > > On 02/06/2022 12:19, Tinghan Shen wrote:
> > > > Hi Krzysztof,
> > > > 
> > > > On Thu, 2022-06-02 at 09:40 +0200, Krzysztof Kozlowski wrote:
> > > > > On 02/06/2022 08:44, Tinghan Shen wrote:
> > > > > > > > +  mbox-names:
> > > > > > > > +    items:
> > > > > > > > +      - const: mbox0
> > > > > > > > +      - const: mbox1
> > > > > > > 
> > > > > > > These should be rather some meaningful names, e.g. "rx" and "tx".
> > > > > > 
> > > > > > The mbox name has to align with the adsp ipc driver.
> > > > > > The adsp ipc driver is using 'mbox%d' for mailbox channels.
> > > > > > 
> > > > > > 
> > > > > > 
> > > > 
> > > > 
> > 
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=9db69df4bdd37eb1f65b6931ee067fb15b9a4d5c__;!!CTRNKA9wMg0ARbw!1TmempNkQhC5QuLBhyfWo_AC97MoLuWipsGV-LPaW9RKNPheU7Bgc-eboNi1JA1nC5I$
> > > > > >  
> > > > > > 
> > > > > > 	chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> > > > > > 
> > > > > > 	/* ...snip... */
> > > > > > 
> > > > > > 	adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
> > > > > > 
> > > > > > Is it ok to continue using these names?
> > > > > 
> > > > > It is a bit confusing... how did that driver got merged recently without
> > > > > bindings? Why bindings are separate?
> > > > > 
> > > > > The bindings always come together in one patchset with the driver
> > > > > implementing them. Bindings are though a separate patch, yet still
> > > > > followed by the driver which uses them.
> > > > > 
> > > > > I do not see any compatibles in that driver, which suggests there is no
> > > > > other binding using it. If that's correct, then you need to change the
> > > > > driver.
> > > > > 
> > > > 
> > > > The mtk-adsp-ipc driver's sole function is to encapsulate the operations 
> > > > of mailbox framework from adsp ipc users. The mtk-adsp-ipc is not defined 
> > > > in the dts file and we don't need it to be defined. The creation of mtk-adsp-ipc 
> > > > device is requested by adsp ipc users via the use of 'platform_device_register_data'[1].
> > > > 
> > > > the driver implemented the mailbox framework is 'mtk-adsp-mailbox'[2]. it has 
> > > > corresponding hardwares and a yaml file[3] to describe it.
> > > 
> > > I don't understand how is this related. We talk here about the
> > > mbox-names for this bindings file. You replied, that these bindings are
> > > already used by something, but now you say that they are not? So why do
> > > you need to change anything in any driver?
> > > 
> > > Simple question - do the bindings here "add mt8186 dsp document" are
> > > used by any specific Linux driver already?
> > 
> > This bindings, 'add mt8186 dsp document', are used by the SOF sound driver of MT8186[1]. 
> > 
> > I'm sorry for miss leading you in previous reply. I was thought that you're 
> > asking why the mtk-adsp-ipc driver got merged without bindings. So, I tried 
> > to explain why mtk-adsp-ipc doesn't have bindings.
> 
> Then my question is kind of still valid:
> How did "mt8186 SOF" driver got merged recently without bindings? Why
> bindings are separate?
> 
> You cannot just sneak in usage of bindings in a driver, then submit
> bindings and say "we already have an user!". No, the bindings come with
> the driver. Always.
> 
> Linked patch [1] brings undocumented compatible mediatek,mt8186-dsp, so
> you should see big fat warning when running checkpatch. So this points
> that you did not run checkpatch which is another not acceptable
> submission. :(
> 
> [1]
> https://lore.kernel.org/all/20220422055659.8738-2-tinghan.shen@mediatek.com/
> 

I apologize for breaking the rules and sending inappropriate patches.

I was thought that it was acceptable to send community reviewed patches in a series, 
then followed the bindings at another patch. I was believed that separating un-reviewed
binding patch from reviewed driver patches would aid in patch acceptance.
Now, I see I make a big mistake. I'm sorry.

Best regards,
TingHan





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
