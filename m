Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35F1C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 22:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W3Zc4lw9OY5mCDTox2UyfPkd23B5LnUVm+szTHb4aA=; b=ksGYHMJEYGw+j19yjQViHYqQHa
	DhX9qruQumpxBoLCooqH5EFX33WvP5E0rFWCYllY5z+LWkTrimVZ0YsfWujMhAs5b8BSYmVk7vj9l
	uuBMxENF2bziYiDhWKPkRckYOwCpCp5S5w0FQFZ1F7EoU++/IfJIs7ymNbWoMOmHv2UrZPLzqYmHX
	vIqooThMYM/URNfbVOtUDrhtPVjQ1k6kBcdbfuwV1qLVDu3Eb2LGHYmFlbdBtQkJkp+tihIeweti+
	0VM7cWHmbbVm27ONAsbh5Epe9iaE2Ut6m/WgcIeSg8f+kN8zQtCC6wdC7hXYlY3I/aEfUwR67aMuW
	+0KO1gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSlHq-005EUR-1H;
	Wed, 24 Jan 2024 21:59:58 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSlHm-005ESG-2m
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jan 2024 21:59:56 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7ba903342c2so341047439f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jan 2024 13:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1706133590; x=1706738390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5W3Zc4lw9OY5mCDTox2UyfPkd23B5LnUVm+szTHb4aA=;
        b=HdQSX6eV6/n/STfwXvp6cx28gBTWfHFuPMNZm6pd0wKXvqz+4KzZYjbB2IG6h+Dbci
         Hl9pDpYvmrbY4qrth2a1CvNvnlDIahB13mKUBnUPsF2mvsdyZ/Qf58L/HW1n7aC3Biov
         x6vEgJbeHa6j+qRyb3kRcn5bFFeOvUM0/3v10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706133590; x=1706738390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5W3Zc4lw9OY5mCDTox2UyfPkd23B5LnUVm+szTHb4aA=;
        b=FutVMRRBRy7e3mTsbGkyDnNZcKyKECEYKQ/nseJot/sjtgQ0LnCkj9tl1XKuttTLrr
         vXNRH4Mpk2RVZPxXmmJknebN2ZemPtmb3Eo0IynsAhOPLGntukspC8bLnqu6wOD43+8E
         32xqN+dXSOWAgnowZwph2uIJho0Cx2rPcDouGodj1umEgrlUsvku5mQMknmEMUGMc32u
         AbxmCYUGF6f/sn1ia9HClG0C6OKadaVsMubaIXpUp1pPV89VzeWN6ERIVxxnJTWemr+P
         VbStYsQFULnHeeaptNsxE0k+irer0ZJrs8Ws3yFMKpx1uDRyuA3StRIGgHX5P4kfJuWZ
         /AsA==
X-Gm-Message-State: AOJu0YyDXkzDoBvNUhJNF8dzYzwpuynK7vXoclZI7X0ALkpSoz2p5djl
	utIebedvC3dLb0CJMaiv4bKQG/UduO2LZk5ufn8y+xn7979p34CWZ54LEvcZ2A==
X-Google-Smtp-Source: AGHT+IFoErDfBnp90Aso6XiHus3HsXdUa1t+JDihc6T5l+sSuJErscvKMaONLo9iiGOiH+hMVMxlSA==
X-Received: by 2002:a6b:e901:0:b0:7ba:8db3:2997 with SMTP id u1-20020a6be901000000b007ba8db32997mr140857iof.6.1706133589792;
        Wed, 24 Jan 2024 13:59:49 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id dq16-20020a0566384d1000b0046e025d9fefsm4228174jab.48.2024.01.24.13.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 13:59:49 -0800 (PST)
Message-ID: <51d07f81-45f4-4772-915f-ed5dac602a40@ieee.org>
Date: Wed, 24 Jan 2024 15:59:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] treewide, serdev: change receive_buf() return type to
 size_t
To: Francesco Dolcini <francesco@dolcini.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Rob Herring <robh@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20240122180551.34429-1-francesco@dolcini.it>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_135954_993478_5EC6AC95 
X-CRM114-Status: GOOD (  28.84  )
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

On 1/22/24 12:05 PM, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">= 0" from serdev_controller_receive_buf(), change its return type from
> ssize_t to size_t.
> 
> The need for this clean-up was noticed while fixing a warning, see
> commit 94d053942544 ("Bluetooth: btnxpuart: fix recv_buf() return value").
> Changing the callback prototype to return an unsigned seems the best way
> to document the API and ensure that is properly used.
> 
> GNSS drivers implementation of serdev receive_buf() callback return
> directly the return value of gnss_insert_raw(). gnss_insert_raw()
> returns a signed int, however this is not an issue since the value
> returned is always positive, because of the kfifo_in() implementation.

Agreed.

> gnss_insert_raw() could be changed to return also an unsigned, however
> this is not implemented here as request by the GNSS maintainer Johan
> Hovold.

I was going to suggest this, and suggest changing the "ret" in
gnss_insert_raw() to return size_t.  But to really do that right
it would include some other changes as well.  Leaving it as an
int as Johan suggests preserves correct behavior.

One minor point below, plus a couple comments affirming that
an int return value is OK because it's always non-negative.

Reviewed-by: Alex Elder <elder@linaro.org>


> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio
> ---
> v1:
>   - https://lore.kernel.org/all/20231214170146.641783-1-francesco@dolcini.it/
> v2:
>   - rebased on 6.8-rc1
>   - add acked-by Jonathan
>   - do not change gnss_insert_raw()
>   - do not change the code style of the gnss code
>   - commit message improvements, explain the reasons for doing only minimal
>     changes on the GNSS part
> ---
>   drivers/bluetooth/btmtkuart.c              |  4 ++--
>   drivers/bluetooth/btnxpuart.c              |  4 ++--
>   drivers/bluetooth/hci_serdev.c             |  4 ++--
>   drivers/gnss/serial.c                      |  2 +-
>   drivers/gnss/sirf.c                        |  2 +-
>   drivers/greybus/gb-beagleplay.c            |  6 +++---
>   drivers/iio/chemical/pms7003.c             |  4 ++--
>   drivers/iio/chemical/scd30_serial.c        |  4 ++--
>   drivers/iio/chemical/sps30_serial.c        |  4 ++--
>   drivers/iio/imu/bno055/bno055_ser_core.c   |  4 ++--
>   drivers/mfd/rave-sp.c                      |  4 ++--
>   drivers/net/ethernet/qualcomm/qca_uart.c   |  2 +-
>   drivers/nfc/pn533/uart.c                   |  4 ++--
>   drivers/nfc/s3fwrn5/uart.c                 |  4 ++--
>   drivers/platform/chrome/cros_ec_uart.c     |  4 ++--
>   drivers/platform/surface/aggregator/core.c |  4 ++--
>   drivers/tty/serdev/serdev-ttyport.c        | 10 ++++------
>   include/linux/serdev.h                     |  8 ++++----
>   sound/drivers/serial-generic.c             |  4 ++--
>   19 files changed, 40 insertions(+), 42 deletions(-)
> 

. . .

> diff --git a/drivers/mfd/rave-sp.c b/drivers/mfd/rave-sp.c
> index 6ff84b2600c5..62a6613fb070 100644
> --- a/drivers/mfd/rave-sp.c
> +++ b/drivers/mfd/rave-sp.c
> @@ -471,8 +471,8 @@ static void rave_sp_receive_frame(struct rave_sp *sp,
>   		rave_sp_receive_reply(sp, data, length);
>   }
>   
> -static ssize_t rave_sp_receive_buf(struct serdev_device *serdev,
> -				   const u8 *buf, size_t size)
> +static size_t rave_sp_receive_buf(struct serdev_device *serdev,
> +				  const u8 *buf, size_t size)
>   {
>   	struct device *dev = &serdev->dev;
>   	struct rave_sp *sp = dev_get_drvdata(dev);

One return path in this function returns (src - buf), which is
*almost* guaranteed to be positive.  The one case it wouldn't
be is if the assignment of end wraps around, and that's not
checked.

I think it's fine, but... That seems theoretically possible.


> diff --git a/drivers/net/ethernet/qualcomm/qca_uart.c b/drivers/net/ethernet/qualcomm/qca_uart.c
> index 223321897b96..20f50bde82ac 100644

. . .

> diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
> index 9591a28bc38a..ba550eaa06fc 100644
> --- a/drivers/platform/surface/aggregator/core.c
> +++ b/drivers/platform/surface/aggregator/core.c
> @@ -227,8 +227,8 @@ EXPORT_SYMBOL_GPL(ssam_client_bind);
>   
>   /* -- Glue layer (serdev_device -> ssam_controller). ------------------------ */
>   
> -static ssize_t ssam_receive_buf(struct serdev_device *dev, const u8 *buf,
> -				size_t n)
> +static size_t ssam_receive_buf(struct serdev_device *dev, const u8 *buf,
> +			       size_t n)
>   {
>   	struct ssam_controller *ctrl;
>   	int ret;

Here you the return value will be positive despite ret being
a signed int.  So like the GNSS case, this is OK.

> diff --git a/drivers/tty/serdev/serdev-ttyport.c b/drivers/tty/serdev/serdev-ttyport.c
> index e94e090cf0a1..3d7ae7fa5018 100644

. . .

> diff --git a/sound/drivers/serial-generic.c b/sound/drivers/serial-generic.c
> index d6e5aafd697c..36409a56c675 100644
> --- a/sound/drivers/serial-generic.c
> +++ b/sound/drivers/serial-generic.c
> @@ -100,8 +100,8 @@ static void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
>   	snd_serial_generic_tx_wakeup(drvdata);
>   }
>   
> -static ssize_t snd_serial_generic_receive_buf(struct serdev_device *serdev,
> -					      const u8 *buf, size_t count)
> +static size_t snd_serial_generic_receive_buf(struct serdev_device *serdev,
> +					     const u8 *buf, size_t count)
>   {
>   	int ret;
>   	struct snd_serial_generic *drvdata = serdev_device_get_drvdata(serdev);

Same thing here.


