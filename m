Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF2BC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 23:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyl0p8SQm1y6pAg3OTXhzJtHEYuVho6+udK41+XIoIw=; b=ux4LGC3PUa4QuXRO/ryGrwuKgx
	m6aPNHgCp+o0mP7hJSIrqX8I6oVET2azEzj9ZIsVCDvioqZAe/yU7VuADUbfH+dkrT7EzswcXyJ2o
	4HVUKRQav9DlCKN1pARoDXh64vaCKbizD1kfVGpbwyjU2e7Q7b1mLoT3kWB2gbMEEA8FXahqrdacJ
	apKyDVWh+EcuIPFvTZ7rnWMs9CQqiNgngItndGMDGWnenS8gBYP7iNSHDHhsjk9EPNRPOKMCh8gXl
	yvI/Yrs5Y0CPg2R6du6NVncM9RU+TrjOTMmO/B347b3++L9be2bizvTrnL49Gw5tMnPWuIIPI4kmv
	hD+Yn87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS4bi-003sOS-OU; Tue, 14 Feb 2023 23:21:06 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS4bY-003sMG-N4
	for linux-mediatek@lists.infradead.org; Tue, 14 Feb 2023 23:20:57 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4a263c4ddbaso228885607b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Feb 2023 15:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nyl0p8SQm1y6pAg3OTXhzJtHEYuVho6+udK41+XIoIw=;
        b=RUqMLnE+xU+QgkbgEHXrnDs9Uxky30vazz4NOSxlTFAFy7ZDasML5PI8RzhsmulwYr
         Bk/jVbb/sY8++VJhuGxdiK/kTonD+WfNXuUBlttxJ3s6NSTIyydT09X4slKafc6mYUxY
         /lXEwZ2gBT1+GYczbOg0WmOgHNPZmpmX9keUXZp+Am0KnMQmhjNql69YfxMQWj9GhSYE
         77SmA0OXWqimlkJVoRoacd+jSIUlgu2BxfOeUGaBoJV1APBuQjDkxxypaaIEd0zrx8pX
         Vs0SOfOqI+kAI1r6qvccUbvB9MLa/H8HaNao4MNAq4miHYvHGlGg/V9rJvIRSngVr8FY
         0k4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyl0p8SQm1y6pAg3OTXhzJtHEYuVho6+udK41+XIoIw=;
        b=M/qlzY+VAUOoGID4xOxZW1Vl1NwuOoML1/NDGY23AK+rBamtgWw6V1RA70k/wBQzCw
         Y4IStkj4H7Optwj4BkuJx+zIfu3SzXL2WqnpPcSU/WeVq00F6kdiiPRBSZpobd3PTun2
         Es3WXeseiwKK8aAs9/qS32aNEYSg2zCSZ7shvmMBsFHhfiP/KcIJJ+miWit3MjAHPnWr
         cu5ADNTcraRFJggapUXCNEt3OUZj+9KVe5mAncsIfcCGvfz/z9xq6mLA5L4CzN0A67TP
         GMvAysK0LWzTbQ7OY5Z9PRyw8MiesacHiAnV4+EXjmJEx8AuG5cKhApFhIfdPfqNQHJo
         XfIg==
X-Gm-Message-State: AO0yUKUYykcKOw+he8hOcr2WqsFfYMCu20AdCJ+seeWhGYF/PzpAu/fM
	oQFcom15QobGBNyHcoOlG7AtXmd8R2w2+qYXCtVY
X-Google-Smtp-Source: AK7set81DXuGY+35pmRfQRXMfyIQZfomwDZTe26wQ1wU4OiYtSU6DIRVKjiSSoFcGoSfR5ybJ6mHFK0A9alC75TzZLo=
X-Received: by 2002:a0d:f002:0:b0:52e:d52e:97d0 with SMTP id
 z2-20020a0df002000000b0052ed52e97d0mr40421ywe.117.1676416854744; Tue, 14 Feb
 2023 15:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com> <1726f1d2-7411-2b49-79cd-f5aecff2d19e@linaro.org>
In-Reply-To: <1726f1d2-7411-2b49-79cd-f5aecff2d19e@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 14 Feb 2023 15:20:42 -0800
Message-ID: <CANDhNCrYaepM3d-xHybqc9n5j0q0iMfPiTGPZKskEWjqjD6nRA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Maciej W . Rozycki" <macro@orcam.me.uk>, wsd_upstream@mediatek.com, stanley.chu@mediatek.com, 
	Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_152056_756969_97406F53 
X-CRM114-Status: GOOD (  12.18  )
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

On Tue, Feb 14, 2023 at 3:09 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 14/02/2023 11:53, walter.chang@mediatek.com wrote:
> > From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> >
> > Make the timer-mediatek driver which can register
> > an always-on timer as tick_broadcast_device on
> > MediaTek SoCs become loadable module in GKI.
>
> Other questions are unanswered. Please do not ignore feedback and
> respond to it.
>

Apologies, I know it can be a pain to repeat yourself, but would you
clarify which questions were unanswered?
My initial skim made it seem like the items you raised were addressed
in some form (though maybe not sufficiently?).

thanks
-john

