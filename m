Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679D4CF2560
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 23:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CkKy4I7Nd+j6TrDrYR1KHm4hZaUOzQggilxM6L2z5U=; b=A+L+nVpsanbYasc0lSIElEfCa7
	QKbbpk/xanuzFcLwckTi+DG5+QVXw+El8qYfyEYOfVmkqCqfKKpnMScW5u5tb4ECANYGfjdL7tNhR
	B7hWjdamoevQ2reRyGfbcpm4hKLoBDjoNh+vLlXkjPgjpI0NuoQaIeE+q+dTzb6Q9ag6uMR7j18LH
	OVT8Vcgz4nb0yxGe0c+/mmRubhCfY19pHVkpBO+Ni30VDmoC2b45e4tTakICOtXy4VwaQPxJ32UBl
	FSOwiFqj5+QJuZs3RcUTkvRDGImUbvOwMWMmfs3TpZLLQdqYN3VYa8C8bmfL3U3DQ7KsrtyYdaG42
	kl3Yj9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUjE-00000001D9W-03QS;
	Tue, 18 Nov 2025 23:03:16 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUjA-00000001D8i-3kva
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 23:03:14 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-787ff3f462bso3995327b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 15:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506992; x=1764111792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CkKy4I7Nd+j6TrDrYR1KHm4hZaUOzQggilxM6L2z5U=;
        b=d0zr14SNKPEKAMkgKxP9FtU3DsE9K2e/q3ztcnVdQH0S5NGvt9vFmHB2QUBG3qQ50X
         qYfvqojn2IYZ5xnOEAzgSCuYeYBg8xNS6byrCIJRdgN8Qg50KEV5F2uukVfv+/x91KZo
         wefaK10udGGFbTd/nUffHgaLLCI1mOUHJfxLuozZE9ERg0Hp78h0qQj+eXYTivuoA/aA
         RF8sL5VY8BSuIZxTkQUPZ2nTmH6j6IAckVwE9T0rIweP8RUaKKLkMbvVzvggeXwV3l/c
         wD3uhw2IH6G3L+FLTNJgKvDrUKBdLDYRpPmrZsb3jLjpqfB0fFNOw/ZrzAnOmlb+YHIC
         BlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506992; x=1764111792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CkKy4I7Nd+j6TrDrYR1KHm4hZaUOzQggilxM6L2z5U=;
        b=r3UBkWjKsHllXC0ZclYRaiEq76uUGl3IaJN2WiGbGbQ+jQmP95plXeFp4+reSDOMhv
         nlRMo6fftdSU3XRI6LStuh1/XhwwOZ7Ih5ovHUDHZ2vz4nvv77L/bh3MIDCUQKxj7N6x
         LwsVhRXQtIEgIFCqIG6A3qJ3EbIVTigMxt81Em5sBzVqaPiMy0GL4p7VLjZ7HlucpbFh
         G6NiEm3GWas3iMool+U386SxxtyPwMvucFFrh18z1m7EuFItNWmF4Exbz33jnceuID+7
         EBgR+dHnlu9yKb0bKmzDYsiRfv66JLrw9OS+8I8KQd9RXsfOfZLJDtg2fOdKEp5uFBz0
         odUw==
X-Forwarded-Encrypted: i=1; AJvYcCVSl6JsmddWGEdh4lQRKKYQACwrPlV7/G722W5/tPb6yTV0blUD5n5gEL2flbJCZGYpfIPIzadM8lkE+K4t0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi8uOULfwLcj3fR+ndVbZk4QC+wfWI2ddSrl1weI8M6GIQwoRM
	y0nr99mAGBd2Q5AGYgkG3VbLOagRxApPygTuTKCSG59o4Higx3QoM9RXCFmSBmYU3TGp5OW8AiA
	s059B3O7jV9WZ7pbhxYJw6sBBjcEbLz899BSqmJPrSA==
X-Gm-Gg: ASbGncsWaXX1ur1lWGBX2EACkmUzR2ARl7Mx7isw6gFKtr+m6CnGseYUEGdeL9pH+1+
	XtMGVbjlU/ZF51pbGX98UVFn+HsdyJ/8USgJkTFQfE9hqOk9iMNJUUo829lixfylcVEj8LhlA3m
	f1oYwVslsPaFXeeNTNqLdScHJSEq+IWwNcA/vd58ZEPJcVhVkdFxNcVlOudx7iV4/L3wZRLKtoD
	n/hrMaN3pFXpsTmv+HSPB75O0VQP+m1OQfGpAWQ1VtA+oz0OLM9+6PB28h/N4RMi03lkvs=
X-Google-Smtp-Source: AGHT+IEWG/T70U51QkboX+BFArhMW1GqtsSC5NyxbuNNMatQpKCwXgLG1q4spEcInbcCfufWgaMLYLHwYyBGvQc+TgU=
X-Received: by 2002:a05:690e:4106:b0:63f:b985:66b5 with SMTP id
 956f58d0204a3-642ed60ce63mr266853d50.6.1763506991657; Tue, 18 Nov 2025
 15:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20251115100000.177791-1-amadeus@jmu.edu.cn>
In-Reply-To: <20251115100000.177791-1-amadeus@jmu.edu.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:02:56 +0100
X-Gm-Features: AWmQ_bnUW-BUpl8V9jWIRwhTERbiqNe1byNfSmfq0uZuXktxGoeLDqptYWTthh4
Message-ID: <CACRpkdbMPGL=s7gmQsRTNpzdBanWHRX857bcg0Jiu0Zfp=hSyg@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: airoha: fix pinctrl function mismatch issue
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, 
	Christian Marangi <ansuelsmth@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_150312_937197_1170BB68 
X-CRM114-Status: UNSURE (   9.35  )
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

On Sat, Nov 15, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wr=
ote:

> The blamed commit made the following changes:
>
> -#define PINCTRL_FUNC_DESC(id)...
> -               .desc =3D PINCTRL_PINFUNCTION(#id, ...
> +#define PINCTRL_FUNC_DESC(id, table)...
> +               .desc =3D PINCTRL_PINFUNCTION(#id, ...
>
> -       PINCTRL_FUNC_DESC(pon)...
> +       PINCTRL_FUNC_DESC("pon", pon)...
>
> It's clear that the id of funcs doesn't match the definition.
> Remove redundant #string from the definition to fix this issue:
> pinctrl-airoha ...: invalid function mdio in map table
>
> Fixes: 4043b0c45f85 ("pinctrl: airoha: generalize pins/group/function/con=
fs handling")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Patch applied!

Yours,
Linus Walleij

