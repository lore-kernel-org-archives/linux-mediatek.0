Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBF1CCFA1A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Nov 2025 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeMwXNllT4LhHLeKTaFba9eFWNp9e0Refct3JU/EgW0=; b=1ccKkwsdanJ8vQ
	+XVKX+fTVru8awgPuRg4XXLsenLWFFt3pI9AzjfudZ8DMfiei9m/tkP6qOQ2f/YXFjMjIQowMrQmq
	ZYgg316G8aVicwg1mFl9ysdnVJdmH6qfr1HPSEdaSaw5plF+VpvR+83Gsg6rKQDngxcv7jMCzLgw4
	pxhHoEPLj57NhbVm40rgY5k9KJl7L6S6LDzQVdup0csw/Fn+j87UdntuTXtvrLn4kghxZLrtllBT/
	qk+oDxXRhtahVQQq8/AVHK8Xy2P8bIu+2TswolTdXa8J9VaCaXCwiYGFVZtGJtLWZwu6FMl3aEDhb
	N20YjtYfL6p7wBIhg+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlNz-00000006us9-0SPk;
	Tue, 11 Nov 2025 10:14:03 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlNv-00000006uq1-21iL
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Nov 2025 10:14:01 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-787df0d729dso26516287b3.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Nov 2025 02:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762856038; x=1763460838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeMwXNllT4LhHLeKTaFba9eFWNp9e0Refct3JU/EgW0=;
        b=F3yv+T7yM1jZv8zwmlwp9dW/Gs0nS0SLrV5ACFsEnQwjIHCLo6MvGuPW/2kFGF2KGJ
         X/2fiA95dn9ItkheZWNYWtnrBjChl3DOf47cOnPCJyM6EuiG6X0qv1O8mjGZXjxpHSSm
         V6DKfk1DgMpU6R8t8eptxUPh35EDiIKy507hlfhVaIvmVVkUMVGQLjbQWkmviSQaZOHm
         B2iMpY3+DJtcrvGqcBFouKUupAKDnVoTezlkuwVjYENL3wYSYaDipUWZ8TUMvnRDAf/I
         RWQ9f88a7zjPOsabnKHwc2GB9SL+QsGIsPXUUUVM4SBZcSEjWuWvWcmwtqrnihqSrzVd
         2AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856038; x=1763460838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LeMwXNllT4LhHLeKTaFba9eFWNp9e0Refct3JU/EgW0=;
        b=XFkH3bm7FBM0usu5xu+H99zbAnXI2oz042FMxDD0qeydJ8o6fmad3cCtgnjPuWO+es
         7P8a/ZbaK9M0gveCN/HcTUwflJJEkyijPbNOWrggST0kfnohPKIzmOE9ZxWgBcdhrKh7
         OuOtTzdTUvMgMVLAcvFswEwjQ3azHJptL0J1rC1W98KMgHz8qClK0/GxWJTWTDlI3Hpm
         Oei4gEn5YB9oqCPjATJ44ugbXwtRapN0xa/lGmM10TbJ6OKPxQ4oXIH4EIl8ZkmYm/PC
         5e/JLNdGzuM1u4OcF0HUfTL31KmYiKWnMP2IFci9KiNK03OGXdhJOlA0CUMcVIX3IGGO
         zZmg==
X-Forwarded-Encrypted: i=1; AJvYcCW+Zle2DU+Weaj1vDFuwU31BGt/VkWu9wYstPk/ZTOW8Tr2dK4i73vvPs2ooy955J9AIF0n6xIEVJ1XIN8DTA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa46bWFPjIs8Rw9xUxrUraPuBw54UkXkxhUnadxh4ashmw3Dn0
	NJ2VtFKYKwthQmYDke33rFn/91eDyuImbzM6M9rMtNhlBALoRhrJ8XXJcwYUvzohk0uFWk6h6Bk
	UdJ6wEjvSqj1HxkjonOtPN7Y6kCn52jqscYg2k76AeQ==
X-Gm-Gg: ASbGncuTOjlAStphfyprYl6tGlOhOUVaviLbLEo/PA5sN1Zj/oH4/xv/qg0adnyCwkN
	+sKPWaBleIE1rQzV+IzryXnQ8Mn8Z6y4ynkBSeLw5s/9yaTR6HSO5eKYAziFOmMt1PBEJd3y9eV
	WwOuDf7yVqrnG5KfUMpnAfxyu9tQwdfQ1XjxG0VNj2Tt4anZtVen75MB3gxPqjJFLOdn8LrPcCJ
	0t7+skubP/Y501lIL9WZLLdF6R2v2MPLj2683G1dOJQavNmc0bFVdQhGY7mDNLNS0X+gAo=
X-Google-Smtp-Source: AGHT+IF9Qzu6zmE2Iio8Nz23xz7uKZaMMjTrJFnhpC9W7T174pmVZm6XJJz8JqOAQn21MLhQ4SKvuQGEPKenwCujUTM=
X-Received: by 2002:a05:690e:dc4:b0:640:db91:33d4 with SMTP id
 956f58d0204a3-640db915617mr7528496d50.26.1762856038239; Tue, 11 Nov 2025
 02:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20251105195007.199229-1-linux@fw-web.de> <20251105195007.199229-2-linux@fw-web.de>
 <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de> <1af7077b-42a3-4efe-a8cb-6117136c8f2a@collabora.com>
 <20251106-strewn-carport-a33a8b812794@spud>
In-Reply-To: <20251106-strewn-carport-a33a8b812794@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:13:43 +0100
X-Gm-Features: AWmQ_blovY8iar-yYYC_DuviA6U5c_hbl8gXmu0oONH393Qf8f6FhAsUxk1NsNQ
Message-ID: <CACRpkdYbcc_0=qwZgLhpTi1NNjkQ88JuOANqTqTfwMrUs_+OfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_021359_534735_DD596E40 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 6, 2025 at 6:43=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> > > Got error:
> > > said: 550 5.1.1 User does not exist -
> > > <angelogiocchino.delregno@collabora.com> (in reply to RCPT TO command=
)
> > >
> > > maybe this can be fixed while applying?
> > >
> > > regards Frank
> >
> > Eh, have I typoed my own name?
> >
> > So cool. Lol
> >
> > Just in case it's needed:
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> I have a vim macro to a) save my hands typing lots of tags b) make sure
> I don't typo. ;)

Typos happen. Also for me.

A good idea is when you change mail address try to negotiate something
simpler, this is one of the reasons a lot of maintainers have simple
mail addresses such as linusw@kernel.org (which will be my next
mail address the day it is needed).

Yours,
Linus Walleij

