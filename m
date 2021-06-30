Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EE9C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F1961D03
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3F1961D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82QPRyc7fi5D9G5VxtZ2CcPqQTnRmcEScx7QCOoR6Lo=; b=tHBpQFuLllbaWO
	DI69uCoCNtN+TqoNOtX4ZYGKLTtc4rLboKadgXvCP8nCY8dE8MO1wxULpQxnd0Qmb4k8wJS8U0Nvj
	RO/O3qO5BJHlsUbiy5ca1Im8evgOY3LY4a5Cy+GeDXJOS3vu+knCxGGXSDHRsPKWkYUvnjsQ7BmYN
	YdpSxhyEXGxXEFebe7LPBDfRF826Y7hsDT8J2gDNEzmWQVHOrCQYXMKVthqX0wtF+TNzfpQ2R3cDf
	qi/cwYSmD0HXCjDPMhgfExkDQ3dk68JXT6e/4Cuk4GRqWKXbx29LLTdm7I/UOuEDOrp590alZL1GA
	Qw2D0wJIVLnauWgNt/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUfQ-00D3Oo-R4; Wed, 30 Jun 2021 07:29:52 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUf3-00D3CZ-B1
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 07:29:31 +0000
Received: by mail-lj1-x231.google.com with SMTP id p24so1946562ljj.1
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WOz5FXFqlIUEejwuKtAkxrx7VDAh1RhiLyn80MGNpio=;
 b=Q0pzAtxbYpihfjoXE9FYAu2jSQauzQI5qhDX6gnA4OlPb2HGu/0vIiSb2f/0ycA1XD
 vgnsu2OkLCXNblx1anPjFEPbI6rD7ZbYveXHcu0uEAqBaU84GgphiKQzFa5Py63lyJto
 PhqD+iIJnnLSHXtRO9pvJO4socDpTbeyL6f4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WOz5FXFqlIUEejwuKtAkxrx7VDAh1RhiLyn80MGNpio=;
 b=dZQmhA33/D1TaZ0ya4m6CIzFuQblzkBjpDS4Uh7N6EArRFMHvTSNGEqymbS331xYx7
 nNqxP2ENbRJH4+K09++gMrWkShjfwuwpmCb2zc4Vj3KImkIIp7n7NZzp38m60uOgrLsM
 vw//ihb4zQyES/fBZncO4TyVSb3++mgbFOBFFuSp+JU/O8c6UVopDmnX5LD+BmOpy0Qu
 igPVBJsBQi2gfufoRwYa9O5embKC7VHe+y2P58ecCPxz8NNBXukzYNqWlt/MUVrHP9Ru
 6+D2oyCenp+evhHWw/REXmeihN7hRiee1sVg5g14A1KqnZdiMR8OaBx0gXSokdbQxsr8
 jLIQ==
X-Gm-Message-State: AOAM531R358FXMLIWKQnj0kNJuB8yYriZpgYjEeb8GL1KNHthcu8T35O
 IoDTF5/P+Pmeo7NhZ4wvypsQTFbadTLU/nQLlGj5EA==
X-Google-Smtp-Source: ABdhPJwYLSlGhsJsYqCeO7APTJb4qDm1dEtuszdzm+gIcVQiuh5EK3GdQGHHjxusv9UuYfUd7ZYs3NX98WcUnIJSOTg=
X-Received: by 2002:a2e:a583:: with SMTP id m3mr6793596ljp.305.1625038167569; 
 Wed, 30 Jun 2021 00:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210630035443.2144958-1-hsinyi@chromium.org>
 <CAGXv+5ERomKaid2wQ5Sz9CB-q+DVLMzWq08b+rkkh5=3WnG5Vg@mail.gmail.com>
In-Reply-To: <CAGXv+5ERomKaid2wQ5Sz9CB-q+DVLMzWq08b+rkkh5=3WnG5Vg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Jun 2021 15:29:16 +0800
Message-ID: <CAGXv+5GE_ksZseTWKLpwrZvQkLx64TvATYw_dGKzOCU1Jd0hKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: kukui: use generic pin configs for
 i2c pins
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, zhiyong.tao@mediatek.com, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_002929_396942_380E803A 
X-CRM114-Status: GOOD (  12.42  )
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

On Wed, Jun 30, 2021 at 3:27 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Wed, Jun 30, 2021 at 11:55 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > mt8183 i2c pins don't support PUPD register, so change to use generic
> > pin configs instead of let it fail and fallback.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

You might also want:

Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")

> On a side note, the `mediatek,pull-up-adv` property probably should be
> merged into `bias-pull-up` with an argument.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
