Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43124C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DO3m2iSYrB9egTqY9X7+1nPCAo8K87z629ag4J+iPrM=; b=Z07PT3+nZgsOMhaXWce24xf3I9
	nKtTp3et62N259G1KXTvSjqo2Fm7iLEQfj/vlwUOjYE6tXePTz+vZEQ4Uh43oZTPefdaW8sloA/Dl
	JiWDjh8eag4dRNl4KBf7fOSslwZ5liW+zGEVH6Y2r4ReDSFIACpkwNpYv5wsLIG4FD3L4Th6D2tEF
	/R/go8zN7V+ZzgNchcYXw7Xbp4JdErSvALS7ybt5pEhJHNa3mvi6WkDJdCGEnlDSOImKCr1A09Tsb
	j05tn+rWYOkGq32gysU2EluLPVFslRbqc7pcbzCJ2h8fdGBUA512UXmXLs7bcPN+t2XLFFXEjSPIx
	Ofi78+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwTXY-00000009uga-3iYC;
	Mon, 15 Apr 2024 21:07:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwTXV-00000009ueo-1F7D;
	Mon, 15 Apr 2024 21:06:58 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F57F497;
	Mon, 15 Apr 2024 23:06:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713215167;
	bh=QK/YnNEsRDQzA+VI9ZfCIug3P5VhevsltSl+SmjeDe0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rdukYCQh9mMFKAPdTqd4jo4lB4a4B7xptpHd357YCY6nsrtHDE8p4O2e61Yb+mMxi
	 yKJPDLBT5H6E9wcVtgSM3TW7Vas5B4YrUJkgnLXrP6kJ0tc0rBjudUOeDKylS3L9Le
	 RHF8woqIolcFMRosZ1uhKhaSSd4+78XmA8SkQZdg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org> <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
Subject: Re: [PATCH 04/35] media: uvcvideo: Use max() macro
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
To: Abylay Ospan <aospan@netup.ru>, Alain Volmat <alain.volmat@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bjorn Andersson <andersson@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Dmitry Osipenko <digetx@gmail.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, Hugues Fruchet <hugues.fruchet@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Martin Tuma <martin.tuma@digiteqautomotive.com>, Matthi
 as Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pavel Machek <pavel@ucw.cz>, Ricardo Ribalda <ribalda@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Samuel Holland <samuel@sholland.org>, Sergey Kozlov <serjk@netup.ru>, Sowjanya Komatineni <skomatineni@nvidia.com>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Mon, 15 Apr 2024 22:06:49 +0100
Message-ID: <171321520986.2333277.5902882675169324919@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_140657_496436_57F9C7AF 
X-CRM114-Status: GOOD (  12.22  )
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

Quoting Ricardo Ribalda (2024-04-15 20:34:21)
> It makes the code slightly more clear and makes cocci incredibly happy:
>=20
> drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index a4a987913430..4b685f883e4d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -836,7 +836,7 @@ static s32 uvc_get_le_value(struct uvc_control_mappin=
g *mapping,
>         while (1) {
>                 u8 byte =3D *data & mask;
>                 value |=3D offset > 0 ? (byte >> offset) : (byte << (-off=
set));
> -               bits -=3D 8 - (offset > 0 ? offset : 0);
> +               bits -=3D 8 - max(offset, 0);

This looks semantically the same to me so:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>                 if (bits <=3D 0)
>                         break;
> =20
>=20
> --=20
> 2.44.0.683.g7961c838ac-goog
>

