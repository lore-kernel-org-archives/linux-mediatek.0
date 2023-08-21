Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2B8EE4993
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0TRjvF00PWIS17fThXhey+mQPnIjutUpfP8XoFnkJE=; b=R8dO21AQG4sQ/TDbIlNy7JG3Wh
	bHYxhqg4ul/NEWc8hUwOXn7JXA7hqjsQJkZWN6cpAaIB6/ppQKVjnvQFkNQJk+JfHt2ggfJ0aK5Uz
	uC8FRHSLLHP8V29fvswMCvcQRSp4ljORI0RHxDE9KDNTjZ3nNTJqhpoET2eVgm6CiEQJ3coZBLSkk
	4jW7EE3UhDrxTc+XgFg8swPm8Oimz28PMC65U4ED0lcRzSGRehuKT2BmWrgiLnFG598MkU/eCNfUI
	lNj3bIjdSBQWKXlhDpjhJPiQSk2LSEsrHtcObcZf73kXoNHff3F1Wshm4TctkUuCXuR04JXqGYTbG
	j1zWFL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY6cZ-00EFld-3D;
	Mon, 21 Aug 2023 15:15:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY6cX-00EFjz-0V;
	Mon, 21 Aug 2023 15:15:10 +0000
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:bae9::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B121766071A2;
	Mon, 21 Aug 2023 16:15:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692630903;
	bh=yOP/crzuh324Aakcxxz+eZDVYJZgYrNZoRWG4V5bccQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kxw8+vzPsdiXctTFi0QYl6nsI1jma5ed2T2gzHXgiSoGxahsSOn09uc1WKF59ENtg
	 pdDyTrzmhDgvkXXCErA+3Jwn86Nex+xNS2n4BjX1ONWyIAm5q4DobU9ZkAuIiy2OCi
	 YmfV6/xD1mNcumpRFapH8wU06O/3Unz9CasZn25bJXTPMPm3oCVYQVY5mKLP3M62db
	 yqY0IWo90gmqNqgTlnS4smnKs3B2V2FPWLDYuSSMBmW9CYztsxwzIIdhxyS2y5GLk/
	 mX5E0l25cKdFYtBux03+ubQztI3f89DPz/GLZ8GIXTIAyVMgWQuW8uJjKNFF12Sz4I
	 Za9Zqx9pyTPNg==
Message-ID: <f21dfae7466a441fbe175db62ad3c9aa4eff3f0c.camel@collabora.com>
Subject: Re: [PATCH][next] media: mediatek: vcodec: fix spelling mistake
 "resonable" -> "reasonable"
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Colin Ian King <colin.i.king@gmail.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 21 Aug 2023 11:14:52 -0400
In-Reply-To: <20230815121446.742742-1-colin.i.king@gmail.com>
References: <20230815121446.742742-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_081509_340387_C9E4C421 
X-CRM114-Status: GOOD (  11.54  )
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

Le mardi 15 ao=C3=BBt 2023 =C3=A0 13:14 +0100, Colin Ian King a =C3=A9crit=
=C2=A0:
> There are a couple of spelling mistakes in pr_err error messages. Fix the=
m.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c   | 2 +-
>  .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> index 9e744d07a1e8..6bbe55de6ce9 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> @@ -68,7 +68,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv=
, enum mtk_vcodec_fw_use
> =20
>  		plat_dev =3D dec_dev->plat_dev;
>  	} else {
> -		pr_err("Invalid fw_use %d (use a resonable fw id here)\n", fw_use);
> +		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
>  		return ERR_PTR(-EINVAL);
>  	}
> =20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> index 5e03b0886559..9f6e4b59455d 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> @@ -109,7 +109,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *pr=
iv, enum mtk_vcodec_fw_use
>  		plat_dev =3D dec_dev->plat_dev;
>  		rst_id =3D VPU_RST_DEC;
>  	} else {
> -		pr_err("Invalid fw_use %d (use a resonable fw id here)\n", fw_use);
> +		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
>  		return ERR_PTR(-EINVAL);
>  	}
> =20


