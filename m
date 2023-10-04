Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EF0E7B61F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih3CfAMz92qznR9krJdX9z6vkwyBn8t8x+cmpetFh0c=; b=yQEExvj7h6p67vN98eYoYt8Zpa
	czbGhK7tpNTOenqGJKX+6Z592Gax80fch1XJZi7P1h70NNYB9BrM9Gx7yfEbhSWijZK3MVBZT0IPp
	fIEujRiYsGVchHpbev55YEq1EsWPC9VbbmwDu3T53+E+9EcTGBKSgZ7LbLrxHXX2Ig9FuRPSXsPVW
	PAQjZ/enMcCL6W0l7xvQ98USxU8yLobiMm9QZxu6VNMilgItsIvm/GFFlwYRuH6+dJck3iaXLtadz
	igG5384T4bNYl93PKYp40gdPwT+girtIFuLlU4DvcQ+vx8GGOMMCkV8BeAP1AC43Xf5b63eXrCA6E
	9r7wP70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2am-000C1p-1r;
	Wed, 04 Oct 2023 14:11:12 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2aj-000C0n-1K
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 14:11:10 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a6190af24aso396611066b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Oct 2023 07:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696428665; x=1697033465; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ih3CfAMz92qznR9krJdX9z6vkwyBn8t8x+cmpetFh0c=;
        b=L+hZsSMYKIw71wb2Booieyb8uuaS3vcAoETBIPtF3M7XUIJwWc4AkQL6+NmDNWCv1n
         lSlYgCRCEU5OgyK89THmiK0gS72G1zt9jKxUGVJqNXf4lbLuhuCRo3Rah26pmCr4dLU8
         rR1oM6APUO86Xf0qFxTxRRhZzWS8k7WoRhSiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696428665; x=1697033465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ih3CfAMz92qznR9krJdX9z6vkwyBn8t8x+cmpetFh0c=;
        b=QikXBleym6cmxVGQr/WF+CtA54ENJvXnMViXhbBYiQOSzBU0meXKwy2g/78pyehoxV
         E/2Nhc7yPe/ssH3jqSRYWj1LdNNRLksiJAYmvKHmrQgIlEJjKcfOhD/PRg0SIbidjG06
         evolfXO0P3gBhqmnAv/Jb3VqXZL5ZKN3K5ibSiBDukqsVprdWTF3HQeQCEb7uFwX7j87
         WkFW8Jj5dfEUPd179/YjMYegG5wbOrzBYmfPVMG+eewIlj5WRHRww++Yyu4iG4a+7RB0
         vRmWUl+DQADlFNeFsveHMlKSAI2v45DexV0BvK67AkY5nBqLBhBE48CWbZ97KYBjbc/F
         uZ4Q==
X-Gm-Message-State: AOJu0YwWDF7+nDdzZIBVNsfzeKnL/58k2tbvNOIfKfiKG6McjwuS1ZN5
	2IoYjjesWiDLAcO8lFsfBcpKx9/rNgxm4ehMKdBbexat
X-Google-Smtp-Source: AGHT+IEoc+tVk4cib6amXFAb/WhvJBJs4ROImQw8UDjZ5MTZJgB71zIhjm8SAgqBQFBj1I5x246mtg==
X-Received: by 2002:a17:906:1db:b0:9b7:2a13:1611 with SMTP id 27-20020a17090601db00b009b72a131611mr1523148ejj.38.1696428665297;
        Wed, 04 Oct 2023 07:11:05 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090627c900b009ad8084e08asm2843101ejc.0.2023.10.04.07.11.04
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 07:11:05 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so10939a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Oct 2023 07:11:04 -0700 (PDT)
X-Received: by 2002:a05:600c:438a:b0:400:46db:1bf2 with SMTP id
 e10-20020a05600c438a00b0040046db1bf2mr101611wmn.2.1696428267648; Wed, 04 Oct
 2023 07:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231002094526.1.Ie8f760213053e3d11592f892b30912dbac6b8b48@changeid>
 <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com> <CAD=FV=UeeL9uycVeKpOm+eDm3xHrOnKi2frt6a1qFG1HX9yEUg@mail.gmail.com>
 <ZRwJKBZaYwF1rrur@FVFF77S0Q05N> <CAD=FV=WASz1uvTgwsu3H3cTr3smHk+E_XNUVnjoPpttwv095rQ@mail.gmail.com>
 <ZRxCCZxZWCG0NBur@FVFF77S0Q05N> <CAD=FV=Xk-OMKQPXxU9Z9HOcWwUxxrmLZ4vD0u5ouZRW_zDFDPg@mail.gmail.com>
 <ZR03liCodnTQWs7s@FVFF77S0Q05N> <86jzs2ofqs.wl-maz@kernel.org>
In-Reply-To: <86jzs2ofqs.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Oct 2023 07:04:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XasZR6dhKBjpbYfby4F1Nu_bsq1m_HP+NpufjsJi0COg@mail.gmail.com>
Message-ID: <CAD=FV=XasZR6dhKBjpbYfby4F1Nu_bsq1m_HP+NpufjsJi0COg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: smp: Fix pseudo NMI issues w/ broken Mediatek FW
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Valentin Schneider <vschneid@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	D Scott Phillips <scott@os.amperecomputing.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Misono Tomohiro <misono.tomohiro@fujitsu.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_071109_471498_F40B581D 
X-CRM114-Status: GOOD (  16.70  )
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

On Wed, Oct 4, 2023 at 3:15=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 04 Oct 2023 10:59:50 +0100,
> Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > Given you haven't seen any issues, I suspect those are getting reset to=
 fixed
> > values that happens to work out for us, but it is a bit worrisome more
> > generally (e.g. the LPI case above).
>
> It is likely that these SoCs don't even have an ITS.

Right. That was what we decided [1] when Marc pointed this out earlier.

Overall: we know that this firmware behavior is not good but we're
stuck with it. :( At the very least, any new devices coming out will
have this fixed. Presumably if old devices are working OK enough today
(as long as you don't enable pseudo-NMI) then they can be made to keep
working?

So circling back: what patch should we actually land? As of right now
only pseudo-NMI is broken, but it would be good to make sure that if
the kernel later adds other features that would be broken on this
hardware that it gets handled properly...

[1] https://issuetracker.google.com/issues/281831288#comment4

