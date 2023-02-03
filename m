Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54407C636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 06:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOZM23/1S7CSy+q5eLPYC0k+K4EbQYTOVhbDtucSWfM=; b=SgMOx8z6606dYoahvyPpVlpSZH
	1Guc0B+2XsCanTNIZwMjiL+TI6rEXzgcw4wtTRd8lUWKR69WhfIJ19ImZnxj2M0VXUtw9M51ZybI/
	Nm12FXxLOkVr2rDcv2WDVXabFg0DlFrdzoN4e+tCJgvKKw3d504SODcjYXOEQSY9MJcNw3kNQreI+
	RTCH+zdZoKaXMgnLjtzULwyMBMG3bs67mEyNbwcvHzCzBYoyzBFmvYdneLYMXlxxCdPk0aKlKqEkj
	oSc4mYErBLoSisDzYkJqQj9f/Yns/eP0FircOWb45q7a0SDa7f4EymdvDbxanxGd7sQFLqHZYPWhv
	aCpdsRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNps2-000c3Y-AU; Fri, 03 Feb 2023 06:48:26 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNps0-000c2A-1G
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 06:48:25 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id j7so4389286vsl.11
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 22:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DOZM23/1S7CSy+q5eLPYC0k+K4EbQYTOVhbDtucSWfM=;
        b=LiP66aSOWqDz/lsmy3FBtArCy252DrCVwRjht+3hFGLHIkDLRMIyomYfBZAYIoXqBs
         xIUYGAErxGzzf9DMiwBtyfLsIBSWZqHJLhNFpUg54R2e6xFEiyVltZyM/x620nbV+LkE
         /pH20N3QvW2bMMkz03uWkzZPcOUJ0TOATiTYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOZM23/1S7CSy+q5eLPYC0k+K4EbQYTOVhbDtucSWfM=;
        b=M/9st9Ot26DU3lK/Rg0cP7Aul1bnAM/GQdsj/fEn8WuZS4JmVL5F2hBt81t/xySLga
         u8sfTzlnMMqBwQwLvPS7NTMwO7mc1yZUdh/HV7U2+JwUwb89hfrMeEid8Quz2YjkM654
         Lfa16R+wxrWVw+EXMYDnrrPxENC4l4H4qVI4MhB4FxJwQ3t2ucIjLpy58GiSan48kD+h
         RENeRjMFrHPW/5dGBqV/qn8++yFdxn/KqDlxmv6To6jFBLuqaoDE/bSJkucE2n5tOGyf
         VFHZ40uZlL/FPcchp3VwobfIuyjil8WIGwrBXxng9Rq6ra2ecIi+um3vLguvx8208MNK
         7w7Q==
X-Gm-Message-State: AO0yUKX8fmCYjDnyplgAgZCatMgxbB/LhI7FgyNpL6o2Bywh1vmw/RhK
	t9dLOrJY381V48fiH3o4uBmnsoEMdmjazdWQojPj4Q==
X-Google-Smtp-Source: AK7set8EbtIiJP5eoXyubQfcVDaNwVo8erq5xWSisdXu007fPae2bmld9wOxBu+g1ovX9YXJEqaHQ5n31c2NLBL8a1w=
X-Received: by 2002:a67:d21a:0:b0:3ed:2cd6:deed with SMTP id
 y26-20020a67d21a000000b003ed2cd6deedmr1757642vsi.65.1675406902737; Thu, 02
 Feb 2023 22:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-6-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-6-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 14:48:11 +0800
Message-ID: <CAGXv+5GFuog-E-1o2qYKFkvC0XnDvYU_fA+BxvaFLGv=_Y=JkQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/19] clk: mediatek: Add MT8188 infrastructure clock support
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
X-CRM114-CacheID: sfid-20230202_224824_090539_D8CF0007 
X-CRM114-Status: UNSURE (   7.58  )
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

On Thu, Jan 19, 2023 at 8:51 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

