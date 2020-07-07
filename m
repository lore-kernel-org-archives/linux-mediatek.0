Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1253AC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:34:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D179C20738
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLBuTTgs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dRxCuE1+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D179C20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ospq8gVp9ogrfKWeiBntK78gq2jaSWnYQ8/IKcbYh04=; b=bLBuTTgs31RKHJfAErONhnPjq
	MSRMDSBm/ytDlaeqgCEo1gYbpLfOg46dzGta2p/0LGpt8owA3ZnMQcjiQ0RjGQy519HqgYFpBb7EI
	R0lGUIvzYKde5mjSXUzU6d9SkQv00Xf1vSKUBY1yK7pyM9idppFEJjo/SeJApDkRqvRIW420he6uj
	/lKWdq7Xwvm5rBoilWCj4vGYdPHW8BNczTv7wlCUyvI8Mjvf2WnpYf5yVKf+//mtX7DhKqa/MRpjE
	5H3Rl0LkxYNd3X2sFTGz5/jP9J/56HjanF3OwsMUuSU358nbyNhrSSl32sGN1zP/IARPcPi3oFYlY
	3QNQcekCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jslrj-00063p-IG; Tue, 07 Jul 2020 11:34:23 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jslrh-000633-JM
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 11:34:22 +0000
Received: by mail-lf1-x144.google.com with SMTP id t9so24494670lfl.5
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2020 04:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZWFCdEUgk5dfzDM3fhNe+v2tWxrsCvDUWA3/QI1yjsA=;
 b=dRxCuE1+l4lJyQ2YbJAaOdam3ofJb8lgOtEdWezxKOyRRyDMxmvt7gEf0x6w0E8JX6
 zfj7ZoIxtLjX0RoOMTlhhp7h2JjwzRPmSlFeghxpjgBnoebMvd8IizTdR+RZTz7Tb7e8
 GWLtSt2RMzfl/2xH9EXD3CfW9B5mBTWTW6Qi28YrmmDUD8WfYzAp+GMW/NX1sf2jcim9
 p9TV40K9JWSp95sXcbLXnhApLLu0A0ABHN7alxdXkM1r9I/97RVRvjvbSl0rwCFDnrds
 MgVQ5wl2VKBhy5HWTXFp0joV93UB52d4AMRaTt7+yi4p9Oni+yYVsyZGW1Ys135suUi7
 NP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZWFCdEUgk5dfzDM3fhNe+v2tWxrsCvDUWA3/QI1yjsA=;
 b=atKDuclywPnhvRLS3hP9kV+9qvz9iDchdP0QoozmnxMBQ/HW+nYx8VX36gz594xvjU
 92tghWEvMYNYNJGcCw4/iDpRU/LETyiDhXHdwoUY4Yvx7sLdThR1aerlluBgV7hputUx
 5lBAbuWboy9OjfqFIXJktvqmjX3EAB1Pn5zCpfkTtt832pC0gDKNUkRQFU72g7vcY1Wf
 kJVgPbDFLXgjygztsocpY4UfZGro6ZHrF0eOioMcq7G47BgIciLnGO2qDlDMPPW7pUi8
 6EHApVOj285e0en32DU5ARXKb8ng/tGyVZIAT+U+aRmMgDFPf3dOUdfpiwakcYrltJeY
 GXLw==
X-Gm-Message-State: AOAM532OtFQcsiNtmg3f9tUYt6S4ZLAvXgYz+Qhp7Zzyp/gX1IQDrh9m
 mOZQSKQV0jH5svpQ39satyO1ddOSkgoXKTBFj94RDP72eR4=
X-Google-Smtp-Source: ABdhPJyIiIuyUQqHN3zlh6wrnfN64GqNkLKnTcdf/MuoVjXEMgRphXgXP3Wlti/RgXHlE/J8tuuX/mMRGR2kcN3VA8g=
X-Received: by 2002:a19:745:: with SMTP id 66mr32821101lfh.77.1594121660274;
 Tue, 07 Jul 2020 04:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
 <CACRpkdavqjcma8A1y9Sh=WWLu-n0+mQOhyNw2dHenA8ZnQkvgg@mail.gmail.com>
In-Reply-To: <CACRpkdavqjcma8A1y9Sh=WWLu-n0+mQOhyNw2dHenA8ZnQkvgg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jul 2020 13:34:09 +0200
Message-ID: <CACRpkdb5TyictD3j_PE5JtBJmxX87Bk04YkxF1ErsbHwO4TSOg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To: Hanks Chen <hanks.chen@mediatek.com>, Sean Wang <sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_073421_661019_0111908A 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 7, 2020 at 1:31 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> > for virtual gpios, they should not do reg setting and
> > should behave as expected for eint function.
> >
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
>
> Sean if you're OK with this patch I can just apply it separately.

Ah nevermind since the next patch has your ACK I just applied this
too since it's a dependency. Yell if this is wrong.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
