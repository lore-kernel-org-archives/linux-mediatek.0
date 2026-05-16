Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37904CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2026 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhRmHI3gE7o85B5IehRC0zbKRLMe1rUp+E277EsuYZM=; b=mxAjV2D200b/C/xnp0DAiB/5t6
	lCq/sy2SaKZem4lbrfkTYq0CyUGgjpJN9t5lQp6/R5rRvrkbBLR4R7gBO4G91Qc5JNh+LbuED/Kk1
	v/cUatQaMBiUxyVkpqc9LiU/efTXB0iYWb70KkeWvTKDwByHpMS3tvfu/XfFWh/YyZENz76YzSH1L
	s31CKfq97R8HkmyZFGOGxlRQrxpX937q56RlPyJeMiS3czKhlHena2MHRoQHszeTsLGJSm2WRnrZK
	H2+b0MPgmemga+KQ9Yy5Y/cz9DgLs7LtnoEM+sdlqrFCVDCR6baCFrZeg1kNNa6XbmHDhAQCuroC9
	g4sVeM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGXK-0000000AuHl-0vXy;
	Sat, 16 May 2026 15:02:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGXB-0000000AuFz-3erU
	for linux-mediatek@lists.infradead.org;
	Sat, 16 May 2026 15:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 728E8445EF
	for <linux-mediatek@lists.infradead.org>; Sat, 16 May 2026 15:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D07C2BCF7
	for <linux-mediatek@lists.infradead.org>; Sat, 16 May 2026 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778943753;
	bh=fhRmHI3gE7o85B5IehRC0zbKRLMe1rUp+E277EsuYZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y1ZsXzW19oVoX1+EVOKGTIsEi3Jk5dD0xWI1g7ak+Pj/Bz/4gKrGHaekY3vO+kGTs
	 nqGSKnxaDuA+vzim1KkguAkpwEb3Vw+GqAdFRzwyEh1VfoSBl/6AFIYpWh7rBkEgGl
	 xLZoH2exiy4mHkYHjhh2PBfuGro06pkkKnVhmHaZi9z5DNaI+d5myms4E4Do9jlI/i
	 noQPxB4/Qg4XBha6hpCyMJxEHNqJcmNW76FLxGHeO2TNuPQfQlV5njLlbMyJYUeae5
	 4yS/F89wLZDoa6ZEMzyJ9oITwmDG/4FcwS5Z6rVQf9FMkBL4ue7mlz3ict6QM5WipC
	 5YxudcTa2B32w==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8ee4b703fso818719e87.0
        for <linux-mediatek@lists.infradead.org>; Sat, 16 May 2026 08:02:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8jVTNcarpg6QYcg/OnW5T6ncXh9byRXAqyhBQADAnqbL17/wOKAbjpb38a95Ezlt82VZxKim0C4ib0f+E00Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsEEtW1JETLZ2RKwVhjv2rqkhJqLEe32KY1wBEfMm0saDV7vqf
	qZ4vZL/yI8n8J4qYVrZU/z82ceMk09hc3A+jKdlxMykv1muFMqPpZqxEOTQwuJFhU3Yc9K72RM2
	qfS0tYt7xoC8gRqt37dGdtWHXxzovbEk=
X-Received: by 2002:a05:6512:3c8c:b0:5a8:84a5:bffa with SMTP id
 2adb3069b0e04-5aa0e6191a0mr2385235e87.5.1778943751745; Sat, 16 May 2026
 08:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com> <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 16 May 2026 17:02:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=XR1XMdGoLGYdbK8DYc52BidWDhV35auyGJo2FRK+nog@mail.gmail.com>
X-Gm-Features: AVHnY4J_BRpuyVIajVUy2Bk72DemUmM0wrxlDP6FCrL_F3X-aoIfjJho3-JZTYQ
Message-ID: <CAD++jL=XR1XMdGoLGYdbK8DYc52BidWDhV35auyGJo2FRK+nog@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: Use named initializers for arrays of i2c_device_data
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, 
	M R Swami Reddy <mr.swami.reddy@ti.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, 
	Peter Rosin <peda@axentia.se>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>, 
	Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Chris Morgan <macromorgan@hotmail.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Marco Crivellari <marco.crivellari@suse.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Teguh Sobirin <teguh@sobir.in>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
	Hsieh Hung-En <hungen3108@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Shimrra Shai <shimrrashai@gmail.com>, Zhang Yi <zhangyi@everest-semi.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Qasim Ijaz <qasdev00@gmail.com>, 
	Sharique Mohammad <sharq0406@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Neo Chang <YLCHANG2@nuvoton.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Kees Cook <kees@kernel.org>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, Tim Bird <tim.bird@sony.com>, 
	Bram Vlerick <bram.vlerick@openpixelsystems.org>, Peter Korsgaard <peter@korsgaard.com>, 
	Wenyuan Li <2063309626@qq.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Xichao Zhao <zhao.xichao@vivo.com>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_080233_953786_32C413D6 
X-CRM114-Status: GOOD (  12.93  )
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

On Wed, May 13, 2026 at 7:23=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>
> While touching all these arrays, unify indention and usage of commas.
>
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

This is generally sound, so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

