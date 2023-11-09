Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0068C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqcXIKFoEQFzQFF5vp19Afmm2Yz0+kzeew+fl+6EftQ=; b=I94ztEvyr83yoa99wM8cz1l/mY
	32RVQWmP2YfhUqSdg6dEEWKAcM+FraUZv0yan8GYPWixu5JWrZRUG6lTxg1MQnuRw3GS3IaRdz6SH
	M1l+/ErauTPZI81NtO84hxpONocJrP3rxk1B16CfEk3L9IdlgVUI6KSP1iBdjC58LzJSJCRVgn/Qw
	HT852yZ99XaskfkjxpUmPpo98gFArFNBYRKV11rNUXORj29VEX+v083/Ri7qXuesS87xeSbClJYzS
	ygV0KF7uGjZtQrP3GperBdoVVLDgzP3qNUJQ60t5glglvQkFvUx6zxSg8WBDToUlcY9JJGt8aUOrj
	8bBTWx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11mN-005qKg-2I;
	Thu, 09 Nov 2023 09:56:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11mL-005qJ4-0B;
	Thu, 09 Nov 2023 09:56:50 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BC966607410;
	Thu,  9 Nov 2023 09:56:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699523807;
	bh=c+3XjSeB8HMKNjwLmSS238tYNmxXwbwvveXaB38GSKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=go3xYNfITHl5diEzptRBnlY36ukC5Xflkzmqf4Rm34E3qLVY2WtNf/vOKNouUwT31
	 XWBrSQ3HFLFpCTkEfKxemlErp/XIbe89+zzSptEE9vmLNTaM+WBBarpt5aEbWlRk+c
	 ze4Q3rJqNKIp64aPproN3VBAZDa3aTZ0gvTmJs0MJ/bV3X7EsS8jfE1TJE4kx0aZJ5
	 EY8MEd/69Tqk9dU1LHT09wR/dJIV5qVsx6kq9tXDPl8ndlMkkzOF6Ol9Gj+cIyoYpK
	 zO1V/WbVmt7qG6FA/Po3JhYDoqvYzkPzgW+zFU9aqRGMf7RNsCVNpYnP8szoGJ945k
	 VM/BOEgVaZLhQ==
Message-ID: <6ff3d1e2-020e-4a50-944f-f8a82aea32fb@collabora.com>
Date: Thu, 9 Nov 2023 10:56:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 20/56] media: dvb-frontends: rtl2832: Stop direct
 calls to queue num_buffers field
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Antti Palosaari <crope@iki.fi>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-21-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-21-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_015649_224979_BBA8A4E4 
X-CRM114-Status: GOOD (  14.44  )
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

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Antti Palosaari <crope@iki.fi>
> ---
>   drivers/media/dvb-frontends/rtl2832_sdr.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
> index 02c619e51641..023db6e793f8 100644
> --- a/drivers/media/dvb-frontends/rtl2832_sdr.c
> +++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
> @@ -439,12 +439,13 @@ static int rtl2832_sdr_queue_setup(struct vb2_queue *vq,
>   {
>   	struct rtl2832_sdr_dev *dev = vb2_get_drv_priv(vq);
>   	struct platform_device *pdev = dev->pdev;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev_dbg(&pdev->dev, "nbuffers=%d\n", *nbuffers);
>   
>   	/* Need at least 8 buffers */
> -	if (vq->num_buffers + *nbuffers < 8)
> -		*nbuffers = 8 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 8)
> +		*nbuffers = 8 - q_num_bufs;
>   	*nplanes = 1;
>   	sizes[0] = PAGE_ALIGN(dev->buffersize);
>   	dev_dbg(&pdev->dev, "nbuffers=%d sizes[0]=%d\n", *nbuffers, sizes[0]);


