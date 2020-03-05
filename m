Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B708C3F2D2
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 17:03:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 228C320870
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 17:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qICe9ahD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=anholt-net.20150623.gappssmtp.com header.i=@anholt-net.20150623.gappssmtp.com header.b="QdJpsICt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 228C320870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anholt.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RScimq5QsV7Rn/DK29nWpECKuFzETd4figt76w1i4Y=; b=qICe9ahDO3Y1O6
	1uKT4dCGWr21DcYIgdO45Z5cC2MJEiKMoDG5N75fK1gaiBdYU2okMWKGZ2v2NuNTSasj0ekC5FhmT
	D08J3KVLK21JDX9TzaXUB0Dun4AfSowDfGkpcux0MpkBwPGQIDV26BnOWVI9fEBLHJ2maB5GUZQzy
	9UcPX25A3Zr6oh1EmabGQ8htkwU5LbAP5SgTPb64Y8AyWex3V4uIsIpRMv/wDWPmG5SjLvGkO/Nvk
	bStOQSZE5oozU9M6UMpeQCa2+75VaOh3MrmznjUvciiXbTGbj0DssgJmFRYCBJpGT3dehOfzitaq5
	8vjy7ibkzsGvLT5I1coA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9tuA-00077O-Io; Thu, 05 Mar 2020 17:03:26 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9tu7-000766-NS
 for linux-mediatek@lists.infradead.org; Thu, 05 Mar 2020 17:03:25 +0000
Received: by mail-lf1-x144.google.com with SMTP id s23so5224525lfs.10
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2020 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W2UjAEkYLoxg6JgLNx0dN+e49hTl06XZg+T5mliqMNU=;
 b=QdJpsICtDG2FI/4Z9M6lKYAcG0BpjpbXK8rLQyA4OEixlsxjDiGx3To1lir1sBp1M9
 UwuoRwaVCnVgUPq4inbZJ3TxCkxCrFEJn1E6DTKoLoG9iHe+E01qy4ui4vtj9Q36JSXp
 ZqI3vZjzXINJNR2WZQYS26NJieBM4iEKc5bwAVwHReucih3l3k93tS1OUlLleRX0o1y1
 KtuaE/jXH3s5Pdf2YA/jnZsd2GI9LGTK5wvLZgDIrxGSZbyinFeR134NKThtgyXxUoJU
 f3VfKoFSVmnBne9A3FTkdC4acYw5/x1ZZwLrZ04c0wXHMYb/1RofGGRyRmlBqM+aIrD4
 1aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2UjAEkYLoxg6JgLNx0dN+e49hTl06XZg+T5mliqMNU=;
 b=UPtFNw0GnUNt4LDIo0k+Xc0TODesBFY3I8vL976nqv6ntKqhzgWKWZdnI7TbUOxHBr
 dxTQWFNWROJMma4ZsQMpSfA//EMcSOSfMAvEmtbmW6aCwXoNYEsPh5+Bma/YELr99Q9f
 q0/rICQ6t5xCDojFeASgcymRgGwVJlSTTR/geH6p71YrCQZrHiETpIvb6L9P8rHAQutb
 gHBHlUdl3Zx4yDyut9KV1Y+xEjrxJpr0qzHxbTbY95K3+Q1loV5LOc5SObyygqcFKTuU
 Z1LZL0NqH/3TIeVzEwBNcFP1vn4zS0CkEvqqvmf7VqtXYPp9B2Cu9OyHuK6ysNLg80sp
 3fnQ==
X-Gm-Message-State: ANhLgQ395v2+PXCxVw92cX3GHpHLvKbnR0T7kkHSa8ivtxFzUT0DtMqR
 tLFdxWYLx8pO21GMuxu1tv9z0VMBPX9am5daz4JvDg==
X-Google-Smtp-Source: ADFU+vtj5gp1/LY+e6ph9lZLVyP4h9/sF6S8jMp7MXl11AHO2LcgdwYrHVm+Ah8nGom52hUhqSxPo5r0KmpWtLmClCc=
X-Received: by 2002:a05:6512:692:: with SMTP id
 t18mr6077856lfe.212.1583427801701; 
 Thu, 05 Mar 2020 09:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-19-tzimmermann@suse.de>
In-Reply-To: <20200305155950.2705-19-tzimmermann@suse.de>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 5 Mar 2020 09:03:10 -0800
Message-ID: <CADaigPXaBRx+DG8TP-BPFycqwzmf-2NMQX6cXQP69MTVE6CzAw@mail.gmail.com>
Subject: Re: [PATCH 18/22] drm/vc4: Use simple encoder
To: Thomas Zimmermann <tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_090323_895142_80DAE8BA 
X-CRM114-Status: UNSURE (   5.78  )
X-CRM114-Notice: Please train this message.
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, heiko@sntech.de,
 David Airlie <airlied@linux.ie>, stefan@agner.ch, linux@armlinux.org.uk,
 paul@crapouillou.net, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 krzk@kernel.org, sam@ravnborg.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 festevam@gmail.com, abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com, xinliang.liu@linaro.org,
 ludovic.desroches@microchip.com, kgene@kernel.org, linux-imx@nxp.com,
 ck.hu@mediatek.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, p.zabel@pengutronix.de,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 john.stultz@linaro.org, jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org,
 kernel@pengutronix.de, jernej.skrabec@siol.net, kraxel@redhat.com,
 rodrigosiqueiramelo@gmail.com, tomi.valkeinen@ti.com, bbrezillon@kernel.org,
 jingoohan1@gmail.com, DRI Development <dri-devel@lists.freedesktop.org>,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 zourongrong@gmail.com, linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 5, 2020 at 8:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The vc4 driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.

Acked-by: Eric Anholt <eric@anholt.net>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
