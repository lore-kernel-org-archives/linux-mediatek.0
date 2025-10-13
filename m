Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06289CCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 11:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpT6hXn4aVzifNN3nBALGbtn4EidYShjvQJLlFyRGLc=; b=Ey40UKbzsHZLGJQwZPBCMocyCs
	ZrVC2yMEliTHq5ahPN+r36f6DvpoWpLu2J10CV37qeY/oMKpH9odSXQI/P2ZH9zcwe9HEOO252cqv
	qiijWNyTKwXLdhCok/4aYhVHFFwCxVQnGDbGeDeZwvOpxmrJaEn8uRhIo4zpZfn7SVZjsZLrYrS5A
	2HQIgRuKEVV/9UmdHZzotMNrQnxXdDefhVaCBCt/aAqFPLosS3iA+6xhm6IR03yDpiq2uaBF+Rr6S
	W52CZBzLqnCjJSFBiAhtmyawPgyQMtWAkAiSDyUKWHB/Ge/nYKNNLMSJbIPu0OkYKTjpp/Vb1WGkk
	EXrUK3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GQi-0000000CzGb-0nQ5;
	Mon, 13 Oct 2025 11:09:28 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GQe-0000000CzDr-3rq7
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 11:09:27 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-363cb0cd8a1so46284361fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760353763; x=1760958563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpT6hXn4aVzifNN3nBALGbtn4EidYShjvQJLlFyRGLc=;
        b=Rig0csyuw1I09u69cqb/DyHm+LfPce0w3j0gYLQr6g8wk6vkXEfe1Ct3Po49IdEwd2
         qMxnyMuTdLRAWkuLeP46rlh3WYF8JLl2IwSTu1/nW94nqIo6iMhj1R8Sg+OijEaDBTTM
         jKq8pY76m/7l38I5/dYWtKk8zyLzlNQBYPGJ+qcIsLTxZEiGCQe0lGS/IhemrDoQo718
         iDDegpCQITmjNZq/jzijHWr11TeQzBeNqBLLVdvBJ7sjO7fsZChU6Uo+uisNEoL7vZCz
         Hn+/1B5zt8eqWpICfNv17DQuEGsQtaRwHqx92CkWHJrkQ+rU33XWpbVA8Jg5prAeAiD5
         qBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353763; x=1760958563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpT6hXn4aVzifNN3nBALGbtn4EidYShjvQJLlFyRGLc=;
        b=O51++X6xnoTg1aYMe4klpZbimWycWeYkDaoPKjtmFCuwKR9uJFQY+UauwQNREurZoZ
         9/8WtNSeqYSzxpiUyfJkzuFlc5wukDIO7/EhKDV6u+dA2fVLwTQOxW9BdHMtxlYaZPDI
         15exSlIlaylI0JbfxGooKt3ycMxsLS2pUI3XR8YJOElOn+QsrUKEV/TrfoCdAB2Xaxgn
         uSTjybKcGMnX9zWnJzOzTRmoHngnHE+8W6pxk64DblcFomxd1MSCFgHV7HJGLFID5Ti0
         y9WYFo0eriss3p0QYI8tgWh7sBFTTyQwNKNjq9GpOKu5jM63Ad2cwoOhjl4jFZweaMdi
         //qg==
X-Forwarded-Encrypted: i=1; AJvYcCWxMYnx0JN5/Kmz/C+tI51nHvnmFpcBG9AoyLVTVKugAbLpjWrmkcJ6j4X3TCxVBsQBNb6+inraKamzmW7c5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMkeWByhCphXfFG9wvpD2Gprtt0WKoHQtK3fu+Wi+R+liXQRal
	PHeHlvkXea92PSJV9EEONoB6i4/2KpHcybTLuXmTOIoy85qGOXkvKOBA1uapzB7SdPqSqO2yJbW
	XbulUzqqKlEMkI7U1HTgvWZ0RBk6iZ2TB1oIDYOLkZw==
X-Gm-Gg: ASbGnctrxsBS/9FOEFMKZyeBADzC5uCpQ9GchBLgKCxRLlGis2dLlgmE69+P8AGs5ue
	qtsWj7w8t4MByh10HjMLzLkZqv39v8uQTf5bXpiKkn2/Y16LX3LHuibihyNFKoXa7dISrh8qO2E
	SA+JEfDnuaF2W161rH9u6PzOiGzyhrTNHeHVd9VZN4WI/T15YMWhk+aXlwR7oeKpDulj8vBaD9V
	+LjjShpN0BfsTe3OSldldKPLrWWag==
X-Google-Smtp-Source: AGHT+IHyxiqyIG1018vg7vc+mtcW6A59E8yUiwGYRJGG9KxCKw5fvAqslGiUqpn1l8NdSfenK2sicsLNKavqouk3DRw=
X-Received: by 2002:a2e:b8c1:0:b0:365:6b40:8656 with SMTP id
 38308e7fff4ca-37609eb8857mr54723711fa.35.1760353762857; Mon, 13 Oct 2025
 04:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
In-Reply-To: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 13:09:11 +0200
X-Gm-Features: AS18NWCBPX6jrMPcN6UDT2y68ZZSKL5gcB8CFxgIkLczrmPbcNs-ikNBr_vqb3g
Message-ID: <CACRpkda_BUvjBsrjG33mg-xV2_X6UACUPKRQMF0k8c76fSoS3w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8189: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cathy Xu <ot_cathy.xu@mediatek.com>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_040924_963953_CF814F10 
X-CRM114-Status: UNSURE (   9.64  )
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

On Fri, Oct 3, 2025 at 3:50=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:

> The mt8189-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8189_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8189-pinctrl" dt-bindings, leading to possible dtbs check
> issues. The mt8189_pinctrl_register_base_names entry order is also
> different.
> So, align all mt8189_pinctrl_register_base_names entry names and order
> on dt-bindings.
>
> Fixes: a3fe1324c3c5 ("pinctrl: mediatek: Add pinctrl driver for mt8189")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Patch applied for fixes!

Yours,
Linus Walleij

