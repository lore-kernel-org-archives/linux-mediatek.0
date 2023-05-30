Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CD9C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZN4QnyKrnxiBs4E17NJb3ZAuAuwM5m7siN0Hd43Wwc=; b=ydxLkfbqIGDdYYL4kqx3LVxrFr
	m6RK4C7ndNydbsrkmCcmKB3GBjJ0JjmiGeA0VQhGSPVOaIueME8yDLpZf+NUak8bHCOTIwAP7miok
	8piCGXV6qCCtlZnzO3AvVxAxopLiEBI8Wnx4f9QqEmb/OYaF2/ZlkM72uDb7cX2ws0LS6dPk3NLDH
	Gn4qkRZGF4gMzjHly8NdlMkiy4V2QsCr28DseAtA5vfRoyqr4+PkY2aCEdgiLgE0z/juXUgtcx6Rb
	gnBBMUy5psioXY67hGbdoGX5IM2LANJbsUS689dOEptt67yf8p3CsxxhMWS6jzKO14EALefxw05eA
	65ddPpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tnp-00Cjpu-0g;
	Tue, 30 May 2023 07:29:57 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tnm-00Cjnt-0o
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 07:29:55 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-783f17f0a00so1243822241.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685431791; x=1688023791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZN4QnyKrnxiBs4E17NJb3ZAuAuwM5m7siN0Hd43Wwc=;
        b=nYn/YGbyfBNmz+lexWZr0TyjGCBc6NcIQSLPze6+c7Qn28R/DOrhrNKArMa5MNjB8t
         1R8k+DFg4jZkZL85GHp6/9B1DzH6b1YcdhznnkpbvQxC6Pu/46+OWnKV4RjkPe3O6OSN
         5TIwLxxA9CZ7i9PD0m9eKg0/EHs4PGlFcZaPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685431791; x=1688023791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZN4QnyKrnxiBs4E17NJb3ZAuAuwM5m7siN0Hd43Wwc=;
        b=bR/qjrXywq7Og2/kWBUBK744ziWQuSyu5nnDN+2Ifc4QdjoW0KKz8JxUIaklYc7QNV
         VDFWEb8m7APtLh6DcvywuCA8qsfCDjgg/y1x65hAw7465/dEhGLTJIXkiYaSSEo9vo+h
         lZ1JYaEsNgP7BHL5uQkUw11/wqp3P+UZLMw7rrqSZyYF/9oNRH3cjEc/Jh8QtNuF6Wn8
         +KK1CQ7eE2i/IBLpK89aXSchAogTd5xXXzTt6ELbzbL/v3h3ig2kPl1Ir++Hk/OX+r6E
         KEugQZpDTj1qm7yIHe/Q3R29sMXaiYIMY59nsTSP1JyL6xyXYeS2qiZnomav/mZnRzlY
         QQbA==
X-Gm-Message-State: AC+VfDzTWQ/LQSb7RY7wvJe2Ev1g9essalCOc8UvpXCZlRnw4+/BHkWU
	i8f7ZT0oT16lgefmUlouTkG2IIWW0MP0oRq3qEr7Aw==
X-Google-Smtp-Source: ACHHUZ685uMwzIsN5k4ruyfFJG+uL5euWQ7CixRe5wGcspUJWh5A1E77FzA1+QPQ6Cn4xvLSstZut1Fy7DkMh2u1aBo=
X-Received: by 2002:a67:fbcf:0:b0:439:4112:820 with SMTP id
 o15-20020a67fbcf000000b0043941120820mr383122vsr.27.1685431791178; Tue, 30 May
 2023 00:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230317061944.15434-1-allen-kh.cheng@mediatek.com> <20230317195453.lpymxjk7oqvbxkq5@notapiano>
In-Reply-To: <20230317195453.lpymxjk7oqvbxkq5@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 May 2023 15:29:40 +0800
Message-ID: <CAGXv+5GyLeVBAk_DXJoTxoG400mnq4y6pa1JXRD7Svc4rtMQBg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add cpufreq nodes for MT8192
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_002954_310368_144495B1 
X-CRM114-Status: GOOD (  11.41  )
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

On Sat, Mar 18, 2023 at 3:55=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Fri, Mar 17, 2023 at 02:19:44PM +0800, Allen-KH Cheng wrote:
> > Add the cpufreq nodes for MT8192 SoC.
> >
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> Tested on Asurada Spherion Chromebook as well. In particular, verified th=
at
> applying this commit makes suspend/resume work. Before, it would hang dur=
ing
> resume:
>
>         Enabling non-boot CPUs ...
>         Detected VIPT I-cache on CPU1
>         GICv3: CPU1: found redistributor 100 region 0:0x000000000c060000
>         CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
>
> But with this commit applied the machine is able to proceed bringing up t=
he
> secondary processors and complete resume.

Ping on this patch.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

