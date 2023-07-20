Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82874EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Aqo/gOfqS4N7dGQz+LUmrfdtT5oEda+VCbRxOBGots=; b=nzbDf8zQ038slwJEyw96oNoKjh
	/VaSHJt9wZUC6BwMDm0r9utl56+yFtdhvO+bgNEgnyQsOqvHxNadQy31WEnJOO30ArcNywpFnR9OG
	5qo/GC2eEaGGyOPZAxJdbJhalRNyeEKa/4yKNVxzCwkF4r3ZWVxvFKkAGQSBobb0vDjfmqGo2d6ws
	X5GNp6lvUNTLberbEpoIz1ht51zDFvLUn3bXc6IojxMZ9hM+nhQBYmHimGDBDgb3+01ipGuS+98wn
	iJemTSWwj3IRjikwCa3qRFriVaMiN0tRkU5TpZkocBwBq3k6YgbQldYtdp+FeCcgjYH3vZ7b+lelM
	//IcEI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZTY-00C4n1-1X;
	Thu, 20 Jul 2023 19:38:12 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZTW-00C4lT-0b
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 19:38:11 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4814bea10e0so507327e0c.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1689881887; x=1690486687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Aqo/gOfqS4N7dGQz+LUmrfdtT5oEda+VCbRxOBGots=;
        b=ZPaTGFbmPqDHsbzbKNAF//LB+sGL+e8ErB9u8GPN/U8qhUhBpWU5DIlQwFlaDosZe/
         p1YWZfL3b3cBv1nolfN1PNi4DeR4PLwvVzZ8fAj+6nw3DJAb24Wqwn/VwUKntTp3zLV/
         9PHE6PTDFxEEuWsRiOmcnrinF/tMUX8t8I6vFEk32+8BM+uucBbqMGvACmUVHREvXSQ2
         HvmI9/5EXLfhUHjBHEsGfUVIE9qZApojxEI/84CjLmIDw6RrJ11Nk64mtLaXw3/LKsKD
         hTMcKlTEGHrqIcfyBbirCeTGt5dsWczFkP9j9uFUhQYSDLaN147PSimQJiTkAVD0FgM0
         +qrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881887; x=1690486687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Aqo/gOfqS4N7dGQz+LUmrfdtT5oEda+VCbRxOBGots=;
        b=JA7wzMmRmq2uyKH8/W1WrYTUavl2N3ZeeEfIlj+tmkXRYTjpi+IGbd95fVvmwgEgAo
         l90uvYUmTtb8WW4cNrUWl2T/akexuNL6ZbeGmjjBUlwOW1zqwaOSBkuReDzMvPzI0Gdk
         bLg72i2kSKcwi9x03NdS16ZnhIzOecVAB3p1kleFElopTpC1twPRrOhZNV25ufB74jEY
         2fWu0pN6JoKzDFDZhnXvARY7hKJ6I+i7OdI3hL5ku9nfJ3Mz8+GtYM2VDmDls70TxurP
         AqBe4zLqLIJvHqzirJalXSd2nhMIjVb+kKE9Y2GK/zUPGzPgzcNy3jwzY4qn5xMhnek+
         Olwg==
X-Gm-Message-State: ABy/qLYw1sq8PpqEZKcYJlVX8/3EftQ1GPrlM+KO+WNgk6Z8UCQf80v1
	0hwZHqSi6DDPoKYz/qBI1N4o0Q==
X-Google-Smtp-Source: APBJJlG58gxa9sCnD8UgtVvUAplhdSAm5YXTJem1cUMpfF3izF2KWjtxgd9RRD0H+1CykZ3PfvN1XA==
X-Received: by 2002:a67:f243:0:b0:445:3bf:9387 with SMTP id y3-20020a67f243000000b0044503bf9387mr12927466vsm.4.1689881886847;
        Thu, 20 Jul 2023 12:38:06 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:83d4::7a9])
        by smtp.gmail.com with ESMTPSA id r22-20020a0cb296000000b0063600a119fcsm687199qve.37.2023.07.20.12.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 12:38:06 -0700 (PDT)
Message-ID: <05048ff687ca5a030bbb218570f13e2165f623d8.camel@ndufresne.ca>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Fix potential crash in
 mtk_vcodec_dbgfs_remove()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dan Carpenter <dan.carpenter@linaro.org>, Yunfei Dong
	 <yunfei.dong@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Date: Thu, 20 Jul 2023 15:38:05 -0400
In-Reply-To: <d4fffbaa-f01d-4e2e-9b1b-45d996236642@moroto.mountain>
References: <d4fffbaa-f01d-4e2e-9b1b-45d996236642@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_123810_223798_417DF14F 
X-CRM114-Status: GOOD (  16.89  )
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

Le mercredi 14 juin 2023 =C3=A0 16:07 +0300, Dan Carpenter a =C3=A9crit=C2=
=A0:
> The list iterator "dbgfs_inst" is always non-NULL.  This means that the
> test for NULL inside the loop is unnecessary and it also means that the
> test for NULL outside the loop will not work.  If we do not find the item
> on the list with the correct the ctx_id then it will free invalid memory
> leading to a crash.
>=20
> Fixes: cd403a6a0419 ("media: mediatek: vcodec: Add a debugfs file to get =
different useful information")

Clearly better.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  .../media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/=
drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> index 2151c3967684..2ebf68d33d57 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
> @@ -166,16 +166,13 @@ void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev =
*vcodec_dev, int ctx_id)
>  	struct mtk_vcodec_dbgfs_inst *dbgfs_inst;
> =20
>  	list_for_each_entry(dbgfs_inst, &vcodec_dev->dbgfs.dbgfs_head, node) {
> -		if (dbgfs_inst && dbgfs_inst->inst_id =3D=3D ctx_id) {
> +		if (dbgfs_inst->inst_id =3D=3D ctx_id) {
>  			vcodec_dev->dbgfs.inst_count--;
> -			break;
> +			list_del(&dbgfs_inst->node);
> +			kfree(dbgfs_inst);
> +			return;
>  		}
>  	}
> -
> -	if (dbgfs_inst) {
> -		list_del(&dbgfs_inst->node);
> -		kfree(dbgfs_inst);
> -	}
>  }
>  EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_remove);
> =20


