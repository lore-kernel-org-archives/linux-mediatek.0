Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4409E99049
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2026 07:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prNhPUxjlC9KTZLbbjkr41gU0WNMiDfRO5w2mPaA3+k=; b=RUqBOdqHly4XE2AEXKCYUB2SDw
	1P9S8wKSR7OETMXMjTzQATrIMBKnGlV5w0dERMkDja+KySBHKfPjiYquB9ECMo44I/Apks76YAaDW
	Lq/nDZjANXUXGwqsNbywbNx9uoc1Ey0s/5BRk0D1NA0O5C+GVOzWD3vNXkwhXDVEgoXkjUqwJXi8e
	uxxFsK8Dv26qtNBJZ3cM+1VS28rBDNGLcjONFdUDJFJs1Up2GkYg3Yo6ogSDc5QwmAGRSUxXEA9uX
	HfmnhjfckMLOkCw9qg2DPBFVP2HVdHftcb//4Srg+pbbIbwIp9ZMGB/Kl1l2GtODJSZXzag+qpDSo
	Ig5Ljv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6R4-0000000BkVs-3249;
	Fri, 10 Apr 2026 07:37:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6R3-0000000BkUf-1KiB
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Apr 2026 07:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C30C6013E
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 07:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F07C2BCB2
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775806668;
	bh=prNhPUxjlC9KTZLbbjkr41gU0WNMiDfRO5w2mPaA3+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f0/Zms55ickfGRIdD6cuuOLeTsSWaROWdDBArUkbLFVWONI0jUcE0SCw2LWLhhJ8M
	 kgmEQw0WOvkJC39OXeX7qYeQctvGNeR5nzwCIx9eLUyL9JbgjsgRbJGQt30RVoHbCS
	 rmmG908ZLTWobBWk2UcfU5SZaKtPACW2S0LKmGjV423Qeko6Rn80gVadk44R5ItidX
	 NU8v/1yLCPinSQO90GlwS77i2Yj7vOdToguSnj9yWXLr41fxVr14x7hh8BuQzZWo+/
	 AUpS/cEcF4MzyGOKquBmTylaOrE+XKSldeLfLEPk0ZKKUhIX5aaBgh/ydgNlJIW7Hf
	 Z8KS8WstxWfwA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6507a7d2eccso1796941d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 00:37:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCHIKOmonZ0z8iEH+mu3f1mopgaLOxXMYlK+hKCZtAHmsXkUf93Taa1pcD6B1tA9iQZn8JvCfYuHxi7i3B/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK9/3Dc43rbq0Q/w8E/UHmvZzpNep7Kwn0o8dPFDqCXBFpQoQE
	kuGMjUDCWZSqV0z3UCowFJewhwhGRplZX6IoK06AUIx9n6jn2DmEqq8DbMp5OQ+Wx0pG31z93q4
	9ZAHp+WoPRduPzmJmlbqSK7WVGw3UUoU=
X-Received: by 2002:a53:bb84:0:b0:650:38d9:a0a7 with SMTP id
 956f58d0204a3-65198b9b922mr1436588d50.52.1775806667759; Fri, 10 Apr 2026
 00:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Apr 2026 09:37:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLmCrqa_eMCCPPnAKTDug0Bj1ZktrEckOfs-H6+FzqtZcg@mail.gmail.com>
X-Gm-Features: AQROBzBQm9AmJG_DbEyKwcRWAwaHWROrcg26pOOQhOFD9Ipr2DjT-YjcixGXSLk
Message-ID: <CAD++jLmCrqa_eMCCPPnAKTDug0Bj1ZktrEckOfs-H6+FzqtZcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Apr 10, 2026 at 9:09=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> If the gpio_chip::get_direction() callback is not implemented by the GPIO
> controller driver, GPIOLIB emits a warning.
>
> Implement get_direction() for the GPIO part of pinctrl-moore.
>
> Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::ge=
t_direction()")
> Reported-by: Frank Wunderlich <linux@fw-web.de>
> Closes: https://lore.kernel.org/all/20260409132724.126258-1-linux@fw-web.=
de/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

LGTM, but it would have to go into v7.1-rc1 right now due to timing,
then from there to stable.

Yours,
Linus Walleij

