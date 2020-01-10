Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C348C33C99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FD2F20673
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IvUQKtuc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9S1u6MU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FD2F20673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaWyidCTN21lNUIoLGtAw2/mTH086PJJdLsyDJB39Bo=; b=IvUQKtucUEeLkP
	fTkiJFP/7HWv2lwhS0+uM//tI2kisD+26d+LidL6Oo5+PfLLspbErD0fTxeYGM8zjTWQyUL4ok02Z
	T2jiFMRnx+v8YjHHRDsDLsTN2K9RhQJaHnaI25351Ddkdr6mBwzLYbdm1ifykTpdMcyHRRZrkGSsZ
	6sFl3Z2nwvQ4bAH+W11EeVShYB362M7hsZNHdEZaO10oX6AgZe7DAFFlXmIaxObFX6Wbg264XGIMs
	vym3jJxl+V2SXyq6ZkcpSUxbjjnck3rSt8v66qfgr14Zu9R54+T05SSOF3hR1+RYtolTmf71F0DQy
	Nvw8FUg/jJ2ty4OFEPlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipoqz-0006Em-Mq; Fri, 10 Jan 2020 07:37:09 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipoqq-00066h-2j; Fri, 10 Jan 2020 07:37:01 +0000
Received: by mail-pj1-x1041.google.com with SMTP id n59so629313pjb.1;
 Thu, 09 Jan 2020 23:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTj4OJccQHZ2BrF4urivSeZlUB6G0DA2jB2WOE566iw=;
 b=U9S1u6MURdSbih/awgcGfOrKcqm8Vkw7+33OoYTsoFVsWAOcNOyxVoIwr5xxwkDjfg
 GgNxv/WnxbAdFR1H68bnX2vI2cla0dT6WbZJb02XejnWHpKcOSOZRJ6OEau3nz4Fiz2+
 QTj/EpWng6qg/kdSWBMWoO3WUnb4/0a93XE0phpqok+ZuZDsw75BTlsjGbRE8D0X8get
 oC8r2haOMhnRRNIKOzbgGVehuNzhnpTDQlYXxwgez08WJNAQMhw7WgIe9L0TKOcYDdnN
 UfJn1M1CneOkhninJNPdVb40dtFJu1a7G5A51AUfaWE784PDwnPkIQQgpiFKFUxJOR43
 sIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTj4OJccQHZ2BrF4urivSeZlUB6G0DA2jB2WOE566iw=;
 b=gwhaUEcjm1s4r96vmvRaj2q2U6OZoBtEFWqOxQRMIIWO9a4j0xnFR1PbS/XccaTzpY
 pQeXaqhWKhXEtd6gH2abmnUksqW+Uc4b1X+TnIXWod3t61YKJ5B9ngx0KVKYUs1B85D8
 vxonBGsGlxdNMr8g+I7/Qz4quMS4eAFWgsMQeDyBB1FTcgmtZBhClBvptBva595qFGSl
 +YHRxGnbzgNR6Fn+EGry+0yXMhfvSYaVgyje5kcyoKaMS4cQrAka/ODXeDzVfRMy6d1d
 DRf6RSpLOoXjbTJbP0u6SI1Zp+JZ/qE/lF/ODP51nvz/nn3YLLaQAezAtjf/GanHxyQ0
 qOTQ==
X-Gm-Message-State: APjAAAUnWq+aBrJSsS50oRXiaOrDQEIRsbjO6P9cn+q1WF3g9oUN9PvH
 I7smDctdCDc+KDJZJZ4XBQG4J5+Ms4WMDX7Psg0=
X-Google-Smtp-Source: APXvYqzPmV7BK59xh7j+/AotZwJxnKvCKvDFyUX9AG5hXPOx5Bk8qmVEtPzgimgz8T9tDl1dzgD1mOB1nffV/fd5Xgo=
X-Received: by 2002:a17:902:8d96:: with SMTP id
 v22mr2634726plo.262.1578641819147; 
 Thu, 09 Jan 2020 23:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-3-fengping.yu@mediatek.com>
 <20200110013230.GS8314@dtor-ws>
In-Reply-To: <20200110013230.GS8314@dtor-ws>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jan 2020 09:35:30 +0200
Message-ID: <CAHp75VcELo3f5VYqGbgjgBzOZOj360+EPmRF5Oh3VqBAF8TeHw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drivers: input: keyboard
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_233700_125298_29CA1E13 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 wsd_upstream@mediatek.com, Stefan Agner <stefan@agner.cn>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>, YueHaibing <yuehaibing@huawei.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 linux-input <linux-input@vger.kernel.org>, Thierry Reding <treding@nvidia.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Aisheng Dong <aisheng.dong@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, fengping yu <fengping.yu@mediatek.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 10, 2020 at 3:34 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Wed, Jan 08, 2020 at 02:29:23PM +0800, fengping yu wrote:
> > From: "fengping.yu" <fengping.yu@mediatek.com>

...

> > +static void kpd_get_keymap_state(void __iomem *kp_base, u16 state[])
> > +{
> > +     state[0] = readw(kp_base + KP_MEM1);
> > +     state[1] = readw(kp_base + KP_MEM2);
> > +     state[2] = readw(kp_base + KP_MEM3);
> > +     state[3] = readw(kp_base + KP_MEM4);
> > +     state[4] = readw(kp_base + KP_MEM5);
>
> Please use memcpy_formio() here.

Actually it's not an equivalent and may have side effects.
I already told somewhere that we lack of
mem*_*io{32,16,8}() implementation.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
