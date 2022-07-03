Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F277C43334
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jul 2022 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FZRGuGyGXrR6uSqT9Lj6raevMBa8uPkB+swZksqT8g=; b=YSCRgavOPNYrX9NxSJqczgVpOn
	bsoEy8O7NyPJ96SrfaGXLf5bcqbYXeDdoG6PrsobP5279bUWi3tJwM/8kzmYYzPJk8+nwHm0AwhDd
	k+geZpn8V+KZ2ycH6Yi+9DUarsIbgRgEjLO8YGNGME6Nld18z6wzMhIg+l9ORKmQJBW5g2eTQRkpq
	uTAtezaQCtBAvXldon/if/60fEN9V3XrCa8vBGiLdYS7AT+mI1JTCmROURWhXN7O9+jRNtZ0kMq2V
	AjiH17VR4TJnOmW0nH4G21mHD7I5KCyY0BX/jsHxMTZbCZvswEB5MDY/UnGKigv2qErKYqp4kRM9k
	+reNtWnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o81U1-00GqrP-1I; Sun, 03 Jul 2022 15:26:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o81Tp-00GqmA-BS; Sun, 03 Jul 2022 15:25:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 748EB60FFA;
	Sun,  3 Jul 2022 15:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E49CC341D2;
	Sun,  3 Jul 2022 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656861945;
	bh=6FZRGuGyGXrR6uSqT9Lj6raevMBa8uPkB+swZksqT8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jnfjjziiv5MMxIuRaSg6LT5q52q+OIrul5gcUV0jYjn4deC7F6mQtgGFOJmSBdAl0
	 7+SdkRcpFhexGoZb4lzRVq6mZJc1wAbKefVz+PuyV1KEBlpiX+/S6PdI99faDmJSAM
	 mPIv2wcYy0abVEu8yIGwxAIQqPASjcut1yD92/ioHhVeYMDzFcrpVvRCWBpWlP/dUb
	 OjauLPWnckOBclx4SUrUQEQga6KweAInZMgPn4uGvyFBOqpbqGUZQv+kYbP1fQn+IP
	 ByMbqIZQJ054r4EcKqUaiiiIhZd/9yFR39F2DMSx+qBTYmKaQXRcf6ZWadBwm2oezA
	 04iZwX3Ba/zbQ==
Received: by mail-wr1-f41.google.com with SMTP id k7so9963184wrc.12;
        Sun, 03 Jul 2022 08:25:45 -0700 (PDT)
X-Gm-Message-State: AJIora+Eg7wp6tFSlNJxrwbHDsCyVbB6tvzK7GuPTSY+L9e1fdinfKeh
	laZzf/lno0nt1Yiu7gHoCcIVhLYGxK611vZPmQ==
X-Google-Smtp-Source: AGRyM1t143YoHfhT1+OzPkK/w5os5HDfXvbtq7xkqhf03LIENcWrbQDx8MClno+Ey8csr1cLW8bxwuJ/Np9kf9yY7bQ=
X-Received: by 2002:a5d:6c62:0:b0:21d:2235:d800 with SMTP id
 r2-20020a5d6c62000000b0021d2235d800mr23103832wrz.381.1656861943448; Sun, 03
 Jul 2022 08:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090547.21429-1-allen-kh.cheng@mediatek.com>
 <20220701090547.21429-2-allen-kh.cheng@mediatek.com> <CAGXv+5FTXXWZU4FyqJ7uqoPGso7ofsb1=QS0mU8Ay2hSz7rFXQ@mail.gmail.com>
In-Reply-To: <CAGXv+5FTXXWZU4FyqJ7uqoPGso7ofsb1=QS0mU8Ay2hSz7rFXQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 3 Jul 2022 23:25:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8T4+hGscNwhYnnySjzOQiuDBKiH-dvazzntnNGr6u2mw@mail.gmail.com>
Message-ID: <CAAOTY_8T4+hGscNwhYnnySjzOQiuDBKiH-dvazzntnNGr6u2mw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/mediatek: Remove mt8192 display rdma compatible
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_082549_472968_9E417796 
X-CRM114-Status: GOOD (  15.94  )
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

Hi, Allen:

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=881=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:37=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jul 1, 2022 at 5:05 PM Allen-KH Cheng
> <allen-kh.cheng@mediatek.com> wrote:
> >
> > The compatible =E2=80=9Cmediatek,mt8192-disp-rdma=E2=80=9D is being use=
d for reading
> > the data into DMA for back-end panel driver in mt8192 but there is
> > no difference between mt8183 and mt8192 in rdma driver.
> >
> > Remove compatible =E2=80=9Cmediatek,mt8192-disp-rdma=E2=80=9D from the =
driver and
> > should use =E2=80=9Cmediatek,mt8183-disp-rdma=E2=80=9D as fallback in 8=
192 DTS
> > according to the mediatek,rdma.yaml.
> >
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

