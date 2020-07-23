Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1E3C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:15:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4520F2065F
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aYEYzc1D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4520F2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sPU3uJziQlnaYUV4S27CMsEfarZ+a3NWWNwWnFK8wXs=; b=aYEYzc1DNTQE1Xu5Aur9jJeDw
	9rrUyAcT5VoQCO0U467dFAiiZa1BeokW4cXvYcMrXfAMaHMgovZ7NfCN4MpUARqDqWBv701KWc/Zm
	jBiYnpgRyUG47tLzCULCw8KfO+IkphmDepxkTUvHNduQi49FRCfB7NeH0U+SOhcWHTWS67s0wYIm6
	3k9JGAQM9YLB9oAqi2WnfIYXij2wxFzl9tvuP44EU7v5akGc7OKYNdFJRUU3TnwTwK2eLI3TbOESl
	kSKAZkOcVv7bdy9DG1p3d1GHTNGh3d3EbD1XNxIuRYUwCohaTv5FLSw2hniQ1aSnT00kLCGh9ZACv
	cjWKSOqRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyYFU-0005aa-V7; Thu, 23 Jul 2020 10:14:49 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyYFS-0005ZT-Sv; Thu, 23 Jul 2020 10:14:47 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MOV26-1kB9yu0iZq-00PyIX; Thu, 23 Jul 2020 12:14:42 +0200
Received: by mail-qk1-f180.google.com with SMTP id d4so1387580qkk.8;
 Thu, 23 Jul 2020 03:14:40 -0700 (PDT)
X-Gm-Message-State: AOAM531z/B6pybA13hgoyjz/UoCm1P829ZAMAgSjMcgPLDTSbuIn5L2i
 ABu+YvX+rMwL+FkEogt3mg+C1/JExq7aps7KJJ0=
X-Google-Smtp-Source: ABdhPJxAf+812MuVjcfu0XwRQWQnRGJhKuMoucN2dt9Q6NE0hzXxWnmvljuMU8/tZW5Ym6SImtgRoUMVG9dICDcl5Bc=
X-Received: by 2002:a37:9004:: with SMTP id s4mr4264475qkd.286.1595499279844; 
 Thu, 23 Jul 2020 03:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
 <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
 <20200723095209.GA30472@kozik-lap>
In-Reply-To: <20200723095209.GA30472@kozik-lap>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jul 2020 12:14:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0g0k6e-STpqPS0S-wajxqS-M3DV+3UD=QFE7e-98J-og@mail.gmail.com>
Message-ID: <CAK8P3a0g0k6e-STpqPS0S-wajxqS-M3DV+3UD=QFE7e-98J-og@mail.gmail.com>
Subject: Re: [RFC PATCH 00/23] memory: Cleanup, improve and compile test
 memory drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:Ix2bcveXbodbOQhnnbDdsYljoavcPwMmvj75q+WGvmCCkmhf7we
 raWEWHnDjP3S2LlAJA3x9g9iY+Q6pq7Omwav7I0ALzIM4Ek6vdAmYl9Lo5fFZ5ce8a/5W1c
 x9eirlDkkl9Syvpt2CFu8jf3ZN4euAf/08I4FysgK0Au+o3PCE1M6xTpCgZKpe4OV/PhEw6
 0ezeKp7pw4w9CBGtCkpAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rPriFozuzhk=:ZTxNL3SgHqEFhJYiijr76G
 uZaJDoaZNz8FnbqB+0A+h8dmUijVUJRNGK3/q7Q9h0yRLbWA6Mzd8vam6qFxvy8thELCQajjz
 aDeVpV0RWNMmRmieBHMnxR2ATpf59Tx0ejR9VpvKb2UFFb5OmNNatRdb36K2Cc8v28Xukwm/F
 887tuS2kVus78i8jnpZYdLbeoIgpEFv3r3aYZy3FgODVf7OrJpOIku0OnzbwhkxtEC3hrPvIW
 jsSnQs+mX7LN91JXIE9D+eM7WWHoCe/qXtez4iRMFkLwnfa+GrMU+RBwJWMWN22kD/Wmld24A
 lDUQtbJ3BS6ksfdmPI44P4EArh/UR3d0yEFIzVV4eTAdfBePZCI1hkGMsNkg31G2+ILIAWJm0
 bmVXGV8OcNyvMQuozmqu72nucST8jrA7CQK+To+3rVYToEpCSQdnOVzTIGyvIRGhXn5N+RayZ
 fdR5G08Tiu1D7c6cEiDRnrJXaQkUqwRaXZmvpnwSnB3HtM0xVjfVIGZapszpwN3+tPRcyXUtA
 EDSwQ5tMxHnNNO//082b+ln/a41qwqaXqWCUK1+GBXVFQiMVgLtBc9y0BAR8UDBDqGSu7R7Hn
 LGyz4qgCm/ggG4lFQbO3gzHGWT2eoeNDQtSFBtL/KLhk4SUPJFBWxPw7RseqtVg34M80n2qta
 laqEtAtjwUXqJwgtj3RuT7ZH82t7JC7Hf4W8nzOoS0GE61CkmRwRGNfDIJbpPvDMlCjvxlcp4
 yidTseCDEoXMqdJvPcBWFvHB6e+8QA1YwNGgh+uyaFAhLp+ZCBadfHDPmJAzOSuGLNPpgf+0a
 yGpcMDjqaKwLYz+d/vVls0kfpbBQY7jk0haFqBYEG6qoUm5BMdV56PQJSxvfCvR8ezMKx9U/z
 0LP+6qYYmKWC4lmMBvZQaw3Jv/xZc5uBxW/DwSVpKHzNcmVlzGJesLkwtoveUHr4CC7kVdnIy
 Rh3UZQohrpe3GzZDd5cBvFbGm62t5jI4FXpqDKxJwwPfrl7DUwBn+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_061447_135414_DFB20EB6 
X-CRM114-Status: GOOD (  16.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 11:52 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Jul 23, 2020 at 11:31:02AM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 23, 2020 at 9:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Afterwards you could either send the pull requests to Linus directly,
> > or send them to the soc team (or to Greg) as well, the way we handle
> > a couple of other subsystems like drivers/reset and drivers/tee that
> > usually only have a handful of patches per release.
>
> Most of the drivers are for ARM architecture so arm-soc seems like the
> way to do it.  However BT1_L2_CTL and JZ4780_NEMC are MIPS specific and
> maybe more would come in the future.  Are you fine taking them as well?

Yes, that's not a problem at all. Most other architectures are ramping down
anyway, both on the maintainership side and on newly supported hardware,
so we are picking those up where necessary. I also merged a couple of
drivers for the MIPS based Baikal SoCs recently.

     Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
