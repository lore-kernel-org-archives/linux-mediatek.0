Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2D1C5AC82
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 07:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=; b=oatdT/PcN7Y3SiY/K90zSzh3Nm
	N7KHUdiQ72BakvcMIppDY+JGw2LDG+lSjrk9NKh/BUkpIdp8E3wa+bgeDNtgv7nh4R2nPsMBVkCt5
	8QM/KugCP8ZmPs+4pc9XaqUW7XsbyNIWdGWTe3l/L1SrAEKOEfjrmO7HaAFhwj9TcdOgruJ/lWlan
	7Hn7oQpJTwkNvdVV3F4UarKowwF3t8M47Z4qkm/aL0m4j7/rnolM1gh7PhpRrjWFsrCP91aZaya1i
	tch3i4IH9x+mmRQMMQWFwuusyo5Jivp9gIzCVIZkzK+f2coNFvVHrkgWz8jqbrNMKRVtTjscnY4ms
	lqNAcjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKPp-0000000BCTj-1o4R;
	Mon, 10 Aug 2026 07:27:21 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKPn-0000000BCT8-1bXZ
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 07:27:20 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5276d598b96so6739981cf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 00:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786346838; cv=none;
        d=google.com; s=arc-20260327;
        b=scVjhecOsNJYZ4j81TjK91513n8N2F17pyoC+QHMNhZmyT80nyk6ZXz5M4UcqAzemB
         jmopVY1oXo8Ozz+XIFGzfE7kn++6pzrCGIWxhjHQ+oyoR1hQj6KWurqpBwPpuAnaGh3s
         IYaMRAhLokBG6QWJ0DQgFOGQW3by9tz36sFsf5rkaWeaGvx2m/oQ8UaASWflUgjt7Jbw
         79T1mGm9CKuk/3U/E+YQv17tTDn6qab1ZtEITpI0P/bw6bSx1WJ5GIvatZnlW8wz0sLH
         LUsG7HpErqZCYTZRwLrjOQBG/X/1TSXk79RDMRGyj1B+M1IIwPckni5G43CzQVFTU0om
         /AuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
        fh=9K7VShErqN8M9gHDYPJivBt9VlGZGiDxrXGYHUlYOuk=;
        b=lDMOtVKVHR2KJa8a0Jb44+KOn1eay5TVn+eiyfrmhn1ewDTcD6sl9+l0iuvEEV4zWh
         6pXjilHe4LYYQzLStG9oNWuEXm4ETI8V+DKPTfIcjvdvVUUTsKPN+kp2jYtHlHSVSnPI
         KTwnN6XxovULuV1L1fPaKfIlqvpTjliQIXcgwlwC/nG/9xvNj5FgCS93YKdFx+/K1wIO
         RanmXseLcJ8xshM1JsU2AGp9jdHJnTg0KZmGDucDoziWdQswValLwZJNJUnovV17JFe2
         931hMG4rcrC/M+QJ8bqZioFOOxQBagIAG3J4l0OhsrahhiZ/ZUtf/eMsFnSpPfplumxB
         sStg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786346838; x=1786951638; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
        b=J+tHnTlm6xlDewBRlGfuAzPMTUarxmOx+N//lvi+wrQyBRwM54ahD2itl7Vy7B3E3/
         yhgIzqDv2F4mlNlD8beG1ttmBb6A1W7vaQ20IzqitTSAw29gi16I2Fi7Yt8YQJ6DT7gU
         l6F+SEaOUtvaOqyXE/x4XZIwift+7pUvRjUHBqBktcYQHYln/J222wKFrXUc/n09Fj85
         Zuq28uhMGGiIPR9Ky2bEW3qCFSTtmLUxqu5EY0A6ww05T9Naz6NpW2hzH3/kIi0NWfSb
         ZXJeF6bUjccKyaYQgmOl70qT8/wDzg64VcBEFsNjX+cs/stvQjOPCUWhQlykVvYBSwwV
         qAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786346838; x=1786951638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
        b=UhGUh/0Fh4vqzgC++CkQwDYsr7/C1lZfChTPYJetvRNYsFTRRtCHGMKJ7f97eILKvj
         dw32wwU8s5OsgpaHMaxcaTSZkRT3vv3cbwDfFQkFSCHJOzdGpjmpYd643AtH6y3YJ38G
         UMkDMLM019pdBP7dKmwvzkwRGKSqo00LNPmDZh4aiHgcxVi0Gv+Ym2PL11T8cRwx/pMt
         2079nzFO+nbj0qZq+duVfJSSBxT5MhfsVmAbyvovynje1oweX4pXM2NWEuNXO3wrcUMN
         TVA8chSEBmxopAObyn784OcKR0/rRjC6ntrBwH5wyB4FmpFQfZlCkFJ7rKc+dRcNK1ZO
         +thg==
X-Forwarded-Encrypted: i=1; AHgh+RoWcCRqgrPtA2ZJqs8H67IaV7DjFKvDDmknUwVT+W1nF4eaBKnPPyZ5zQXzHrbMSn6FhP812W03pvFR/PKLGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCHd2m7BsnUHJataeDYFWwhuj+woTVyM5qMwZruZ1SRyDI6s+E
	h1wsNfRCI9DufJn2KyJTfoIFJUVSlRh9r+ThHzDx01TWVUWAji4dh8Nn3Sf4PLuJ2/B6m/Iv87v
	uoCbUAhN1m5cCBkIfX0u7+QQHlS51KZ0=
X-Gm-Gg: AR+sD10iwYi40IGs4OrzpVvh62kFzSybXVWk1lLI5vg+uvvV5N381WbRpfqzcxRHhpN
	Jqcr6qfzMz1u9kBsEpIqJKHBHPODUn89VG560A32BAeBqG1AaxziHnDXBlLJVcegLJYd8gXRvhn
	frFp5EUyFUtke9euRZzPvj3+uLdhBILqXrH5TPPHo+D65ZiJOIdJxBfwd63S0DMhVW4Vjpx8ElA
	feS2oL3yqQYzDEWbhP6q1PEfbv+KYK9Zfh8Mx7iHnVSItceHfOdjuJPJHY0j+Jt1tHK9A+UoyWc
	zxebBVOJ16opxZSnue0RIjUzCash3UNyaHFWWygTLQ==
X-Received: by 2002:a05:622a:2b4e:b0:51c:17cd:1fd4 with SMTP id
 d75a77b69052e-52ce622aad1mr426354311cf.41.1786346837843; Mon, 10 Aug 2026
 00:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786262697.git.naseefkm@gmail.com> <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
In-Reply-To: <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 10 Aug 2026 09:27:04 +0200
X-Gm-Features: AUfX_mxJ04kaXTJmP1OVrdQLPid7YkYxdoDRvjl11jvmxSghogHNPP37XYst2dw
Message-ID: <CA+_ehUwO0WEiDGE18a=v=ZjJhpZB_KVP=m-Cog7K9Cm-zZV6EQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: Linus Walleij <linusw@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_002719_431826_EC7C0145 
X-CRM114-Status: GOOD (  15.05  )
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

Il giorno lun 10 ago 2026 alle ore 09:23 Linus Walleij
<linusw@kernel.org> ha scritto:
>
> Hi Ahmed,
>
> thanks for your patches!
>
> On Sun, Aug 9, 2026 at 10:05=E2=80=AFAM Ahmed Naseef <naseefkm@gmail.com>=
 wrote:
>
> > The series is based on linux-pinctrl/for-next, as it depends on the
> > per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
> > phandle that landed there.
>
> If we can get a speedy review on these patches I don't mind merging
> them for v7.3 already, it's nice to get some movement on all the
> nice Airoha silicon.
>

Hi Linus,

I wonder if the same speed treatment can be done also for the clock driver =
and
also dts?
There are a few patch there that are currently blocking usb phy and pcie...

