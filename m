Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25028C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 15:00:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97AC22D58
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 15:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D97AC22D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z+j/z1CE9V/bRtj7btNQt5F6+x86sPX3Mqp+ahLlz/Y=; b=WE4fKEtFRDB++4fUANocpQGfL
	SoqkBRjJd3vHnip8FYka57hWGY5f/qbL/BX8qAfaWyZpd4xk9zRuQThAzi5UcmMpzqQwcwT4xVHIh
	V6Dm6DL2OqqfVL8EAzu41xE/tBr9oge69bHwWTpfYCnjoKjCOXXbl4kfsN6Sq3/H7S8/aDQj+yL/v
	2ceTlJEbTo1UdpdySHR1DjFyiZj4uGTxxpfk1/PiWz6SY70hS9otENQoZH/OpW7HIDmg3LSdOw8Q6
	nkBanMiweaLJBhSX4az4eshurkVtwaqSIv36j9FPwmmGVVV7XmubOl1o3Haj9hcSJZaH3nvyVRgjN
	VDphdZBfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Pp2-0007Gf-Nh; Tue, 26 Jan 2021 15:00:00 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Pp1-0007Fp-1L
 for linux-mediatek@lists.infradead.org; Tue, 26 Jan 2021 15:00:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id f1so13266807lfu.3
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Jan 2021 06:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5PPoqIyCpJtL/ek+tU9+EyocWfpZVKR5Q6N/JZNTSoc=;
 b=CJW5k+g5rrW0iG7J1Vqjf7EeICvtVMaqQr4Mrssy80eRmciKqXrKNu2x10XtIpUMjd
 2Q9fD9jJF+Yiw/QHFgpLarnnoC9HGqb7+JqNxEgSc6ULWHrPbJmfwNrJC6HhunyJagtg
 X99euSfrluWSS5ypVzSO5NDMQXTO+CUmJuikTOK8ZdbxbZzpn8/jxBjqRW7InmA6noQy
 kVpakp5prj7msQgdbf5j7iuW6hQhykXGedscqJrv+7qvBclJSxgfLk7uWbofhgk5yXoC
 HYVsH6NmMWQ2xYCfoGIVnVCnWAy7NrLg+zu14JIFrJsRVJ3PouFzyRQeh8veAj9pmYVy
 LVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5PPoqIyCpJtL/ek+tU9+EyocWfpZVKR5Q6N/JZNTSoc=;
 b=tghYoh8cHzAigzmLcqWgWRwIWCuzbK+a/L519ybbpzdKEvRLbags5aZ9OwZCtxXbzZ
 hXZzCSMIFlinS/YynUpnV0W7gVFJcuw1fzQsJ77ksYZgL/qRpSLCIPwwS94zFh9Tuwl/
 UxI0ecnRfpT4oL7aap9oGSAX7Dr7ZSvm7zml5CnRqU2gtK+qtc4MPE3a5BvEKVBrZbtK
 /pnExaV7cQ26SWM/FM4372kgSTimDIZPGiyulXcjwk15VXi235d5XK5NbTQyoo3QkUXv
 92H+rc7xpy6UWxuln4FTVuzLFnM8iuhYn5MpJ8dpuu93InAqTJnwPfTxu/LnDVkeaL1K
 +ItQ==
X-Gm-Message-State: AOAM5319kvtXY/BwDGo5kIahefhennbvdo+GTwrVykT167WwDise7QVa
 dm7QpvAnsfwCx7usNjC5uO3bosVcizuu+ydD0N+5/g==
X-Google-Smtp-Source: ABdhPJw+UEQhd8vKQIGL6NeYSPSicxlz7dsriKTU3lH8LHsu7n43H+WLi/pKgx8+e/k/qqhhJKe1LW7Bfg9MZUXVmL8=
X-Received: by 2002:a19:495d:: with SMTP id l29mr2785470lfj.465.1611673197037; 
 Tue, 26 Jan 2021 06:59:57 -0800 (PST)
MIME-Version: 1.0
References: <20210126132531.2084711-1-robert.foss@linaro.org>
In-Reply-To: <20210126132531.2084711-1-robert.foss@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jan 2021 15:59:46 +0100
Message-ID: <CACRpkdYPY3HxpWHMp08477z62PBYEjCKWpw3Uf0SQ7VHVB3jdw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Fix
 dt_binding_check warning
To: Robert Foss <robert.foss@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_095959_091350_6F2FF486 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, jiaxin.yu@mediatek.com,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 2:26 PM Robert Foss <robert.foss@linaro.org> wrote:

> Silence indentation level warning reported by dt_binding_check in
> order to reduce noise during routine checks.
>
> $ make dt_binding_check
> mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation:
> expected 2 but found 3 (indentation)
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

I already have a fix for this in my tree, thanks anyway!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
