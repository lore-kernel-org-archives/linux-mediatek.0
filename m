Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11869C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAifdSfv0qu9/9RmW88ObONMsIk5lXQf5X6sr56a9BE=; b=RuELJN3VvTl791T9nq3Bry2LcK
	6n0EH3awLgad1nKdv26/WxqAFQqZudJUTPcsjPTjiTtgIza5jOAOejdibWldbQZacFZRsbOd261D1
	gs6rBsS67gsc9hymIHPWWGUrIcOPqfw1IOEKJ0Irkcts30cR1NsSgyIrywGkQlx6f2p7gC50xl9HA
	nSJGh/OMxY/UHexhKQR8eTEqHrHKvgTc75/zol/DeXkdFegkDQrt5WwyRLEtcHKb+UkqglqqIGuyA
	rmprfMctnI6Kwf1CT+UxGW+XtgDqoUi6LdUh9MqyKZOrxFEBfnNb6NhWwl5oHbEOXmRrKY3UV7/6a
	QndyvyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUWw-00HFpW-79; Tue, 07 Mar 2023 10:26:50 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUWt-00HFnb-6G
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 10:26:48 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id v27so11851950vsa.7
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 02:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678184806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAifdSfv0qu9/9RmW88ObONMsIk5lXQf5X6sr56a9BE=;
        b=HJP2dq5eXMi9C5VywdM47zJbV2wVa0N9nsZp/eflBdCu8ikIWZJM5r3y3UGBH1Dlgg
         ovaGRHIAavdwMr2Qq7xZieDNL2aXPJBNp1mqtE5DwSN4Gt7Tu1IBjw7nTVEj8ylkFhJI
         G3qzV/86brm1FEBBhZbPlFtVo43BQKrW+Gx+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678184806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAifdSfv0qu9/9RmW88ObONMsIk5lXQf5X6sr56a9BE=;
        b=lYAm68X7M4QmMmRgzW7jf+OpCTqLiM8JIvISQF2fCFBjdry1LeurZV0QgxY7/ytSZB
         t+uxDiyHn0mqzoyzB6g3N6q0ntv33yqTDI6IEupDL3icPenMYEtF4J0VbWoN+EHPgJ94
         8qtCJYmvMfk735zCrf+MTDPmnb2QV//eqz8hgzOlfjdvzfWn79Crbo0wWB/kK3L1AoqT
         jW40bub4rKCLUudH6N0vQ2ZuUdlC7Y07wyLHq9L47qj1qa2v62sIgZw4VlJi22A7U2zW
         B6iLB8Iks293Ofvbv3LxU2//yGuN0NCBdydADjCYRlwl60kR/L6IgM8kYGit/6uNMCI8
         3ILg==
X-Gm-Message-State: AO0yUKXtLwD+Wor72wfT499X7V6fdwBoBT2X/J5GoGdN+euP83nXZh2L
	Z053oOBOHBq8Zg3zNaV0uHvb/L5aHEibDeUwtqmtNg==
X-Google-Smtp-Source: AK7set+cFs1AwNyjrHfT4eFsJP6dSFO3pQ1xfcD0fVPi5XjmERq9rViR6hefLiK6x6lPDIOISJKm9Sftmn5yEh7+j64=
X-Received: by 2002:a67:e2c7:0:b0:412:2f46:4073 with SMTP id
 i7-20020a67e2c7000000b004122f464073mr8848432vsm.3.1678184806025; Tue, 07 Mar
 2023 02:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:26:35 +0800
Message-ID: <CAGXv+5FcnLYZnWGtngkj2y0mozPopT=16X2rApFqNhRYxfMjPw@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_022647_275552_1431596C 
X-CRM114-Status: UNSURE (   7.42  )
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

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`

