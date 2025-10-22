Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C173CCD1BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjG53ExIK1WFjeDIAAZczTfr0kaW2lHML1A9qjZU6Y8=; b=OH6pZ8+HPo8ZViuu/uSH/QnnnQ
	5piwAg951h21a+7hzhU/if73WF1TrDbUMeqerY9dCPT+QExRPgg8dQUh9F7PksEMN8zshrUJ93SHK
	CsnxW7YNYWtoekBMI2zMeWGB7QCkHRJs9q+Dr/KG2hVJ/GjtT3WEdDfreVB1bAbY0ObtjmETwd+x7
	u/aC16suIO3tmkeDqsmOusE6i9ydM/K5hflshONWxD8Q2watUaLMV/InfvpTT/9nRtFO1VreRJf1l
	1ekSkKEBhkm3bwMBE5/U/ekr/QGb44CeETEK5u8vY87ZNhk0Ee0lQfpT4qwVVfdwZsVStZGJBVdan
	8/dNcj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYQJ-00000002u8p-1yd2;
	Wed, 22 Oct 2025 12:58:39 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYQG-00000002u7j-1OGm
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Oct 2025 12:58:37 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-63e11347fd9so6691484d50.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Oct 2025 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761137915; x=1761742715; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rjG53ExIK1WFjeDIAAZczTfr0kaW2lHML1A9qjZU6Y8=;
        b=gtuia/PVmE3dPtabCubMfjsFrT6eSoS6KjX8PJPaqCLFEemNwfgSj0dHqvSSSTwrkQ
         OHhCP3IhMp2NCAI2t42MjK/XfRqN409MzwiwjBSDfm9abiobJ6d+upt8ZhVWedP5Uaia
         gRf3PtklpeDrJRlbr/1qxFz/nDiTje/9sQPvpq2KwEDD5xmRr2ICvZpMGKP4DSJwoXFt
         /WHirjv1c2N0GI5EzV9b5QjRddBaKLD6MXJHVJRLDMazcBKhDcgGlrC01GXvvCyaMQEZ
         Z/Ra2NSmepKgk3v+iudTm2fsdQ/em2Uyn0TQmoNKn45qwVd7gZXupEOL/3lyH9jT7yyV
         Xi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761137915; x=1761742715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjG53ExIK1WFjeDIAAZczTfr0kaW2lHML1A9qjZU6Y8=;
        b=Ot9E3peZp4fnpJl8BvToALjogqED92W7JENBJf/UuaCPBbM+u6YDvYsqI1BAk7+bin
         RMBcFMKMEAoN5CjEp8usPcEinz0+qt0PV0hFYePpor3UvlnhPLyA2ZF+tuAf1IB3CArD
         J6CZHbOKr70FmOalR7YvYaisYR0CoVi3hsCnW/tCDc5RgN4iDjkTtOBUh7v/r76ja6y5
         Fss+4M44usVvJUXEgTZNuqa3JIoS/HmVRtmt7BBHsfEF8kZdKJlDe1aoQH6iQ8gXQT04
         rAQ6+2tF1PT2cGVT5JLxeeMlCiruyE+TtgqmTc9GjAgdGBSw5PMH3WUz3m9kjvtp6mMR
         A3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVibtSfz/gtScLE7hdMpaIdxDBzuPxnHen1spi7Vw8KQFFpXA6maN2I7IQxeUPnjg3hEb5Y3meE6KFb0lHRYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUcSgukD2KOU+FBumBUaurDWRFxNBZS6yK0vNlZIZGi4ePFasD
	KRlEZOZWwkcyW4IVwvwa5PaxlNKlV//6Q2SzMcNvokS7wMD2WlClpJ3NhhP+Jr3NslVVCAZRmHI
	UvWighp3BOIQ2FWjvzinM/Lk8W0sy26Ic2utW+F76rA==
X-Gm-Gg: ASbGncu5V9xjEdt4wCXa17mRhSP4fnBtrSFP4DtPjE0zz6S6lx/HHvsZ4tmxoJWuRjc
	sqpi44JsIv80D8H/4Krra/oYaJYIziYRjJq3BL+Y8CUbKpQX9kjZWjM5OhFenaxFO9axdcA4NrQ
	UYwciN4rYZWUF5z3M0jvMi3DFbuQ7MhfMNNII7ORl4Bz896vBUkAoJuNRKHbNGfJM+pLmCJSMwf
	Rj4+yIqry3B0XLOXvu0o0W2KGzzmb3uwb5TuzOmyixR2yVtI9iL8ii1fEKpCsEB7UWTGKQ/
X-Google-Smtp-Source: AGHT+IEpKfqQAP/glDCUgAVJgatRBUGG4LJgEA2qJzeL/hKIAfZyo7XzIeJETd/S1CbVK1X+8E38/575DImRXb9n0+g=
X-Received: by 2002:a05:690e:4182:b0:63c:da95:21a4 with SMTP id
 956f58d0204a3-63e161b6c8bmr15719971d50.25.1761137915143; Wed, 22 Oct 2025
 05:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250925143122.39796-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250925143122.39796-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 14:57:59 +0200
X-Gm-Features: AS18NWBK_6SEKp0LPrIDEzZP10EAnrhsIWSa5DHPeYttYjGzKLOmquHgZnWl3Xc
Message-ID: <CAPDyKFq9oxUfdfF-TOGLgi7b4aYay40H-VaEq-s=C3F2eVOBVw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pmdomain: mediatek: Add HWVoter and MT8196 Support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_055836_396720_175DCF10 
X-CRM114-Status: GOOD (  21.87  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, nfraprado@collabora.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mandyjh.liu@mediatek.com, wenst@chromium.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 25 Sept 2025 at 16:31, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The initial series [1] was refactoring the bus protection regmap retrieval,
> adding modem power sequences and support for the RTFF hardware found in newer
> generation MediaTek SoCs - and adding support for Hardware Voter, HWCCF Infra
> power on, and MT8196 domains.
>
> That series was doing a bit too much in one shot, and then a discussion about
> the whole Hardware Voter started, so I decided to split that in two parts:
> one dedicated only to the refactoring, modem and RTFF [2], and one that only
> introduces MT8196-specific parts.
>
> Since the refactoring series [2] was merged upstream and the Hardware Voter
> discussion came to an agreement on how to proceed (resulting in all of the
> MT8196 clock drivers being also merged upstream), it is now time to send
> the final piece of the Power Domains (MTCMOS) support for the MediaTek
> Kompanio Ultra (MT8196) SoC.
>
> So - this series finally adds support for handling the Hardware Voter type
> of power domains in the MT8196 SoC, for secure infracfg power control, and
> for all of the power domains found in the MT8196 SoC - using all of the
> newly introduced support (HWV, RTFF, etc).
>
> This series was tested on multiple MT8196 Chromebooks now for more than 3
> months, and works just great; the last test was performed on the Collabora
> MediaTek integration kernel tree based on next-20250909.
>
> P.S.: This is a v2 because the initial series ([1] v1) contained patches
>       that I am sending in this series.
>
> [1]: https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delregno@collabora.com/
> [2]: https://lore.kernel.org/all/CAPDyKFoe9=4KgOsPUX6FOE+yPxdUqAxRec5yKY2h6uFOeUvvDQ@mail.gmail.com/
>
> AngeloGioacchino Del Regno (5):
>   dt-bindings: power: Add support for MT8196 power controllers
>   pmdomain: mediatek: Add support for Hardware Voter power domains
>   pmdomain: mediatek: Add support for secure HWCCF infra power on
>   pmdomain: mediatek: Add support for MT8196 SCPSYS power domains
>   pmdomain: mediatek: Add support for MT8196 HFRPSYS power domains
>
>  .../power/mediatek,power-controller.yaml      |   4 +
>  drivers/pmdomain/mediatek/mt8196-pm-domains.h | 625 ++++++++++++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 305 ++++++++-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |  49 +-
>  .../dt-bindings/power/mediatek,mt8196-power.h |  58 ++
>  5 files changed, 1012 insertions(+), 29 deletions(-)
>  create mode 100644 drivers/pmdomain/mediatek/mt8196-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt8196-power.h
>
> --
> 2.51.0
>

The series applied for next, thanks!

Kind regards
Uffe

