Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32E9C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 10:31:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5027664DE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 10:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5027664DE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jQiLQfhRbjWWQvxtSR4t5SMwUgto1saruCsCVcwXSm8=; b=NPzLLUbEPbXGJRY96FR7RbGH4
	c8HE4/vU7Qxs4zxIjwOY+LH2Mg5kXEL3OJ6y/5QOY8dU9WMSJv5IQ+V1jrOXu9RNCszE1YefJoB4A
	E0arWyKYpQW1+IXoZeZixXSBYw+ZBZqzID91acCPwhr+pxj3qnyymmRpUHUqKwB7L7pm6yfsZ9gQk
	mnG2nsDdgkygcJaiDD99pNFymyYUXIfDAHW0xRhw2jf2B3/UYpt2juYRhTTholquhsPRpQeYArTTg
	o9pg/63r1YpIPAcOuDc/+lOep6woHTLL3yGAhQohUVtLIPDG094B1KlIMdmrirmb6fRBy5SD7dzqO
	LYJstTiCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCgab-0002wP-7D; Thu, 18 Feb 2021 10:31:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCgaW-0002vK-D6; Thu, 18 Feb 2021 10:31:14 +0000
X-UUID: 2c983cd9a6474c64b623006e8d01f7c7-20210218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eON87UBh4F9YZE2o4i+l3IiN/mJ3GXZV1FRvjVbIqC0=; 
 b=LeXI2DTFzLPmSm8dn0aEv8G3MR1FHCVy3J+TAPwJyGosZyEUlAvfKpceh74+twkU1H5CwhWcQgzSw9sso83EyCIvSrS+QYsUGTIHbP7Xb8DwnLP1DA5kLPougo3iFFURIkT9p/nveibo2Df8HyBwAZ7LYkkKLwPt6g+SqKkTpwQ=;
X-UUID: 2c983cd9a6474c64b623006e8d01f7c7-20210218
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1310517170; Thu, 18 Feb 2021 02:31:06 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Feb 2021 02:31:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Feb 2021 18:31:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Feb 2021 18:31:03 +0800
Message-ID: <1613644263.10586.8.camel@mtksdaap41>
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add mt8192 power domains
 controller
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>
Date: Thu, 18 Feb 2021 18:31:03 +0800
In-Reply-To: <1606734983.24689.1.camel@mtksdaap41>
References: <1605782884-19741-1-git-send-email-weiyi.lu@mediatek.com>
 <CAFqH_522NuGY9c-_XWhHxoa3QkrdoM92qTOLxgM8PpOU=-ttbw@mail.gmail.com>
 <1605791419.19819.4.camel@mtksdaap41>
 <CAFqH_51m5Pg9ny4HWt1iwf8wtsGSdShpDCVaGwac=v9BBDj2vg@mail.gmail.com>
 <1f25cc3f-324a-0020-7bf2-e5a915291522@gmail.com>
 <1606734983.24689.1.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_053113_199717_59020E65 
X-CRM114-Status: GOOD (  28.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-30 at 19:16 +0800, Weiyi Lu wrote:
> On Fri, 2020-11-27 at 13:42 +0100, Matthias Brugger wrote:
> > 
> > On 19/11/2020 15:13, Enric Balletbo Serra wrote:
> > > Hi Weiyi,
> > > 
> > > Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dj., 19 de nov.
> > > 2020 a les 14:10:
> > >>
> > >> On Thu, 2020-11-19 at 13:13 +0100, Enric Balletbo Serra wrote:
> > >>> Hi Weiyi,
> > >>>
> > >>> Thank you for the patch
> > >>>
> > >>> Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dj., 19 de nov.
> > >>> 2020 a les 11:48:
> > >>>>
> > >>>> Add power domains controller node for SoC mt8192
> > >>>>
> > >>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > >>>> ---
> > [...]
> > >>>> +                       /* System Power Manager */
> > >>>> +                       spm: power-controller {
> > >>>> +                               compatible = "mediatek,mt8192-power-controller";
> > >>>> +                               #address-cells = <1>;
> > >>>> +                               #size-cells = <0>;
> > >>>> +                               #power-domain-cells = <1>;
> > >>>> +
> > >>>> +                               /* power domain of the SoC */
> > >>>> +                               audio@MT8192_POWER_DOMAIN_AUDIO {
> > >>>
> > >>> If you run the dt_bindings_check it should return some errors, as all
> > >>> these node names should be 'power-domain@'. Which is a bit annoying
> > >>> because then you will get a bunch of errors like this:
> > >>>
> > >>> [    1.969110] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    1.976997] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    1.984828] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    1.992657] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.000685] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.008566] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.016395] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.024221] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.032049] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.039874] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.047699] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.055524] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.063352] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>> [    2.071176] debugfs: Directory 'power-domain' with parent
> > >>> 'pm_genpd' already present!
> > >>>
> > >>> But that's another problem that should be handled in debugfs system.
> > >>>
> > >>
> > >> Indeed...so I chose to use different name in dts to avoid problems in
> > >> debugfs. It does violate the naming rules.
> > >>
> > > 
> > > But your binding will not pass (or trigger warnings) the dtb check
> > > then. Rob was clear that names should be generic. Proper fix is fix
> > > debugfs not the binding.
> > > 
> > 
> > By the way, is anybody working on this debugfs issue?
> > 
> 
> I think we can solve this problem by adding "name" to the struct
> scpsys_domain_data and use this domain_data->name as the genpd.name.
> This is very simple. But I want to know if you both like it?
> 

Hi Enric and Matthias,

May I have your opinions on how you might to fix this issue?
I'll try to give another name to each power domain in the
scpsys_domain_data and register power domain with this name like below

struct scpsys_domain_data {
 	...
+	char *name;
 };


-	pd->genpd.name = node->name;
+	pd->genpd.name = pd->data->name ?: node->name;


Does it violate the naming rules to some extent? or it's acceptable?

> > Regards,
> > Matthias
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
