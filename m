Return-Path: <SRS0=qWQ0=HI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41257C433E6
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Feb 2021 03:02:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52AF64FAE
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Feb 2021 03:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52AF64FAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mjpg/IJWxMmiM8QzXcIJ8lSJt8j50w5bsLso1jrxALY=; b=FXbhXVCqLln3tQVu9+q+DTQfF
	mOaMjoD650ZaOhYEYtLXCrVFaR/Mn/HA8+QwFz/laVNayYrzJqlHIuC5NTPBYoKIp967jMbY/ckb3
	NTymH6iAGxeRlmEIE3/qYhuG7mms/oJla3UAXcRHyFZprnNLFdMuyZ1zW0RZoZ+Ixt60JweE3JGCl
	e80yNVm0OT7MhC5uVyVKFbgxCdiP80Zu9Xx6BoSwrcAsm24gWR92B0wqf2sjfXKrcNmN28rFvkK3o
	iZn+C5Czndwz9N+mhmq2gf4RIsFNN40ZK8NQn4Z82BFb/GE9hKrEXMJOe+cy62Wr+6d9QxGN5jliP
	mrOPCkfKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8DrV-0008Ms-QX; Sat, 06 Feb 2021 03:02:17 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8DrR-0008LU-2G
 for linux-mediatek@lists.infradead.org; Sat, 06 Feb 2021 03:02:14 +0000
Received: by mail-ua1-x92d.google.com with SMTP id c8so2773325uae.13
 for <linux-mediatek@lists.infradead.org>; Fri, 05 Feb 2021 19:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vuPLugpx3nVqN901hZhHAJ68fe+2jLjEwlOR0tJDXYA=;
 b=F6opSYqv6jZOIDMw2g1ehsjaiUwtHudjb08fDacbv/EDpLlwSpy4IMI9fFhh8IsrUR
 6z2eJKGywevwZfoGwCPGT5Nm9kzq//cAUkMjmj4ttLr0H4RuMnf0xAHFZ3WXDK2CX4Jv
 kxl/y2itpTtbDt2HwFVoyjCBpFYEnW27WBFeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vuPLugpx3nVqN901hZhHAJ68fe+2jLjEwlOR0tJDXYA=;
 b=E+5GepO7rQrK3YbRs1QUYun1t5KLb/jceGUz8QdIsmP/KQb3kKuJhrw9LGtmQjtxOY
 dKm9Mp/vH/x2ZtJNZTmN+U4lroBldZznGWe83bwffJ3rDNGwaPD4fdLSKjdd5crykmsh
 GcPr4aRFloGRRq6m3y6sjysUjsn5IpmJqtyavDr+mV8Lq6DX1iFFZOB89wGeFW2bAVVd
 LV0s5nVctgf8X/PAFgNfS+A4zs5CaL9gaxgASBDAyxm6CDvaiqon38ajJK5K5xuFtBgQ
 /FiiYtIoLz1fluOa6JlHBBQt0AfwkmPMAiCSBOGsLt7h3nr+TV99EzQTACHwQrBM6DaZ
 kn1A==
X-Gm-Message-State: AOAM530+PgdtbYUazZzlhIZQL/lJC6xArTB4NZPb6aL5FIbpVhN32N+b
 l2FdXzInhtQIAgnuy3mwKyAbx0DqSh1aSDTe30nCyg==
X-Google-Smtp-Source: ABdhPJx8dqL+kHCdeyZ4DlETrA6syQ9QDsjU5KGZ5QnyvgeCk+5tYIv9ZfqZvBXd6LQikBo/7yMyvzQGpgRlw96uTRc=
X-Received: by 2002:ab0:20d:: with SMTP id 13mr2631762uas.27.1612580529357;
 Fri, 05 Feb 2021 19:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
 <20210205175543.GA3363048@robh.at.kernel.org>
In-Reply-To: <20210205175543.GA3363048@robh.at.kernel.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 6 Feb 2021 11:01:57 +0800
Message-ID: <CANMq1KAshVgWPp=4KpjkwfAD=N4ZOw0xBCZHkfGob-TY0RCGew@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_220213_125160_868BE037 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kristian Kristensen <hoegsberg@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Feb 6, 2021 at 1:55 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 26 Jan 2021 09:17:56 +0800, Nicolas Boichat wrote:
> > Define a compatible string for the Mali Bifrost GPU found in
> > Mediatek's MT8183 SoCs.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >
> > Changes in v11:
> >  - binding: power-domain-names not power-domainS-names
> >
> > Changes in v10:
> >  - Fix the binding to make sure sram-supply property can be provided.
> >
> > Changes in v9: None
> > Changes in v8: None
> > Changes in v7: None
> > Changes in v6:
> >  - Rebased, actually tested with recent mesa driver.
> >
> > Changes in v5:
> >  - Rename "2d" power domain to "core2"
> >
> > Changes in v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> >
> > Changes in v3: None
> > Changes in v2: None
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

There were changes in v11, I thought you'd want to review again?

Anyway, I can resend a v12 with all the Rb/Ab if that works better for you.

>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
