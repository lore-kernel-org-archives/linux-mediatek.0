Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E87C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 12:07:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A45E264E5F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 12:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A45E264E5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i4hBWt2gOPDd+WYKvTP+tMrAXFhv+Zfew7uAksq0iEU=; b=3gF/0zNPzpQiF2upv8230iU4i
	rviAQdPN77+pUuSh2aYlIcXQI++7YilnnqWxyflKKowjETm4Jz8n/KyT+HohEJvjsxVqkPLtd6LlT
	nmFsi+IBKJwnPID9ziHSHIyUbk9CtZ/iwIX4uN91fLJMsyj3e/z/xPOnAfxCD9Xz4UMvfoCgOq4//
	iNj0UYc3Z1tDF1yU0W4OpOCLBDZUC47jWulNW+v1LIdRGvKOaysO2ZriGr98Gi+HIyCtS3wjbbpcU
	p5CzVY4DG445kHYCUZ57XQC3M4pN7ikkgxIboTHTJwaCZjC8oxjLS6BUw4YBQiQ9wRTvhMn1gbysb
	+bd22l2fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCi5h-0003Um-3W; Thu, 18 Feb 2021 12:07:29 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCi5f-0003UP-Cs; Thu, 18 Feb 2021 12:07:28 +0000
Received: by mail-ot1-x334.google.com with SMTP id c16so1663976otp.0;
 Thu, 18 Feb 2021 04:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UAF+AYB5tpUpq4+oyyh6f/zszxtQc2PJSl9KiMzzdLg=;
 b=nEORJ1zq5KEJsx/O+mUTUsGzEV58pXDCdz1GlwQUXjqtzU5Wb6ahDmbRFpnNxX3Ep1
 RuikxdpjNAM72y8iMky12EesUVKvF9XPaM6TsEvwJMiOqSsCeVbDvAYYo/fFfrrcTAJW
 nGEF2VVjrJ86uD/RO1f4dqqAtxYLfRzFIRA4pAfaYf5LUTJnyxL4n+yEqUq6FvBUrRok
 +WsrnCnf4aWFzfkNKsYmM6jdcmoWzLKq3RpnbSqrijGS8oNR8o4irvXSw7Q1dv6EaVBC
 bS/a1GJnsWAieHNkO+Z4d7nJl/Sih6Rk7GkR9JroLHF0XAb2D+0fiVQiWJqfna5bzfgF
 8epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UAF+AYB5tpUpq4+oyyh6f/zszxtQc2PJSl9KiMzzdLg=;
 b=HHKCsO8AZxTbzmfQr8WCnxuEODtbHRFV2Vm+qGR6CQw8XKPDU+4/qZ+pUx0IHse+nu
 ubeRyRGppKkO3IHJ/ydkJG1FSHQ/GOF5XSrMXr3WuCeCeAlhI7c4gYY0i+OSdNBkTl9s
 N3Fi7J/feHMz0Zm5BqMQwuxwXsjmHa0TxWnW6T5ZW9jZy4XKokewEnaO4w2yJ0iAkUhg
 YOXYrY/tFBeLLkg7tmJ64pUFaoAYNmTByEfxJjgy6W2iH1s9fqV40xy547ESLalYKWK9
 Es879qVgzkMp8pWPNBsqEyrQ1My5nEojFdizLqgwrH7oqg9IIAiy2tu31vgVD3FAffm3
 /gbg==
X-Gm-Message-State: AOAM530P8kMNeK92WJphAaFolJSXO35DlixETE/vGeGqWvZ3NiIJMzxa
 6hlbk0o71K3LrSB03RRKVsnRyTYnK2RCFwL5Aao=
X-Google-Smtp-Source: ABdhPJz5rL4/7PZwcbf5yGJPgwmcBEWoqsceFCttMg03TwgGMRqsXPc8r/vT9J0fTR7KBMJfbwI4SyTD54AeKCGVPmE=
X-Received: by 2002:a9d:7f86:: with SMTP id t6mr2664690otp.362.1613650044026; 
 Thu, 18 Feb 2021 04:07:24 -0800 (PST)
MIME-Version: 1.0
References: <1605782884-19741-1-git-send-email-weiyi.lu@mediatek.com>
 <CAFqH_522NuGY9c-_XWhHxoa3QkrdoM92qTOLxgM8PpOU=-ttbw@mail.gmail.com>
 <1605791419.19819.4.camel@mtksdaap41>
 <CAFqH_51m5Pg9ny4HWt1iwf8wtsGSdShpDCVaGwac=v9BBDj2vg@mail.gmail.com>
 <1f25cc3f-324a-0020-7bf2-e5a915291522@gmail.com>
 <1606734983.24689.1.camel@mtksdaap41>
 <1613644263.10586.8.camel@mtksdaap41>
In-Reply-To: <1613644263.10586.8.camel@mtksdaap41>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 18 Feb 2021 13:07:12 +0100
Message-ID: <CAFqH_51m7zXQ1G-KxhKxH0dPXrgfi=2JgmnncON_XqthpF9U0g@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add mt8192 power domains
 controller
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_070727_517470_B58024E5 
X-CRM114-Status: GOOD (  31.67  )
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Weiyi,

Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dj., 18 de febr.
2021 a les 11:31:
>
> On Mon, 2020-11-30 at 19:16 +0800, Weiyi Lu wrote:
> > On Fri, 2020-11-27 at 13:42 +0100, Matthias Brugger wrote:
> > >
> > > On 19/11/2020 15:13, Enric Balletbo Serra wrote:
> > > > Hi Weiyi,
> > > >
> > > > Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dj., 19 de nov.
> > > > 2020 a les 14:10:
> > > >>
> > > >> On Thu, 2020-11-19 at 13:13 +0100, Enric Balletbo Serra wrote:
> > > >>> Hi Weiyi,
> > > >>>
> > > >>> Thank you for the patch
> > > >>>
> > > >>> Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dj., 19 de nov.
> > > >>> 2020 a les 11:48:
> > > >>>>
> > > >>>> Add power domains controller node for SoC mt8192
> > > >>>>
> > > >>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > >>>> ---
> > > [...]
> > > >>>> +                       /* System Power Manager */
> > > >>>> +                       spm: power-controller {
> > > >>>> +                               compatible = "mediatek,mt8192-power-controller";
> > > >>>> +                               #address-cells = <1>;
> > > >>>> +                               #size-cells = <0>;
> > > >>>> +                               #power-domain-cells = <1>;
> > > >>>> +
> > > >>>> +                               /* power domain of the SoC */
> > > >>>> +                               audio@MT8192_POWER_DOMAIN_AUDIO {
> > > >>>
> > > >>> If you run the dt_bindings_check it should return some errors, as all
> > > >>> these node names should be 'power-domain@'. Which is a bit annoying
> > > >>> because then you will get a bunch of errors like this:
> > > >>>
> > > >>> [    1.969110] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    1.976997] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    1.984828] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    1.992657] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.000685] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.008566] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.016395] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.024221] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.032049] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.039874] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.047699] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.055524] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.063352] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>> [    2.071176] debugfs: Directory 'power-domain' with parent
> > > >>> 'pm_genpd' already present!
> > > >>>
> > > >>> But that's another problem that should be handled in debugfs system.
> > > >>>
> > > >>
> > > >> Indeed...so I chose to use different name in dts to avoid problems in
> > > >> debugfs. It does violate the naming rules.
> > > >>
> > > >
> > > > But your binding will not pass (or trigger warnings) the dtb check
> > > > then. Rob was clear that names should be generic. Proper fix is fix
> > > > debugfs not the binding.
> > > >
> > >
> > > By the way, is anybody working on this debugfs issue?
> > >
> >
> > I think we can solve this problem by adding "name" to the struct
> > scpsys_domain_data and use this domain_data->name as the genpd.name.
> > This is very simple. But I want to know if you both like it?
> >
>
> Hi Enric and Matthias,
>
> May I have your opinions on how you might to fix this issue?
> I'll try to give another name to each power domain in the
> scpsys_domain_data and register power domain with this name like below
>
> struct scpsys_domain_data {
>         ...
> +       char *name;
>  };
>
>
> -       pd->genpd.name = node->name;
> +       pd->genpd.name = pd->data->name ?: node->name;
>
>
> Does it violate the naming rules to some extent? or it's acceptable?
>

I think it could be acceptable, I think doesn't violate any rule. My
doubt here is we should name in a generic way in the form
'power-domain@addr' getting the last part of the full node name to
avoid conflicts or if the name should be driver-specific. I think it
makes sense to be driver-specific as is more helpful for debugging
purposes. If we do driver-specific (with data->name) I'd fail if is
not supplied.

Thanks,
  Enric

> > > Regards,
> > > Matthias
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
