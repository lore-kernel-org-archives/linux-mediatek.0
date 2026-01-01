Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D387EEE25C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 21:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qGeOIEXCnLq99CGQeQ1eWuZeDA3OumK0NUXsyjIwoc=; b=fjotBQNsT2YuuRuYFYxPVZHKSS
	QM0XOUFIh48XZS/hGN6X+6f4aPn7f1lDOlrfIAF/oejOI9u716fWb8Bu22byU1AAwKXNd709rqqJV
	UcM1EHgVNP60QvKhw+rG2bWOu97kbDnh7tgexMxPFtIpJZ6zv0PXiKYAiHiuRoNsOvy3iTGGvUqF0
	fEH0GhmWvhExaX4L9kkHt/usr9iTPmGOvNG7+H/5TTk0WseEtUp7Da4Kvdf/yiDncRZqnhPNcx1by
	WdTnEBHQBtU6YrXsW6kzaJlLRJzSnhX/lPX6Z+LjGtuMGAhjF7KJ8BpgPvNcEYf/yyMCaR1q3ljxh
	3JW46oGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQUm-00000007Wp4-3Na7;
	Thu, 01 Jan 2026 21:46:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQUj-00000007WoI-2kM6
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 21:46:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso121046455ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Jan 2026 13:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767303967; x=1767908767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qGeOIEXCnLq99CGQeQ1eWuZeDA3OumK0NUXsyjIwoc=;
        b=CqRX01XpkwSYfSJU5Lh5vnI3uqhxucR7/05aZbZJq/iLSufZFDikN33ZtierXed2Rz
         uS2jOsDksohgFFmRsYB6BiE4EWsO6Fd6tdolZjkK3fVLpCVQI1oYSfMM3ktOIcmbYbyG
         4by7gQVzq3jsPatrXbJQ2vpbmrYC0om4vagmm+15LtvagUO2PfEyi//aUKXPppUMihMn
         JmMWnATkexh9dsuLeiuDE0i21JFNlS5ewp0sAxcjRbN1oRxT3YO7pUIzm663H4DmrfJj
         vQEMzECXS1UkC/2h1LiLwGxNyouzbgmYY7ymDaDgHMFvejYaflpAx69seyjOINZqLh3v
         XA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767303967; x=1767908767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/qGeOIEXCnLq99CGQeQ1eWuZeDA3OumK0NUXsyjIwoc=;
        b=O0tcqLtPT+CZNiqYcBilcWmVPW+N737dstRw1WMepo3YLZSWIx352qibDWFnjwT8Ji
         lIu4Ikfrz0L32tN8XZ0wfFKMU9gh6M6mY68ya2cQmyWK26CJ0BN6aBMjTnhIrOX6Lpdz
         uqQnzJL/e76CIiJfnTFdw+mymuWTTpiTvFjewICR1gWNYpwaEdIFIasxybgf2BrPPbSB
         AcEHcG60014DWiVRGG3blnn2pQvK3s09Kvqn4/OR0g2S7TqOBa94I8j3h1xo8/XRiL6U
         iiq6a7t+H1045IVAsp8U63IHZkKPTRZseFODMTEFx/7qTWcwZ/ZfZqdcmd1oi+wuuyLC
         xzoA==
X-Forwarded-Encrypted: i=1; AJvYcCWuQs0YURYfFm2jmNoSio7eqigSKAQRUWPlFRBz6xcO+z2UnH6ij9BUkgS0mNBeTwmjovAGu8ZQ9nRlYqHfoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxGTAO8F4Msm2S0BuJa0H8i1SeBUud131k4iMonV6QlE1hP2YA
	DZz0hqLt40LEnyUkarRcHuL3WSe1dvPeOZDYCrt4Y8HobGP/y/LA0ivmREmuzj1yRcgWsglfFRR
	VO67v5vFKJ3qXjwyUBSJvXFodkVhQyLg=
X-Gm-Gg: AY/fxX5ela4Apfb+olbk0PjvtfroUxvT5uvOb+gB89mWRKIYCf/lFDj9fq579vDqVUN
	n3igM8NPxK4o4XE8Aov0Ln9GkT4yWIar/Xe7dG61MUwuxJZp7IazC5SsvGRgWaGAkDI2S+Wj4By
	CK/FDFEdNjq6Js8Go7CgyYa0aY2KInM7L0TfL5lGF1rEp1Q/eIfgLAhXqGVrR2cWh1Rzg+/JBiE
	ZB1FNlg9Ftvdbd+fTUW2jZqYWcz1UYsR0EXLMIPjENT5WUfuP1Yp97rf+gNUUnc+x4NeD1+4OAL
	ymk2
X-Google-Smtp-Source: AGHT+IHSUyciBMOilIcbt7HWqVU9MizsV+4Y+vMa4rwxqp1kK6Xy4T8CKC8ooJ7UwHC5GL0rYFqcLpHFUdgExBBrRuo=
X-Received: by 2002:a05:7022:e11:b0:11b:7dcd:ca9a with SMTP id
 a92af1059eb24-12172302438mr46279194c88.34.1767303966643; Thu, 01 Jan 2026
 13:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20260101172052.1862252-1-olek2@wp.pl> <20260101172052.1862252-2-olek2@wp.pl>
In-Reply-To: <20260101172052.1862252-2-olek2@wp.pl>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 1 Jan 2026 22:46:19 +0100
X-Gm-Features: AQt7F2oqocFNQmJB-3KQEF2TnEZfZsw4aObS_R4iYm5tqbcpTsbrKBpnm8uH8pk
Message-ID: <CAMhs-H_iN7pWsis2HbeJ-xr+9JoMa+EF-+7z9e21DJ1dyNNtuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mips: dts: ralink: mt7621: add crypto offload support
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: ansuelsmth@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	chester.a.unal@arinc9.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, tsbogend@alpha.franken.de, 
	angelogioacchino.delregno@collabora.com, linux-crypto@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_134609_830411_35A265FF 
X-CRM114-Status: GOOD (  16.05  )
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

Hi Aleksander,

On Thu, Jan 1, 2026 at 6:21=E2=80=AFPM Aleksander Jan Bajkowski <olek2@wp.p=
l> wrote:
>
> Add support for the built-in cryptographic accelerator. This accelerator
> supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256=
.
> It also supports full IPSEC and TLS offload, but this feature isn't
> implemented in the driver.
>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/r=
alink/mt7621.dtsi
> index 0704eab4a80b..9ba28fa016fb 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -361,6 +361,14 @@ cdmm: cdmm@1fbf8000 {
>                 reg =3D <0x1fbf8000 0x8000>;
>         };
>
> +       crypto@1e004000 {
> +               compatible =3D "mediatek,mt7621-eip93", "inside-secure,sa=
fexcel-eip93ies";
> +               reg =3D <0x1e004000 0x1000>;
> +
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SHARED 19 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +

AFAICS, the crypto engine for mt7621 has also a clock gate[0] and a
reset line[1]. These two are not present in this binding.

[0]: https://elixir.bootlin.com/linux/v6.18.2/source/include/dt-bindings/cl=
ock/mt7621-clk.h#L36
[1]: https://elixir.bootlin.com/linux/v6.18.2/source/include/dt-bindings/re=
set/mt7621-reset.h#L33

Best regards,
    Sergio Paracuellos

>         ethernet: ethernet@1e100000 {
>                 compatible =3D "mediatek,mt7621-eth";
>                 reg =3D <0x1e100000 0x10000>;
> --
> 2.47.3
>

