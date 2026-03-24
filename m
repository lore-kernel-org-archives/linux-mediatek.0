Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4DAF532CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 03:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=; b=EzO1RfhG89nErFcE2c4hpYhwTj
	1LO/6V7qszGPZB0hqECYAy6eA7TlfdC2idOaeDnE491ZPRyxyP3rWxWNkcgAvPyHrbvavkPKU0xmA
	VosHWhnFnWJNr4LeDJb5p2tqbfJovRMmRz2G8ffb6678JSHcf6ddwXyS6R9MuTfWvg3JhwnR4F+ZZ
	MxZZT1UvZWUyRDv5OFfCCriFW6TPYAN8qxQZyYQnClnTuKvIDot/wUk6eAn2DfeCAxfJGJXOpQhfH
	hekOk4vpRwo6Icq3btCrajDdxVB9IXV05CdOBzyRu3GgET5PPebRIZhmOJHO4cezeyqdh+dZQRi63
	tLchpQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sf9-00000000VHm-14MO;
	Tue, 24 Mar 2026 03:42:39 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sf6-00000000VFl-3gmc
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 03:42:38 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3775908e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 20:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774323755; cv=none;
        d=google.com; s=arc-20240605;
        b=YCrhr/TQKamMXwZrCGzkvY8WdUS7UUDMP3sR3+crX3Kld4zlH65KA1V0BdPN7rtaTy
         67h+stRAKKl7ifiomYhZc/HbOp2xsaUMS9QuurW/HmwtL0isSPRk6PPfSzNy8rW4GGjP
         mtT4iDdDxst+1XPJ3Jei/QEu+najHFtSdMbwxoqlqZfd6jh/pHC2KN+OPFiQc/dthSmw
         TnsrP6Ruo4AwV9miXICxfXsUKX/8MRtk/AwGLRRbHP5a88ZsbdNX6MEVWMJcj9r9yx1R
         WEe8AyEJ3k8ILvXUdylWd7IodCBbmnaYqTTOg5eJ9dJNCkn1IdQ7M9JxU1awcAQwg589
         IeEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
        fh=CYBvciGYR/v0FK1weiFgyx3TxJ+S6MtFAoZHsm9cw+s=;
        b=d5Vbrio/dfRKOqrTYPzCgFXZwEDXX2SHUsyOBjI9gAn1gWv2jUjC4+2xbkm7xj+Aou
         aSRNkT9LgMr0L1piCzh9Tei4mI5P/3UX1rovRjlMqcWAB7Xc5XWLjst+ujDw+1JsZp+k
         N//mLjUfhMuTb2WrVW3s7L63222tw14PPHb5XW4JPcd44YEBx3AKBg7OGQyvxPpwEkGy
         kvmUqiSZLHmSTlwP0xNkWBE3gywRCWw65Hnld9cHE37G7rpsdpS7l+1y79iNKU+t8nVs
         BcbvvyvhWJLRBA6M4yrz+5u54BeoShtC5+CaoGhQD+1wgWkuwwBL+7SVbSljNRmKeje0
         BMPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774323755; x=1774928555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
        b=oW1MdO7KboV/p6hCsfi6XDwu75lQFDHWCEiaV3ObG29SmvrkOHgMB2oLhzIJOnghSg
         Aff0TY47vtf82Wz5gTgYMSo/da5oK2v1RDbGtqB9iJGpgdiV6L6ETxejjxrxCnogCRpi
         tNfhuYtZrQbsFqO+Y7FVk1WTNsme1jZwJF0BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323755; x=1774928555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
        b=GYfwjS4LiHmQEP+hQq2F8yL+1YxkQnvs2EW9VhMUGEQYTzApeqU3+X+MgnNvQrVROe
         QJxQiz3aYt+HVo5dnilBmU7eZWoIdEJKpOgE4+E1eS8g7LhNF+ehvVcJHq5M139u4gwN
         gUnPCREKR4GwDo/O3kZ6/h8H+w6LmYZQyedNycwC4UVr0LV8NmiuLGvgNEGMEE1vj22w
         5XUIqFDEUR19Grf9iApq/zganHic9nsKcquQlpJoE5ZsFCTEtip6J50CLkMgx62Jp2iC
         y/7P60ezAS0rCVNeuEv6eHgXUXhr8AXVWokUoWmm/32TmfjoPvlEvEDpd9LO28uZGKaT
         Emtw==
X-Forwarded-Encrypted: i=1; AJvYcCV8RyNOjAO4NTsmqrMBJaoNy9VHTDxke9uc4TGJVxL1WPZRw0Qrc7jitbPGjey2CgBW3X30BQRlar+iXXcIuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy40Tp6iDBar0QFnxfJLH4Vl3t18CBgPX/JqgPe5rmYGQIqx7gJ
	p/eZIl8RAGrsVlUWdtvDHdH/dqmisYfg2+1+BjOnqq6YnABdyGG8u+2fxOOkN/zBRHWUV+4RBOA
	86TgaBqBvYcsKMnWbVtL8TRYlrp3UFiQqcRGq6j7e
X-Gm-Gg: ATEYQzzze7GP7OYTO+63ubBUNLPqlF3mSabF3X+e6MIv1Qt3a8Ruo7BOEH+ijn1dxaM
	OijaSWHlUA2OsoNb1V9Vpn5ycskm8PapAu/uuHwV7L7xDoh1maad4D77DlcHRFH+XG9S+LqkZgQ
	O1ijePT72GAXKuIeqWL4LVjHrOKyZxBPzjT1YxFEM8MDC95WgKAXWVBM1LgO7b9+TgXD2dxukWq
	JK7B6ImJddOiQRP3k9NuzHQ4A8+dG/0+Szh4Cml26lO6aeUCKsoelXdEW4R8+QcyuDRsUtk0k5x
	mfeYY/fBVw==
X-Received: by 2002:a05:6512:32c6:b0:5a1:44ba:c96e with SMTP id
 2adb3069b0e04-5a285b6db31mr4580171e87.38.1774323754655; Mon, 23 Mar 2026
 20:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260320072440.2403318-1-wenst@chromium.org> <20260320072440.2403318-3-wenst@chromium.org>
 <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll> <CAGXv+5ESnhsVfu5pWf1DEt35+10ZKTgJ5G6DuJC4s6yEpRH_YQ@mail.gmail.com>
 <e14ae934-e448-433f-987d-77bede5f6d07@kernel.org>
In-Reply-To: <e14ae934-e448-433f-987d-77bede5f6d07@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Mar 2026 11:42:22 +0800
X-Gm-Features: AaiRm52CNgLAlXeiRcCcd4-xI1ROYPaycCYYMcNwH55Sc_4mMYJ7m6m9CPgV9Vk
Message-ID: <CAGXv+5FhSsq2FtieUm+jKTZ4+Zes5TO9gD-a_rHgOzY5kTOB1g@mail.gmail.com>
Subject: Re: [PATCH 2/5] regulator: dt-bindings: mt6359: Drop bogus
 vcn33_[12]_* split regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204237_024706_5BA6F941 
X-CRM114-Status: GOOD (  29.63  )
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

On Mon, Mar 23, 2026 at 4:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 09:26, Chen-Yu Tsai wrote:
> > On Fri, Mar 20, 2026 at 5:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Fri, Mar 20, 2026 at 03:24:35PM +0800, Chen-Yu Tsai wrote:
> >>> vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
> >>> two enable bits in the registers so that BT and WiFi drivers can togg=
le
> >>> them separately without any coordination. If either bit is set, then =
the
> >>> regulator output is enabled.
> >>>
> >>> Unfortunately some of them are already referenced by in-tree device
> >>> trees. To keep backward compatibility with them, keep the vcn33_*_bt
> >>
> >> So you drop "_wifi" regulators breaking the ABI, no?
> >
> > Indeed it is a breakage. I kept the *_bt part to cover all in-tree
> > device trees.
> >
> > But the representation itself is broken, as explained in the commit
> > message.
> >
> > I leave it to the platform maintainers to decide whether this "breakage=
"
> > to fix the broken representation is acceptable.
> >
> > Note that there is a similar issue with the *_sshub and non _sshub
> > regulators: there is only one actual output for the two. I'm still
> > asking the vendor for hardware behavior specifics.
> >
> >>> regulator. Also combine them for a shorten regular expression pattern=
.
> >>
> >> Instead the duplicates should be deprecated and driver should still
> >> support the "_wifi" variants.
> >
> > But it doesn't really work in the driver. You cannot set different
> > constraints on the two, especially conflicting constraints, and expect
> > them to work. And if you set the voltage on one of them, the other
> > will change as well.
>
> Of course, but now imagine a DTB with only *_wifi regulators and no *_bt.
>
> >
> > If we want the driver to support both with _sane_ behavior, we would
> > need to introduce some sort of alias lookup for both reading
> > constraints and resolving supplies. The driver registers _just_ one
> > regulator, and both DT nodes resolve to it.
>
> Yes, either alias lookup or adjusting the regulator_desc before
> registering them, depending on the nodes.
>
> If I understood old code correctly, the point is that ABI allowed *_wifi
> without *_bt and this would be a working setup. Now it won't work.

OK. I will drop this part for now and just add the supplies. I'll
resend the cleanup once I figure out how to do it in the regulator
driver.

ChenYu

