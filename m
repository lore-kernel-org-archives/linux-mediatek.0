Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E04C63797
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWd8ap96nAgAL415/EFATTI5RTX0TRS1PzjaGcltWi0=; b=TPxShVFvIKGxXae1wBm0ITlNG3
	gqlSYKRb+s2xIhFLnfS66q2s0drdMqNzTqMFkPl1lVjPRKM8CXIh4E/QUh92rOzHsIbLDOm9CYVAB
	xkW/YzURmZjivhnWNCGYd6Uu/xrXoglkLCD8Sv+8kxb690yFUfS6G4UZrmFK+4KyNRG0OtdqFprMB
	FI+haVwscoo/tjYF9P1IOg6METFZItn/vf+w9qy7z6PbFYdN/THr14j2T7aJo2Pri+JL7BI9l4hDK
	NUyp6nJfqxqJ1YDbpVU4cZRXAkE6nUx+IkmGYrEKNO03DcXeS9AY7vzO3oBtpthfHCRIYJfkmyMCZ
	BRksvkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqcW-000p2T-G9; Fri, 03 Feb 2023 07:36:28 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqcT-000p17-Ls
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 07:36:26 +0000
Received: by mail-vs1-xe35.google.com with SMTP id m1so2634533vst.7
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 23:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XWd8ap96nAgAL415/EFATTI5RTX0TRS1PzjaGcltWi0=;
        b=LLwkDnkGD9sQPL8wNcGoHf3zoY3ly0UMsk+iFxlonWhNFTYJ0FR2EQHrQnnXqRUncG
         2751wL52GQaCRpODfNwXv3+N5/972sVR1ZaGP9hB4XdiaCmctuvEhuaYXFR+jkK+IaCq
         pyIiss9W94Iwia+BgiSSgWAwgqi2QgQ/XMat8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWd8ap96nAgAL415/EFATTI5RTX0TRS1PzjaGcltWi0=;
        b=0ZjM/rbxl3VIBRMCbxrPmJ/MoW5reTt0bgzSbLeS1pZralh/SPdw/15k9/4oO8qoIo
         yBM4xlntNfi/DCdpWwaSWGAZFjJ91gAw5H97XGRE2ikONIlMNlvFrAbTsGjSoZyd3yjG
         LWcCvtP56PX6HqR74rHpBml6ITICI7wuEe/0QfrmpKth3HwoHqBBQDkxOuUdT5ULYGA1
         N2PN4gub1dI6Vfsi6sqdj0ZBwYqmLNcBKnqWm4iH2VNJceoIH3PhNZReiEL0hfYgmwSF
         nYjwBgks6ToEopSqiUnWM0Y25mKQmel615ssGTIhq45IkcTd+bDC3QDj1Z3YUnE6rzqc
         QfGQ==
X-Gm-Message-State: AO0yUKXqcoMQGqYFxesc5Gje5ZTktSXm7pK1HKEE/hkGKOQCtcnwxf17
	TTPCPLu6p3rJkimK+2NZ9K4c6f1NDuTjwyQVMSUDSQ==
X-Google-Smtp-Source: AK7set8M7H+RZ+wc2NkrqpEmbn3SZ1l1MIeIPiYShNT7awfF8mMd3QSxd4Wrz1xZcnMblvzNv11k8fjEOOa/6MUu4lM=
X-Received: by 2002:a05:6102:322a:b0:3fe:ae88:d22 with SMTP id
 x10-20020a056102322a00b003feae880d22mr1498238vsf.65.1675409784709; Thu, 02
 Feb 2023 23:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-19-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-19-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 15:36:13 +0800
Message-ID: <CAGXv+5FJJDqRdiHO2Pfx29NB9uRUz=t7KOHZ=HaREGcuAdph6g@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] clk: mediatek: Add MT8188 imp i2c wrapper clock support
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
X-CRM114-CacheID: sfid-20230202_233625_731500_F1C0D896 
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
> Add MT8188 imp i2c wrapper clock controllers which provide clock gate
> control in I2C IP blocks.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

