Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBBDCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovXYBvf9BeaM5Jrvkdgwh1YmZinox/U6c6KG8zcWhac=; b=UEgB7Gk5AIVtRxfi7FUtgmr31O
	qFdbRvowItpG6LHhKfXHDr0H37cUVkZ5xeAlbGyuiygfVo79RyfWNNoxP7wvTfY51QgQevnF4Awv8
	K68IHwMIycb94TG2pcyeO8GQDmqBCQi2QslwMinqZtpNgjJuNGWFAepD1IdlV7kIFen+ZKeL6TrlI
	PrqLspXdhrGyRboMY3NkiOHMpbY7QogM3+gO3TIDVUDbEReiPIOOI5d7opE45MG6oBaNnkJC97qxy
	TfPy74aKtH8M1lWUnvwJRR/lSEzm3BB71hPi+c/RRou2SVhLeW/rCUzJCk9KO3C5bP3TmkT6K/Ump
	Z846cd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJADf-00000008nOA-1Z9i;
	Wed, 12 Nov 2025 12:45:03 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJADd-00000008nNO-3OFO
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 12:45:02 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5943d1d6471so810682e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 04:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762951500; x=1763556300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovXYBvf9BeaM5Jrvkdgwh1YmZinox/U6c6KG8zcWhac=;
        b=FjDPJxrXsZBqRrA1vUvg3vTIsB0jCe9d9Km2hCY5VDGw5IOWl8SA8PJDOla8VzOFHG
         s7KbD+lDNn8nFu2MO4hMC4qvoIckOsCu87lUvBLyvFJYM8OcS95wBk+SakvPi6Sr68VL
         49tonjMadCIHfnDpU28DEDpjVrILK/II9CQIekvgW8Gq4d+QvuhFfhR083y191VRLB+k
         LRNzN7wKKePV4cp3E85rU4UATiJBwZfpEyFBzRnF5WPMlb3zWFt2yaUV2suPkMJoLkUd
         ENYLxEiyrrXDULopJDCfHl0i1kGdIYeEJ/ydRiE4+0hOdbhSEWNWYIQR6j9ftYiHVKvK
         kauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762951500; x=1763556300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ovXYBvf9BeaM5Jrvkdgwh1YmZinox/U6c6KG8zcWhac=;
        b=CctUa9NC1m4ch0cocgeeetD9808vuv+z9atCA/BXhd6gQXMv4Vz3aP67WODhVZbxHl
         bUDSCzVUwd9Mfh1/mXB0hicG0AZumlIiGUXvN6+KutyvD3mxLOodinLyHph2u9uI/whL
         vMvTslYJwncoENFkowTDVy+FUOKCh1E6B9CJFAQNnUwFqktO4/u/T3vppoykleqw4bvF
         kC0xbmLYY1pohk2xWc/uYtG/8f7Ke/aY53qirqDRh6cryjR+rzU55hwxmFAZaGtUNOZr
         wrBN6YA/4Li3rH5eOFQB4+LmLQZK0sC/ENn6ptUk8y6bbXXRFu37nZ8fnYiFk92DWxEj
         LWMg==
X-Forwarded-Encrypted: i=1; AJvYcCWN3FnnZAY1/dcTOAZ8FBrBXrokItiFxlU9UHZL2CEh8r8WJRo964rLghUd1aLWw7MdtsHP7W1WqStqNvWQqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVy52ZT5BJyGkvAMRUclvyJo9SkWwife4zHr/zB+E6iBBGu6XM
	0qQKkWRK6Bs9ltj5ndligJ7xDBQkawoyXz+lx7BT5CaI0zpuzE6DY0OfyhwXygvvP+MQAzZQBoZ
	U47yLwb8rPzkp5nY1XC/kN745viusa5gvUAbiqGP2ug==
X-Gm-Gg: ASbGnct79utsDPOMFnCRqet0WqRRE/w4j0CqqT/gw1p8J+PDB1GSAdl2gU+ahdFKLNY
	3xQRXh+COjsTD/9ebGWB8TsLDua1xXcHIjwWRi3/yOmxXpRS5yc1Dhxe1JDKuVE3OjCuIPgvcXx
	un1o0wMHnLVQ3dHCC9fG0mT1K0DPVpRY5SyN7HAbjNAq14fs79LPiU92FVI9OyNAeyzQQBO4bEq
	5ywIcQKO/+ap/oVLYU8EUBqlVyub2KgAHuF9a7S7OkAZXUwiN6Fai3vOyvsFmisYmWPQpo=
X-Google-Smtp-Source: AGHT+IHQakyME6xEnHQQsmuUyerv0hf25mEyF8+JOVxqljHOGLgY+yIGdrozQm01lfyzvPwPJ0stQCUI+cbhPCgYAws=
X-Received: by 2002:a05:6512:12c9:b0:587:7f2d:2580 with SMTP id
 2adb3069b0e04-59576e19ba8mr982952e87.32.1762951499660; Wed, 12 Nov 2025
 04:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20251111062944.3820079-1-nichen@iscas.ac.cn>
In-Reply-To: <20251111062944.3820079-1-nichen@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Nov 2025 13:44:48 +0100
X-Gm-Features: AWmQ_bkCSMuaz30HpFGccbxR73HuAGmsgiOeKgCmrcMpEXvyI_fFR265lSkc_Yg
Message-ID: <CACRpkdbdXBKq5x1weqB339M6y0HBq_NyBTkJ_7BQMaveTHF7ig@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lorenzo@kernel.org, sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_044501_859081_52B75A90 
X-CRM114-Status: UNSURE (   7.62  )
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

On Tue, Nov 11, 2025 at 7:40=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:

> Replace comma between expressions with semicolons.
>
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
>
> Found by inspection.
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

