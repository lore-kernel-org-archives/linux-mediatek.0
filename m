Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F9AC27C49
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Oct 2023 01:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g5kyZ0hA+DlGKnaeXH//43ksUqY7YG+r7+U+dNLRdo=; b=q20Y0a8kd43Osxgc2Yo8TtccZt
	SjofwRQAnkdIliyzmJpY5sNfvVzqxsAbgiYsR7vIPSMGf2oJBPpXxIGq3BrtjzpvkkHUXfj5BUe5a
	1QKfOsSF+xkvqz4IAS7wjmZKOjYCw5QwJIqyK+DXWg7BHmQvAMleB/vlxr55avVfkb4aoRC/x6BTT
	xrPPSV1m3bGJE4vvdkHGowfdmb1WddLS/+1ektnLhlc0SxDhXb1ZIjpFjy0jZh3fhq82HG3jIF2Ef
	niHqmVgz1zrw9HER4egqk6L0Ds78EpkOCEmdLvoV15wRVjYzBICtJKpiZTCiZ1o0KOJGOYClJUlv7
	jDnfuEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwY04-00HRHi-2c;
	Sat, 28 Oct 2023 01:20:28 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwY01-00HRGs-2t
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Oct 2023 01:20:27 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso143772366b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Oct 2023 18:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698456020; x=1699060820; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g5kyZ0hA+DlGKnaeXH//43ksUqY7YG+r7+U+dNLRdo=;
        b=xHth2Ay/uMXQXFqZSTeNKMDBMQwvoIGnbeL4RKWaoODCUAFX7gD5gC9JQ45M2OyEfW
         1IsqWLEHBEirLOkYoRI6zkeboHOssALb7F6z/JEiTbfH229zKRYhmqDKmoY+G3L5t03R
         kWUd9a+qJ8OO+s81A1O2gdOBBA6FpJfmSNgPXDBKvRKrxSkG+TFBS8q7F2g6B2JtmwkD
         vN+++UzcguHYhVBh/j/orUK7RNe0FOugwP5Zc2apJwNH4xwkPmZjmdK0KW0YA90kZ8G8
         vYGlpfyhbhVAWaUXyoMiwXc1xg0viDI+8ii/+Lbg2Z7t2uVt7xCOLyHX6dzVec7pHbq8
         w/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698456020; x=1699060820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g5kyZ0hA+DlGKnaeXH//43ksUqY7YG+r7+U+dNLRdo=;
        b=V5awHRtXfxpkoSo1SmRm16n/FpR44HtC9K3lw2anoXlNNNV6M02XIBr0ZwbshlAcGS
         9jOUvX58jdFCcGXibRNP6y3ctWWinf1ZxTJ1/iWhwAvqP5FqZ/9Ag7hcNxjqVuyqgvnD
         XGrBu8NUOioxkbpZ5ZdHzpTdmy1YI8Tscuw9Gg5N2shfATZ8k4grJM5Lv+FKMVH4G3vU
         Xse7YlsmqwRDQNL1K3510XAqEFa7fkwy+XrFzHoh8D8z14cMZLk7WoJsyeevmV51JpjR
         WKOktfmXavFcp1/kqRIJLfdMZtqctoG967RnZuC+6pfVRZtDzHnumavZKHYHKgoQbWIN
         Ybcg==
X-Gm-Message-State: AOJu0Yy4AuZ2qtLydN2hdLQWiT7PqzBqbvIF5KfSsa8PrQr3bTFfdQao
	aMqf4swOpiuzXpeGtJ1mMF+wpDmfnVp8O+tcqj3ZvQ==
X-Google-Smtp-Source: AGHT+IHxolWSAC4XvBLAiS8bNkb50iFHz5nOkd4FFLXw/+WDrtcRsN44VBQ67SWxWTbp7GfzFR6SM97u7XxM3x0zW6s=
X-Received: by 2002:a17:906:fe46:b0:9c3:b3cb:29b2 with SMTP id
 wz6-20020a170906fe4600b009c3b3cb29b2mr3275410ejb.42.1698456020364; Fri, 27
 Oct 2023 18:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231027-ethtool_puts_impl-v3-0-3466ac679304@google.com>
 <20231027-ethtool_puts_impl-v3-1-3466ac679304@google.com> <8ca4ba13-1bcf-4c7b-91b6-8c77fbe55b30@lunn.ch>
In-Reply-To: <8ca4ba13-1bcf-4c7b-91b6-8c77fbe55b30@lunn.ch>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 27 Oct 2023 18:20:08 -0700
Message-ID: <CAFhGd8p8mmGfR-eTu_g3k64Z79z=M1xfjTFDhmJ1XaszCtQx1w@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/3] ethtool: Implement ethtool_puts()
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>, 
	Sudarsana Kalluru <skalluru@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Dimitris Michailidis <dmichail@fungible.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Louis Peens <louis.peens@corigine.com>, 
	Shannon Nelson <shannon.nelson@amd.com>, Brett Creeley <brett.creeley@amd.com>, drivers@pensando.io, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ronak Doshi <doshir@vmware.com>, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	intel-wired-lan@lists.osuosl.org, oss-drivers@corigine.com, 
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_182025_961950_A00E9E08 
X-CRM114-Status: GOOD (  10.42  )
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

On Fri, Oct 27, 2023 at 4:43=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/**
> > + * ethtool_puts - Write string to ethtool string data
> > + * @data: Pointer to start of string to update
>
> Isn't it actually a pointer to a pointer to the start of string to
> update?

I suppose.

FWIW, I just copy-pasted the sprintf doc and tweaked:
/**
 * ethtool_sprintf - Write formatted string to ethtool string data
 * @data: Pointer to start of string to update
 * @fmt: Format of string to write
 *
 * Write formatted string to data. Update data to point at start of
 * next string.
 */


>
> > +extern void ethtool_puts(u8 **data, const char *str);
>
>         Andrew

