Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADADD2A529
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJMbjUcKi6EbniPKKMf5mPOzUN+tw8qhO/6T2EniAjY=; b=B0VVa7CjV1oSqi3oXDgJ43+MwN
	ga/J7j2OaMp355sH5w/2pj8TDRbW/FxE8MiJKKxNS4MGxvk/CFY6zlQ7Hd5CdBJDgk/yEclIAzGFG
	n0OaIxDxkL/uUXHriDceibXsRrM5CTzQYOh5OI8PLsqiPRdPIw2bb24s0PmI7+JxmbYjWOtBNvYDb
	MrjQ0TSg4JXD7y1t3ghqFWsEp4BKiStn9Xgya8ToLS7GWDYf8sevliWE2sTQe6BGTh1MbusLzk8qx
	u/hGCyLlmJFJb+EmBUzRM68HdH1QO8ohFnZHH4+0IIX741xFOBv1UlIWCT1ugF3sZxEhOFa1SxsC4
	UKzU5dOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t165x-0000000CH3J-1nlz;
	Wed, 16 Oct 2024 15:37:53 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t162Y-0000000CGIf-01Ru
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 15:34:23 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539eb97f26aso4645553e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729092860; x=1729697660; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJMbjUcKi6EbniPKKMf5mPOzUN+tw8qhO/6T2EniAjY=;
        b=HXN7ubn/lElhVmG7JXn4nF0rCwm95wsctbl2maMuZ3eklQ30JX5bDQODwGnG8Fd4lA
         EYi4jDjIbH+oTlpSWfNLRhmtEOGMQfc2XgTmz09C9W42FIovY9GEOggxSMC+VkcCKmZ6
         ZO7RKuN2a3UjnpZ+8tqLhZjlIcFdAmkxbyHsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729092860; x=1729697660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJMbjUcKi6EbniPKKMf5mPOzUN+tw8qhO/6T2EniAjY=;
        b=gHDdvmbLL9cLPvUl/c/CmdpQtgb5p39rI9BNdIbz2zB4WbypubYRnwWAsZoJEvlz0+
         cFV+SeEKt96jAzXyvMFBBiN0R7qTBcNkw7wht/MH6JBne/QpIFmYadTvlMNjpV+mmUDl
         FjbIb099Op3SLOAfKGj1IT9h/4Q8aYked2Q4ogEixyYZ/JWuokcQ+FXewFsm6ozxc0xX
         3ApdSXPB5yrMuXrgJSy9UyPHG+0eHAurJol9IfiSEM0nlAk0xrIhm+7JulJ4bh3/x4/x
         4D2dnnUG9lKZs+IDyDgRTdVtK1Sr2NeYc/DsVgf1MmVqM5gB2wTL2e3nVIwKG1Khu79I
         cJUg==
X-Forwarded-Encrypted: i=1; AJvYcCWVHxEGstmNjlJZeh0lLYsl1fn+P8B86zS2yYyMCuJSp/a0jzuUCgcYDuME3ISsMMcu5r7fvr2YDicbwk8uRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3yq7n80YSIOtWIn4EAPyu4lmrvvjgJzHpIUEWDkIRAmg9eLtx
	utUeKhl+QxSfxrQpj1p3qGesWfXMRCcoq3sPXo0fg1F06ZV65Sb+/yspziO31W3WVyc6gFGPrvQ
	zwmAd
X-Google-Smtp-Source: AGHT+IESeI4PfF/oZPk5yYHFRJ3z1sYx2oOlruh3ZVz29aqpie98UgeDwBw9zyVfSuGUO1F0zH5I0Q==
X-Received: by 2002:a05:6512:138f:b0:539:f2f6:c70f with SMTP id 2adb3069b0e04-539f2f6ca6fmr6800823e87.8.1729092858245;
        Wed, 16 Oct 2024 08:34:18 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa88fbsm487791e87.48.2024.10.16.08.34.17
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 08:34:17 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb561f273eso31527391fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 08:34:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAkJOhEBzqymq4I/Hj9GFkk7a4YUOgh2nJiw+gZ2/wLasDgTH9UbjoCICRmt2apVhe29fVeafkNmFB10P5lw==@lists.infradead.org
X-Received: by 2002:a05:651c:1509:b0:2fb:6465:3183 with SMTP id
 38308e7fff4ca-2fb64653a19mr17100581fa.3.1729092857448; Wed, 16 Oct 2024
 08:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com> <CAGXv+5FTdNqK14OYe=PN5_BcF9Ve7-FyBTKz=mJ+1QiiUzu0_Q@mail.gmail.com>
In-Reply-To: <CAGXv+5FTdNqK14OYe=PN5_BcF9Ve7-FyBTKz=mJ+1QiiUzu0_Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Oct 2024 08:34:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNZJ82e2rfMicAiXmxAx5hwydsnMVO8naaakRfroyNow@mail.gmail.com>
Message-ID: <CAD=FV=XNZJ82e2rfMicAiXmxAx5hwydsnMVO8naaakRfroyNow@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_083422_092058_DB70CFFB 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Wed, Oct 16, 2024 at 12:49=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> > Just commenting nits, so:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I assume this stands even after Andy's suggestion to drop the gpiod check
> is applied.

Yeah, sounds fine.

-Doug

