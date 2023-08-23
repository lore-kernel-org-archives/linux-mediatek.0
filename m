Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6A4EE49B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 06:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lB8ZbVq5sQ7DzHOBHLugPDAWi9TKXlIcXjvdJWhqI+A=; b=sKKbxs4UlAy90iDfwRpljDB4Z4
	lCzizke6kUVLFjhMoVTl7Vb/H+qdP547FEWMHE8H54q3mlaW6IxeGr+BXL532YpWaURvKGZPo0Bsz
	RglfQ7nn0PLDaFRV0s2YB4YncANPMdw845xATdwwPRYlAAshX9tQ+VPJcT9Xzb9j2RM1PcTT5RB5Q
	VFwmVFU67Fkefaw0EKyBHzCVVcxN5k8iEcoXKACNdbGjCxJjFJTWz2bR9S3WuXtWbN+dc5vgAWrTp
	8hiYPsVRf0j/ocfWJDWWi5yRwDRtypNGRgxS4aCcYncxgXKOCijkqNt1QDAjGHjTi7UU++J7Toquy
	crDqyz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhmh-00HPyr-1b;
	Wed, 23 Aug 2023 06:56:07 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhmd-00HPwu-1J
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 06:56:06 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-48d0e5b5a36so1172048e0c.1
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692773761; x=1693378561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB8ZbVq5sQ7DzHOBHLugPDAWi9TKXlIcXjvdJWhqI+A=;
        b=IClLffrpZcMu+6LKkWMb2iYMjsTjrkaUqrYA7WVBTBrZu8Rk9cEmTcQpNzwliaEYOs
         Fh9iUcv2UOIcNrn97Bt9kXa9oRjEbVR0W3uxBGa2NbMYqsgayR3isNmKww9L5bY2Y7HI
         RatRDyLvwjy/V+In9dVfKaPi6OaFcpK+NDakk0Nv89OnO9fYh5YklBNNKQABownwxaLy
         Vc/ih1L6v1WPG18V+1O9nhhKRxifefgFowtPdN/aKz/n20BVZNJSUY38+FJAGH0gEmZp
         idlDOcjuIoF4kaalYRzuLi6zFQOZYQjBzp9E75g8QeWRgjkGt3ZOSHq/LO3lLUIy5rai
         33EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692773761; x=1693378561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lB8ZbVq5sQ7DzHOBHLugPDAWi9TKXlIcXjvdJWhqI+A=;
        b=AzKl3/mOK2/lWrvK+ViSahFvOJgH0JCdOWjxGV/WNkwCrF1IHhG6Nywtf0u+YnJzkn
         8rNKB82bS4ij3u6dWZ1KXvssgbrBLJJdoyukK9xcZJw8S7ib2YhuHZuq6PPxeTp9Wgw0
         wGHyaNXupk9bN2xbWX3FyIgHFo3bNxitT2qQkH6H1OZlFP2YZKucYL9QbNofN/xL2lWh
         J1WPjibgwDKPI9b3VkCD4etDGEsT0UxZPfW+U9PSq5PlMxqF9Cj00Z9V48LqblX5LRsy
         MjOqZanFwTkwd7q+PMakB3f07VfgufMKAQ9ps9JHzA7sJ8bDi4fOQcX/YVDA7BmgRMP/
         1BZA==
X-Gm-Message-State: AOJu0YzXXglzNqSSP6SaAFbpNgXmx7dlyeI+yuJeE3C3kdAScOx5/Vh8
	WbR5AeGHhKALcFdlmcGjRaBA1y6oS2YjFsiYCve8uQ==
X-Google-Smtp-Source: AGHT+IEwjcDx1d3S7SNyrAkvaRo8eUvQkQP4M2xlywseolmmO9jwKjqIKIoGVYIjaFiR0hfjVai9PSjnU42jN3gPoW4=
X-Received: by 2002:a1f:e2c2:0:b0:48d:13e5:1376 with SMTP id
 z185-20020a1fe2c2000000b0048d13e51376mr7597851vkg.10.1692773760791; Tue, 22
 Aug 2023 23:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230822131237.1022815-1-lizetao1@huawei.com> <20230822131237.1022815-25-lizetao1@huawei.com>
In-Reply-To: <20230822131237.1022815-25-lizetao1@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Aug 2023 08:55:49 +0200
Message-ID: <CACRpkdY1Q0U6Yh69hW6FYJbDf7a94=UnwinuKaUnz6aqOaWaLA@mail.gmail.com>
Subject: Re: [PATCH -next 24/25] spi: spl022: Use helper function devm_clk_get_enabled()
To: Li Zetao <lizetao1@huawei.com>
Cc: broonie@kernel.org, chin-ting_kuo@aspeedtech.com, clg@kaod.org, 
	joel@jms.id.au, andrew@aj.id.au, florian.fainelli@broadcom.com, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com, 
	olteanv@gmail.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	conor.dooley@microchip.com, daire.mcnamara@microchip.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	heiko@sntech.de, linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_235603_525135_A327B691 
X-CRM114-Status: UNSURE (   8.09  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 22, 2023 at 3:13=E2=80=AFPM Li Zetao <lizetao1@huawei.com> wrot=
e:

> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepare=
d
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it i=
s
> no longer necessary to unprepare and disable the clocks explicitly.
> Moreover, the label "err_no_clk_en" is no used, drop it for clean code.
>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

