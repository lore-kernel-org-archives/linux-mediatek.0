Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613E7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkIbskpimKR2/9fzrAWSyQLoVJL5uXULRH9TwqZEGxk=; b=hVfFSHN+ThGEto
	JeR1DPexXf63F2HZOPoTobHD/4E5vokmFQS8x/bculqP6AR+euEOF4ctUMTFn+TXqNyoIChQDxPAB
	k6/bTPjPRdmH8trVF2+bIUF9AyLKi7JvUzkRKEY03Gt+srUjy5g2270kBGTnT55cFJrTAqs/DsjM1
	x6/woG0PqHpGYvOACy5M+r0/khFXVkEtFZ/LlfNVe4NDvf03NW/WP1fPF+u1lqLGVkYELUnMpQgVC
	JLkHy7v6H0BaGKYPmXzYfkTLjbeAZCvzWNeZH0kreEqkQt8LYHIDSABo/08USeuY4ZUcy8AME/MFi
	8I55rOH64YAnt2c0RYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZhkx-0005Zz-3C; Wed, 30 Mar 2022 23:29:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZhkk-0005Vv-AY; Wed, 30 Mar 2022 23:29:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id EBAFA1F46057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648682962;
 bh=2Aw59J1GMFNx5W0R3ALTAtEuLxi4M5bwfjRhWuhb7CI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TVSCUvG6BhBxf3w4gp8U+feiK3EkK70kObxUTlaxb2xQVluRaXmi/y/hLQ339geZ1
 QqYcTFAAsY/lVTIL/sdmD1W3y0Mp3zj4+VfKvtij9HBU8061fpkCFIixRD+QjAQu4S
 N1KDDEdg44pTf73esJyoqXXepcu0i/anBeuYsrYgXVZ6o844Dy6zNXTx+RwmQiAcTS
 DJi4iMlzN4gIoOtBvTtStVOOrmiFXwNWu6efyM23eECPNumpcreR87W+2bJs8ks4rd
 4X9m+85LRJpClzB44uaiuFwNFCbmEBsU2oRblsgP0IscHw5pl2i1zILhjheOSfNMCe
 OwxccEyp5um6g==
Date: Wed, 30 Mar 2022 19:29:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] soc: mediatek: pwrap: Use readx_poll_timeout()
 instead of custom function
Message-ID: <20220330232917.uu7337hv6dqh34xv@notapiano>
References: <20220329152245.124341-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220329152245.124341-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_162926_536974_AD9F4B7B 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Angelo,

On Tue, Mar 29, 2022 at 05:22:43PM +0200, AngeloGioacchino Del Regno wrote:
> @@ -1303,7 +1297,8 @@ static int pwrap_read32(struct pmic_wrapper *wrp, u=
32 adr, u32 *rdata)
>  		pwrap_writel(wrp, ((msb << 30) | (adr << 16)),
>  			     PWRAP_WACS2_CMD);
>  =

> -		ret =3D pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
> +		ret =3D readx_poll_timeout(pwrap_is_fsm_idle, wrp, tmp, tmp,

Should be pwrap_is_fsm_vldclr.

Thanks,
N=EDcolas

> +					 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
>  		if (ret)
>  			return ret;
>  =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
