Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3DCCCF9E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 23:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhp78e/c+JzJpivrf0ZSW9REEjpcgf8Be2/rchU61Pc=; b=WbUbj0UwK+58bY
	3LB4ACmg7d6Ij/6thxgbGuOfMf1VNkbxZRp2z0JzLbbdlX/+3z4My99Csn0Q5HgEsO02VSW+YByrE
	ofZnOIPM2+ekeLrebKB0UqHvVfHmG35pClA8+sYHU89B8D5VLhufFulG0XRy4nUWx0fb8mFdQztVj
	4veWLQ2hxWDoR/a5xrojBFLnnOwYl46faSACjS2AapMP+6HLdz2/yNLHLQKiKu6efxONbpQ4QokvT
	54qpzY8aotVW3CJNU1blfUeRRyw74VVVGGNYLdk/MJ57NGpEa/t2dyGb1kiVoVzSzoKvivuPR8SUP
	wr9Gx0xFRH2aVfXkbTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbPX-00000006GHL-30JE;
	Mon, 10 Nov 2025 23:34:59 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbPV-00000006GGZ-3bMn
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 23:34:59 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-594516d941cso3967949e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 15:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762817696; x=1763422496; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhp78e/c+JzJpivrf0ZSW9REEjpcgf8Be2/rchU61Pc=;
        b=pDlN6NHq7HRBAcB0ndjWg+tLZz3fWzzLnieB6APUNphblt213+EQZJQvpsGkFiU5qm
         MkDti77xRdiJvaL/i9UAQBg6yjvNUf7uw/Hi13rWZRY3nEWgqRzH4UvtUhm1PDcjcDpo
         vXaZaGzaz+S2sJNI37I0CFcBI3WQ713AJmWBuMbKGEROv/hhY2+FvOS1eot6K6sR8xCF
         dKS+cDZsf6vUYOr1sDMYGH3MiGgGPwCVVrKtRPNSn7XS/n8U59kXYnW1oJ4d76Xaea8W
         GsMFn4XutPcSG9oPBW4O4ZxM670ZQqUlEqSA6F2l7LuxLJPb5U5BVG8rnnteu8MD5uiI
         UtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762817696; x=1763422496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yhp78e/c+JzJpivrf0ZSW9REEjpcgf8Be2/rchU61Pc=;
        b=l4mlXRdsyWznM/EmeUFS8WfO8+LBcX1Pk2J0gFOrEnOls4IdwT4Zdg/Bib8P43nCMe
         w1PKMMr2jYddIPeOp4FCyL2UbQPU1bB2rZ9V7X7M2s9T2Bp5NC5EMu3ztxjdcbQk3QqA
         oiVJ8L9krXYlMKmyBFDFMBGU9KceMcZPMm9yoMIBUGjzDqNYpQYIls5LD3ZI/AamfJtc
         iW+n7g87oY2ctBcMm3AaUjMCuoiUeOah7NnfH9U/6GJGVs6nMe6ppLocf7z/dAI1p3oT
         va/lZJg+ZDIb/jXOdvSTJSpI/tUoCXTQH+OAv9cnA9BKyS99cRC0aE/tWyqKltPluROq
         39kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX7om7h37Uw3hDL+07bJhNkzTNEjWwX6E0BhfXHMg4UncYE7onVIuw4cmTcljhkHycwzdkL1NwkmPJaz11mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ8oimYneCoj1DO35NBhmZRkoyajS8mFCGsPCAysqtRYXnaR/1
	iiIF1II9i9yaK8Qxkue2JyyI34ISD9Cwxb5JaJC7JKu6MlAoij1WvnJzUux+St2aZlGSciNUB4T
	do0u3dxokQxgMdCqn8rSkfvVBRqT06265IXEBEILSvQ==
X-Gm-Gg: ASbGnctLfbXvWvDap/m10ckDykHAHkoKMa80SrH+M3CHXEnHUpMHKJ5T+9ZG6TIGMwh
	8vCNAIvZKpnfNgSJ44UoUFWxJ+trUTEY3+WeBR85gRQ7rt7iqRIjwyBeLVFj30z1Spda3g9EMC4
	E28wtalZjJ+0AlLIhnQd6xFRq/mdbTEoqSxSMo4x8v4NWWsxFlye02Ne7TQW8X97kfo3tMNYhep
	Rj7NYOGc4l4By06fjk9YjAhBgyRH2xENJ2Gr3UC+NejbrUv0FlsxI854XHZKejgI1pdHLw=
X-Google-Smtp-Source: AGHT+IG82Mi1A98FfG7yJz0vIc3+2ARkilByhg2O+8Fl+qHjePdN/o/dGr8Q9VvGwKtcezeBk+2GUuqJSQeCVKslfy0=
X-Received: by 2002:a05:6512:130b:b0:594:29c8:9ae5 with SMTP id
 2adb3069b0e04-5945f1e54demr2482118e87.53.1762817695621; Mon, 10 Nov 2025
 15:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20251105195007.199229-1-linux@fw-web.de> <20251105195007.199229-2-linux@fw-web.de>
In-Reply-To: <20251105195007.199229-2-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:34:44 +0100
X-Gm-Features: AWmQ_blvjYyNcyzASnRUO_VL5niJ7bbXr0Fy6afKuC--gzCCa6ihk2uw5R5x_5g
Message-ID: <CACRpkdZ6wJGRhobbTxvm2ZstHA=P4gaUsqvdm3_n1tKqWJ=50Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_153457_910512_369CC35E 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 5, 2025 at 8:50=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> w=
rote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@collabo=
ra.com>

I already applied an earlier version but it seems identical.
Tags were picked up.

Yours,
Linus Walleij

