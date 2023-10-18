Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C63CDB482
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1R2Rr1jU/wF+7t7rTzdeT1/U8jF/CmiZuYGx2lkCs4=; b=dsSVkwhF7E6o0n8zO55+OOEggC
	pCxrfMKc2CJV6hECXXpfUO5RkawYJkRgBnyGr+VKeCkFCzQ6voLi96cbVO8d4dbTvt+WR2at+Dn0z
	r+5zfmfSPcRqyaiMOeH2+xdTR3EqJFePQciQP4kgJPB/GoU3vjRKNnGtHDG9CgAsdzd6rQM0z0nmQ
	8grYQa7ac2PSVdwpKB/rHk+UqPutCPbrpFSpbqSO20zkcyQjT1FB4Ewtwi9ZDZ4JNuk7vghM2nqz7
	2eGw0qHonr4+6N4hy56dcFos00Mj+sMOyP7aeG91khT0UQakpvxF0Bm+sZJCktS8W7Vj8ySF2Eqh6
	VJlI+sOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6Xv-00Elq6-1X;
	Wed, 18 Oct 2023 13:25:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6Xr-00Elnv-1n;
	Wed, 18 Oct 2023 13:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1591BB82360;
	Wed, 18 Oct 2023 13:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC2DC433CD;
	Wed, 18 Oct 2023 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697635498;
	bh=y7R3Xc7b/dDNyN2IeFpAjUBAw7DegSFH5XvMPARiVk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HqRRQnvPK9Llpsr83E0oTzhy/MdvDrNQkXWi1wfdt0swbneeg0G4qXpRNX0H2YOU8
	 2s/GzaMVN5v/JizxnGYjamOybkFMBWCSqMvH1s0EJKOBdkW0BIVnuibasbKNkxp2r1
	 Iwxr32Ep7jAMWk7Ii3r6oIFRubLOCdh50Mf2Bosg/+LM93+ZMNIQipIqrP4OpQuQVB
	 YQyqyXkE6wzhg/dconNrBQ1Mq6EzoUgRspIbWiMlvHn+DTtkk3XDou8f58qRH3rApf
	 FyJxSaDGH60zhVh5e+mCRFTEy1EmvbeeNGHgX7nXeq0waUYlQmVvdYKcmnHdCOhX0X
	 mdU01qZUKbTJw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so80952171fa.3;
        Wed, 18 Oct 2023 06:24:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YxaBmkbj2ywKLPLBfS9PviaCW/47ISwA2Pj9K//8aBCwgQx/oz6
	WgJ202RTTjUr8iE1gY7N1aZXSfZ3rcrKLG8Ldg==
X-Google-Smtp-Source: AGHT+IE2erweQk78p2WZGcYNeJzi7UyNstiTigaugME3+3bf0yEm/om0FbaNsQp91jAtR+tU1eTO2SwDaQRNiTjDk+0=
X-Received: by 2002:a2e:9457:0:b0:2b9:4b2e:5420 with SMTP id
 o23-20020a2e9457000000b002b94b2e5420mr3825894ljh.52.1697635496365; Wed, 18
 Oct 2023 06:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
 <20230915101124.283232-1-mwalle@kernel.org> <54a04d22-7ec1-473b-ab57-f6339b2cc782@collabora.com>
In-Reply-To: <54a04d22-7ec1-473b-ab57-f6339b2cc782@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 18 Oct 2023 21:24:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_85g9bvVDUqK3ePd+7cWvqmVU4zRb=f4QxU_=A9eZaEpw@mail.gmail.com>
Message-ID: <CAAOTY_85g9bvVDUqK3ePd+7cWvqmVU4zRb=f4QxU_=A9eZaEpw@mail.gmail.com>
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Walle <mwalle@kernel.org>, airlied@gmail.com, chunkuang.hu@kernel.org, 
	ck.hu@mediatek.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
	jitao.shi@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de, shaoming.chen@mediatek.com, 
	yt.shen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_062507_918104_38672439 
X-CRM114-Status: GOOD (  14.82  )
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
2023=E5=B9=B410=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:=
21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 15/09/23 12:11, Michael Walle ha scritto:
> >> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
> >> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
> >> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
> >> later calculation for horizontal sync-active (HSA), back (HBP) and
> >> front (HFP) porches got incorrect due to the logic being inverted.
> >>
> >> This means that a number of settings were wrong because....:
> >>   - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
> >>     set in order to disable the End of Transmission packet;
> >>   - Horizontal Sync and Back/Front porches: The delta used to
> >>     calculate all of HSA, HBP and HFP should account for the
> >>     additional EOT packet.
> >>
> >> Before this change...
> >>   - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
> >>   - For HSA/HBP/HFP delta... all three were wrong, as words were
> >>     added when EOT disabled, instead of when EOT packet enabled!
> >>
> >> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
> >> MediaTek DSI driver to fix the aforementioned issues.
> >>
> >> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time cause=
d by EOTp")
> >> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and =
EOT packet control")
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >
>
> Hello CK,
>
> can you please pick this fix?

Applied with the changing

Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and
EOT packet control")

to

Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register definition=
")

Regards,
Chun-Kuang.

>
> Thanks,
> Angelo
>

