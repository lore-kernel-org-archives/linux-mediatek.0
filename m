Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FCCCD98E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 18:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg5urtXwHhG5NTd2I1ePWdoMCidQs7lsiIoCNc/Lh1Q=; b=uyj4TeFlK/d/OtJNZ4tr1GQctF
	YggAhPQZ6aCSFyWgJwvhJ/kYpLLBR5l1/BmnguLLqnRJgTBk7F91snb6Zbk7v5DLNPkNE3e5liOvb
	/58siUHfWPNslKRVyEqi01I5P9oyESqSkPKIl4jCAUfK58buvfCly8dU0DHEmi4b55aCUGT4VenYh
	w5QLS/SJ4ys8SwMmbyRkRvzXZdT9Ch4Nf6LmFnX7XqiltT/xjxGgXXokF9h4RP4XsAWT/MoS+SVa3
	25O7hwfl5gXyY3e7JBXY9cZS3ccgXsFHnhcKnl5WIhDKAqbKwoUyRR9pl3mQMUVa4IYnlE2s9+XqI
	eJkj2fZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYyK-0000000GECA-43fI;
	Tue, 16 Jun 2026 18:57:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYyJ-0000000GEBu-2TNe
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 18:57:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03262445C6
	for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 18:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C1D1F01564
	for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 18:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781636234;
	bh=Kg5urtXwHhG5NTd2I1ePWdoMCidQs7lsiIoCNc/Lh1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=luQxn9claLnfUGUe4BPO/rKUJCKvbYkdDQ+j2wsHIRz6AQVNGuQHOD9FBHPCskdqe
	 Talz+wHwrzepupIp3d+SdJigCtw9Lh4qC8oi7IQpB9SCoXxl+LgU4f66IuqYKOZtf5
	 tieRGEMDoKYR2r5sJZGKvXFJ3dDoywYVOh4JEgDYatvyfewTCFwCT8sbizwxy+HVbk
	 rsBMS51Q/mz88WQrG5h+I90N7HeVmYm0ykIqXd5MmHWUHpLkCkLf8+fuCfQ0j6EYWU
	 WkKYh5OPblH6nMNoAMO8dNfO4Ja8DM3ZVM3VCiavzuHNaL4KlPW3pK3MdD6JQMeQT1
	 1u5RACOzy2rzg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6914a658115so6402488a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 11:57:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YzokUTGOjURUgv6INpZ03fl8IcjlUO+FX2t2uik9AdFaoezL1ND
	rQUsxSxYq/1ZLnc9k5nxoSnIEYTSvmvD4HwvtgJaFjt+eqfUeXUMyRa+NTYKkJf9h8KXqqcLm3G
	/lTBewbfTXTMANpc3x5Yne4oVZMMNMg==
X-Received: by 2002:a17:907:aaa:b0:c04:1977:1025 with SMTP id
 a640c23a62f3a-c05a128a414mr47141766b.0.1781636233441; Tue, 16 Jun 2026
 11:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260615071836.362883-1-l.scorcia@gmail.com> <20260615071836.362883-10-l.scorcia@gmail.com>
 <20260616133918.GA2335264-robh@kernel.org> <CAORyz2LiMHnaTK6QnsLxJDtw0fZ_N9LELw0iCorOZwHuWXus0g@mail.gmail.com>
In-Reply-To: <CAORyz2LiMHnaTK6QnsLxJDtw0fZ_N9LELw0iCorOZwHuWXus0g@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Jun 2026 13:57:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLGqqyDoGskgmRLzQC=UkFEXgW=cDazc=frO2KBaSri=w@mail.gmail.com>
X-Gm-Features: AVVi8CcwnrM4llpoEzOBnyyyWauL3xCmDN5lvRxGwwKA_noSBsMx_Zki1jU8Teg
Message-ID: <CAL_JsqLGqqyDoGskgmRLzQC=UkFEXgW=cDazc=frO2KBaSri=w@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 16, 2026 at 10:32=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> > >  arch/arm64/boot/dts/mediatek/mt6392.dtsi | 75 ++++++++++++++++++++++=
++
> >
> > Nothing is using this so it is a dead file that doesn't get tested.
>
> Hi, it's not referenced as the dtsi inclusion was removed in the
> original patch from 2019 for an easier merging of support for mt8516
> pumpkin boards [1][2].
> If you prefer in the next revision I can add another patch to readd it
> to the existing pumpkin board.

That or move this patch to the series for the board(s). If the board
is already upstream, then add the include in *this* patch.

Rob

