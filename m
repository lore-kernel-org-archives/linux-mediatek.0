Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA7EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++76IYs9yoRI3rc7PDrP4kcwMtWs62MWDrjknCH9alw=; b=03WB7HYrcrWX0F
	c+fc4GzrEYPQDDRU2uN45qvSmMuoseUC2LdHOXwb3JG9SF6xb2/IdqVHg/yfzAEk/T/t+lpmB3xXz
	+CMJ9Lk7DT9AZaHA5BlYWC/1OvhdoDPyfKXVas5qmMLFVzJ8lRGPG0WFh0GjICMH0x6DBFPJrFyZG
	wyTUD10/01JndZULVV76U7IODe39koR3I5OV2oFZzQG9sFPpVlCCvSAX8XZUWZPR5mTw0qEFmY4It
	9Ap8NVkK99KGOWr8YxOp5mc5e3OXHc5bjk02BYO8vgtwTFGUZLJkGB3h98heJcTGBvZ1qgtA0Gy2A
	EM2AFid+Cf0VSU620w/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJe72-00Fz6k-CQ; Mon, 14 Feb 2022 16:22:04 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJe6y-00Fz57-Sx
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 16:22:02 +0000
Received: by mail-io1-xd34.google.com with SMTP id r144so20435671iod.9
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 08:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/lXxznWJk6t4L5VwAqaMS0+NBIKS0zk3kQAGJ/1b/k=;
 b=JZLXUfRWra54tioTiu2lrYxDJmGtcUX8NNdySo/F7BWBvDruBVnf1bOydWNgXOogN5
 Iz7arnCufrG1kJ9V7DcoDSRxMCbNRVV3btf8XwNiGUJYm3d1E2eS92/RlK7bOd1VQe5G
 IQJLzFRnqEVjliOJs+NOd9nwMMPcEvNaZXjNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/lXxznWJk6t4L5VwAqaMS0+NBIKS0zk3kQAGJ/1b/k=;
 b=na5S+aYW/1QkbZqiw5JpnxNao3gtGXw4IfntjcfG/XLh6wtiyniC/wNoruCg79Q4+S
 SaYeYidTdAsu1e8tJKxZ6QHPjs1hd8AMuxQB0BARfIFOhrsZuUXEhxir5gS1gnRK4nSg
 mfs3hVtmfEAChlcknaMeZerdSE/Kdv4Mrs3sWc7qEXxxlsgFYVXtmWMi37wQW48Yzw7A
 DZQXzL8/PNVaMQri6cOtfae8jNtBqysqP0jzlGV/eEiMCcpgRNDD+AySLD1K9SkQax22
 fgBFurHCEWFv0aD9Aq+jID2zME42zK87vDxwu3K8kVyo6wnXjRqqc3if1fVWkrhBvqaI
 bH4Q==
X-Gm-Message-State: AOAM530MxSE8EoxcxFea2VO5I6asUB3SeMU9U+Db0o9b9Wwj5xq9ConK
 //q47y4DVJY+c+pQGCgt7tWDh+lLMHVaRg==
X-Google-Smtp-Source: ABdhPJzH3W6fEV94Q8+2dJ5WoLZGLgv53LaVc/z04j/qHiWxg4k+yWTE0UDAczg3GuVax1zCMpT2NQ==
X-Received: by 2002:a05:6602:2e90:: with SMTP id
 m16mr342272iow.74.1644855718722; 
 Mon, 14 Feb 2022 08:21:58 -0800 (PST)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178])
 by smtp.gmail.com with ESMTPSA id e5sm17930016ilq.9.2022.02.14.08.21.57
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 08:21:57 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id z7so12713272ilb.6
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 08:21:57 -0800 (PST)
X-Received: by 2002:a05:6e02:19cf:: with SMTP id
 r15mr119973ill.180.1644855716786; 
 Mon, 14 Feb 2022 08:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Feb 2022 08:21:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VNarYKq8cZVqWfFKccTqxH46Wmm8Tr979EVsiAoOnT_g@mail.gmail.com>
Message-ID: <CAD=FV=VNarYKq8cZVqWfFKccTqxH46Wmm8Tr979EVsiAoOnT_g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: align Google CROS EC PWM node name
 with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, chrome-platform@lists.linux.dev, 
 LKML <linux-kernel@vger.kernel.org>, linux-pwm <linux-pwm@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_082200_961264_03943696 
X-CRM114-Status: GOOD (  10.73  )
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

Hi,

On Mon, Feb 14, 2022 at 12:20 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi             | 2 +-
>  arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi             | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                 | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
