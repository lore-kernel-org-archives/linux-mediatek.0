Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408EAC54F30
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 May 2025 13:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ish6o0Bhh995IK2wzs6updBAdJ3S2zxHBcJqrswtQm8=; b=eHUmMrWCpE+99RP/zwm3LFzBaY
	SS3oFUFWub7wFyVblN0f38nbAY91pD+sYbiZPlCGHdU15iD6+YHFKUAWUjFrjnljUUKT+McNGSHc/
	ts0yxWxB9RTTgpQT/gxMLAU8JneVrwy2p+q4PfDoVRHYoCWA8GXw8PVtTMe/cXbqQScv4ZhoSrzBK
	rkPxNbK66QJtM2ImzjCox9+3dKIqW7FsMtcdQ78lNRbxsfdcTRzq5B44/+xIPi1VLY3r1KqbQC1Js
	D6rUZ6UI1/puae0dFXZ9i/AiWDtrcwFjaRRhJIfza4nFGy4+Z2jtIITlh29IYAui5w6Vsh3FtJiiM
	Bo/ojU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuZR-0000000ArCW-2M8f;
	Tue, 27 May 2025 13:42:21 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuU6-0000000AqEA-35d2
	for linux-mediatek@lists.infradead.org;
	Tue, 27 May 2025 13:36:52 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4768f90bf36so27438581cf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 27 May 2025 06:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748353009; x=1748957809; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ish6o0Bhh995IK2wzs6updBAdJ3S2zxHBcJqrswtQm8=;
        b=GMa+Z11z98ElNMoZS7W6FaaL/iUP/FpUzvLbuee/B9KT5n0gO0nf3X2CijHrde3ZDu
         iaznqInIwRGD7WwR4XB0HU/y5a96QGB1TANe+86OIN9dihGwe/I2n2nMadtvEHZVvbif
         HoynaHxnrcq2WKa5NrKF4qQQtMGJ/3g0C+xjP34N+Abdz12ku+6OGk9wV4lSBiB3UJqR
         dTrm/joSH/rct80ZTaiM52o3TR/WeZp60JLcsHtkMyT10nPzzX1K2jHzWLD9Y7UOSt8F
         zxG7Ro1VqNlhfl52c06uK3QhOtKZuNkXBuoIMu6fI1leP5lY3vt9MCKjS+KTrCqoJ35L
         xPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748353009; x=1748957809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ish6o0Bhh995IK2wzs6updBAdJ3S2zxHBcJqrswtQm8=;
        b=h3sYbBku8mVSYF0gFof3nfXwgoGejU2uTgNCFLe5ETAVv5NIdoMkSIGvWCtUM4WSUs
         yRbfm3JY7UGSyBw3KYtuJa6v6S4EmJyXyF3EKdJABBCinXoQX06Q5h1eoNPQpibRHw91
         tqfPg/IeFrVwTqY3NaBDq+0vJCs9sbiX2gF3OJMZnFijMyd00d9MXVpQmvzw53iKoE2u
         6h6rIhSilfTU3JDL7o1V73+ur7BuBtFpO1GfvRJw4aTYumMwJfnLfg8cOaaf2F+1Mgqo
         OjE9NlpvPHeCT+tJh/dRWo9wJ3gxa+sKlVIO0NsovZUIajgEsZH6rTw0d/qZNzCt+D8s
         Aqsg==
X-Forwarded-Encrypted: i=1; AJvYcCWxLKij6m4tXs2pig9yv3PFmhjrvDz2cLN10KO83eu0zJzKNXU3o/xKHaJ8ivwxJOKRBal6DB+HuQQdvVvlow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmARDDz8GBwtTp0H7j4yVXMMh+bKra4cwMYC11MY1mynfHm7mz
	w4jTD6KMEjlV8qVUpIszs7P8WUxdEYeS0xOWbbnXAdDlif1/6GsBFRhXSxManbjrzVyxAnvvyhZ
	KGEFvNQSksQlqkcOiIPoahQoFI0Z5RCYhWpbMXl+cGA==
X-Gm-Gg: ASbGnctKCflRivm7RGm+4vnCgc7ampMTQriTgAgMWb2lW/CUTmtyUcvu6AKTsPsrddc
	A/0nOvInqbvlczq7nDOrzVAygeiIeSgTbLXzYaO+/F5ICV/wvk4cUY0cD3gc9cMfYNhuy29WAjz
	vEH2gqJTa+6Lkkp85CiMS/cEYiJokR4A==
X-Google-Smtp-Source: AGHT+IHr4jwrHqEJczRvGQzuN87CsS5C28zJXtY9UXRLqVMsScrfx0niqPKTlAIrCpVv2931fOLgMYPlwCUzMNEDANw=
X-Received: by 2002:a05:622a:1f8e:b0:476:8eb5:1669 with SMTP id
 d75a77b69052e-49f4781ed76mr216619901cf.32.1748353009174; Tue, 27 May 2025
 06:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
 <CAPj87rMjAv-UphvFuQjop60o=wHrkfs4-XOM=JqH7f8Kk5dyVg@mail.gmail.com> <e462cdc4-7243-4cef-bd1d-a0ef551b3a87@kernel.org>
In-Reply-To: <e462cdc4-7243-4cef-bd1d-a0ef551b3a87@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 27 May 2025 14:36:37 +0100
X-Gm-Features: AX0GCFvEuF0JQkg3QiWt8vTrQrmgkUnYilTb6_QdjwVCLuie3br5KvhEpdyYryI
Message-ID: <CAPj87rNZPub=hEs+86JNfR-iqiuRYGGGKGsYyXtE1aUt8dEyUA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_063650_881457_F6FC4CE9 
X-CRM114-Status: GOOD (  14.87  )
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

Hi,

On Sun, 25 May 2025 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 25/05/2025 12:48, Daniel Stone wrote:
> > On Sun, 25 May 2025 at 06:16, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> >> @@ -45,9 +45,8 @@ properties:
> >>        - description: OVL-2L Clock
> >>
> >>    iommus:
> >> -    description:
> >> -      This property should point to the respective IOMMU block with master port as argument,
> >> -      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> >> +    minItems: 1
> >> +    maxItems: 2
> >
> > The comment removals are not documented in the commit message, and
> > it's not clear why removing information and references would be a good
> > thing.
> It's obvious, isn't? The consumer shall not define which provider has to
> use or how many cells provider has.

If you feel the change is good, then document it in the commit
message, and ideally also use separate commits rather than throwing in
unrelated changes into a commit which does not explain anything.
Again, the kernel documentation explains how you can structure your
commits in a better way.

Cheers,
Daniel

