Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AE9C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C306044F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56C306044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sutzn6SDSup2CC8EwlLoe7XtNAI2i27b3NbcVoNQjA=; b=Vxa8SRBlhX4Xoj
	2jwprE+IXr7LAhLzYeTko67jnhLH6d5pP8OV0bziotzJtPNRD9Mnr84W9qujzvZfg7+HJCpA45hUm
	g/x+8QIWb3vlgIpQdMsiNCvpARRaKgGcm0dTWDQmiYx9QolV+tzYLAYzKiD35ulsKjz/WvZ5098Kx
	7UxeN4+nZa1oKinQWFBHXNUKxahrZMa5mtKcT8eW5dF4qskCJVXKa8+7yXs6QWerrFjx3Kjadtn9x
	KQNNPxkHxWh5cJz/f1Y2eZRTY0iecdjjeq7KJnbkuJVgleJRZKiT9mqO5SyvqoKMU1+MFa5tXtNid
	2riBiw+Jx2TwKvE9F5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7wPK-00AJRb-5O; Mon, 26 Jul 2021 08:56:18 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7wP6-00AJLJ-Nu
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 08:56:05 +0000
Received: by mail-lj1-x234.google.com with SMTP id e5so10432831ljp.6
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vfGOANo6TojxjSyUtBk+c/yyOvQBgYLoVpO4rN8lOu8=;
 b=Wo+D0NDi9dCxo6BkePhL3/dXKXwvkD2kVC2GJFC2gJSO3EZLYYYxJQkokJCoepYYXN
 zKDrD9uf5JXkZU5sUlphcVcLPYw2DbuALfhCpYCr16P0sLCoBjVnmpJ4+bkbbZsY+6Ae
 aePG/1QMSSWkKXv1jQoz27Sw0QoS12K/1w8X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vfGOANo6TojxjSyUtBk+c/yyOvQBgYLoVpO4rN8lOu8=;
 b=kULSylHZ88z0hofFJtIWDKJ//1iGrTOqp8VO2PJS9MaJUr0gzbB+U5ipy4sH1D/aQD
 o9AtsgJ8JKHPk92WU6vI3Z2+o/awL2CGJFHQvgxUbGfBzNMAv6AL3OjFC4JdL4SgZkZT
 T/LBL1cW/QK+vjR0TWctIM4SRdVaWApLFzGrMar3EBXTMZOvqP0GvJwclzq5hk4dbYtS
 UH/hEvX/Tb9MzCTAh6G4WBFq+XbtoggfdV68iZDWKLiYO5QEl6a7G+yQOJxScNZyXxiO
 3d9R65c843PnY4VHpz59+hzmi+m8SHQkqtMRBoeELR+Eq0L8g7vdU3Fzdbu4MQaFUz7t
 z3Eg==
X-Gm-Message-State: AOAM533zrBj28aHeMhvHqYkDprVCdaDo9cJm9JA5EJn3RnjCQEvP4Q2g
 VczPCbqRUu8RiS0zzSQjq/0tggVWpzIO9HoefELeQQ==
X-Google-Smtp-Source: ABdhPJw67P1wau80aeqooMy907ZYAzpnAEddZ9DMaEPCUCA9XANLeDaDFjZlvhvqn/e4V3NvNlGzJuK3q9X0z2yIpCo=
X-Received: by 2002:a2e:a417:: with SMTP id p23mr7799929ljn.23.1627289763011; 
 Mon, 26 Jul 2021 01:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210726050831.1917982-1-hsinyi@chromium.org>
In-Reply-To: <20210726050831.1917982-1-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Jul 2021 16:55:52 +0800
Message-ID: <CAGXv+5FmKHft-s9u_G0aEXuK2x5p1+unC-35ksaS_D=52JRkYA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: kukui: Use aliases to mmc nodes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Eizan Miyamoto <eizan@chromium.org>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_015604_806396_D10AEBB8 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 26, 2021 at 1:09 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Use aliases to mmc nodes so the partition name for eMMC and SD card will
> be consistent across boots.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
