Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C77D65C58
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2024 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/pPbpSXvWpzWX5QbdY/3SgKf0FohjhUAcy4H2ySqAA=; b=N2wrM1HNKJ786vn00E7PvOcut5
	JGnmRjrg7lHuNqz5LdLo3+1ua5M/9sRsLA6SxjAjAv5B0EGjTbXOjmSt8S+QIsJqFy4KJX0UFgEGu
	eK1QiGYgG8BPhdJ0AR5c/rEyJQ+UJI8yAriwcvse5PlT3/DLOSFNYC5vFnQjfLNwYmBqvtemQNLrf
	fOk28r5BO2S4OmoVygTYM0+aMLqzRiLRUzLTSudo2sY/1nsdg4+l/nRMYc3T+HxypbjifNXbz/baF
	x+3zxwY4qadaCqYp2Ma7hyEuvnDeq8MdLVccNdEW1YAwMgS+WiVNWP/M8+VSzwZISWDSWPfpXIIP0
	u7xn5eIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUZp-000000097HY-15S4;
	Thu, 14 Nov 2024 07:47:41 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUZm-000000097Gq-1Etm
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Nov 2024 07:47:39 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fc968b3545so2636581fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Nov 2024 23:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731570456; x=1732175256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/pPbpSXvWpzWX5QbdY/3SgKf0FohjhUAcy4H2ySqAA=;
        b=vJkak6fJQeu/9x+gxYVVrXPi0cC9+sRJrvztAoke/a/XpXENYOR7jBZDjggjhx3je4
         Wp6PcAjKVcvY9Jsz8HlRNQXCCvqQn0hUYHvThcS4gCzd2YvbGYpbWunotvYFTjq/0yBG
         TXkCmjhqBZ8NTiXPDOFEL7qrjBxfhDoE2e5f/YsjmkprIsd1yKtnqnrhEk6h2dfhBlA0
         My7vP89WUsrJKxZLT4pPx+x69m7Z7cOAFFis0r9bGdCmqJosImFWN3o/VR0+U0IvWzH9
         uAarSuTnp1zNswAesKQtHlRyj/wBmdh4izrxZnAofM5mdTohDvR96HF/Eyz71z1t1vNn
         9TkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731570456; x=1732175256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/pPbpSXvWpzWX5QbdY/3SgKf0FohjhUAcy4H2ySqAA=;
        b=pEYZ3kd9gg/lfGhY8Hcxs3VpbxFmFqLv73RJSoNbj7LZvbT/Soi2dcBRaU5Mhx9zVw
         FhDixUGIaVKD0f+UukGapjPbCA+Qrkzl8HbOp1SEJRps4iFva4aqLT6C/N1aYIPZXine
         XD7lNGneDuKBROJa6xjBhnrKNmPUxITFddZzdfYBWNwVNbyD7rXjxllafFoblCelNH+v
         +GZcpvxQi+ZfcmFOJS9+JanYyX9rNkMnzEHdB7cFV5EsXw0/DLZyAFtK/W6ky7rhngUs
         wcReXvHkU35YggBhXHGQnMRLjp74z5LGgj7fmAeGEEpHGorjYzI5/pUFAHtbQ1CH4XAr
         DL1g==
X-Forwarded-Encrypted: i=1; AJvYcCVEobOqvrs523cWqrpeIrrAH1ZbOMe1QrXn8HPiSlYAzr81i859x4R/R1hexjDTVpJZZ+uj4moJlWsVdf3xcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybglD/YhLpPh4oMV0hiQKXDhvjBaxHbWa2GU0G60flRka+InlJ
	RP6H5fM30K2jfrj+9Xp+XH1QO9eGL+AiTQZUDoShV72jlD4VHObo+mnuKpuq7KSJEAF68ICezc2
	f0G3O5GjeDNAIkKEgfuqFxDkUqdVfuP2q15iH8A==
X-Google-Smtp-Source: AGHT+IErHWmbQJv3kvLImbtdMuY4ZYbaGmwTC9XVeS7KTlKYd0znUE8GAC45BulO9USEVMUBJJUBjCdUo127qToiX3o=
X-Received: by 2002:a2e:a548:0:b0:2fe:f8e1:5127 with SMTP id
 38308e7fff4ca-2ff4c5bf818mr28281151fa.9.1731570456279; Wed, 13 Nov 2024
 23:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org> <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
 <ZyssJpR7xwbMzUsm@lore-desk> <20241106110046.GR1807686@google.com>
 <CACRpkdbf4Pb+n-F-K-JaUvytwCGUHHh8d2rYP4A9KgVTzqSnGw@mail.gmail.com>
 <20241111165120.GD8552@google.com> <20241112144427.GI8552@google.com>
In-Reply-To: <20241112144427.GI8552@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Nov 2024 08:47:25 +0100
Message-ID: <CACRpkdbnon4J=uSnVTnhsrkA1z2P9tSCDt4mhMShGtFomUxNvQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 4/6] dt-bindings: mfd: Add support for Airoha
 EN7581 GPIO System Controller
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_234738_358949_F245DCEA 
X-CRM114-Status: UNSURE (   8.30  )
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

On Tue, Nov 12, 2024 at 3:44=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> > It's okay.  Life will be easier for everyone if I remove it.
>
> Okay, I dropped it from my tree.

Thanks!

> Next time I would like a say/opportunity to Ack please.

Yeah I was a bit trigger happy, sorry man.

Yours,
Linus Walleij

