Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA50C25B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HResry5JndYeZBSzTVAWBwxzRl7+fUNF38GNSOea4NU=; b=WGx3w47v+i8vM/dStqahbU4eh2
	vNP9GxfDHjhbJkKgv/WYvoRR0OVLsSP5ud5HqVBlu27RQtRTddw1dIo7Z5DULBrLL/6PyNrRQB5FB
	s1vr3FEbtsQCJKfw8kJ7fI8qOrD58v6B9bBpc4PO6H+CLi+X96VAwo8/H+udj6gry+uuAcWXIWe2I
	N8XIeALP2bEmE8M3BDBC5aEUoixkhUBrdu2lvM91/28BcQXYFksvCNK/jKSowmWVHOaNCpvzbJRkY
	7AA3Wo3RYHy0P/zsNsF9NhUTX2CuuQ7TX6HC3sdkCNv8oFViVPvJsrEIpK9FXr95kzqzb7fo4eWZU
	7EwlhFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSf4-00H89Z-0O;
	Fri, 27 Oct 2023 19:38:26 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSf0-00H88W-2L
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Oct 2023 19:38:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9c41e95efcbso343884466b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Oct 2023 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698435499; x=1699040299; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HResry5JndYeZBSzTVAWBwxzRl7+fUNF38GNSOea4NU=;
        b=uSSaz1d1ddqV2ZNOvQo0iU//aU+61pKK9DyqtbgDCeaDd9Ldlmpzh3p2uRtMmuGUmN
         fKTpCE9PLUL1d3m88ZXm1oxb58Nfwela3yboehgwr6bo85UWN6cSJDN7A9d2i0wm3vMP
         o47WGn2IgiXxrHKGqu4JQ4spFI0ZcJclrDN727WtF6Zr3DIT/XWto5BFBIROl7oo0Qni
         zMUWKYo5BYvjpBMMPMpbNUWVU+hq4w2eyxNXBUs4h8MGa12gBcb+MjNKTGgPu1JPvIeX
         kNk+erTugq2vUUUFzZY2zUNrEgMZPqZ/I4IIL89xHR0v/QhwKRn4WxacootPp11vFcZJ
         tdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698435499; x=1699040299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HResry5JndYeZBSzTVAWBwxzRl7+fUNF38GNSOea4NU=;
        b=nbXJnjVcFzrB+w6GbbpM3OI48fpIDDNgolHwhJ7H5eCbQTJH/V0g+t9nNIy7VTL3yY
         mAvr2gK6PHuWzJQCGYISjzO4js//ti35WCCRJI8ZKzYlrqloOELFHjts9hDse3eILGnN
         pBAoQaNyDABEUmgvAKQb/rU0o9fHdPpeuEKbYmIbuYRfG+rfS6F2f2KAn0XZ6jq5C+x9
         2CzMaxVXnZeUlcPTV5Y30gQ/BNG968OnNNT8QhVNSUcC9p6oykpFkKcXkqsOJqnzf7cK
         vsWDQGKLMh4yzivePcoLxVHBu9W2RB9VEvjyKxEiQfjSl3AxtetLz257jzn6tazMLfrZ
         dcnQ==
X-Gm-Message-State: AOJu0YwnJU/ncDlCZWUyEGthk2HjV4AmVQmPw9PlJtE0UY+pj5H3epDc
	ZIB0378YJIPoCRBVbBAMpgkqYKm2TgffcWlvERRYfg==
X-Google-Smtp-Source: AGHT+IGfiH7/vZwPOYNJYfiPFBz2VHBIUsAkZ3hwTXH1qOBLB7kLIxeiWKyV6/erRjPKyouXW2aFwt8n98N0Q3p+tfY=
X-Received: by 2002:a17:907:9341:b0:9b2:b71f:83be with SMTP id
 bv1-20020a170907934100b009b2b71f83bemr3210322ejc.1.1698435498762; Fri, 27 Oct
 2023 12:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-1-0d67cbdd0538@google.com> <20231026220248.blgf7kgt5fkkbg7f@skbuf>
 <CAFhGd8rWOE8zGFCdjM6i8H3TP8q5BFFxMGCk0n-nmLmjHojefg@mail.gmail.com> <20231026222548.rqbp5ktgo2mysl6w@skbuf>
In-Reply-To: <20231026222548.rqbp5ktgo2mysl6w@skbuf>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 27 Oct 2023 12:38:06 -0700
Message-ID: <CAFhGd8r9Y2tavxA2KVpELm-SRdvD+iEmYW=s7tf_dPpmVT3WeA@mail.gmail.com>
Subject: Re: [PATCH next v2 1/3] ethtool: Implement ethtool_puts()
To: Vladimir Oltean <olteanv@gmail.com>
Cc: GR-Linux-NIC-Dev@marvell.com, UNGLinuxDriver@microchip.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, oss-drivers@corigine.com, 
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_123822_795106_8E7CFA25 
X-CRM114-Status: GOOD (  13.31  )
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

On Thu, Oct 26, 2023 at 3:25=E2=80=AFPM Vladimir Oltean <olteanv@gmail.com>=
 wrote:
>
> On Thu, Oct 26, 2023 at 03:09:59PM -0700, Justin Stitt wrote:
> > Should I undo this? I want my patch against next since it's targeting
> > some stuff in-flight over there. BUT, I also want ethtool_puts() to be
> > directly below ethtool_sprintf() in the source code. What to do?
>
> (removing everyone except the lists from CC, I don't want to go to email
> arest because of spamming too many recipients)
>
> What is the stuff in-flight in next that this is targeting?
>
> And why would anything prevent you from putting ethtool_puts() directly
> below ethtool_sprintf()?

The in-flight stuff consists of patches I sent changing some strncpy() usag=
e
to

ethtool_sprintf(&data, "%s", something[i].name);

We can see them here [1]. I went for this approach initially but then
discussion came up about introducing ethtool_puts() which now
made my patches (some accepted into next already) semi-outdated
and in need of another swap from sprintf->puts() -- hence this series.

As far as the rebase, I simply took my commits and placed them on
top of next/master and got merge conflicts when ethtool_puts()
was placed below ethtool_sprintf(). All I have to do is move the hunks
around but since I formatted the file it's appearing in the diff. v3 will
be a clean diff.


[1]: https://lore.kernel.org/all/?q=3Ddfb:ethtool_sprintf%20AND%20f:justins=
titt

Thanks
Justin

