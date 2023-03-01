Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF9CC64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVm2ijZ3wY3vwKPabNU+PBrwbUTBJBfFnL9ZZ4aBrfk=; b=h7M8jMAV5mqRCuTkYtgY0potOB
	m+VqsT+jxtucVBpJgWuf9H6QeGAxC3zj3Kb7w7Jr4xz8HYFGe2FPjoJlkmz+9RSfSilHi8DSW436N
	MF2ckDdA3g1JM54f9KLaKSaQoajjFlqaaY6InS4J9PuNKZFfcvpxRly0Fn5huqbzjOI/zZLIqr1uk
	dXZBZEzGygo+L2F51SRPV9ms671l4sIg2E5pRs74bMDC7luMns0LR0SLktZF9K2Dzfe/gQ2JShQ/W
	0GIRtxvRs1bYEMJODOnQlJiBAMinfQnGv6KvJ4Ks5ucmbqFlvnJSsropyzBSCBjqzTSK4d6KsGjEL
	1hdhWroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJ9I-00Fd7p-AR; Wed, 01 Mar 2023 09:53:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJ9E-00Fd7B-ED
	for linux-mediatek@lists.infradead.org; Wed, 01 Mar 2023 09:53:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so11382322wmb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Mar 2023 01:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1677664395;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVm2ijZ3wY3vwKPabNU+PBrwbUTBJBfFnL9ZZ4aBrfk=;
        b=4Fu+yqsl6ks1J0Fa92PUm/F/nDyDK9SWtP1VAUdZUy16GTC0Ap4+Lo4bksw5qTFdp/
         XsNyAQmjAl8OLy/XCzbzMGljtzJA5RtohMxMQbVwEHdOo6+DFLEe9dlfHUNM71Ex/476
         /CSZJ4bwXA6nhA+7i+fKCSxQFIJ9286JI0RWsHzb1KceA2OtY7h8MFa2v5g2xZhem/H1
         9QgNF/SXXxd3XgGRvGy+31KiyGPPaRyQ+yZZeNEDl/nqPYodHrmu1C34T0/Qnkg5yN0N
         DJ1KI1d6YUGaeQNTKcaGnfu59z9aqHlg0CKtgvHK8CjciShYLbXxTcuZeT7AjGXwzwLh
         +3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677664395;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVm2ijZ3wY3vwKPabNU+PBrwbUTBJBfFnL9ZZ4aBrfk=;
        b=P9zxoWpNP/fR/s0EEQOaufLUodLANtb/9Q+QjbXJq1k3tdDVRtNv/e61LSb1ucjBMe
         /ICLA5lC6Gui5IfAUhZk1jsHow0WjYC8yDYM1hherfenM9RFaPSj4XIgWMntAc5jbj5/
         8Ym+JjUfAWwysaOnwBQArtr46qSCbS0FeTXdD+bP2F1AS27jg9LsQwG7b9oKilHecTEY
         KMLgMc0/R1PPTKIkmIaJ+wenQIFwOy25MkX76D5EtpyenaBHYnBE0LsaAYMZic0MHiOM
         KTMSIABDpEAEmf/G3dJGo1FrvN5ULeJyzWDY8nBFEdv/0IxqJ5mCae1QhRHHqbaTtYDW
         DY8w==
X-Gm-Message-State: AO0yUKVFuGma5YSQ/SfhkzcscVzlGSJw1LcaR9ywTpvpso5OptzUP9fW
	q+/xQ/x+5Yz+UBa2bSH7JRvnDA==
X-Google-Smtp-Source: AK7set8CPzlU6u3WbrG+eMk2du/oZA+z3qcruE13b+PzUec0tOqk2HfBYdpjeyzDGptxwgKfIZvhuA==
X-Received: by 2002:a05:600c:3495:b0:3de:a525:1d05 with SMTP id a21-20020a05600c349500b003dea5251d05mr4728331wmq.8.1677664395119;
        Wed, 01 Mar 2023 01:53:15 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c020d00b003dc1d668866sm18765830wmi.10.2023.03.01.01.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 01:53:14 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dan Carpenter <error27@gmail.com>, Julien STEPHAN <jstephan@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
In-Reply-To: <Y/yBC4yxTs+Po0TG@kili>
References: <Y/yBC4yxTs+Po0TG@kili>
Date: Wed, 01 Mar 2023 10:53:13 +0100
Message-ID: <87r0u83iie.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015320_734236_B7087EB1 
X-CRM114-Status: GOOD (  18.03  )
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

Dear Dan,

Thank you for your patch.

On lun., f=C3=A9vr. 27, 2023 at 13:08, Dan Carpenter <error27@gmail.com> wr=
ote:

> There is a type bug because the return statement:
>
> 	return ret < 0 ? ret : recv_cnt;
>
> will not return negatives on 64bit systems.  The problem is that the
> function returns ssize_t types, while "ret" is int and "recv_cnt" is a
> u32.  The negative values are type promoted to u32 and returned as
> positive values instead of negative error codes.
>
> Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during vide=
o mode")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 7d5250351193..8e99981ca0e1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1016,12 +1016,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_=
dsi_host *host,
>  				     const struct mipi_dsi_msg *msg)
>  {
>  	struct mtk_dsi *dsi =3D host_to_dsi(host);
> -	u32 recv_cnt, i;
> +	ssize_t recv_cnt;
>  	u8 read_data[16];
>  	void *src_addr;
>  	u8 irq_flag =3D CMD_DONE_INT_FLAG;
>  	u32 dsi_mode;
> -	int ret;
> +	int ret, i;
>=20=20
>  	dsi_mode =3D readl(dsi->regs + DSI_MODE_CTRL);
>  	if (dsi_mode & MODE) {
> @@ -1070,7 +1070,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_ds=
i_host *host,
>  	if (recv_cnt)
>  		memcpy(msg->rx_buf, src_addr, recv_cnt);
>=20=20
> -	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
> +	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
>  		 recv_cnt, *((u8 *)(msg->tx_buf)));
>=20=20
>  restore_dsi_mode:
> --=20
> 2.39.1

