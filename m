Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88FBC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 08:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1o5B4Q1OR2ZFnLIoINtqMkQRvUs/AP1LJaxG3uy772Y=; b=ZZSHWrmZdvqyTP1rpF530XgTOk
	BsJsX2KgNm6tIy4uBIOuxTzyF+/PICGAyziyNMZQ79gn+IsbH9z2+vO/kmWHJt7ZsbJWMPEODYuoB
	wZtmQNQ3DvhoF6uwKrulDI1cDXxWB4HVq73wLTOsDxt2NMSeu156u8enfay18LnNtb8COBxcp2Dwi
	3oxiAU/gwlqmwHuXhGnI4qmuNjcTPE1Ya2u+r1rOQXxtyQzmLqvZfiMe0iI8Q3zlSDug4nC+C2gRz
	a2G/9bb/mzvG+acfwYoWrpzmbdQK4t4Ji4QnnFNNHcmF/el20iG2/c6yDVukM1f/q5TRyQZIznOLK
	GjfKCvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HJ2-000nzs-1K;
	Tue, 07 Nov 2023 08:19:28 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HIz-000nzU-1B
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 08:19:26 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7eef0b931so63395977b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 00:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699345163; x=1699949963; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1o5B4Q1OR2ZFnLIoINtqMkQRvUs/AP1LJaxG3uy772Y=;
        b=ENxLHIwocY7r0xACUF8b0s0JAIXSsbN/j5/3lIhaca3qE/RGS0wecZ2BueDVBmSw0q
         kO2zbCWjA+x6NkkZrDVou1aMQyKoxv9xBsmZOd+y2bYf/wNOB3quyBJhxDG0DarNsqb/
         e99V1IQCpAxAguSVE/eTSE3QoTYjk+mnux5B7VzsDxTh4Yb7x75OXjheyHE9Y1G1cRz0
         Ci7qj2PnXlnKDHfv+AHv1NnZLtH+UwQHc7p60wOvnVrHHfLkvqOnWhuScg4ynfCjRNTG
         uVOj8oOISXOdajWiTJm6x3nc+SkjNgPQ9DS0HXYbDDqDUZ0oZR4AGShOwccUbYwst0dM
         rogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699345163; x=1699949963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1o5B4Q1OR2ZFnLIoINtqMkQRvUs/AP1LJaxG3uy772Y=;
        b=pgG0JOq3fWwJuOEyRRoobtwZ4Q2Nl1EU/vj3Ss4Cg5kD8xBaE2raPnfHkxcG1paGzs
         T2uixrzKyB4TPDli2/m1JxVJCuxYFtngJnfV0W6L/T/gkNYqKd5u70EkwLZA30rl4Y+i
         xIt+qlGCPZoMaEm5+LfyADLrBiZf/sU4QpinvD7erG2W2vrIImfZOa1u0OYRsVmD3/Gq
         OtHfjRfgt29EHwwxyXKgQs0jMnfzlVLvProrxfME+Kg5rUfflf1BCc4mI52gJ1Hogifg
         NdwPw/C5W5t1Kq9wPyzaFifdXl2bYdURkl8x4PIN/KcDp/T+7Fm3bJtZgNz10A1Tv9xj
         znHA==
X-Gm-Message-State: AOJu0YxVNBL5be4b5XJfNMUWh2zEFS9v0lgrscrDwES9tTmj8M1u5hqK
	cW3pUO7GsVMMI3gCmXYB1ZJ7UUOOm0m9LlLFoUH4gQ==
X-Google-Smtp-Source: AGHT+IFYtvsoT1ZlfWMIWQ6l6vz/ktBwRcrOCLL2Xn2Hl9aFBnwywmUr15MIOxeISvfy0ARJ/jblAGuj/gqq1fo11q8=
X-Received: by 2002:a25:d489:0:b0:da1:b041:70ac with SMTP id
 m131-20020a25d489000000b00da1b04170acmr30155588ybf.10.1699345163633; Tue, 07
 Nov 2023 00:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-2-zhourui@huaqin.corp-partner.google.com>
 <8a1f5d6e-3753-4ff5-94a6-dee7925b902b@linaro.org> <CABRjgzstdYKDCBDiD=ciwmP2X3CJ4PnDN7dLFF-F4yOVR6ex-g@mail.gmail.com>
 <db0f47cc-5c44-4671-ab2b-cc8a315212eb@linaro.org>
In-Reply-To: <db0f47cc-5c44-4671-ab2b-cc8a315212eb@linaro.org>
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Date: Tue, 7 Nov 2023 16:19:12 +0800
Message-ID: <CABRjgztWX1Z6QH9QZiZNKYrzE6Sy1KPuPHUzFbcj=DcxqXywiw@mail.gmail.com>
Subject: Re: [v1 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, perex@perex.cz, 
	allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_001925_428334_2FEE48C7 
X-CRM114-Status: GOOD (  10.03  )
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

Sorry, I didn't express myself clearly. What I mean is that I will
modify everything according to your suggestions in the V2 version.

On Tue, Nov 7, 2023 at 4:06=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/11/2023 08:59, Rui Zhou wrote:
> > Thank you very much for your reminder, I will pay attention next time.
>
> Next time? Does it mean you are not going to fix the patch as I asked
> about the order?
>
> Best regards,
> Krzysztof
>

