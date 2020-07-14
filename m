Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17909C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 21:14:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D69482067D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 21:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z3kCcByO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0Ss25Af"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D69482067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yaQqLtxAtZ2LgMPymHCvcAtVq4EPHdWrW84pyi0kA2A=; b=Z3kCcByOYufVh960skRwTHGjH
	ZydjVE5PR+4Hp0fgVIXeiaovv7h/SZ/Zbff2xDFpNEcXDIbdkHdcKp9GiJgKKWR0P2WyXLvsANgkf
	hJIGk19FwDy96TuSzjPshHx7IEKfzlKZjrJOsuVz76FTPbvuhyT7pPOtEAn7LXRSN8TryY1HctxL9
	x/96Ua0cXKE2gKiWcbmXVxk1v1Qjn6pf9mrcphPgT8WRp0QHeFRvCQ7myw0jDrl7RUCNO6BQ5KeDK
	qpj8ToXjloLHM3H2PmqoPm1jvZEpJKmvf6HHuiF/izOdLYhVjJrJdGMggvp08AxbtCp89wh15GNKT
	xG5YFLGZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvSFr-00054n-48; Tue, 14 Jul 2020 21:14:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvSFj-000524-VO; Tue, 14 Jul 2020 21:14:17 +0000
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 270ED206D9;
 Tue, 14 Jul 2020 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594761255;
 bh=xJEt28yG5snfGCRRjw3wSQrw/eSHAemNaNv10dkyRQ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M0Ss25Afg10HiK/2HBQRFfzW42VJzF+YbzTW+RJiRBO0ah3qJU9xYlM7eECwM6+w5
 MOZ3ssvMvLhbFxn+19w4O+JVkZGcmHeOPH296mS5x/oo/pEqVfOAZQV+34ulZcJHRK
 JoBjKpf8NUYpeMWnT0WUM7mxZD1mcMvmHbAYYQLA=
Received: by mail-il1-f173.google.com with SMTP id h16so48071ilj.11;
 Tue, 14 Jul 2020 14:14:15 -0700 (PDT)
X-Gm-Message-State: AOAM533sK6+spTCiVp2xqrwB5Iik53oHubKfUwnSovxCfXJlKsnmFX3/
 RZ6K0CzMa496CXLtc4m8kNVyzyGQiqRmgGLbiXE=
X-Google-Smtp-Source: ABdhPJwXf/Rm5ypnIxr57TkPPI0oKtuKdoZqvr9Ssu+Eyqx3vf6EQCyBT1vgH+wRyKZZO+SRh5TiFGRfhBGQQ+0Ymy8=
X-Received: by 2002:a92:cbd1:: with SMTP id s17mr6620228ilq.43.1594761254567; 
 Tue, 14 Jul 2020 14:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200710072717.3056-1-zhiyong.tao@mediatek.com>
 <20200710072717.3056-4-zhiyong.tao@mediatek.com>
In-Reply-To: <20200710072717.3056-4-zhiyong.tao@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 14 Jul 2020 14:14:03 -0700
X-Gmail-Original-Message-ID: <CAGp9LzpVTRX6CrU7nErqyznP6QFS10mKuvt5oEXUGL+_FAyYNQ@mail.gmail.com>
Message-ID: <CAGp9LzpVTRX6CrU7nErqyznP6QFS10mKuvt5oEXUGL+_FAyYNQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: add pinctrl driver on mt8192
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_171416_264275_2AFE2D5D 
X-CRM114-Status: GOOD (  15.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?Q2h1YW5qaWEgTGl1ICjmn7PkvKDlmIkp?= <chuanjia.liu@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 hui.liu@mediatek.com, lkml <linux-kernel@vger.kernel.org>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 12:28 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This commit includes pinctrl driver for mt8192.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

It is good to see the clean driver with mtk-common-v2.

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/Kconfig              |    7 +
>  drivers/pinctrl/mediatek/Makefile             |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mt8192.c     | 1453 +++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt8192.h | 2228 +++++++++++++++++
>  4 files changed, 3689 insertions(+)
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8192.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8192.h
>
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index f32d3644c509..8d5ffc6aa8dc 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -121,6 +121,13 @@ config PINCTRL_MT8183
>         default ARM64 && ARCH_MEDIATEK
>         select PINCTRL_MTK_PARIS
>
> +config PINCTRL_MT8192
> +       bool "Mediatek MT8192 pin control"
> +       depends on OF
> +       depends on ARM64 || COMPILE_TEST
> +       default ARM64 && ARCH_MEDIATEK
> +       select PINCTRL_MTK_PARIS
> +

<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
