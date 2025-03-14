Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC305C282EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyeLesu/6qOxsTAaXie5nFM1At2JPy33BMSuqodw/Vc=; b=MNuJ66sy8G+MzXZi5dEcYS2RQ7
	RVPUCZBI2fihC2PBYhD5DUy/uQjaR3iyURLj15W4HTQipZHZDtLKMsbhSf0pVSoMIL3l7gwk0BmiM
	PgYdyqbrK7UJtGJBCKzz7ifeqk+pO8NG/YvrpbV9BwP9+izFdw/7MLBsSWzw05YlM7URNDLo0SEzl
	LOYO7T2Xz+bd+E9prlBdXh4NuNBKst/RWHFXbFRtCVOEtJpVESAyEMDS6hmz/rfHfP4SdBLwtvZZD
	sssbEioSYYcoR7BXg+GEzhPNCNYw4wsTHlKEDpQZ3i13JuyWVW6zA/XNaEuBRiSxIJ0vCWkB1DO3c
	AYIoqWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2kf-0000000DvUP-3hqz;
	Fri, 14 Mar 2025 10:58:53 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2RP-0000000DsSp-3REw
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Mar 2025 10:39:01 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-548409cd2a8so2218292e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Mar 2025 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948738; x=1742553538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyeLesu/6qOxsTAaXie5nFM1At2JPy33BMSuqodw/Vc=;
        b=zr/hGP4QLhE22oKMsJ6i37fkaJhwdGEHmbP1+JJIeDH8k0KvSdueMSD/Aq/OjcbFa0
         9DswKnRGEazOe35MS4tSicGNghiEd26Mgl4n7sOVMDidsqdwH6aNNU2wJGAgzfOAW8i8
         74Uup9M7lug3wiB+ENBwvBnDI4JFh0qT8r7AeUuwVY0pH8iHOlJLvhgbSiMR7zStyB99
         r6336d+CJrIJtDd5ZTfSLOI3qngymPHS+WR/7bJIKHva9OYLpGkqC1yaq1oM4hgfM6KE
         +3qHDORhv+sDLksFzLloHdZm1sfWvBo+FgoQncQq84PwtZMcyPlmV5Oec6SnTuI3Q0kZ
         dHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948738; x=1742553538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyeLesu/6qOxsTAaXie5nFM1At2JPy33BMSuqodw/Vc=;
        b=KXIw08CoM4+YOkNOJiErG7QKbRUweyb2wkZFzljb9b6VtXIgfpkWp9prRb1Hs4j9+7
         LzoAVzUyL8PtBrjWaNHXQcv5u1roflIRoF6mLbpfITI8Bk3BuErs4qDMvMg+VvM86SX7
         p3nxKcotN0kYwGGQ0NcK2Zg0G5vTPu8FTz4tln1fBS28G9jwoPyxt55Q4P/HEprvBlXN
         kGNuSEvWeiBBbgAEyDPb7910mXt8GGF0rcd6zrNPlFmVp4Eh8wYARtULoa5UX/j7ZvQX
         5HZFhwfH1QsRUoBhhtcb4kco3OYapnvNIrEDjdWVrT874GTQLOtjViq8djdLDUVGXorE
         gwAg==
X-Forwarded-Encrypted: i=1; AJvYcCWn/5SviEqTlfA7xkH3a7lVYidpTyJex20cqeueCvQLpaDKpb4CCdMGrsJuhxK3mCMaIo6/7tNVUYrmum06Ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoMaar9+FVY/csDSQTpnE8QJ4I0ey5bx5uDlMbx2oHyeYRuYsM
	pvawsP38IbeT6NNApbYPpvgKYpOJS2kaXSMg0M8rXXiIqJAt0hFBRdHZIIIFtmCArwWcL23PHFx
	JuObTUS+oG5nq3cFf39K1dX0T3FIV3aoLqZ5CfsaoM0BdU+WS
X-Gm-Gg: ASbGnculenUNp6Hr37Mt8hClya3KYh1KveFnR+uK2FY4a7OrFoVnl6vwuC1/boI08eZ
	/A/t5dxddP/lqUAAHp+E5A6uAtUf/c2hFQckj1pkeCcIDd2TWBwIPMYO07kj1RGXQw7aiYTi1rA
	UcvLxXP7bmyNcybzY+K4XWn8U=
X-Google-Smtp-Source: AGHT+IHxhAnR8E+RwasBnU+EVae5M55GP8ujY0PhZJ8YjGHRbmG1lTmcDhu2uwV0HMJdLPp8ZnEwtoKmC+WIjWFCG9k=
X-Received: by 2002:a05:6512:2343:b0:549:4de9:22df with SMTP id
 2adb3069b0e04-549c3612160mr635995e87.0.1741948738199; Fri, 14 Mar 2025
 03:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org> <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>
In-Reply-To: <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:38:47 +0100
X-Gm-Features: AQ5f1Jo9_mqBFukwygbuTda_hEtN2V8hjFmv1KBkHq8fVH1jsyHNXjQJZyWyfVk
Message-ID: <CACRpkdZpj9q+yH7VEQJ=tOjpR6S3GTeHbyYpqaTYxCOJgGd7+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add missing gpio-ranges property
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_033859_860121_26E74D99 
X-CRM114-Status: UNSURE (   6.62  )
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

On Fri, Mar 7, 2025 at 6:08=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.org=
> wrote:

> Introduce leftover gpio-ranges property for Airoha EN7581 pinctrl binding
>
> Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

This patch 1/2 applied to the pinctrl tree.

Please funnel 2/2 through the SoC tree.

Yours,
Linus Walleij

