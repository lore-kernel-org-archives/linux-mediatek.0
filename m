Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4F0CF31B8
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL9v4AHZ/INp8TeWxKwvfGoMuAaVHhqmCcCgRa9MWnA=; b=2ACX8wZ51xF68ojx5XsD2QYJQa
	d3RCJYZIoceqTni0EKnM+gFakdhpA7ISUTgpfAzPcFlnkhjmTgsrS3kAf4dWNEXOsY0UXYzvP4RUs
	dALGiFy8hkusmPPPwxDaBvz1I4cdsywonnFM6WJeBAl7/UXF8wKJfqQJ5VctmcJpkoa8iKalWwriN
	UBetMM8wmXQKMta01Fu6Xeis5tU3EI9uXXeyiIN/AXz3VxKxtDXtzsHt5s3YeoiaprwiPNvc+vi/v
	RtHPZSW3y6QNvs1hX1gMPLgRX8gEEXl4DsaoHZTUYGOjiMij7HDzH7XDgQXQCKxCQYm/iZDtt3fY5
	D1GUdzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svy3F-00000005lfN-1f0g;
	Wed, 02 Oct 2024 12:01:53 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxzk-00000005kd1-3ARl
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:58:18 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-84e808f3c3cso1724178241.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727870295; x=1728475095; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL9v4AHZ/INp8TeWxKwvfGoMuAaVHhqmCcCgRa9MWnA=;
        b=lfFWa6k2qfnXJjZJibLQRYBnvLc1lbqDL3B9WP4sO5b6C9MFYuqujvj5ENVHQ+juRA
         tz8l8vHWOS4sx7ostb7DqUiur3X6tf8LKJWkic8lJWPZqLwvUjKP03+f+0OpLT0d4Jo2
         WaEJYDBJCcPbMPWE8icd+pSpjDS7fCN15GhYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727870295; x=1728475095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fL9v4AHZ/INp8TeWxKwvfGoMuAaVHhqmCcCgRa9MWnA=;
        b=bsNNb1VYQOlVhRrAGXTfq/9TELQtTKPYPoWAnRRPmAZQU5XmjmnMYDlOuSvoIZQK30
         0oras55rjzWqrfrCaF52YBONGW9Y5ENiJwZJd5o32IOc/kAfiNJEXAUenwy9nRFYSOn5
         lUy8/Rw/aTuQMTJn/TLefnG7CK6ZRlRX4TNkw5NNiAuXHAlcs4yCzf5ip+y9GycHIwcl
         5Yi1WMYepyJ11PpHqUMoEm8YoYzubRnW56NPMMrd6ySTt4Tow1Cpo3NuaR7dOMoEXwKd
         W4bv6YJylmy45U3borrEBhf24fW6xCfN7/lxlwx8xYOe5hkEFOvq6slhkjCxJggnFMtQ
         pAPg==
X-Forwarded-Encrypted: i=1; AJvYcCVz6eEExDbGq/yJ9PdHo5P0ILHfj6DvWVAH3NrWK1SarbMt785WGHgxCqp1NgY7QiH1hnNnZ0LBNJjOvPjfWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKmUrs6UNmuFG1nJm0bKAS3VQUsqZiIms/kcCYGIgaQLcCXqpf
	JZMtFmBN8zbO4qIdA2YlVB4zLrI38cGV9YAoy+fztqp5l6/MRCWD/N5r8al05mdK3SsTHB29mg9
	MbQ==
X-Google-Smtp-Source: AGHT+IHwjuiOAG6mqG23oNqOlMwEbs/qBbY4sNUnyFl8MUkjsVlXxYB2GDXLG7EIFbuiGtn0EaTlgA==
X-Received: by 2002:a05:6102:50a4:b0:4a3:b91d:78b1 with SMTP id ada2fe7eead31-4a3e6933115mr1936024137.27.1727870295034;
        Wed, 02 Oct 2024 04:58:15 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84eb1d4b4bfsm1581216241.0.2024.10.02.04.58.13
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 04:58:14 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-84e88c2ce05so1894232241.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:58:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVO2aEZy5m6G2SmpU4JggdWXj6FiTkFft5xlbI1RE79p475GE9Wqy1hvoWnF9YdbfB3l6fskRv0yGLqZSmYTQ==@lists.infradead.org
X-Received: by 2002:a05:6102:3912:b0:492:9e3a:9f48 with SMTP id
 ada2fe7eead31-4a3e68078a7mr1610494137.2.1727870293454; Wed, 02 Oct 2024
 04:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241001113052.3124869-1-fshao@chromium.org> <20241001113052.3124869-4-fshao@chromium.org>
 <r22z7eehmuprvq67gxekqwsah2mcobfsyhn7xzyyh2gdtjegve@zl32uljxrilx>
In-Reply-To: <r22z7eehmuprvq67gxekqwsah2mcobfsyhn7xzyyh2gdtjegve@zl32uljxrilx>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 2 Oct 2024 19:57:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhF7CiiGaNASiqYw4Av7MQfLJsUa1HrYsx9n4D2sAP7Gg@mail.gmail.com>
Message-ID: <CAC=S1nhF7CiiGaNASiqYw4Av7MQfLJsUa1HrYsx9n4D2sAP7Gg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: mediatek,jpeg: Relax IOMMU max
 item count
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Xia Jiang <xia.jiang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_045816_829866_1290FBD4 
X-CRM114-Status: GOOD (  22.39  )
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

On Wed, Oct 2, 2024 at 2:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Oct 01, 2024 at 07:27:21PM +0800, Fei Shao wrote:
> > On MediaTek platforms with Multimedia MMU (M4U), a multimedia hardware
> > can be assigned with a local arbiter (LARB) which has a maximum of 32
> > ports for MediaTek's IOMMU infrastructure. That means there can be at
> > most 32 items in the iommus property in theory.
> >
> > Instead of relaxing the max item count every time a newly introduced
> > device tree hits the limit, bump the number to 32 as an one-time effort=
.
> >
> > On the other hand, all existing and foreseeable JPEG decoder nodes at
> > this point have at least 2 IOMMUs, so set minItems to 2 accordingly.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> > It's not in the upstream tree yet, but the upcoming MT8188 DT will have
> > 6 IOMMUs in its JPEG decoder. This patch is to pave the way for that.
> >
> > Changes in v2:
> > New patch.
> >
>
> I do not see any user of this in this patchset.
>

Sorry, I was doing more checks before sending out that series.
The particular patch depending on this is now available as
https://lore.kernel.org/all/20241002114614.847553-6-fshao@chromium.org/

Regards,
Fei

