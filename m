Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA81AC46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 18:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoLlXQHqTK7HqBtusjTDNT+WkwnobdwPWq0TIrWK0gc=; b=jZPrPJbdyg250qnozyCDJJSsTc
	oPhq3AzMYPm5edFOKEA9BrnqXcpYlF1XhIBStFhveblNo3x2a/turIXkNkF/s+vjtN/4WeiaCBjBh
	Q2c2M59drXkLmN1MXw6507okhKyiBggNqIzN4N6C0YfpewZxUfGorpsW9XjkVmQscH50DW8Sr/T5/
	Liie3VoYRi5ljzfi9+2hBVePAxxV64711T0YEw6Cr1FTUfn2Rg1imGwS/0m3ODkbfPTOoM8jMXE34
	3/kzrwCyWmIAXvcjw4CyaqzmBjB55zRnV6WqJwQkKD3/D1obndG5gtvixY8nc2AVzUdM+3Zp9XjND
	iiU7/u7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiDd-004jtG-1K;
	Wed, 24 Jan 2024 18:43:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiDZ-004jrn-2g;
	Wed, 24 Jan 2024 18:43:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3367a304091so6094607f8f.3;
        Wed, 24 Jan 2024 10:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706121799; x=1706726599; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PoLlXQHqTK7HqBtusjTDNT+WkwnobdwPWq0TIrWK0gc=;
        b=iVCSx4nHdrR/VY41g/H9FbratYJbx84RIpD6gqqIMyPUOTrxKnUdPyrmAfi3HiPwHJ
         iX+tEDd3S5RWfhSsTwUlt49hbr3BkggZfDEdnsUPKL833vH8zqhZ4yFPeWLu1UfAVFY/
         ZtcUejb6Av9Blc4SC/qgqrW6Chrq4hDMS8e0EU5X+THcOK81R5boiA9ZAz19Of9Ypw/P
         W/hEt1lvxPO6OZX0xzeQ3GYAwL9KNA6MlN92Nu7fewNtGBirVrWq0SuinL53pz4W02dF
         nxCb08PZ1WbjhNo/hf+YDnJa1rvWYSQG3op7TTOT5Y5E1z68dXDHX6pjKFgxCWHqssjf
         aDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706121799; x=1706726599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PoLlXQHqTK7HqBtusjTDNT+WkwnobdwPWq0TIrWK0gc=;
        b=Zvy0fezhiBRk7CXlYumk1tkIcaUOAB/3Yo9E+lBd1P8oYNJNpKve9AVKhlRL8Makk4
         DuHoEH/r4yt4dcRB7Fm5vbqeR9Mra9SlHOrnT8kzj6QfR+vuy8m40eEA9gzg1KQDsIlc
         PcbhovC1Y0IhTA/XzKZmBYjysuN/Gdk8BTBq7DO0t8FOSNM45/p5IRQm6mmpVU/MI2Nz
         0L98RTowcJSmpJG7fyAC3NrqRtQ8oHq6CtlqjYAibazoqA/qvn/ebUUALXU//3idYkQ2
         mZa5U+1j/+EvpDef30rKaR6GOdtAky4aJ0w6yVP9uilP+E7gvBbb9I2lnGCDJTbuAzj5
         Y1eg==
X-Gm-Message-State: AOJu0Yxgrb9o0ZI/8g6zJ32s56P2S3Wj43izvhbAqe6TzLNi4WUdvF4n
	LD0WH+cFagVjLrkEm+Akk4oP1/1OeQsl4wYP6+1EMiKLOiXV4kIf
X-Google-Smtp-Source: AGHT+IFlIErV8dEFz/9T1alFM7lc2QOSheHtmLZZugwnSKdWDuepLtIvkZQzTUvPFP5qATBFLxG4Qw==
X-Received: by 2002:a05:600c:198f:b0:40e:ad0d:75 with SMTP id t15-20020a05600c198f00b0040ead0d0075mr926207wmq.132.1706121798834;
        Wed, 24 Jan 2024 10:43:18 -0800 (PST)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d4b81000000b0033920dfd287sm14186876wrt.19.2024.01.24.10.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 10:43:18 -0800 (PST)
Message-ID: <dd90ca0b-f323-4083-8901-b79eb188ee90@gmail.com>
Date: Wed, 24 Jan 2024 19:43:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] treewide, serdev: change receive_buf() return type to
 size_t
Content-Language: en-US
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
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_104321_873895_1A1F9EC4 
X-CRM114-Status: GOOD (  28.08  )
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

On 1/22/24 19:05, Francesco Dolcini wrote:
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
> gnss_insert_raw() could be changed to return also an unsigned, however
> this is not implemented here as request by the GNSS maintainer Johan
> Hovold.
> 
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio

Acked-by: Maximilian Luz <luzmaximilian@gmail.com>  # for platform/surface

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
> diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
> index 3c84fcbda01a..e6bc4a73c9fc 100644
> --- a/drivers/bluetooth/btmtkuart.c
> +++ b/drivers/bluetooth/btmtkuart.c
> @@ -383,8 +383,8 @@ static void btmtkuart_recv(struct hci_dev *hdev, const u8 *data, size_t count)
>   	}
>   }
>   
> -static ssize_t btmtkuart_receive_buf(struct serdev_device *serdev,
> -				     const u8 *data, size_t count)
> +static size_t btmtkuart_receive_buf(struct serdev_device *serdev,
> +				    const u8 *data, size_t count)
>   {
>   	struct btmtkuart_dev *bdev = serdev_device_get_drvdata(serdev);
>   
> diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
> index 1d592ac413d1..056bef5b2919 100644
> --- a/drivers/bluetooth/btnxpuart.c
> +++ b/drivers/bluetooth/btnxpuart.c
> @@ -1264,8 +1264,8 @@ static const struct h4_recv_pkt nxp_recv_pkts[] = {
>   	{ NXP_RECV_FW_REQ_V3,   .recv = nxp_recv_fw_req_v3 },
>   };
>   
> -static ssize_t btnxpuart_receive_buf(struct serdev_device *serdev,
> -				     const u8 *data, size_t count)
> +static size_t btnxpuart_receive_buf(struct serdev_device *serdev,
> +				    const u8 *data, size_t count)
>   {
>   	struct btnxpuart_dev *nxpdev = serdev_device_get_drvdata(serdev);
>   
> diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
> index 39c8b567da3c..a3c3beb2806d 100644
> --- a/drivers/bluetooth/hci_serdev.c
> +++ b/drivers/bluetooth/hci_serdev.c
> @@ -271,8 +271,8 @@ static void hci_uart_write_wakeup(struct serdev_device *serdev)
>    *
>    * Return: number of processed bytes
>    */
> -static ssize_t hci_uart_receive_buf(struct serdev_device *serdev,
> -				    const u8 *data, size_t count)
> +static size_t hci_uart_receive_buf(struct serdev_device *serdev,
> +				   const u8 *data, size_t count)
>   {
>   	struct hci_uart *hu = serdev_device_get_drvdata(serdev);
>   
> diff --git a/drivers/gnss/serial.c b/drivers/gnss/serial.c
> index baa956494e79..0e43bf6294f8 100644
> --- a/drivers/gnss/serial.c
> +++ b/drivers/gnss/serial.c
> @@ -80,7 +80,7 @@ static const struct gnss_operations gnss_serial_gnss_ops = {
>   	.write_raw	= gnss_serial_write_raw,
>   };
>   
> -static ssize_t gnss_serial_receive_buf(struct serdev_device *serdev,
> +static size_t gnss_serial_receive_buf(struct serdev_device *serdev,
>   				       const u8 *buf, size_t count)
>   {
>   	struct gnss_serial *gserial = serdev_device_get_drvdata(serdev);
> diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> index 6801a8fb2040..79375d14bbb6 100644
> --- a/drivers/gnss/sirf.c
> +++ b/drivers/gnss/sirf.c
> @@ -160,7 +160,7 @@ static const struct gnss_operations sirf_gnss_ops = {
>   	.write_raw	= sirf_write_raw,
>   };
>   
> -static ssize_t sirf_receive_buf(struct serdev_device *serdev,
> +static size_t sirf_receive_buf(struct serdev_device *serdev,
>   				const u8 *buf, size_t count)
>   {
>   	struct sirf_data *data = serdev_device_get_drvdata(serdev);
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index c3e90025064b..33f8fad70260 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -271,7 +271,7 @@ static void hdlc_rx_frame(struct gb_beagleplay *bg)
>   	}
>   }
>   
> -static ssize_t hdlc_rx(struct gb_beagleplay *bg, const u8 *data, size_t count)
> +static size_t hdlc_rx(struct gb_beagleplay *bg, const u8 *data, size_t count)
>   {
>   	size_t i;
>   	u8 c;
> @@ -331,8 +331,8 @@ static void hdlc_deinit(struct gb_beagleplay *bg)
>   	flush_work(&bg->tx_work);
>   }
>   
> -static ssize_t gb_tty_receive(struct serdev_device *sd, const u8 *data,
> -			      size_t count)
> +static size_t gb_tty_receive(struct serdev_device *sd, const u8 *data,
> +			     size_t count)
>   {
>   	struct gb_beagleplay *bg = serdev_device_get_drvdata(sd);
>   
> diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms7003.c
> index b5cf15a515d2..43025866d5b7 100644
> --- a/drivers/iio/chemical/pms7003.c
> +++ b/drivers/iio/chemical/pms7003.c
> @@ -211,8 +211,8 @@ static bool pms7003_frame_is_okay(struct pms7003_frame *frame)
>   	return checksum == pms7003_calc_checksum(frame);
>   }
>   
> -static ssize_t pms7003_receive_buf(struct serdev_device *serdev, const u8 *buf,
> -				   size_t size)
> +static size_t pms7003_receive_buf(struct serdev_device *serdev, const u8 *buf,
> +				  size_t size)
>   {
>   	struct iio_dev *indio_dev = serdev_device_get_drvdata(serdev);
>   	struct pms7003_state *state = iio_priv(indio_dev);
> diff --git a/drivers/iio/chemical/scd30_serial.c b/drivers/iio/chemical/scd30_serial.c
> index a47654591e55..2adb76dbb020 100644
> --- a/drivers/iio/chemical/scd30_serial.c
> +++ b/drivers/iio/chemical/scd30_serial.c
> @@ -174,8 +174,8 @@ static int scd30_serdev_command(struct scd30_state *state, enum scd30_cmd cmd, u
>   	return 0;
>   }
>   
> -static ssize_t scd30_serdev_receive_buf(struct serdev_device *serdev,
> -					const u8 *buf, size_t size)
> +static size_t scd30_serdev_receive_buf(struct serdev_device *serdev,
> +				       const u8 *buf, size_t size)
>   {
>   	struct iio_dev *indio_dev = serdev_device_get_drvdata(serdev);
>   	struct scd30_serdev_priv *priv;
> diff --git a/drivers/iio/chemical/sps30_serial.c b/drivers/iio/chemical/sps30_serial.c
> index 3afa89f8acc3..a6dfbe28c914 100644
> --- a/drivers/iio/chemical/sps30_serial.c
> +++ b/drivers/iio/chemical/sps30_serial.c
> @@ -210,8 +210,8 @@ static int sps30_serial_command(struct sps30_state *state, unsigned char cmd,
>   	return rsp_size;
>   }
>   
> -static ssize_t sps30_serial_receive_buf(struct serdev_device *serdev,
> -					const u8 *buf, size_t size)
> +static size_t sps30_serial_receive_buf(struct serdev_device *serdev,
> +				       const u8 *buf, size_t size)
>   {
>   	struct iio_dev *indio_dev = dev_get_drvdata(&serdev->dev);
>   	struct sps30_serial_priv *priv;
> diff --git a/drivers/iio/imu/bno055/bno055_ser_core.c b/drivers/iio/imu/bno055/bno055_ser_core.c
> index 5677bdf4f846..694ff14a3aa2 100644
> --- a/drivers/iio/imu/bno055/bno055_ser_core.c
> +++ b/drivers/iio/imu/bno055/bno055_ser_core.c
> @@ -378,8 +378,8 @@ static void bno055_ser_handle_rx(struct bno055_ser_priv *priv, int status)
>    * Also, we assume to RX one pkt per time (i.e. the HW doesn't send anything
>    * unless we require to AND we don't queue more than one request per time).
>    */
> -static ssize_t bno055_ser_receive_buf(struct serdev_device *serdev,
> -				      const u8 *buf, size_t size)
> +static size_t bno055_ser_receive_buf(struct serdev_device *serdev,
> +				     const u8 *buf, size_t size)
>   {
>   	int status;
>   	struct bno055_ser_priv *priv = serdev_device_get_drvdata(serdev);
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
> diff --git a/drivers/net/ethernet/qualcomm/qca_uart.c b/drivers/net/ethernet/qualcomm/qca_uart.c
> index 223321897b96..20f50bde82ac 100644
> --- a/drivers/net/ethernet/qualcomm/qca_uart.c
> +++ b/drivers/net/ethernet/qualcomm/qca_uart.c
> @@ -58,7 +58,7 @@ struct qcauart {
>   	unsigned char *tx_buffer;
>   };
>   
> -static ssize_t
> +static size_t
>   qca_tty_receive(struct serdev_device *serdev, const u8 *data, size_t count)
>   {
>   	struct qcauart *qca = serdev_device_get_drvdata(serdev);
> diff --git a/drivers/nfc/pn533/uart.c b/drivers/nfc/pn533/uart.c
> index 2eb5978bd79e..cfbbe0713317 100644
> --- a/drivers/nfc/pn533/uart.c
> +++ b/drivers/nfc/pn533/uart.c
> @@ -203,8 +203,8 @@ static int pn532_uart_rx_is_frame(struct sk_buff *skb)
>   	return 0;
>   }
>   
> -static ssize_t pn532_receive_buf(struct serdev_device *serdev,
> -				 const u8 *data, size_t count)
> +static size_t pn532_receive_buf(struct serdev_device *serdev,
> +				const u8 *data, size_t count)
>   {
>   	struct pn532_uart_phy *dev = serdev_device_get_drvdata(serdev);
>   	size_t i;
> diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
> index 456d3947116c..9c09c10c2a46 100644
> --- a/drivers/nfc/s3fwrn5/uart.c
> +++ b/drivers/nfc/s3fwrn5/uart.c
> @@ -51,8 +51,8 @@ static const struct s3fwrn5_phy_ops uart_phy_ops = {
>   	.write = s3fwrn82_uart_write,
>   };
>   
> -static ssize_t s3fwrn82_uart_read(struct serdev_device *serdev,
> -				  const u8 *data, size_t count)
> +static size_t s3fwrn82_uart_read(struct serdev_device *serdev,
> +				 const u8 *data, size_t count)
>   {
>   	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
>   	size_t i;
> diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
> index 68d80559fddc..8ea867c2a01a 100644
> --- a/drivers/platform/chrome/cros_ec_uart.c
> +++ b/drivers/platform/chrome/cros_ec_uart.c
> @@ -81,8 +81,8 @@ struct cros_ec_uart {
>   	struct response_info response;
>   };
>   
> -static ssize_t cros_ec_uart_rx_bytes(struct serdev_device *serdev,
> -				     const u8 *data, size_t count)
> +static size_t cros_ec_uart_rx_bytes(struct serdev_device *serdev,
> +				    const u8 *data, size_t count)
>   {
>   	struct ec_host_response *host_response;
>   	struct cros_ec_device *ec_dev = serdev_device_get_drvdata(serdev);
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
> diff --git a/drivers/tty/serdev/serdev-ttyport.c b/drivers/tty/serdev/serdev-ttyport.c
> index e94e090cf0a1..3d7ae7fa5018 100644
> --- a/drivers/tty/serdev/serdev-ttyport.c
> +++ b/drivers/tty/serdev/serdev-ttyport.c
> @@ -27,19 +27,17 @@ static size_t ttyport_receive_buf(struct tty_port *port, const u8 *cp,
>   {
>   	struct serdev_controller *ctrl = port->client_data;
>   	struct serport *serport = serdev_controller_get_drvdata(ctrl);
> -	int ret;
> +	size_t ret;
>   
>   	if (!test_bit(SERPORT_ACTIVE, &serport->flags))
>   		return 0;
>   
>   	ret = serdev_controller_receive_buf(ctrl, cp, count);
>   
> -	dev_WARN_ONCE(&ctrl->dev, ret < 0 || ret > count,
> -				"receive_buf returns %d (count = %zu)\n",
> +	dev_WARN_ONCE(&ctrl->dev, ret > count,
> +				"receive_buf returns %zu (count = %zu)\n",
>   				ret, count);
> -	if (ret < 0)
> -		return 0;
> -	else if (ret > count)
> +	if (ret > count)
>   		return count;
>   
>   	return ret;
> diff --git a/include/linux/serdev.h b/include/linux/serdev.h
> index 3fab88ba265e..ff78efc1f60d 100644
> --- a/include/linux/serdev.h
> +++ b/include/linux/serdev.h
> @@ -27,7 +27,7 @@ struct serdev_device;
>    *			not sleep.
>    */
>   struct serdev_device_ops {
> -	ssize_t (*receive_buf)(struct serdev_device *, const u8 *, size_t);
> +	size_t (*receive_buf)(struct serdev_device *, const u8 *, size_t);
>   	void (*write_wakeup)(struct serdev_device *);
>   };
>   
> @@ -185,9 +185,9 @@ static inline void serdev_controller_write_wakeup(struct serdev_controller *ctrl
>   	serdev->ops->write_wakeup(serdev);
>   }
>   
> -static inline ssize_t serdev_controller_receive_buf(struct serdev_controller *ctrl,
> -						    const u8 *data,
> -						    size_t count)
> +static inline size_t serdev_controller_receive_buf(struct serdev_controller *ctrl,
> +						   const u8 *data,
> +						   size_t count)
>   {
>   	struct serdev_device *serdev = ctrl->serdev;
>   
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

