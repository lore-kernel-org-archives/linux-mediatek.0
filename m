Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CE2E7F150
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 02:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emIKXtRIs/yM2DWwZD9zMtoiHVTkPPbqlVWgbeCiXyc=; b=y10fR6jQPQZzeef6S9+OB9Frff
	MKbr4DAUhnxeT0oAqmbufNQsg0NTlPQNDfGJgzP1+fvQYBsJyJvDrl22uwGB0vRk6DdEPuNEQ8QSH
	rOlTa2y0SAwG5yj/juSL0/nXDtsZ/Q7sEhf/ZjtadgF1uaL+ecKbz+0UgEtAdpcggPjY1Nmi8F/x3
	MiSQ2GSLRoNeMSYIoNPgf/CJoo2lfp2v2ZS9J3l36RtcwbWTFoloAzi4nJ0O6ThyAzD8tgTMk1X6o
	Hh5rFQQO+wEHSOcHen47YUEvHJ+ma73hYdQ7oZA9WZZEDtQixrKGI4TOExh231clmXDK4Sv4sOEml
	I0Br6Wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlKFk-00HMe3-09;
	Wed, 27 Sep 2023 02:26:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlKFe-00HMdG-2Y;
	Wed, 27 Sep 2023 02:26:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9b2a3fd5764so317396966b.3;
        Tue, 26 Sep 2023 19:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695781568; x=1696386368; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emIKXtRIs/yM2DWwZD9zMtoiHVTkPPbqlVWgbeCiXyc=;
        b=gxNT9P3iuK8sCQUOspybTmsLgZmvWNE5voHrn4h9Cb26EWVgCl7btXEOxt6dQHmRiN
         qO8G2OizGGTUMnXJQctCN4BD/Rd+QS4hgxIoMkbK0dRXPt8WrxxfUiE5Ifi+suaoYObp
         Y6HBK+bKoV+EqDoxQ6Djga6yApj9O9Eo4j2ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695781568; x=1696386368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emIKXtRIs/yM2DWwZD9zMtoiHVTkPPbqlVWgbeCiXyc=;
        b=R22wmtGxurnR0LVVumIxv7Ehl8UO/z1DjnrJWjbnK4Zy5IAfflmVaZPsWfsNiI0Uor
         cP2rtNwTplfHj4mgZDI21jJFBw3X6BtqKglm1iHLMtMa/E67Bf4/mhpgvEpH7tcOmeHo
         7Hhyiff4bG8e97cybEpvO1Bvwgts34PCPBjCGCZpd7KWzZEf7EuOKxrRs4ze2XSjVaEs
         0eoVZvxXR/3tpgJziJAwr+F0mzZxPOSzCOFRaSVdwMrBGFEoG+Kaq//BUs1qS1B7Hhou
         IG9aIfDxrKFSbXSRGF4b/hKfLK1NAdlh3lCy0SCeO7etz71RCRIvtoUOkeXmeGlBxRDy
         yKbA==
X-Gm-Message-State: AOJu0YyMzhRiFwWX9jdd9+DOYIZzqdUmKFPa9aHTDZPsOJZZeu4UapCH
	HgmHXMrHHk15La/2gFW1k3a8S5fnfey7pNdaY1w=
X-Google-Smtp-Source: AGHT+IHCCOjXb8+6pc5O9HOXdlXxVDhFBKsFiifAI3BglZZL/BL8JlMYEB/1h28CGguKKA8HQFS3La5RDl0OFTUHTbc=
X-Received: by 2002:a17:906:9a:b0:9b2:9d6f:2949 with SMTP id
 26-20020a170906009a00b009b29d6f2949mr400624ejc.57.1695781568293; Tue, 26 Sep
 2023 19:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2023 02:25:56 +0000
Message-ID: <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
Subject: Re: [PATCH 00/40] soc: Convert to platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Li Yang <leoyang.li@nxp.com>, Herve Codina <herve.codina@bootlin.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Huisong Li <lihuisong@huawei.com>, Krzysztof Halasa <khalasa@piap.pl>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>, 
	Shang XiaoJing <shangxiaojing@huawei.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Zev Weiss <zev@bewilderbeest.net>, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	zhang songyi <zhang.songyi@zte.com.cn>, Lubomir Rintel <lkundrak@v3.sk>, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, Nick Alcock <nick.alcock@oracle.com>, 
	Yang Yingliang <yangyingliang@huawei.com>, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, Ruan Jinjie <ruanjinjie@huawei.com>, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_192610_853426_BC5BB905 
X-CRM114-Status: GOOD (  13.58  )
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

On Mon, 25 Sept 2023 at 09:55, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> this series converts all platform drivers below drivers/soc to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
>
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
>
> As there is no single maintainer team for drivers/soc, I suggest the
> individual maintainers to pick up "their" patches.

I'd be happy if Arnd merged the lot at once. Arnd, what do you think?

If that will be too messy then I understand. I have queued the aspeed
ones locally and will push that out if we decide that's the best way
to go.

Thanks for doing this cleanup Uwe.

Cheers,

Joel

