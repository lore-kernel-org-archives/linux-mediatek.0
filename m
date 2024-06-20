Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AF5C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 19:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4Z+ybUYMauqZ31ugavPoL4O/Q0wanX4Mqqn+IQJwQQ=; b=REexZ0HtzjMPajn937y2VKuk7F
	1icPmtrjUsRTvtq6mkioDr3NGC3c9hEhutFgkOOmycmXVKuouOXO8IBq+UyF8htZtPANZUC43AvB+
	5YOUQ2bCjhFqnqkN94j7+NyfWexMPiDV5JvfZykf4HwTviwmmvkxE+9KjxasYWZ5hkS6fdVcZHChK
	5GDTiaePznSpRBWWFbQYhYVFI5bG3sXbGL/zBtEVMktdne400jOBYwBiHGbZBNhJg86JELvYRbXtx
	cK5INRFuSo1YnXLhF/FgfbkCwSjKbnueVTdrhMPAhV85GuizQXUkZmyCAHfQeshn9v7innsc+woka
	YOEliLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKNb6-00000006U2n-168J;
	Thu, 20 Jun 2024 19:37:28 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKNb0-00000006U0D-2O0y
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 19:37:25 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6b501a4344bso6115396d6.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718912241; x=1719517041; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H4Z+ybUYMauqZ31ugavPoL4O/Q0wanX4Mqqn+IQJwQQ=;
        b=0gkCz8MAHjv8AAOWnIiMzCbCTQRlsWY88YofVMtdUIEOk/Eyk/+CViWoD6sn46tDQn
         DQCwW1wnO3798vQVcC2KYrrG/iIXcqSxZwFxQAbKxzXJkbzeVBBAo/TsgkdVhzEHKl0n
         rGNpeTAAb0NFbMv5MKo6rDspuZnBLLrGiBldZ8711Q2jVrOeWFgeQqmHuZMGac2mKjRX
         MyPJR36OevyOt/7UveEJRxqw6YV856bFuzCTEgsWAhwG88OBBUfbcmfB/Rw4YV/9jkgB
         oTYa6Rs7OnvodWJyXcQFiYPo2AE3C11H98bM3AJHsV0yJpyMnCoW9hnllJmoA87l2tPe
         3tDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718912241; x=1719517041;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4Z+ybUYMauqZ31ugavPoL4O/Q0wanX4Mqqn+IQJwQQ=;
        b=Zp2rlWhmHtM0JFBhYnf9RxzoY+R/QAK8VWs195yR4YA+jz04UsH+pdjFN9sEQE85Bg
         1NrGxA+ouhjzy30mb0opxAlD5ea72KE9CakQiEOmPfB8oEYDjHq3CRiH7hV09Tvsm0ww
         LnwC80iUHpcgECXeWVe6Dn3I47pCGGtu9p5MCZTVL0bejMBd7HOYbUwZMhxCe4HDF2F5
         hRM/ou/wn3ROhuusn7rhNF1/6xcy0ILBH7SPLoNiijoycJjXDMCfGgZePuU6EWhFUpsA
         ou8EPvSPEjjL7dssjC7VIa7bEtpHEyaE0mySeZwheRBAik3b+51DfcS8RHYSjxO/SOBp
         z46w==
X-Forwarded-Encrypted: i=1; AJvYcCXjuBma34k9Fz16BDdIsKqvA0qvPCIjM06wt+VYp/BEEgGNGCr0NsIAChK/PMSDjwQqk6LifjifBWuMnJD5NxNcHTmJhQAOCL1AdMkA8fsGlENS
X-Gm-Message-State: AOJu0YxCzoKyyiM6N8iRISNLUouCuSCtJqJOCVt9q0uSQCoPUpul5v34
	ZyQ7PfK0p7Ae0cIU8rZDJ/Tm+1EXeiC5DebEFx+56FVN+lo2SU10xbVQ7qcqLDY=
X-Google-Smtp-Source: AGHT+IHNbneA1rPJZPgvcj3mwHKuiGb77Z6vVNX3UHTpocfd13qKN824+8NQu/mJjvCXPM6WtEQUuw==
X-Received: by 2002:a0c:ca92:0:b0:6b5:34b:8c02 with SMTP id 6a1803df08f44-6b5034b8dbamr63633426d6.27.1718912240911;
        Thu, 20 Jun 2024 12:37:20 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6d4e::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51b90472bsm3248726d6.143.2024.06.20.12.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 12:37:20 -0700 (PDT)
Message-ID: <d31f18cae640095ca0704185f8238184c13cf93b.camel@ndufresne.ca>
Subject: Re: [PATCH 0/4] Support MediaTek MT8188 Media Data Path 3 (MDP3)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, amergnat@baylibre.com, 
 moudy.ho@mediatek.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org,  p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
Date: Thu, 20 Jun 2024 15:37:19 -0400
In-Reply-To: <4e1a8383-fdcb-45b9-b3d8-7019ed8c07bb@collabora.com>
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
	 <4e1a8383-fdcb-45b9-b3d8-7019ed8c07bb@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_123722_783533_AE60BC52 
X-CRM114-Status: GOOD (  15.83  )
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

Le mercredi 19 juin 2024 =C3=A0 11:23 +0200, AngeloGioacchino Del Regno a =
=C3=A9crit=C2=A0:
> Il 22/03/24 10:28, AngeloGioacchino Del Regno ha scritto:
> > This series adds code to support for the MDP3 block found in the
> > MediaTek MT8188 SoC, including the necessary bits for mtk-mutex
> > and platform data for the MDP3 driver.
> >=20
> > This is mostly compatible with MT8195, with a few differences
> > "here and there", with the former having less instances of some
> > of the MDP3 IPs compared to the latter.
> >=20
>=20
> Gentle ping for this series getting stale.
>=20
> The soc bindings and commits are already upstream (v6.10).
>=20
> The commits that would go through the media tree [3/4], [4/4] still apply
> cleanly as they are.
>=20
> Should I resend this, or ... ?

If 1 and 2 is merged already, a rebase and resend makes a lot of sense.

Nicolas

>=20
> Cheers,
> Angelo
>=20
> >=20
> > AngeloGioacchino Del Regno (4):
> >    dt-bindings: soc: mediatek: Add support for MT8188 VPPSYS
> >    soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
> >    dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
> >    media: platform: mtk-mdp3: Add support for MT8188 MDP3 components
> >=20
> >   .../bindings/media/mediatek,mdp3-rdma.yaml    |   1 +
> >   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
> >   .../platform/mediatek/mdp3/mdp_cfg_data.c     | 280 +++++++++++++++++=
+
> >   .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
> >   drivers/soc/mediatek/mtk-mutex.c              |  41 +++
> >   7 files changed, 328 insertions(+)
>=20
>=20


