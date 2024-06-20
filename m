Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07BEC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVPLtuShufVqL2WCjpTc8rDVep4hA7cgotqlwBxgDE8=; b=HM+O2QhFa35W/C65xhS4wwafyy
	r9xVI4/YIYvWZ5bP+yskdiE5683bNyphHS78Z6YibTCm+I5uZj7VGkGA9jpEL3XwlZnlhPFF+HXY+
	ifXze2BFQcPlrUj8XcxRLbgik9AXgKBQ+hDWz1s5AvotefDT62r1CVMPEvfpKATGu1ERAFga+yv3I
	dxZB1iVWntTAuPpKPrgFBjeGo5te+eF+4z25c+AzeZPzE2hWAvPeGjydPRVGijSONcEvZiTootYeJ
	caVm+QGW5xvNeO4Bb9L4f7nm0LOtQr/rIspFFj6Qw0TZ3sU16+69xSbKSZEXm8+1PfT7yw3AhMFoT
	UJB8QjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKNdM-00000006UUp-1yur;
	Thu, 20 Jun 2024 19:39:48 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKNdJ-00000006UTo-2p3V
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 19:39:47 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-25c9ef2701fso792783fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718912383; x=1719517183; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uVPLtuShufVqL2WCjpTc8rDVep4hA7cgotqlwBxgDE8=;
        b=Yt9x1ODhdwd9DPw7englBMxmGc88kgV2zw3bO4BIYuNEj0cZZ4/xG8tUPHwrwVLBIQ
         AcfAiaMz3M/AAgapgU/3AmTIS1r2xWXzlvKvW6R2A8N+/Y2rglKnykoJf04bvmOJM2oY
         FwyNETnowcSPIMpJG5tyvNnULtdv1OpO1uBnKpMuKnBR8Y0rQTvHG3VfbnYz7WJ1ZaEE
         BfhKBKXkaLNXNGjAHIFysThM+ImWM/Ou/ObAqqoO2f3uU1Ryt+4cobpAFekI84BHoKj3
         KGBzuMFSmXSdvNRQbuT5r+PO8Bmarvz20kQGNs5zOYkvMx+naAa72ksQEQB/h8PTzwkJ
         4lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718912383; x=1719517183;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVPLtuShufVqL2WCjpTc8rDVep4hA7cgotqlwBxgDE8=;
        b=E80xW0F24eBbEhILNvYgn187c3HKjWrvIEeoB3v/ZM2nwbE70UWvEU4JE5GeOHV8os
         clU9AClUPGOehxKJrMHKzA4bVnFYeqsgi5b79BnuFsodyeU3BpX/rMlKG9bOjirXAPzt
         bxkPe1bhsaazMTak4S0WI/Su39DSiae9+uTaDZw4MAOvuNNH7Druyn3C49XipyrDm+I1
         90CORH4lqGGFVoBUi2C4G5EbPlpfILP15NVGoJLqaoehMddXJyFa5VGmeR8ukrkDe9tK
         ZhmjuvL3XNDGb1VvLCFybebu1O4UcjslwUYN37K+dzu9pVQkEcuJHZIiq8zQm5j9F+v4
         wweA==
X-Forwarded-Encrypted: i=1; AJvYcCVbMWI7nVpr2RcAlJ/+FOODjfhNhhk9w3ju63end7Ur3pXX8aEdDNjuMa+BOyv4JPCgLeOCmzuZbJVHpj3Omony5BrtFuSJFjTCTeY7Kho9qgoT
X-Gm-Message-State: AOJu0Yxmi+9/QSYDbvNI1G8rKsbvIa63T9Zu7N5qsFJgmjVnTm9oXzGU
	ZcQDgeg+oTplAMZcHSGVqb06//C8w9nWxJZkPkCvQkrTF04oZ/AecvonTJI+wnBWVW7bYjfdcQm
	w2iA=
X-Google-Smtp-Source: AGHT+IEaK9J7/frv8gK0LaWNtaMRBnzNtHqmvVCsYQHf1z13p7M8pNmPXqLPyAWQ+uIHjvEuKMCEXg==
X-Received: by 2002:a05:6870:d60a:b0:258:38d5:6518 with SMTP id 586e51a60fabf-25c948e3e2amr6593718fac.4.1718912382995;
        Thu, 20 Jun 2024 12:39:42 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6d4e::580])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce933e28sm3775885a.120.2024.06.20.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 12:39:42 -0700 (PDT)
Message-ID: <0d5f4addd82729cdae08740c80b48f01ab9681c4.camel@ndufresne.ca>
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
Date: Thu, 20 Jun 2024 15:39:41 -0400
In-Reply-To: <d31f18cae640095ca0704185f8238184c13cf93b.camel@ndufresne.ca>
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
	 <4e1a8383-fdcb-45b9-b3d8-7019ed8c07bb@collabora.com>
	 <d31f18cae640095ca0704185f8238184c13cf93b.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_123945_790780_549625BB 
X-CRM114-Status: GOOD (  19.54  )
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

Le jeudi 20 juin 2024 =C3=A0 15:37 -0400, Nicolas Dufresne a =C3=A9crit=C2=
=A0:
> Le mercredi 19 juin 2024 =C3=A0 11:23 +0200, AngeloGioacchino Del Regno a=
 =C3=A9crit=C2=A0:
> > Il 22/03/24 10:28, AngeloGioacchino Del Regno ha scritto:
> > > This series adds code to support for the MDP3 block found in the
> > > MediaTek MT8188 SoC, including the necessary bits for mtk-mutex
> > > and platform data for the MDP3 driver.
> > >=20
> > > This is mostly compatible with MT8195, with a few differences
> > > "here and there", with the former having less instances of some
> > > of the MDP3 IPs compared to the latter.
> > >=20
> >=20
> > Gentle ping for this series getting stale.
> >=20
> > The soc bindings and commits are already upstream (v6.10).
> >=20
> > The commits that would go through the media tree [3/4], [4/4] still app=
ly
> > cleanly as they are.
> >=20
> > Should I resend this, or ... ?
>=20
> If 1 and 2 is merged already, a rebase and resend makes a lot of sense.

Ignore this, I see Sebastian did it for you and sent a PR already.

Nicolas

>=20
> Nicolas
>=20
> >=20
> > Cheers,
> > Angelo
> >=20
> > >=20
> > > AngeloGioacchino Del Regno (4):
> > >    dt-bindings: soc: mediatek: Add support for MT8188 VPPSYS
> > >    soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
> > >    dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
> > >    media: platform: mtk-mdp3: Add support for MT8188 MDP3 components
> > >=20
> > >   .../bindings/media/mediatek,mdp3-rdma.yaml    |   1 +
> > >   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
> > >   .../platform/mediatek/mdp3/mdp_cfg_data.c     | 280 +++++++++++++++=
+++
> > >   .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
> > >   .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
> > >   .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
> > >   drivers/soc/mediatek/mtk-mutex.c              |  41 +++
> > >   7 files changed, 328 insertions(+)
> >=20
> >=20
>=20


