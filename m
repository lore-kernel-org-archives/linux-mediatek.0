Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7225CD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 16:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aej6QFoETxeFvbQm8/sOYYAdEcWAnghw/7Ynm8n0ucQ=; b=SRl2rAzivasUjf6CAkjH6rQjRT
	6zUCPYmZaVjZmYRWwzxszkm1pcPtvm8GBtbTGY3eJK1D1+7Ibcic6F+vDnbqXCYU6Qc6BsPL8I2BY
	qUZqxKgqUxkFgvSUJUTl7R/74LT86tVln3AZmSqC+T4xRVdpGnN1bEOkzFVf8xSB7QBDclZ1jes0R
	oq+3KuZvfYkqBXIAPWeMPWuGyyCWGFSW2TjFLfwXPpiJBq+X6CK7vI+0VoWyfdmVFdGzmHVJQLJzr
	cD3SaauKiilbd12v++UhB+4k9lCe2dMfpDspljJiPcGtkl+ko+LD0o4BB6Lp+awmMJRr/vaiepJTo
	yAEXImSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs3im-0000000H1W6-1bVK;
	Wed, 03 Apr 2024 16:44:20 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs3if-0000000H1Sn-1Yms;
	Wed, 03 Apr 2024 16:44:14 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4da6995e58bso3886e0c.1;
        Wed, 03 Apr 2024 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712162651; x=1712767451; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aej6QFoETxeFvbQm8/sOYYAdEcWAnghw/7Ynm8n0ucQ=;
        b=bXDZ3+tbyg8Zy85CBNgpAT5K3OIvxtq4VpetZ4ZANBLtO9n3wEvP8Xx/Jl3ywzIsrY
         MVrr4qZHfS2F6NCSNEMscJX7E0hv01N6GUPy2nQtsLXITIuPAnXlxCa28q4Bk6Gfbaj6
         yM+VphIV338ht4L4nRmxNKRVvya8TgG8hFokSkz0HVNl4ttCMaZylBAzcdotziOvSPOt
         auNJRZjhz8xtt4WkBa+KR9wGQfrvfewrZFpPKoVXUSfhJAk0Eaqv5qEBAiYbgfAjP7++
         FFKSX2jFGG4qVwDYB/WWyx52wrg0uH++W1WO0HyyrwGEF32fqG2L6xeScOsPdfkS++tj
         v53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712162651; x=1712767451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aej6QFoETxeFvbQm8/sOYYAdEcWAnghw/7Ynm8n0ucQ=;
        b=O/ITfc/lLuWIriP4UttUQoOEHUKtbYKq1fmR17iELQYkvcbrT8hEZXpyRgPkK3aR40
         zg9UbrW4ucm7GNdEB8ynda+hVUxIC1vKisZUjzi/mxvIcoZ9j8kf0gg/slZeeUqblMPg
         xaDLKy52jHQsb7/pApVgiHgi2bkyQXMyvAwtjANZ2feBA8Y2ZWaAtvF4tpOSDKHlIGlV
         VBleFZOuEh8kh10YOjFnqKDNITqQs97HxMMUMvXwsUqGQ4x9T82X/M6HjJRL5udJbi93
         6pVc4MBQgwpd9hH+RnkfVbFSIzbVNTVe2xHvoBKJ9BYroKR3rC4QoDPNdnHNSmBN5Gop
         AdhA==
X-Forwarded-Encrypted: i=1; AJvYcCWYyV3bxuwaLYVxSV7HVGNkd21+rukq1kJiRI5b3wCQwMo0t6LlF13CDFsv2d4jAcyS2v1WAA0t9bZ8RXBJYcWP/Uij74dywcGvzbSqf+uO6KyQgWqlXyzj2eBwHpis70W7vICSJisoN5RClR930t8sd5frWyZ2qkxXGVIoAtm3zcEk2h3YaGRQg2Owt3Y572CEeroO8WM23Unp3EU+iQ1RcK0kWrTsZ7Q2gbD3vDrxA9JSvo05kD1U3K/758FRlY+m1w7mMxJf+MzPLNQohiHI3/xRAeqosiZhjfzn2JFtZzVy
X-Gm-Message-State: AOJu0Yy/q3jIQ0IG41RZanZ3/StSQOH6t8k8MICPtpsb6Ht39KLnvzss
	SNUw/hMVm2JsMSY/I9foTUkqo5ZFgiJY2I6hOo+29AwzNI/Zz+fq9k6pFGjVq3e4IHlxEeBmqMc
	/Q51UO/DpU/vR6g9kZ2Qrolhe0XQ=
X-Google-Smtp-Source: AGHT+IFEFFEcpcdQfCxRWJYlDuuUETZ0sWBciDlGUMCvLnJmEBIY1oP87nAaJSL5QQDatxb4oTnFcly4MrzzQ8OrF5o=
X-Received: by 2002:a05:6122:499a:b0:4d3:b326:5ae8 with SMTP id
 ex26-20020a056122499a00b004d3b3265ae8mr10815788vkb.14.1712162651582; Wed, 03
 Apr 2024 09:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com> <20240327160314.9982-2-apais@linux.microsoft.com>
In-Reply-To: <20240327160314.9982-2-apais@linux.microsoft.com>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 3 Apr 2024 09:43:57 -0700
Message-ID: <CAOMdWSLavg27YZgnfE2QHjO=4RNmFx_7veAURaPG_=qWX=KMVA@mail.gmail.com>
Subject: Re: [PATCH 1/9] hyperv: Convert from tasklet to BH workqueue
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org, 
	vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_094413_443079_77EA7F8C 
X-CRM114-Status: GOOD (  10.92  )
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

> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
>
> This patch converts drivers/hv/* from tasklet to BH workqueue.
>
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/hv/channel.c      |  8 ++++----
>  drivers/hv/channel_mgmt.c |  5 ++---
>  drivers/hv/connection.c   |  9 +++++----
>  drivers/hv/hv.c           |  3 +--
>  drivers/hv/hv_balloon.c   |  4 ++--
>  drivers/hv/hv_fcopy.c     |  8 ++++----
>  drivers/hv/hv_kvp.c       |  8 ++++----
>  drivers/hv/hv_snapshot.c  |  8 ++++----
>  drivers/hv/hyperv_vmbus.h |  9 +++++----
>  drivers/hv/vmbus_drv.c    | 19 ++++++++++---------
>  include/linux/hyperv.h    |  2 +-
>  11 files changed, 42 insertions(+), 41 deletions(-)

Wei,

 I need to send out a v2 as I did not include the second patch that
updates drivers/pci/controller/pci-hyperv.c

Thanks.

