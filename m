Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E921C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPezifRRh17LMgbOCetI5RBHb7FvOfUfqVX0Agy4qtY=; b=Ant/lg9BC6biAKF1WhhkZxFGXm
	AAqSQeI8ZNpVxAagUMPXzSpW8R5HesU8g9gq6z6KNIeRlqRjqu1+xXXt9GCXEctNZnFRXEIHW3qi5
	fYyyYZQXINYym2FMiIcut1QSfFmmJm+KFTkB13eOcJHWYfOTZJc63Id1i86rHuSmt4TdqE+uacpfO
	f2JNM/9DqOs5UX/HLBxPoFn1Rbm3WQPMC2Jr2GczoyQIvwL2fxSPpeDBHg+6fDc9iuQC6M25LK5m8
	wvgHn5iPRva5hTiZ7IVNJOG1VQe0oslRDSjQvHaXuwuIGBw2owerUNVCKZUULXBZbPxMBjiMT56NA
	fNr/wnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq2D-000dvM-LL; Fri, 03 Feb 2023 06:58:57 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq24-000drj-0V
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 06:58:49 +0000
Received: by mail-vs1-xe32.google.com with SMTP id h19so4394663vsv.13
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 22:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BPezifRRh17LMgbOCetI5RBHb7FvOfUfqVX0Agy4qtY=;
        b=N02LErE9dq3/R+ouQXbCmArYXakhpEsijaOrlNridYJmj530ETOeWePoqlx9jusdKT
         iPfDHYES4HEyQQxPJu19zeJddM1thZLxnlq1uMSzUslbpFkGddTouvlTW54+4K6dADtr
         VAzgIeSwiO4kIkWN6we4elrNZOzpqpXh4Jg08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPezifRRh17LMgbOCetI5RBHb7FvOfUfqVX0Agy4qtY=;
        b=Tfgq/4WDkQ4eD1RG1aXt6FG+N9LbIZCT96nSNNBJxT2kKsqO1FXPc1thNYmNxPVh/r
         0tgT8te9A0JWSscckUUm/UTTbz2cYJk9ym4o7YTkkju5H4ptHNwppbqlQ4TmUQJbEgNz
         9a8AdC+TBCY/VPfzl78i+ifaf4A53YVRqFt3Qdfz8TTg090TYN5Cg2tbfJfEf9TKW3pI
         maiOeml8sDAH8BvAR0krcxQkdtJcnd70lZs4gzbWorcpVic+by762Fuii2fRCN6oysg6
         L8K3QMG8MNwftFBMJWcipZyEnCGtq9+XQcZV0F8uUC8oh4MzBVR0K/54q+TUqlh9dRDK
         nJKQ==
X-Gm-Message-State: AO0yUKUMOuBAU4ZKjYZX+dAs2muxGCl4GZQZ9GSJO1CK6GYiyaJFklJu
	u4E4QP5/QljGMrWeeoDK9BzhRtCMPtgOMO6wTv29XQ==
X-Google-Smtp-Source: AK7set+oNQywJdjoNKiBRoVLc3BLNQgwROOiiULh2qZGXSFUG24dnj7Lf6sHKTrCEF1O2JAiqeFNZ7IgIlv8x4NVK58=
X-Received: by 2002:a05:6102:23f2:b0:3ed:89c7:4bd2 with SMTP id
 p18-20020a05610223f200b003ed89c74bd2mr1663085vsc.26.1675407525498; Thu, 02
 Feb 2023 22:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-9-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-9-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 14:58:34 +0800
Message-ID: <CAGXv+5GEHXqtYffimHzH2srMZKa2dnMAmN5wgTW+91bfFFf6gg@mail.gmail.com>
Subject: Re: [PATCH v5 08/19] clk: mediatek: Add MT8188 imgsys clock support
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_225848_064198_A24117D7 
X-CRM114-Status: UNSURE (   6.85  )
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

On Thu, Jan 19, 2023 at 8:55 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 imgsys clock controllers which provide clock gate
> control for image IP blocks.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

