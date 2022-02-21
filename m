Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF63C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2B8bhlM6M3XNYdDZmyreNMRkZoRd8hmKCKtZRcV2Pk=; b=1ja58ZGcvWQv/6
	ckIQfPaL0D68Na1Z4sc2tDibOvTkY5ZhcwOP73ruuHtUCYxBqsP1t01QVg0n6e0JycfYJJp5i3OB4
	o588d0J7EOSQPZ56FwgNd3qTrb5GVPVyLFQKJwDLPE/2dKN4HtMFa7xNL8X4EPCS3wyN7IOEyZZFx
	d/MoP5EXw7ETmzxEtwiRShwveYwYEhZJPQ0Gfl/EjWhM5HQGmwOnYOYpW58B8WwGxIMQgaG68s06K
	+r21vPcJqSzyemGzT/srJsfxZDijyCH41mzbJY+iu3qWeM755RNtIJVqKbLx9ECocb2ZVPgZ+13oj
	QfMmmhD5WMNMJ66pErlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM621-004zPF-OQ; Mon, 21 Feb 2022 10:35:01 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5Rs-004iSu-C1
 for linux-mediatek@lists.infradead.org; Mon, 21 Feb 2022 09:57:46 +0000
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2d625082ae2so131619847b3.1
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Feb 2022 01:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nl0T0iJnVKphPzFb8UDMXZHBwxSlA4pey//XXCrdqBM=;
 b=JV94Ro4lD58Q8SSlPXbqpiDYr9lPiTn34wLn1CoDReV03JWAV/y9Brn3dwuSMXGRgT
 DROiEU8RWXbWiQ8H9k8V5+uV5rlKeTp7xPJYZ9J0bKcc27t3pnrevykxr6x12Ye8rkFl
 cjGxmxCuAiYBGqYuUlStAHFQNAwwMHnALLesA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nl0T0iJnVKphPzFb8UDMXZHBwxSlA4pey//XXCrdqBM=;
 b=t8USTjeqOUrJ7yYgG3V4DbSLCeiROKXYlTS/fbg4N+N/SYYWSRbFvXTl98ftCuWw2k
 TKceulb7g++kLMUeMTZ24sDCC0knBL0e7VaddQ1VJhm8hRap/Yxn8Fsiag2+nMWyv/ch
 dxd0OG1plO/FQZ4ohVFGInEnrj9Dk2NKSZixf3ptk4o9TOlwwU4kCc/kzOr/zEIR4+Ct
 /Z9IZ6VhQ3dLWrV4JoYqZCyPWLS2Ae8BXIKQPZlv9KGiTfcSur0J446Z1HYgNjjuIAlV
 ZNIZ4GsNrgKKZw+pl64OcHaemZ+cJ/0M9CMpgDVzMKmJ00k4mVZuioHwq2WkD4fJ9JR5
 URPg==
X-Gm-Message-State: AOAM532yihD4g/JhgdBPmauP8c/b3PHy4CVK6tkgxpc/jmIOACxD1SIK
 SVVfGHmj2nZ5oM/rmEz18AbCEavvZZfpNfYe/qyfdw==
X-Google-Smtp-Source: ABdhPJylswhYS8F4TyxPo8vzjQfGSw+My43raz8y1hBk5uNq4ma5dn4gMAr3+HLi6N3zsrnCjLR1O+p4nSGhYfBM834=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr13604624ywk.27.1645437458949; Mon, 21
 Feb 2022 01:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
 <20220210141931.291712-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Feb 2022 17:57:28 +0800
Message-ID: <CAGXv+5HKbd+w0r+YC59Tw5mZf4P1gqYX6sysvoFj-JxUKH7hDA@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: mediatek: common-v1: Commonize spec_pupd
 callback
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_015740_463374_F0C21B2C 
X-CRM114-Status: UNSURE (   9.75  )
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

On Thu, Feb 10, 2022 at 10:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Reduce code size and duplication by using a common spec_pupd callback,
> which is possible to use on all of the pinctrl drivers that are
> using the v1 pinctrl-mtk-common code, with the exception of mt8135,
> which has a different handling compared to the others.
> Since the callback function signature was changed, this had to be
> propagated to pinctrl-mt8135's spec_pull_set().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
