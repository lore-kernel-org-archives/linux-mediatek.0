Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF86C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCqX5B+zhrDKpuRs62rqJnb0R5l0ogRH2YoLWX5OaQA=; b=2KDr+HUU6y4IFcJ/0l6dKNu5Wx
	nFzV+ROT7SRoX+j6O7pFJw8bw/aJW9ebZUx5VZz6pf5cArZCwuPUcywH7QU05C9EbVpmU+vKutaad
	tqQfMFSIY+fgTmJSB+NUQiIuH0lQpvxHRfEOLIAKZOpucKPIch96koUsxxaA4xV9TQykXU0KIPTI9
	99PpSolobxWIG+QouXjRCeXiFKI1LXCaOsEk8Kw960htpaYW3WqJ8sxFN1+h/CsmS95XYifscMcbD
	hqAUwNlMLmM4TNbCDT8Z4NsmFg6LYsnzHay1X77lF1P+l3Z65tA74Zy8ASq/2kEalJlBtIW+lgc1V
	oMX51SmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZRl-00C4aq-2d;
	Thu, 20 Jul 2023 19:36:21 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZRi-00C4Zi-1M
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 19:36:19 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a337ddff16so848596b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 12:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1689881775; x=1690486575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fCqX5B+zhrDKpuRs62rqJnb0R5l0ogRH2YoLWX5OaQA=;
        b=gBvnOr0JgrI4Dpx6IeCG+XoztX5r7UPzUiCZayttjCeC30JvGQP/fnrsVY+yPQC7Xx
         66P/cPQ15cxNQAVLUu9GCJF04177/8/aqMo3TYFW4ZE+bCa6ymRHaBnjK0oLSEVvtVFR
         55K9fJWVvnLDmnQae84RYQ0KGoAGdziG2cMTs+z/rkV4Up++17DfbpKDznFvucJkqBbj
         xfumbcznFXLAPm7PUG7DrPO6vYoe8ZhwjPguIS7tG4Yul9w0+JlYzOf55ooXM7lOfcpN
         X1hwb4vQtWs61YLpxPLc0YbYMHdVPnjoE+7aQ1mCUQmXCIl7j0qctLSIWwsTeae1j2Kc
         xJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881775; x=1690486575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCqX5B+zhrDKpuRs62rqJnb0R5l0ogRH2YoLWX5OaQA=;
        b=Q6K1cVlG2m7dwQ1Kkl6qmXRGpEnDfPmSJ0tyTDNmhpt6877P0eGA52Tg6TuJly/p5E
         /asOdcgPMdcONBnV7JJ4GOaxkRqRkpiS+2b23Y25VXe4wnF8l68JGoa4ifHrl/sAAOl1
         3qJO4HDeaK1zklnxZAB/ZAURD0DDYcsLhIzd8lhjRAB47xF35fkfAYdIOha5D1Fm7B5U
         hmfGqrwI5wDWdhRyLUVvkFDmjPXyy55xKKpmKAW869hqPhoGewaGjDeis81BD70FErnH
         YPQilW3r34Q4OlFX8iA7DE88Lf6/uQq204S0vbk/NIexbkOvVvC/Fn7v0Mq1MUmZk3OS
         wg2Q==
X-Gm-Message-State: ABy/qLZHc532h2KSrAWPiKWIw9heihTIf1zchsABUBsBVb3Ae/CdVqOR
	ZdOAGd7rrucE/jc5hGzo/Sawgw==
X-Google-Smtp-Source: APBJJlH8IvwexnwlfEPCulJnc+7Fldt5647O/XARhg5vn5qnzYg42szoNWOVisXdIJl623o51CAajQ==
X-Received: by 2002:a05:6808:1394:b0:3a3:ed19:8a25 with SMTP id c20-20020a056808139400b003a3ed198a25mr521806oiw.3.1689881775665;
        Thu, 20 Jul 2023 12:36:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:83d4::7a9])
        by smtp.gmail.com with ESMTPSA id i26-20020ac860da000000b00403efa1c143sm651001qtm.38.2023.07.20.12.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 12:36:15 -0700 (PDT)
Message-ID: <694dcc89ec4ff01ff240a1b924dac98fc1b64ac0.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: fix potential double free
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
Date: Thu, 20 Jul 2023 15:36:14 -0400
In-Reply-To: <ca491aaa-cfc4-4a84-b7fc-b64f3adc6550@moroto.mountain>
References: <ca491aaa-cfc4-4a84-b7fc-b64f3adc6550@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_123618_698123_69D8C804 
X-CRM114-Status: GOOD (  18.59  )
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

Hi,

Just a reminder to Yunfei that this change was originally addressed to him,=
 and
a review was to be expected. Over a month is a bit too long for fixes.

Le mercredi 14 juin 2023 =C3=A0 16:05 +0300, Dan Carpenter a =C3=A9crit=C2=
=A0:
> The "lat_buf->private_data" needs to be set to NULL to prevent a
> double free.  How this would happen is if vdec_msg_queue_init() failed
> twice in a row and on the second time it failed earlier than on the
> first time.
>=20
> The vdec_msg_queue_init() function has a loop which does:
> 	for (i =3D 0; i < NUM_BUFFER_COUNT; i++) {
>=20
> Each iteration initializes one element in the msg_queue->lat_buf[] array
> and then the clean up function vdec_msg_queue_deinit() frees each
> element of the msg_queue->lat_buf[] array.  This clean up code relies
> on the assumption that every element is either initialized or zeroed.
> Leaving a freed pointer which is non-zero breaks the assumption.
>=20
> Fixes: b199fe46f35c ("media: mtk-vcodec: Add msg queue feature for lat an=
d core architecture")

Unbalanced calls to deinit/init would be unfortunate, but I like keeping it=
 safe
and aligned with the fact everything is clears to 0/null otherwise.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/dr=
ivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> index f555341ae708..92ac82eb444e 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> @@ -231,6 +231,7 @@ void vdec_msg_queue_deinit(struct vdec_msg_queue *msg=
_queue,
>  			mtk_vcodec_mem_free(ctx, mem);
> =20
>  		kfree(lat_buf->private_data);
> +		lat_buf->private_data =3D NULL;
>  	}
> =20
>  	cancel_work_sync(&msg_queue->core_work);


