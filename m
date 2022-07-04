Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709D5C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLjEVh4Ej9fAcoligCRKT/RdcSrDS4ty6Do+1MEwQio=; b=gHG3+ArCZeFKwoivPXGwqX4xJl
	ECGxHzhMzZx7n7092ng7iXivtLorn1Y50+ZM/tGH2dKfHQx/c8gfJJR1BQUjI/fssWhc6CNME1n0J
	fHPU7uygQ8Q+efz6MychXkH4fs8f+3CgmTuJJe67VFQXRMbY3TFWahwFUXZutGrScyANQ08qemyDz
	8sIfs9dgFJDMO1Pe6FY2BO1mFkj6dpfYOEW5S+jAH/4bY9XTTRmO7YDYFl2iQKRy9l/6/HlcE93eV
	dHtZaKKNqmQJHYQiEwfZN5fwTm/tZ3MlYWVYyVZWYaEtfM6cjwuwED+Syy5OeDmbfpgH/PpN8VLZJ
	Y4NkWfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8GZ8-005jZq-IA; Mon, 04 Jul 2022 07:32:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8GYx-005jTj-H4; Mon, 04 Jul 2022 07:32:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0743061036;
	Mon,  4 Jul 2022 07:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCEEC341CA;
	Mon,  4 Jul 2022 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656919925;
	bh=Om+nqyQlk3ApwySlhU6XCtK3ALi3IXJUqmVS0sAksoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvvNeEXhguJ/fBeZ8UhgLDURBTtN/9EI/GZpfcpbZR6tLtCBuTNE7bHHQEldnGzme
	 X/e9TPvuqzXU5aOFXzaOpylhZFZYcR2YYa0Va3ZZVvKKQiS+6AKPbuIwRLGzireZUS
	 YAxlyXr9wFqsv4s2m69GXLBTecgeYE66bAwkGkkY=
Date: Mon, 4 Jul 2022 09:32:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	jic23@kernel.org, lars@metafoo.de, lgirdwood@gmail.com,
	broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v4 08/13] usb: typec: tcpci_mt6370: Add Mediatek MT6370
 tcpci driver
Message-ID: <YsKXcnys2Wa8Zz0p@kroah.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-9-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704053901.728-9-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_003207_643004_04ECC93A 
X-CRM114-Status: UNSURE (   9.13  )
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

On Mon, Jul 04, 2022 at 01:38:56PM +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add chip level mt6370 tcpci driver.

What does this mean?  Please provide more information about the hardware
being supported here so we know how to review this.

thanks,

greg k-h

