Return-Path: <SRS0=3FPX=PT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF4EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Oct 2021 16:50:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 884FE60F58
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Oct 2021 16:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 884FE60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYQV9hsJbZk/uxarTATS4e3dagFHISfVUUJerDFYlag=; b=fQTPghoGEZC4Co
	iiyEeIhRjteYDTR7h61ZqW8TXOd5ENgQgr9lz7VBthYlNuy+2oAooZI+aYgGogzZA03gIWKo5mmH/
	J+zz/WhhRo3M9jMaHZ2vs3t/zb8RO+9GP8L7MaL+wqUe0n7J1Xz7dVR6zj77FurrRhkXJxadrKz4U
	FHxElyZl2fNkwtN5FdiukrgUKwPFt+lnxC5xUOnnzKm4yhlFtTnQ6Yu0RZg0PK0K4j1vOnUhbgmPu
	5to6QG8nOhQ4NTDDpsg+6duuxFSkzAPkNWWTb2aLdooKhgVxblKeavR4aa2mZPXEbma3ZTk1lAMqP
	URttWJBtH8A8Af6mZoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhE1u-00EO0r-CC; Sun, 31 Oct 2021 16:49:58 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhE1p-00ENzV-QD
 for linux-mediatek@lists.infradead.org; Sun, 31 Oct 2021 16:49:55 +0000
Received: by mail-il1-x12c.google.com with SMTP id b10so6720812ilj.10
 for <linux-mediatek@lists.infradead.org>; Sun, 31 Oct 2021 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BMVjxcd/zzRQYq1WTivnwAIgAwOjNTLkhJ5Ulnu2Uk8=;
 b=PTto3LGR+d204eIOomzPjb4LyuBs4qAuiWVdDPgZ28UxvJnZmtOqSyp4cjuduOqPaZ
 8zo/BbOnT1gckvw4o7BBChlql2ZdUdpbFF79ZyXx7WlGiy+TRzqQfTWH80hUSRdYCYqo
 MsP5D3BFfcRMQGGTZKRb11Qa104OzHDn7iFzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BMVjxcd/zzRQYq1WTivnwAIgAwOjNTLkhJ5Ulnu2Uk8=;
 b=SCyCOP+Kibpzo7JKa41X7CWYoCUtJ4X4v0iMVAkOPnEB6wUmzGq29bZSJ8qq8H3Rfn
 C0EwreiVjibwddYTG7+ZM1XGvXXttqokHZE6rdwMWxUGCtr8Up3qDdQG9snAWGU3pQsu
 Hb4ew/hG3+yQbQGsuWAu4KoV5z7/WnlEeiaMrB2qSQ7jcy+eA6ps3JWsBeHkxRbhmKfd
 uh+xzOSRdGJUcif1Lec2u1G/5tZdlxiZmEq/Dpx+YSlY5LSyEnmSI94f+H2iBlqzIIw5
 spJOHucU6WIRya6MnwK/gMhZ7iTZsi7pUnz25FtLIdNbO36vD4PFj7LApcCJMRHOasW6
 ncoQ==
X-Gm-Message-State: AOAM532g09hKv8wN9jcXqnjmAEwc9jrDoUVMkWrDsVi59CscuoMaC8pv
 VocKVJI8OVolTB6A3BsZJvuW8ghwaJmmvNXwBkyoTg==
X-Google-Smtp-Source: ABdhPJw/fWI4yBIyNitNSOkjyAfBNm7ZNia/c9sL3FDDYXh1FB6HiazF1EN89RoDXLaaWcyo1HYKuzu3zB4MFn/nry4=
X-Received: by 2002:a05:6e02:148b:: with SMTP id
 n11mr16126184ilk.230.1635698992204; 
 Sun, 31 Oct 2021 09:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210926073028.11045-1-hui.liu@mediatek.com>
 <20210926073028.11045-2-hui.liu@mediatek.com>
 <20210926123022.1b76eaae@jic23-huawei>
In-Reply-To: <20210926123022.1b76eaae@jic23-huawei>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 1 Nov 2021 00:49:26 +0800
Message-ID: <CAJMQK-hDN3xOTU0gcmDWaOKRwPk_h0E7=6nok45mrU3RvgbcHw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] iio: mtk-auxadc: fix case IIO_CHAN_INFO_PROCESSED
To: Hui-Liu Liu <hui.liu@mediatek.com>
Cc: robh+dt@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net, 
 srv_heupstream@mediatek.com, zhiyong.tao@mediatek.com, 
 chun-hung.wu@mediatek.com, yingjoe.chen@mediatek.com, seiya.wang@mediatek.com, 
 ben.tseng@mediatek.com, matthias.bgg@gmail.com, s.hauer@pengutronix.de, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Jonathan Cameron <jic23@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_094953_890518_5A40E870 
X-CRM114-Status: GOOD (  12.41  )
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

On Sun, Sep 26, 2021 at 7:26 PM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sun, 26 Sep 2021 15:30:28 +0800
> Hui-Liu Liu <hui.liu@mediatek.com> wrote:
>
> > From: Hui Liu <hui.liu@mediatek.com>
> >
> > The previous driver does't apply the necessary scaling to take the
> > voltage range into account.
> > We change readback value from raw data to input voltage to fix case
> > IIO_CHAN_INFO_PROCESSED.
> >
> > Fixes: ace4cdfe67be ("iio: adc: mt2701: Add Mediatek auxadc driver for mt2701.")
> > Signed-off-by: Hui Liu <hui.liu@mediatek.com>
>
Hi Hui Liu,

After this patch, mt8183 tboard thermal sensor[1] is getting incorrect value:
Before the patch:
/sys/class/thermal/thermal_zone0/temp:41488 (cpu)
/sys/class/thermal/thermal_zone7/temp:35433 (tboard)
/sys/class/thermal/thermal_zone8/temp:33709 (tboard)

After the patch:
/sys/class/thermal/thermal_zone0/temp:40365 (cpu)
/sys/class/thermal/thermal_zone7/temp:69781 (tboard)
/sys/class/thermal/thermal_zone8/temp:69014 (tboard)

[1] https://elixir.bootlin.com/linux/v5.15-rc7/source/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi#L862

>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
