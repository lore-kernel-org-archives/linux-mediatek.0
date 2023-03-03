Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE6CC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 06:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJ2aViFV8G5fD3sj6zvP1zwzM+rkvacAu8VneaLs+F0=; b=iO2Pcil01V9Kqw
	zGJ0lyknD1zr6j3n6SRlyDln8caP5i6VVkEf5Aeqa0MN8Jv5dGV5SiIGXs9gQYsqFAyg+hXRBUt9t
	oKemdADgGxwgQTKAHClHZTyTSQ5pQQJuxp5FPQcKWWdDGjEAxWPhXIMdCvCUsgp+54XGVCLBmWxL0
	Woe70aGmeaCONCFV444vfHG4kQ73usQkXCNGuWjJBwdyBFCeZ0hJWxdqeKqkjFlrId01/LIuJHxSK
	GaOiqeoV8D/vj/vZiKdBQ1um6NfLmEzLoCIQjn9pArejHmTf5SXg7Do7+dSO7CLXALErkdI/m1Y0V
	tpRBHOgHaC7OG/3vDLJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyWM-004y6q-Ks; Fri, 03 Mar 2023 06:03:58 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyWJ-004y5W-Jd; Fri, 03 Mar 2023 06:03:56 +0000
Received: by mail-oi1-x231.google.com with SMTP id c11so1047022oiw.2;
        Thu, 02 Mar 2023 22:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677823433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ2aViFV8G5fD3sj6zvP1zwzM+rkvacAu8VneaLs+F0=;
        b=MPIeoVXSgZQNc49dEdm+5PyxfuyNRWHFy6hY3TPROVGUTnXybd0lj8Feor6Dn14i2I
         DTjAJyXWKQ7LK/dRZ95078fw6kSk2XPI48BkUnUyDsNkC37GQ71FarEh+iKd29Aeu3Dq
         /84zs9wM7/QI4C/5Wirt0SD4iaVkvG9Nu1wD+NUZACxFLqwkx2ECxQX1+xK/uOG8K7+o
         gC/68ag2oH6pq3iqbFkKwhaYTDnFSiCqYhPuBuqPRKQ21tWM4mYP8P7eYUUU8URN2w0w
         iXUKb1GnLiEZzGCR/FXRWm3kONerrmdEYzZT9QD+qyG7OJPJQ/GOptdYbTBJhytkGMfE
         2jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677823433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ2aViFV8G5fD3sj6zvP1zwzM+rkvacAu8VneaLs+F0=;
        b=IMuHc8c/UjqNuzleChYkG+dzXCm0spd7lPZE53pMfn8+mlNaPhr5CQbgc3Blz/yx4D
         1fwcxiZU1VyHsYHVGGpuyvuYohI08MZAAhdIiarTHWJ0pi+my3flYt+0HZbwqCTb0OYf
         +dZVWoGDRIvJtM539jLu1SDC2UpdZRcQgox0EZ73MtDLzpk8iqCN+y0ZHpky9MauMjeq
         sdOYm83uW4y0Lg2TZz/pPds3U2nUGWV8kiXQIp1gnzf9X9dg9Uuf+JuwxphLhoMYLbzl
         pZENzz0ke0SXli/xEZwGpfXkumi2Z/KY/KUMcLfyVd3wZJD0CQ//m5sqXbCkC3kx7vXQ
         n0fA==
X-Gm-Message-State: AO0yUKXafalBN8G1FnJdjaAuPUvdSV+brZyog5fNoGNrkhONgHHQ9mBE
	FXqbNNsr90XQtmLHy8Lhz+OmfKDf4ovyR1P36po=
X-Google-Smtp-Source: AK7set8YxDCWPYK7rU1INZGaYhKhWrHNXMzEGlkkj1ToCKsyEYhRAP7UvN+4lrZyv7g91f2zNpmwjk+BtkPXi5r4J8s=
X-Received: by 2002:aca:1c0b:0:b0:384:2a27:8567 with SMTP id
 c11-20020aca1c0b000000b003842a278567mr198832oic.2.1677823433805; Thu, 02 Mar
 2023 22:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-5-arinc.unal@arinc9.com>
In-Reply-To: <20230303002850.51858-5-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 Mar 2023 07:03:41 +0100
Message-ID: <CAMhs-H9qVE0Z23Z3J8D1voo5UaKZrjUYU=7V=oRMd8=vVGASAg@mail.gmail.com>
Subject: Re: [PATCH 04/20] pinctrl: ralink: mt7620: split out to mt76x8
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_220355_686225_88EEC5CC 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 3, 2023 at 1:30 AM <arinc9.unal@gmail.com> wrote:
>
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> Split the driver out to pinctrl-mt76x8.c. Remove including the unnecessar=
y
> headers since is_mt76x8() is not being used anymore.
>
> Introduce a new compatible string to be able to document the pin muxing
> information properly.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/pinctrl/ralink/Kconfig          |   5 +
>  drivers/pinctrl/ralink/Makefile         |   1 +
>  drivers/pinctrl/ralink/pinctrl-mt7620.c | 257 +--------------------
>  drivers/pinctrl/ralink/pinctrl-mt76x8.c | 283 ++++++++++++++++++++++++
>  4 files changed, 290 insertions(+), 256 deletions(-)
>  create mode 100644 drivers/pinctrl/ralink/pinctrl-mt76x8.c

