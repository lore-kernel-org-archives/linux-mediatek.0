Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE1A1093181
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 07:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaBkkyt6S6mdY3qvoboPKm6e0z2T7buXyCziS8cID2M=; b=ll6awaxQHHv4bkiXC6n8IOKIL1
	qHmbD4Ql5GlBB1QSb3W+JrTRID7+SkAiaT9bkWui9miSFL+uZAdu94plSqRwJbs/kIbhU/lnYMjgh
	ggRKnvKMgdXLwQKWL7SU4m4ADjFUvSXpl7pCHkV0fR8oCJMPnGhrSeWZsYz8/stJP0ep8AfPPWPnu
	uAexbO86cK6VTZLcNyLru3SwwPjPBzgFZysHKDbt2r5Vv0adGJoZpDUxQGqR3mG0GocoMu1vgkeMO
	+eKy1lJorOEHCGXXYxrMx9ccZCqJMGd6beGRg4ObpXj6HdYeXY52DxC5KIxBaE/wpym0K4yJ4rRad
	VMUGQgPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UHd-0000000CGVZ-1VE4;
	Fri, 20 Mar 2026 07:28:37 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UHb-0000000CGUo-2B5B
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 07:28:36 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5a278b4c1a5so1477885e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 00:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773991713; cv=none;
        d=google.com; s=arc-20240605;
        b=PmceHLWthejMN6dXr0Wi3HrvorSSPa0c+MA0tmFWeR5nBV8KbGB85ZfTh4PMfy7F8I
         4R2nM/xotWU8qYK3NIE5w3LIV3Lyyjd2qdls/RqkrZbyRzSgsDh5Mcl7g+jG5F0xSLrT
         0KbATtpzJANjzPwRTAARPQjGYivJ3ehJmNPqgcw0MFXFDzN1r8GYmcgAbw1TmYDxn+rK
         uF9aQLysXFmoTZ8+bJDPLBHHbHJ+hRdxuCrJxhtpx8OatQ7aPqlCw/Qmlf3I8igkZHdJ
         uKOJE9IgrvGv6l6F1aK+kIk/foPf3y0ciUXcgYoAOlKfUystt4Yy2oPy5d7QWxQ6Z8y6
         S3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zaBkkyt6S6mdY3qvoboPKm6e0z2T7buXyCziS8cID2M=;
        fh=fNEdtuPStmi2yBUekiVkpLQZKUJGsLcofcEzSbJjm4I=;
        b=dap6WZnHwRQHze6RyBHOTXUlSZLQcO7Nmqm64Fja55X+i9l8ZPIw7bU27wOK+zQH4i
         IZHFQ/D8r29ehZXRjYCZVEoqbtf6l5OlTD1ki79823S2vzugQS56vagS+9F87dLaWGag
         I3qPNiArXAxH3czsbC7kQUbRY8fCQjHFSOtDE/9mcElg3y8KwDM3UvxRbcRPzd3BnApU
         +Q2cRptKi6Y9PUin1ONosGo/YVgp41CFCnRmrb1qc8Lbmt/b6msudH5BrVZikd5l/AhQ
         v5OtrXStIkBV+3MCQel2QxUpfKY14eeBbnAQ5RE0LJaRn4mMZZc0hS87GAQlrkwjyNt9
         lUDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991713; x=1774596513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaBkkyt6S6mdY3qvoboPKm6e0z2T7buXyCziS8cID2M=;
        b=Y5z37ug3ufkFx4a1iL/yutgQAzp4Vr5m8W3JWdAiR68PVfvBay1B4eBHBM3NyeWt5s
         bPB2Gi7PgXn8khozE/v/MphXxV54KWvA07+VQRPuPyTHC6w4CUw7dvkKoUg/8wXHG0nC
         gZLsmLh/rLqrgfJPPhHOGBaoQe6EC58StetkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991713; x=1774596513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zaBkkyt6S6mdY3qvoboPKm6e0z2T7buXyCziS8cID2M=;
        b=OJNLrmbpj7hv4wOBOEJhU0z2fZsFcawneFnR6nYqgJIAb4IGtH/dvs92PHgmO3X9nK
         veYbf7VXp9Zg3REBVgC9rJK9q2Qg3seaY19i53KRycvWAmcIF3dXKmAj1U9ely5CcE0N
         v4vylwJEAETrUJ/sy4Twb8LNKzwfrRKy81GIpmLMObo6l+ix0iTuR9OqX0ldmvNzKZao
         L4K8QkbP1VnwmJ7be/Ewl6jQu2njH+YY/4x4Ccc2z0XWVCrbrsbGDuxO453+Xz6pU9jw
         nqFZ7+KN6UxcWQqWH1HtfSTzJaYF1TgzO1mLz0qInOW5JHzkGN96k+KqNeaeKbFNv7qp
         o//A==
X-Forwarded-Encrypted: i=1; AJvYcCX0QwzAoJeLRtmzU9oQqRZ/3XrQCuXQNEaMrWZmTUv1bzjEmkCUK7YnRtwA3FPHk30b1ihLUn9a3dO86jTXiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1aT1a6aG8yNQCcp19nwflZprrV1NNo4d7o3L8jroIUmtL9ro7
	6rTiT4WyAk+7K/eKR5eHVTknCDTw2kxvxUWU9M7PbOFk1dR5HV5cMkvMRvqnpsteFKax1SfG2ki
	73DVKA/soch65j30SnyeXaos+JS9NbIHuxc4K+BXp
X-Gm-Gg: ATEYQzwkHLVJiylZDYj82DR/uopWemgbpNf9mXJBWnDBx4ewO5vIiWTqjVqLkp3BYxX
	o8cGrk9mkyuHak8ttzdoKCZTrx9VluSdbM/s5IFlKut1eL2J4z049UzbfZRlrrLB36R6dcuk7I1
	/MuwaSGCUgd1iBnED19LG03IMDEsV+w4KjFV+FAV1NiAzV0/ohPmdt/JsCM25DoNH1mQsXKAjLt
	k4Yg9LTC9L7g9BFNwQ0TyNr1gArHDSxiGbUP9cWWiUNMYIQFEacv6DO9mAzkqK0qbogvCGlKayu
	AlUGP0Wt7wPurmKZqOj++P79ztHIKNzKW/jb/A==
X-Received: by 2002:a05:6512:39d3:b0:5a2:7a48:f4a2 with SMTP id
 2adb3069b0e04-5a285ae4b05mr626516e87.2.1773991713064; Fri, 20 Mar 2026
 00:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260320072302.2402489-1-wenst@chromium.org>
In-Reply-To: <20260320072302.2402489-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 Mar 2026 15:28:21 +0800
X-Gm-Features: AaiRm53muhcbEfiawzjnCME41hVR08oCHNfuwP3luCiL15l5M764Em_8Z9arEds
Message-ID: <CAGXv+5HwK9hvHeMWS+vjOtwd6TOk3upMmDx3bZWH+KQzi7oRww@mail.gmail.com>
Subject: Re: [PATCH 0/2] regulator: mt6359: cleanup and add supplies
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002835_604344_9C5E5CE2 
X-CRM114-Status: GOOD (  18.54  )
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

Oops.

The subject was supposed to say "regulator: mt6315: cleanup and add supplie=
s".

On Fri, Mar 20, 2026 at 3:23=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi,
>
> This series is part of a broader collection of regulator related
> cleanups for MediaTek Chromebooks. This one covers the MT6315 PMIC.
>
> Patch 1 adds the names of the power supply inputs to the binding.
>
> Patch 2 adds the supply names from the DT binding change in patch 1
> to the regulator descriptions in the driver. This patch has a
> checkpatch.pl warnings, but I wonder if it's because the context size
> for checking complex macros is not large enough.
>
> Device tree changes will be sent separately. The goal is to get the
> regulator tree as complete as possible. This includes adding supply
> names to other regulator DT bindings, and adding all the supply links
> to the existing DTs.
>
> Please have a look.
>
>
> Thanks
> ChenYu
>
> Chen-Yu Tsai (2):
>   regulator: dt-bindings: mt6315: Add regulator supplies
>   regulator: mt6315: Add regulator supplies
>
>  .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
>  drivers/regulator/mt6315-regulator.c                | 11 ++++++-----
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> --
> 2.53.0.959.g497ff81fa9-goog
>

