Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DE7C4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXPv40UKiN0pdjRRG3IPp8PXZI0C6Sv6kiLqHzLCQIs=; b=IGaKc1jwzUzCSwtqy4Rn1co6wu
	nZY/CNeE9bUg+GziYvB5YpvGZZ6pKpcOGQgU3ZRPoP53kXxWypQSokvRnYq5LzcGM1SUmmr3/w1cA
	2DiWtvClprjs7i6Y22nazQygj6975yaQWViKQNwNlcTPLQ0IIbeIF2s2iwiWHGcIgdh4defpSnElD
	yALlRwXP+hgCd4JI63GENIL3j05g94JvIOaFl46jYuX9TLQyam2TEwfu0byV8wUW6LW+kpjtyP4dM
	BdYEOzp0wjAfbi1Mk41lQw2qSbSORf0M+mSlnvQiosYmYvi0mbNLODm5L9uCFFkgTF2oFo4rPd7CD
	JRUb6NGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVGv-00DoJg-MI; Thu, 05 Jan 2023 18:47:25 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDGUh-00HRFv-4Z
	for linux-mediatek@lists.infradead.org; Thu, 05 Jan 2023 03:00:40 +0000
Received: by mail-vk1-xa36.google.com with SMTP id i84so10758800vke.7
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Jan 2023 19:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wXPv40UKiN0pdjRRG3IPp8PXZI0C6Sv6kiLqHzLCQIs=;
        b=Tfo7xSTMp3ZHBuKhEdl6YQmRWSu9evEhRA9jVD+XEmZAmX3OhILMv6/tagqg5JrWyJ
         O27AQX6qVsvvx/aztU+FHrYmR+DDWnZD4lWiXg21skl/w2F3cMa1s5PhiEFOum8ACThm
         bpho+D4ObOmG3/lykf3rbUDD+0e+0muT1Zxpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXPv40UKiN0pdjRRG3IPp8PXZI0C6Sv6kiLqHzLCQIs=;
        b=vu7AoiLQ4/KigdUXlMYnJCE4jmXNFnvwe5Y+DdKGN9ARPVBOAUFUT7drR9tpenlhDG
         4NkU4qT5x6oY1j69HTlVm3PpvcHWbulVtbuzDFSKSD8/vHosJL4HZ0RBrTO1NzEmn++g
         EvSf43QF4Aq+1MdwOkQqvYhCl/oEpvA9mrlK7OCsA/eM7KWjpNpLzdLhidRXKnAUGrAi
         paTBOeGSmMfvwPHJDMxk310Tmhw0ZGoykODReCHaJsW4IGTFYdzpXzdTBnHTrR2lh+YK
         uKrO1k/Dl4Hr7rz68KMnvMQPlqIcjtuBBUwbKl00+SMR95FHBhYh3Q8wipbHGfB9/5Td
         a3/w==
X-Gm-Message-State: AFqh2krnxlDdFwSwA5Wpg4lQrMlGNNx1DzMJaoGfKgDllw9SyPpMltgI
	MGCa/I3usupDKOVzreg8Ka7qU1VWhqO71k7GLGBBxg==
X-Google-Smtp-Source: AMrXdXv0eISHRGoQ1TN64WNdAr9dqLbmh2OyMms0GAzinCpYIPmx7WL0T/abKXd9uqh1oh8lQogUYj5HtSiUBb7k+Cc=
X-Received: by 2002:a1f:df84:0:b0:3d5:9e3a:538 with SMTP id
 w126-20020a1fdf84000000b003d59e3a0538mr2154545vkg.22.1672887632729; Wed, 04
 Jan 2023 19:00:32 -0800 (PST)
MIME-Version: 1.0
References: <20230104083110.736377-1-wenst@chromium.org> <20230104222213.GB2112402@p14s>
In-Reply-To: <20230104222213.GB2112402@p14s>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Jan 2023 11:00:21 +0800
Message-ID: <CAGXv+5Fh13ciPjrfK2F89QJavePHcBwMwThSALxEF+5CUdA_Yg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mtk_scp: Move clk ops outside send_lock
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_190039_240805_A91FCCDA 
X-CRM114-Status: GOOD (  17.09  )
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

On Thu, Jan 5, 2023 at 6:22 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Jan 04, 2023 at 04:31:10PM +0800, Chen-Yu Tsai wrote:
> > Clocks are properly reference counted and do not need to be inside the
> > lock range.
> >
> > Right now this triggers a false-positive lockdep warning on MT8192 based
> > Chromebooks, through a combination of mtk-scp that has a cros-ec-rpmsg
> > sub-device, the (actual) cros-ec I2C adapter registration, I2C client
> > (not on cros-ec) probe doing i2c transfers and enabling clocks.
> >
> > This is a false positive because the cros-ec-rpmsg under mtk-scp does
> > not have an I2C adapter, and also each I2C adapter and cros-ec instance
> > have their own mutex.
> >
> > Move the clk operations outside of the send_lock range.
>
> Thanks for providing such a clear explanation - it makes my job a lot easier.
>
> >
> > Fixes: ("63c13d61eafe remoteproc/mediatek: add SCP support for mt8183")
>
> This is the wrong format for a "Fixes:" tag.  Please see
> Documentation/process/submitting-patches.rst for details.
>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> I have fixed the above and applied this patch.

Thanks, and sorry about the brain fart on my end.

ChenYu

