Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C2BCE7A88
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Sep 2023 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXNGzcY+MKqfgR5i62zeQdUYuS++q81xu7i1ghX1VIE=; b=iD9jdsLGEc1DJH/M88DRSqVgvK
	YOFxugW3+Bq7OllD1nzvRbVbyA50UTzGxY1q/hqMkD+idYGoOrr7StQ2PclhP9siu4hbGmQB3qpL8
	40nKH/l+w4ME8X2bn3uXUd0uTrxBYx6Z6Ogop3dNbqKspXTfxzahm+eSfcwrZYjG4aNPAidGz7TUo
	4bcYZDDYlpYnfNQ7AX2F9tOxS5xjucnVzprQDSG/PCgtAVnsuPPU6eieunxtxJkL6/NoXvpg2l7Rw
	ywwqQV2V/tr0Z2KC6l8UGQGCUrE9KfbAFtcM8d4Rcuki4DFvbWbHp54/ZPz5XqqyXLjWfkix/wiIW
	eZpnMeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkQHm-00CNAW-2Q;
	Sun, 24 Sep 2023 14:40:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkQHj-00CN9T-03;
	Sun, 24 Sep 2023 14:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 41FFBCE0B2C;
	Sun, 24 Sep 2023 14:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A60C433C9;
	Sun, 24 Sep 2023 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695566422;
	bh=9GRsckWSSu1mlk9vmJKy9J27I3v7LoT+WjbT3ntqne0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gCcVsK/CkNAlyMVqWnN4VPt1kzjPoqNo5oo6alEewEruR12Pzpino4CvWoSEgGcO9
	 /Rr00Y0Eua09CO0vZ47JpQ4ZfAewqtiIQGn/ievdlfg+l9gA/P2JsZHOpSKtYjcmOi
	 Z2VSOmKGDykY20pTAlF+gU2khzpEQXGzvE14e7FGIPHLrPivhJKHpyhKUxNoN90hAI
	 o+ys+PbAVXHqOPxaoUULYRreT4jz+eKeyLE6ta0PKw+hQjdRkLKw2FRyl60crpglhM
	 ds1KF+m+Nz2BsZ8sDZPAq6SCGYEYWmhz3fQP7DoMYDeD7lQboBTJQR0YEZi4kMkgrs
	 pkb6lmrpQ3Izg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5033918c09eso7526032e87.2;
        Sun, 24 Sep 2023 07:40:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YxzTr8DN7pwGQtWuWjBGUQK1TzD8yFMBoWlj8gVxckLNSo4aC1+
	T/pgpd1GUM7TIIKPTO1xjeLUf1mfI3ej1f3Bgg==
X-Google-Smtp-Source: AGHT+IHgb7dlF3spUK7WjEovMRqe4TqCew31OFnTTbuiTomARpVLNlO+VuNaMI73R08m9JXOZ3UuaIZrHQ9jk6PBkA0=
X-Received: by 2002:ac2:5f97:0:b0:503:200f:47a9 with SMTP id
 r23-20020ac25f97000000b00503200f47a9mr3453499lfe.15.1695566420722; Sun, 24
 Sep 2023 07:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131058.2472260-1-jani.nikula@intel.com>
In-Reply-To: <20230914131058.2472260-1-jani.nikula@intel.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 24 Sep 2023 22:40:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Vn9eN+OjSWjo=WTrSasJs6h_N93PQgVAUU-NDeQ438Q@mail.gmail.com>
Message-ID: <CAAOTY_-Vn9eN+OjSWjo=WTrSasJs6h_N93PQgVAUU-NDeQ438Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 error path
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Guillaume Ranquet <granquet@baylibre.com>, 
	Bo-Chen Chen <rex-bc.chen@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_074035_516315_7BECBB33 
X-CRM114-Status: GOOD (  14.54  )
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

Hi, Jani:

Jani Nikula <jani.nikula@intel.com> =E6=96=BC 2023=E5=B9=B49=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:13=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Setting new_edid to NULL leaks the buffer.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Cc: Markus Schneider-Pargmann <msp@baylibre.com>
> Cc: Guillaume Ranquet <granquet@baylibre.com>
> Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: <stable@vger.kernel.org> # v6.1+
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> UNTESTED
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 2cb47f663756..8fc6eff68e30 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2049,6 +2049,7 @@ static struct edid *mtk_dp_get_edid(struct drm_brid=
ge *bridge,
>          */
>         if (mtk_dp_parse_capabilities(mtk_dp)) {
>                 drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
> +               kfree(new_edid);
>                 new_edid =3D NULL;
>         }
>
> --
> 2.39.2
>

