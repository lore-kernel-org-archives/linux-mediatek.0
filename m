Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041C2C35274
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmULj2wuWMyxKOnASA3YgXyVd67CHaYz3SXTcpzEcRQ=; b=2WfqQq7wwibY0vD1aAtPodKWxe
	lrq37y4ZOMdY4p0tDy3Q3kgoLqjP7RXKczXFXY6x0scHMcizYEwCw5ewPEqfC7AzazN5GxIgg62Kr
	crHFpSC5dDtRj8WzzPAAFdYDqysmPayRUGyCj8r0y7YwzWgNMxMkXZsnU8YAa2Lrb5TDrw9niM/cg
	A6VbDR67TYeRuChu1BdGByLgi6PIrkH+rIkFQCwAEQCp61aMmJb+6czUrrWt+u1Erz1ODSCfByn8L
	MBHkhCqe9T+4Dk/klFAbnMbaK87AAEFJTJm+IW/oYN/FF5YNufUZgD+lLESVnos/WYtsjAEU2XvcK
	3RLOxTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8Mt-003OYI-3C;
	Fri, 15 Dec 2023 13:36:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8Mq-003OXO-0f;
	Fri, 15 Dec 2023 13:36:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 33B77B82919;
	Fri, 15 Dec 2023 13:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C1FC433C8;
	Fri, 15 Dec 2023 13:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702647397;
	bh=subHRTKMwmMr0u+Qf2RNzCSmCaDcHEzfdzarxtD8z/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tud6o92I0jvVdrQ08FGKjdwhC80aUmMEmOH08YZYA7JMT2nqm5k4KKn6vBcUbxJjP
	 VmpYMMCDc/VLLrETSfv2FpWhSRRti1nAMypE+MNbCK/UR8mamGdHErStfqAZXkgaKC
	 qBv5XaksNxAOX6jipIaq1IbmkhKayDCxE6KAcyXAv3QSDdh51sfDh1IcgQiy2tAttY
	 WXgcpMVNiCj3RxJHmQEXR/hTQbtqjFGwwlG5b3BHtjTFBOyuVjwGH1S6sM6UqultwY
	 zXpxq3Nw1vqu3UFHQsvlUnunnipIRRlxvKbgttSUVa1ufg21iJkPpOgtx6sbhdvg9A
	 kjq2BdKV10YQg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rE8Mh-0008LA-2Z;
	Fri, 15 Dec 2023 14:36:31 +0100
Date: Fri, 15 Dec 2023 14:36:31 +0100
From: Johan Hovold <johan@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-iio@vger.kernel.org, netdev@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1] treewide, serdev: change receive_buf() return type to
 size_t
Message-ID: <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214170146.641783-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_053640_414670_9347CA94 
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

On Thu, Dec 14, 2023 at 06:01:46PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">= 0" from serdev_controller_receive_buf(), change its return type from
> ssize_t to size_t.
> 
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gnss/core.c                        |  6 +++---
>  drivers/gnss/serial.c                      |  4 ++--
>  drivers/gnss/sirf.c                        |  6 +++---

> diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
> index 48f2ee0f78c4..9b8a0605ec76 100644
> --- a/drivers/gnss/core.c
> +++ b/drivers/gnss/core.c
> @@ -317,10 +317,10 @@ EXPORT_SYMBOL_GPL(gnss_deregister_device);
>   *
>   * Must not be called for a closed device.
>   */
> -int gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> -				size_t count)
> +size_t gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> +		       size_t count)
>  {
> -	int ret;
> +	size_t ret;
>  
>  	ret = kfifo_in(&gdev->read_fifo, buf, count);
>  

Why are you changing this function? This is part of the GNSS interface
and has nothing to do with the rest of this patch.

Greg, please drop this one again until this has been resolved.

Johan

