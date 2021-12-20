Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD21C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXs6kSCrgTv4FvUzeMlZUciIWBNOHw79SjMi08+hriw=; b=Yqi0cF+Em47zw0
	AQE//XEyyhrMqGIAKvndTqMQUMsyTaJn2sMvrgD3MX7N4EIefOa/uSmYefPtcvdoK0brqXiCAvV5S
	WD1U6dPiOwIY7somqYRKtDOuzdbC1jTMaghX8cyDMCqzDaxPaGmk/XrhYifmLNzt4tO2Y+Ggav/ef
	98VY2k5fvCOc3fmP8PkT48rzpINKUUcjlKY5TuVsaK/Z7r/USyl7+mehkzUmdqAcWuiR06cgo7YxM
	Vl7z48rYUV8UDGH/CYGXP5CgQSe7qpCIwmeVPt/NMCUia1oABmEB/D0Wngo+2T2WNWlY2i0dMk+2c
	tzSpk310ZjSuzjTBvRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzLN9-003GMP-NR; Mon, 20 Dec 2021 16:18:47 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzLMw-003GJt-9F; Mon, 20 Dec 2021 16:18:35 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8n8I-1mNJ6u1vPC-015ts3; Mon, 20 Dec 2021 17:18:30 +0100
Received: by mail-wr1-f46.google.com with SMTP id v7so13868565wrv.12;
 Mon, 20 Dec 2021 08:18:30 -0800 (PST)
X-Gm-Message-State: AOAM5307ON6cx9PCOoNiGhCSJz4fXnai/f6Lxkuayq5IzhMJuoAPu9IV
 E/t8c4ab8eLv7nOuxfNjbxpUqBGWk73Bvg/NcpM=
X-Google-Smtp-Source: ABdhPJyA2LGJ0uydHgPL3F8iobo0HnKBt8FXDwHRu+xqKAdhr7la//Nq7B9um0JBzW7e91O9oTfXHdgSG5Qim03j8Lo=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr13221348wru.12.1640017110131; 
 Mon, 20 Dec 2021 08:18:30 -0800 (PST)
MIME-Version: 1.0
References: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
In-Reply-To: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Dec 2021 17:18:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
Message-ID: <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: updates for v5.17
To: Matthias Brugger <mbrugger@suse.com>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ben Tseng <ben.tseng@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Prashant Malani <pmalani@chromium.org>, 
 Sam Shih <sam.shih@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>
X-Provags-ID: V03:K1:oTpDHgAcFZg6piqP69qmRLSCzJzQifPqbQWClIk1ZU4RWF6HKzi
 FKIfGWErxP8kOXwDR/iKSU2+RWK5K1BvzEon8pXXFUHW3FOdMLdaIU/W/VBcjPJv7VjMhmm
 wbYf3wbQf/2VTzRZlEFxdrk39CtQMMrsWhgnWSO+uqNhADQ7GQvdh1g3+Pbq/hIxgpbG7EP
 gU/n0YJtKtO6c8EG0jIqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1teXmFSPPQE=:L2LAz5UUciSF8b8klNAY3c
 yL7GQgaRhcJyAynOfA+DmXnGk+wY73aiJ3nHI4NvuMMe1VhaOoyuKhqjQS4L6ZsGRdsYKDM1t
 iXqTzQ54n1V3Pr2+HVEkro4iKbQTPGw4RK+24yW2VIOUwl3RMSDUqgQ30lPINSqUR/pkCzFg2
 Ft0bnp9n1gKY2OcAjmdXmLNtvF+Zp6RHzAZ1fA038M0oR76LjfdnA8zsvzFH/7QUBnaQ7CNai
 azkzC/4hczUjMp3yYwOztQX3G9+I9rjQwBGHpux2+87PY0GtpQW61xYw1lLRFrVkDdB7mrxGa
 8eW22+VzsLxTkjqHOZh5nQS1L27T9/1qd706LUeBmxMyu4sYCsx4taqGy9ADp47qs1xOzmNu3
 t5kwKDZSOK/GPZjyBhRZRSJ9RO1Wf4TcWe8OggIdC0cNWBVU/GY8rBgfG180MnchhaDC90hQ7
 o5UkQGuPHaosJDUdkTU2YbOqcIVmXYIK0Zn2pWp8oT8giVflN1N0YZBVsD/xmPcZ0eUpzCUCS
 wbrTYHhH3187+2S4eONvzCH9YqhcRX70fTbkxKBApLNRvYLvVX9LmPwMZyfn9LjU5zS8/yyhk
 9VT6upLFTvZN/IpwAAP6klZJTzkqcLPPmXOupHLVxNipavGC46giucPIf+Luyyz+ohk6huQsC
 VYwTOxQrNsbWrUXNbh3DTEJjVwfgxRZjMTP2ypp7CIUyi7zCK8QGPc3layzAuE+Z03xi7cl3a
 kIctMryTkroWxOfy1Ccde3A6tJ2c8vBU+H78EtVD17n897cQFj06xR5p2oDBE62Be02NmqWQ8
 JzYYCTgMkVKWzQOOeTf7zw6iI2QTShTtBm+mbjkrNHR6Mck21w=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_081834_635029_F16B51FF 
X-CRM114-Status: GOOD (  14.74  )
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

On Sat, Dec 18, 2021 at 9:42 AM Matthias Brugger <mbrugger@suse.com> wrote:
>
> Hi Arnd and Olof,
>
> Please take a look on the below patches for aarch64 based MediaTek boards.
> In this round we add support for the mt8183 based Acer Crhomebook 314, as well
> as we add support to several SKUs for mt8183 based Chromebooks.
> Apart from that we add basic support to the mt7986 in both variants (mt7986a,
> mt7986b). The difference between the both SoCs are the pin-controller capabilities.
>
> Hope you are fine with this pull request.

I've pulled both tags, but I have two minor comments:

- please put "mediatek" into the subject, that helps when looking at
the pull requests
  with pwclient, which does not show the author by default

- I was expecting you to send a branch for the new EN7523 SoC as well. Did that
  end up not making it in time?

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
