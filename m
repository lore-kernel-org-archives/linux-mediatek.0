Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254F9C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiNIg/zYZ38dNte35yIrwLt22pv5Z8LWSBq+qCcfUtU=; b=iwZ4whnIw8b/P+IFVk93zBouAL
	VWTCenyLPS5JgPzilVZKXlzpNgHuhBMju5uoLDc67T99kDvpl35U90km9bhNUnRuuM4zNPaMyLoqx
	q++/FGIkWJxCFyn5hVRJJU+anrTLC6ubIRowK/YWU6jtHpdcGyclVo/oeTCJucYER+cUgNE6jpNsC
	eddmZSPedua+7g1HNr3Ps2kAsH4Ji0SYDFv3FfbKGE4q2a7QNh3cNKt7udQ/IWgr1g+ULMYCQZNBG
	g6qGfY0Y1ALrD6GkoqqrlKiu86CzXFGjXwWeL9FvQOXXapGZoiEWPTWTvuaLJacOAc5Jyjji9QG+n
	rc7Jw3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRpn-00EfXC-Lc; Wed, 28 Sep 2022 07:50:23 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRpl-00EfVc-7M
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 07:50:22 +0000
Received: by mail-ed1-x536.google.com with SMTP id m3so16139412eda.12
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 00:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QiNIg/zYZ38dNte35yIrwLt22pv5Z8LWSBq+qCcfUtU=;
        b=NtzNSjvY4vyAUbLC8Ii0LP3f102njHedYSBGeDzF/hkB810Z7nZG7cmefrAHtpFxhe
         Zp9te2hkWiDhTDlHfjC2QXAsRum0CWIfAidozvY7YrY5zd9bMeLp3BBUkbc21Pm4fwYD
         bKKKOWtXTMb7XcHcBJO0GQJ2gYygtC4R68NE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QiNIg/zYZ38dNte35yIrwLt22pv5Z8LWSBq+qCcfUtU=;
        b=Jc3rv51dmLgkpdjruCCcpuiqV5IiIPyqwed30o+6CiEqdtVYlEECsx0DtjtLdRMPk2
         3AeKExyaNH0OtEYF4DqiI6URS3Xs+tj8AW0N1tjeRx1bF7ThjfFEWrc/b3gGkazI5PJY
         v7UmQyk6/T+vyHPSZJ1OqMJOCrrJZTUfDcAuvgaSUQ5S3L/BrBvE+4Y07RzypbtOZTBt
         bet2lRAv25l5ZwyNCSc9xMAvBCNOXRyZQwLbmbTx1tQiQcX4LiBXd2qXAKa7HRZafAUO
         nlEBnGS92A7fQH02EE+vJOgcTn4olsJLdAhXbZhIYZ+5rh4LqJJz3QAMauX+VXhh9m8J
         e/pA==
X-Gm-Message-State: ACrzQf2/nllYmt/B6RT8Gk1ODq4ZXFrDeSncKr2ZltNerV7eiL9SbI8M
	YwD6M3z3Eh23bctyMO3gfxITyRRyTUDO3j/5i1+EUA==
X-Google-Smtp-Source: AMsMyM6tdHhfxNIYTWCDrGO48E5DQKirqL+MmjRR/T8+Ih7026PNLiu8XfmJTZnxopqbAP43SYNBrqxzsdSO9XaLHp4=
X-Received: by 2002:a05:6402:1298:b0:457:c38a:2f10 with SMTP id
 w24-20020a056402129800b00457c38a2f10mr6387160edv.264.1664351418958; Wed, 28
 Sep 2022 00:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <0a1618c4-b808-56bd-e89f-560b0423191d@collabora.com> <20220928015507.17206-1-miles.chen@mediatek.com>
In-Reply-To: <20220928015507.17206-1-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Sep 2022 15:50:07 +0800
Message-ID: <CAGXv+5FLwrE-kiZ_opjB3NA=e2_tDoNUs6hKE-o9m_DXcQmcGA@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: mt8192: Do not re-register
 top_early_divs in probe function
To: Miles Chen <miles.chen@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_005021_321696_C4333330 
X-CRM114-Status: GOOD (  16.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 28, 2022 at 9:55 AM Miles Chen <miles.chen@mediatek.com> wrote:
>
> >> top_early_divs are registered in the CLK_OF_DECLARE_DRIVER() half of the
> >> topckgen clk driver. Don't try to register it again in the actual probe
> >> function. This gets rid of the "Trying to register duplicate clock ..."
> >> warning.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> >Can't we simply remove the CLK_OF_DECLARE_DRIVER() and top_init_early entirely,
> >and transfer TOP_CSW_F26M_D2 to top_divs[] instead?
> >I get that systimer concern and we have something similar in MT8195, where the
> >TOP_CLK26M_D2 is registered "late".
>
> Another reason for this:
> Removing the CLK_OF_DECLARE_DRIVER() is good when we want to build our driver as
> kernel modules because it does not work with kernel modules.

I agree. But as I mentioned in my other reply, we need to fix the clock
user first before dropping that clock. And there's also the matter of
DT backward compatibility. So we need to do it incrementally.


ChenYu

