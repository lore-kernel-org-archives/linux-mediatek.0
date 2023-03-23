Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F71C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ynyp+S9BGcwrttvmGqGTVkG9UhEwnTOcUptS58xcI4=; b=1ktO3p5B+yOHY0DzSaryDAHrff
	9aDcVnPOl5ql8knr58e+/PBHFbkLZcAFsdZcgsjv1Bs7l53Oc5n9mWrDymhm/Mvx7YtfKR+1IhiyC
	rs2U5zUkpbivZBYYI3CC8zZqqr0C6TgOrQ4bZipML9BrmTCTsgoRgklxu7haHg1qoikWH3jqAHGZ8
	XjSzNTn/mi4IS5CbSGRus6uHsK+wB9iOuC59fFj8XN7v441MpouBsjZ2RKfstqeNGgcP5JP/ophPA
	2a2BNDNxHp0Sb8HL9UZYZYjyuMvpVZmITOn+KHmg8NKwHRSfNMZfVWlX7Axx8rXV1GkxE4PuNaoWS
	WI7QQSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfUJM-003C3v-1B;
	Thu, 23 Mar 2023 23:25:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfUJI-003C3F-1I;
	Thu, 23 Mar 2023 23:25:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 38217B82282;
	Thu, 23 Mar 2023 23:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7C5C433D2;
	Thu, 23 Mar 2023 23:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679613928;
	bh=4Ynyp+S9BGcwrttvmGqGTVkG9UhEwnTOcUptS58xcI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gaojddBsLMklRWpkIoGokzCon+Owd2xZg7OaHtN8Y+dEzUGKOOhecBjwIGU5j/0E4
	 CVpzVE8bri1ehajeHa+NSYVOtE5TRJDYXBEmgUQq6/pMMix57uVUbhkrl4XfGFvdRn
	 EiCc9wumwqpQnNbxwaBqSii3tE+4RCdN2qxNRuAobAyFNcaDUIzhU+/ejWFO2PtEay
	 3GKMz2B3sxpCW/HUYBoRXoa4ndsueYKRHVseuzVlSA5h2ZRvD1SDKGtKcBQh8hV+l6
	 pwYT+aet3bsCpYXdz1hWRu8qi+rjbGI6101k9Wzk5W603yuH3X6djvbWsWSTuclLsR
	 0+tlZqiJ+Sq2A==
Received: by mail-lf1-f41.google.com with SMTP id br6so29841684lfb.11;
        Thu, 23 Mar 2023 16:25:28 -0700 (PDT)
X-Gm-Message-State: AAQBX9ctzP3fejvsu1CGG9Uheieb9JIbvqZ5xKkHOVUKc+MjhoQMOhre
	cHdhonelpYtrLK9vgpnkgwqh4Wkp6NxL0yhlrA==
X-Google-Smtp-Source: AKy350bWHhQk1T3i2SqgUwf/TTiR6ou0itybGLCJUXytufGSnho4rPHLFcQzemcdLX6NIoPVcTsCovZ4emivLFiFZb4=
X-Received: by 2002:ac2:5639:0:b0:4dd:9931:c555 with SMTP id
 b25-20020ac25639000000b004dd9931c555mr273032lff.0.1679613926916; Thu, 23 Mar
 2023 16:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com> <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
In-Reply-To: <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Mar 2023 07:25:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
Message-ID: <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Nancy.Lin" <nancy.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, krzysztof.kozlowski+dt@linaro.org, 
	Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, CK Hu <ck.hu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, clang-built-linux@googlegroups.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_162532_614056_7F3E0712 
X-CRM114-Status: GOOD (  15.92  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2023=E5=B9=B43=E6=9C=8823=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:5=
8=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 21/03/23 13:18, Nancy.Lin ha scritto:
> > The hardware path of vdosys1 with DPTx output need to go through by sev=
eral modules, such as, OVL_ADAPTOR and MERGE.
> >
> > Add DRM and these modules support by the patches below:
> >
>
> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
> Green light from me.

I'm curious about how you build code and test on Chromebooks. Do you
build in cros environment or pure linux
(https://archlinuxarm.org/platforms/armv8/mediatek/acer-chromebook-r13).
I've a MT8183 based Chromebook (HP 11a) and I've tried to run a
upstream kernel on it. cros is too heavy for me and I doubt I could
use it. I've tried the pure linux and could boot up with console, but
display does not work. If you use the pure linux environment, could
you share how it works?

Regards,
Chun-Kuang.

>
> Chun-Kuang, can you please pick it?
>
> Thanks!
> Angelo
>

