Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6C4C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 04:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvFH86Wx5RN3SI+RWTx88o9Hq2BKwJTQQWbayEx0CcM=; b=KmNlkrnyD/H6cxN1Gurktd041a
	zEDMajggQ414mLClt5RMBHSZRfBqtu7RC2HkZZavv2a4FxQ4hjnq/TxhVM/gfZqEVz7BX4/C8O57C
	9aMOq7R+jUm1DEmSpEXaOONbFASr4/XZbUlSXP3Bz9C6aBEfWPBENh3fCEVi4hupzXzF3bqikzlCQ
	oVZzPw1A+Lj2LvsKtjeU+qXJY1L9pXMXzoFFpI4n+Hm9gOfgJ2IBfk3dTZyVhTRCfLidGUojPG4Jw
	iJvhqxgguVNvGgKguWEn9ETGScNUFqLTjVmdCsGwQybAArjGszaKadPqrdx674jXKIAqaPkhcubma
	1Y0zGk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEUF-00F8TY-KF; Wed, 01 Mar 2023 04:54:43 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEUD-00F8SQ-Ui
	for linux-mediatek@lists.infradead.org; Wed, 01 Mar 2023 04:54:43 +0000
Received: by mail-ua1-x92f.google.com with SMTP id p2so2848102uap.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Feb 2023 20:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvFH86Wx5RN3SI+RWTx88o9Hq2BKwJTQQWbayEx0CcM=;
        b=eLmZKh8w5eKPslfPj682pp6AqDMDr3kDWb9MF5eICVLXGgESSxa3BZT8UIJn33hSU8
         hgv1OYwD5V4o7SJjoloP4rm82+v9A4iC0QneD6l2cthy6ASnHBFg1fsePr0DnDVpvadv
         AX5goEfzIeCbD+vcU+mmaTqr+EnlRGKiw/NRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvFH86Wx5RN3SI+RWTx88o9Hq2BKwJTQQWbayEx0CcM=;
        b=4HKzehMxEw5USl55uQGC7jkNEOHRXFdExHGAA4fsRkfHHEFPujLZhvp+QQWiTwmmjZ
         TQQKJweIJQl+gDdTJGqIY/8zU2E+mYWNYniAYJSMdFPuVh4KwiyyRibcoa8nAPnwVH4N
         sGqxWBxnQuyu89/lICjyMwI/qU+3CEFS440Mbh6Dy+NJO/8O1JbUWaViY1/8nLycbM/G
         quRDiTXSe/kpdrTpeH7RpPhhY7BHO6Axr5jVYs864jOZmVRFk0NVr6qGN8rQrds6gsMt
         N3ygaz/chNX10U+vwJLwiy6fq6FY5LJt1IZfv9H0Z0+IGev0rpX3LsHZdWQRbGo7Gt7N
         8VmQ==
X-Gm-Message-State: AO0yUKUbrCM11ca+K/2brWm+x7wqeQ021I+aFiGbNt7yKw2BOHw4bQ85
	zBR79oCcGg8CxZKmBemEQb3+rxaui+7BvR8+sJj/Ow==
X-Google-Smtp-Source: AK7set/N+eInI6S/VIF++zybR+zm/0n4DGjWC3U76j9ITkp75HBt6PzFpjINHEpOMYtqRAIzBvtKqvk/lZ4UssMcvxc=
X-Received: by 2002:ab0:4a97:0:b0:68d:6360:77b with SMTP id
 s23-20020ab04a97000000b0068d6360077bmr3021515uae.1.1677646481168; Tue, 28 Feb
 2023 20:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com> <20230228104741.717819-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228104741.717819-19-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Mar 2023 12:54:30 +0800
Message-ID: <CAGXv+5GYc1X0J7tXfqQ0yj5rCFgEcTN5kwB4720vCkNvEKgiOg@mail.gmail.com>
Subject: Re: [PATCH v3 18/18] arm64: dts: mediatek: mt8183-evb: Override
 vgpu/vsram_gpu constraints
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_205442_009177_35FBD347 
X-CRM114-Status: UNSURE (   7.53  )
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

On Tue, Feb 28, 2023 at 6:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Override the PMIC-default voltage constraints for VGPU and VSRAM_GPU
> with the platform specific vmin/vmax for the highest possible SoC
> binning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Suggested-by: Chen-Yu Tsai <wenst@chromium.org>

Chen-Yu Tsai <wenst@chromium.org>

