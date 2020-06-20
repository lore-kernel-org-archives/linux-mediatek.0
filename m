Return-Path: <SRS0=iUBX=AB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9FFC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2020 16:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA7020DD4
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2020 16:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJvq01Kh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPRzqSsX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA7020DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdCfSrlTdEY9iaUXd3RJ3JTzr96d6xIug5PwNmmG13c=; b=hJvq01KhIlik89
	Vahp3Qy0hI9mbab4D/oa/G6P/NDdmf+lGZGTjttpZ+Mk2vuf20+Uh/qjDkzlHucfwMkoYX9vLttSR
	gv+uyNPrLxc092DMsrZ4Kf55S98gL71TwZo73hRtP54pQucc8T87DeJQZ5PgzAcArVCQYdrxPHyx5
	LxOTkZFxWj76X/V9KwXr44Yf32Ik/BWIKn6qZSewpo8VjzPI+D4BX57rd9hpmo6PUFj7yJkJbT8rl
	q9B+TIx3Q9dI2NsSrobGkwZx2f/l5a5PhCifsufwW1cDe9nRYkDopgqZ0wXn0uvvpXpfDd6yKxNs6
	1WnZIfAx3D4TqxRS6Gzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmgmA-0003Re-JY; Sat, 20 Jun 2020 16:55:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmgm0-0003JD-Di; Sat, 20 Jun 2020 16:55:21 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63B9C206C1;
 Sat, 20 Jun 2020 16:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592672120;
 bh=jh+Dtd6XxyvfeBpJwr5NXJeG+cGq9HQ6DALEAl2vhK8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JPRzqSsXNNflaSN9W1VKLjKK2Tr5YQxLrly67XS/Qe764zuYMr+E9uH1bYZASM9Hv
 nA9zxaJ/PEbaeWS/EdE2E8sgv8IGN1OZPB2q9h/1cC4du8Aj50MfGUkH/37NFIzkO8
 b6E2rydpktC6hsBzvJSxhwYRnDREOCga+4RJ/QHw=
Date: Sat, 20 Jun 2020 17:55:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 0/4] dt-bindings: mfd: Add bindings for the Mediatek
 MT6360
Message-ID: <20200620175512.1e11d12c@archlinux>
In-Reply-To: <1592567631-20363-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1592567631-20363-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_095520_485221_297D7051 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: gene_chen@richtek.com, lars@metafoo.de, pmeerw@pmeerw.net,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 knaack.h@gmx.de, matthias.bgg@gmail.com, shufan_lee@richtek.com,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, dmurphy@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 19 Jun 2020 19:53:47 +0800
Gene Chen <gene.chen.richtek@gmail.com> wrote:

> This patch series add mt6360 sub-device adc/regulator and
> fix mfd architecture and add dt-binding document

Hi Gene

Please make sure you include linux-iio@vger.kernel.org in the cc list
for any iio related series.  For now I'll take a quick look at the
ADC driver patch (and +cc the list for my reply)

Thanks,

Jonathan

> 
> changelogs between v1 & v2
> - adjust binding document schema include mfd/adc/regulator
> - adc: use IIO_CHAN_INFO_PROCESSED only
> - adc: use devm_iio_triggered_buffer_setup
> - adc: use use s64 to record timestamp
> - regulator: merge regmap to mfd driver for r/w with crc
> 
> Gene Chen (4)
>   dt-bindings: mfd: Add bindings for the Mediatek MT6360
>   mfd: mt6360: implement i2c R/W with CRC
>   iio: adc: mt6360: Add ADC driver for MT6360
>   regulator: mt6360: Add support for MT6360 regulator
> 
>  Documentation/devicetree/bindings/mfd/mt6360.txt |  122 +++++
>  drivers/iio/adc/Kconfig                          |   11 
>  drivers/iio/adc/Makefile                         |    1 
>  drivers/iio/adc/mt6360-adc.c                     |  388 ++++++++++++++++
>  drivers/mfd/Kconfig                              |    1 
>  drivers/mfd/mt6360-core.c                        |  541 +++++++++++++++--------
>  drivers/regulator/Kconfig                        |    9 
>  drivers/regulator/Makefile                       |    1 
>  drivers/regulator/mt6360-regulator.c             |  485 ++++++++++++++++++++
>  include/dt-bindings/mfd/mt6360.h                 |   15 
>  include/linux/mfd/mt6360.h                       |  240 ----------
>  11 files changed, 1389 insertions(+), 425 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.txt
>  create mode 100644 include/dt-bindings/mfd/mt6360.h
>  delete mode 100644 include/linux/mfd/mt6360.h
>  create mode 100644 drivers/iio/adc/mt6360-adc.c
>  create mode 100644 drivers/regulator/mt6360-regulator.c


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
