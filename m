Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02DCC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47jlcLBYAf5p/ZA80lzYhIXnJWPG3l1bsjt9+c0F7VE=; b=g270pojaf7n9wZZE0YHTXu8L9v
	BDfKKOE4ev/tST/Yr+AVaPT9XDo9P8EgpHqq1pIOJAHnCbIU5WjezkbXFvPmDBlAiNc2vi1kKy/S6
	dHe7GX4euSKjMBboUTyRHHuNJQNLojbh83tSf0WsEiwLfSEpXX/vMvSj8CoWyEmiqKm4YM7JA8lfY
	0PE9gibHPfLPz74wSPuQ9j4Ux/z3oHji3Tuo7GyyrNoWVC9huDlJnPraF5GP0yev5MWcyFe+fzhQz
	GhqqjzNfxzpx5SZ3cxhWkx/3/juUkCVIV+qzlByJEr1S/Odj5r3Jy/jiElWH2snDTjaXfuUa1kKfS
	5eXddONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0b9-00000000LEg-1NfU;
	Thu, 25 Jan 2024 14:20:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0b6-00000000LDx-3raq;
	Thu, 25 Jan 2024 14:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=47jlcLBYAf5p/ZA80lzYhIXnJWPG3l1bsjt9+c0F7VE=; b=frPZavIaVORvOqnjWUzGqSPnhz
	n4Reb1Nps9xdLOu3/QbzlSYG6gAj6CVla642MyZ1z/ghBKoLXUoRvKkvYxdTu0u8XEaCR06bb3oBl
	fWU7sjbyKAdE65C4zfpiibFjAU49Pmpn2ecAPaEqt7tFphbbujbnmLM0erkt3o4fBf62hiDRAm71H
	rY3hcCncbfbVoXSTOIdsLIb3k5/B+3G5Xam4Afy0xSHfl5IKQgCOsaiinXkVyZc2oRg2naWB+iq7f
	j/x8eOziBx91AeOmk0QOlY6Pdd0DkiVg5kOLjQrTShtZg5g179cCIP4n3lioNeEGZjMOwQFn3Fr8X
	/IZWpx7g==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSxCu-000000054Of-3PAX;
	Thu, 25 Jan 2024 10:43:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0CA92CE3348;
	Thu, 25 Jan 2024 10:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A8EC433C7;
	Thu, 25 Jan 2024 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706179353;
	bh=1/AQZg5NNw9HG13KiYI6HfNvwqZ4xcS6GaNad1Jmb/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+WC6q/pwbwzH6zhMdWS153JB6VUWqmZcSDN5fViUQMl+zNnFkr+L5iCIZC4Lmv2j
	 bS4xt+Jc+fIKPiuc/kJRIJ6TAeALxfXs7+VoI8ancJ7e9QSMZf9u8wlf8juOT449Gm
	 dGuxdVykXP+YbuK9da+3YP4AGDYrHkdmnPt65LdsuIx8gGLD4hTB/s1rjqbkVCKiUD
	 oli8l8eXT1ku4I2e/jROQgRMNh1cOo8JM8FSB0c1qy9mR6qP4bCyS6fEZ4sW83WE4H
	 dvME2O/MBNNvzFmFBAQf8Pqk3H35BFWj4WMW1H3tXE6hY7SpsHA0xe4mZ94kyccwIt
	 HEVRnGIIo3ahQ==
Date: Thu, 25 Jan 2024 10:42:23 +0000
From: Lee Jones <lee@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-iio@vger.kernel.org, netdev@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2] treewide, serdev: change receive_buf() return type to
 size_t
Message-ID: <20240125104223.GD74950@google.com>
References: <20240122180551.34429-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_104342_581039_486A07EA 
X-CRM114-Status: GOOD (  21.98  )
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

On Mon, 22 Jan 2024, Francesco Dolcini wrote:

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
> ---
> v1:
>  - https://lore.kernel.org/all/20231214170146.641783-1-francesco@dolcini.it/
> v2:
>  - rebased on 6.8-rc1
>  - add acked-by Jonathan
>  - do not change gnss_insert_raw()
>  - do not change the code style of the gnss code
>  - commit message improvements, explain the reasons for doing only minimal
>    changes on the GNSS part
> ---
>  drivers/bluetooth/btmtkuart.c              |  4 ++--
>  drivers/bluetooth/btnxpuart.c              |  4 ++--
>  drivers/bluetooth/hci_serdev.c             |  4 ++--
>  drivers/gnss/serial.c                      |  2 +-
>  drivers/gnss/sirf.c                        |  2 +-
>  drivers/greybus/gb-beagleplay.c            |  6 +++---
>  drivers/iio/chemical/pms7003.c             |  4 ++--
>  drivers/iio/chemical/scd30_serial.c        |  4 ++--
>  drivers/iio/chemical/sps30_serial.c        |  4 ++--
>  drivers/iio/imu/bno055/bno055_ser_core.c   |  4 ++--

>  drivers/mfd/rave-sp.c                      |  4 ++--

Acked-by: Lee Jones <lee@kernel.org>

>  drivers/net/ethernet/qualcomm/qca_uart.c   |  2 +-
>  drivers/nfc/pn533/uart.c                   |  4 ++--
>  drivers/nfc/s3fwrn5/uart.c                 |  4 ++--
>  drivers/platform/chrome/cros_ec_uart.c     |  4 ++--
>  drivers/platform/surface/aggregator/core.c |  4 ++--
>  drivers/tty/serdev/serdev-ttyport.c        | 10 ++++------
>  include/linux/serdev.h                     |  8 ++++----
>  sound/drivers/serial-generic.c             |  4 ++--
>  19 files changed, 40 insertions(+), 42 deletions(-)

-- 
Lee Jones [李琼斯]

