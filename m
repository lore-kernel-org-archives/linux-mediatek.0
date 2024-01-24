Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE03C47E49
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 18:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkK3O3DATntM/9GVD3kuQMbW01b9/WzRUkiFxj/khmo=; b=DJnl5ipZtkYJQ4A2wNkuN7S7Mp
	v8pEIt+fw++1pNcvTRJUymUpfS9wnleYIiD/OZOsgSePpYuP0Dbf4WyYOSGql+SiWj7zlRBviSxR4
	79B/h0zFdYNzmLw6d/dEtu06YIXwuVz/QDQxLw960KmUIMi/OICVzyKbszbS3srC+CAP4f2N1Hpx6
	BcjYMPbdX7Lhm4fQ2O0n0XjwLxoOdlh0bZOeZCRF474kOzzuMU6+u3S2IJPNHA0aaeuHOiSD8PQcB
	55mWS01INVr+mAwl025bCL0aHTiUbe2F/sGtmNO7CrUcVlf96Y7vR0FTlqDViWjvyDDL8AvydXtlN
	ib7IvGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShrM-004feR-1T;
	Wed, 24 Jan 2024 18:20:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShrI-004fcN-1m;
	Wed, 24 Jan 2024 18:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD47761E57;
	Wed, 24 Jan 2024 18:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADF7C43399;
	Wed, 24 Jan 2024 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706120419;
	bh=8i7hW/P7gRwZbg6eJhfWSHuYfwNb6fjxwXNOYa+zX2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Br4mhTz3ABsovsBh891iFtITCloETm7Xd3auyJ06H5OtOXYpmgIubWlxfBF2VAGmf
	 OlGgldHJriEwX+TyBKeNai970ecogEG/P+gUzZX4GkxGns9Tk6eEXHb1JVxvu6/qbt
	 skPzgvzkoqvZSI3fIk0qzZS1oVVsfORv8XNRdsm4o8jNjgkmRgXjCqeQuzGAQ/loQ0
	 MNqC/og/U/JCX02ROA4VSt/31hoJJKyDJYB6eTiM5FtscPo50IXJxuwfPJcISYJ5Bo
	 JVUzkTQyQJDT/DwPnh/6uJPHvZSstEkjmSaAd1oD/2eYSXBm+WQRf3GOuraJ/L6/c7
	 dAa8p4/Z1vrVg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51005675963so3496528e87.0;
        Wed, 24 Jan 2024 10:20:19 -0800 (PST)
X-Gm-Message-State: AOJu0YyfPWgSyYtMIsb1QcwBpGZzOr/KFqT7XagD5+fVJujrvB/pjxu6
	i8DGwWvcbxpEWN5OmINXBRo44vxsUKlTrIkocKW4TXN5xwwq+dTc+Wvn8+f5mlXf0BjAX+KqljE
	FWCsBxz5YuwR6DmqPgZLnJ2EtKg==
X-Google-Smtp-Source: AGHT+IFQ7o9sj+x/bj/29pY9Rds1Cng62HUIvJOWJ1X7OlDRC8xWzyyEJAbOfVXOJaSePIJD48bw3TcKGaUGSzwtDq4=
X-Received: by 2002:a05:6512:1295:b0:50e:ca83:887e with SMTP id
 u21-20020a056512129500b0050eca83887emr2710515lfs.34.1706120417667; Wed, 24
 Jan 2024 10:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20240122180551.34429-1-francesco@dolcini.it>
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jan 2024 12:20:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKHjj5SfPTxhXUtmNh1nr1-eNKnL-Mmv-XdyONxgn9UVw@mail.gmail.com>
Message-ID: <CAL_JsqKHjj5SfPTxhXUtmNh1nr1-eNKnL-Mmv-XdyONxgn9UVw@mail.gmail.com>
Subject: Re: [PATCH v2] treewide, serdev: change receive_buf() return type to size_t
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, 
	netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-sound@vger.kernel.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_102020_693730_84F8658B 
X-CRM114-Status: GOOD (  21.96  )
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

On Mon, Jan 22, 2024 at 12:06=E2=80=AFPM Francesco Dolcini <francesco@dolci=
ni.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">=3D 0" from serdev_controller_receive_buf(), change its return type fro=
m
> ssize_t to size_t.
>
> The need for this clean-up was noticed while fixing a warning, see
> commit 94d053942544 ("Bluetooth: btnxpuart: fix recv_buf() return value")=
.
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
> Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@ke=
rnel.org/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio
> ---
> v1:
>  - https://lore.kernel.org/all/20231214170146.641783-1-francesco@dolcini.=
it/
> v2:
>  - rebased on 6.8-rc1
>  - add acked-by Jonathan
>  - do not change gnss_insert_raw()
>  - do not change the code style of the gnss code
>  - commit message improvements, explain the reasons for doing only minima=
l
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
>  drivers/net/ethernet/qualcomm/qca_uart.c   |  2 +-
>  drivers/nfc/pn533/uart.c                   |  4 ++--
>  drivers/nfc/s3fwrn5/uart.c                 |  4 ++--
>  drivers/platform/chrome/cros_ec_uart.c     |  4 ++--
>  drivers/platform/surface/aggregator/core.c |  4 ++--
>  drivers/tty/serdev/serdev-ttyport.c        | 10 ++++------
>  include/linux/serdev.h                     |  8 ++++----
>  sound/drivers/serial-generic.c             |  4 ++--
>  19 files changed, 40 insertions(+), 42 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

