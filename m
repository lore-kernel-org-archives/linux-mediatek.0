Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A5ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0o7LEef+BZuEidJK6a/jvVmiWZ9XRI7Dey6frbpCPk=; b=NfSRwpGN7svlMUO3PVNtqqVeEC
	itAsp10FU7N+Xk8nuRhGau8xUT3Zg+nFlTAS/2/cDeBcDV5vbS+XozkVeV1SK7xPKmgGE4jBEUMn/
	8WDW5whZbUdUZ241UPcnXmjdglMapBz8j/KSkbqbQ2DOM3oLZ7W5T9qjkE1GEz9TssS/qrdayYrRn
	1TtWMXCQwR0xI7jWVEUwBaqMqJx7t162JXolqrWkmR3ZnM8lN6NR/B5iPj+py3ly+AHbe75I1ocm5
	c2UGnZVxeSk/yybCDv9XbM4iZcHJpeTpskuGmB4/HJl/OlNeiudyl6FMG2c3Df5DBYFGx6whuTsoG
	RW2ImCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaD9T-00Ao0U-E2; Mon, 19 Sep 2022 09:33:19 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaD8G-00AnJk-An; Mon, 19 Sep 2022 09:32:12 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A12EB5C030A;
	Mon, 19 Sep 2022 05:31:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 19 Sep 2022 05:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663579916; x=1663666316; bh=V0o7LEef+B
	ZuEidJK6a/jvVmiWZ9XRI7Dey6frbpCPk=; b=uS4UCKxajYjRcBSiGgj7YYfQgp
	7CV1pvuYtM22JSYUOoBecJOFPdcUwfEOmxkQHAqBG0hGgvMGJcw2g+WAe0Rze9YN
	ifKNitab6fe+/qGmKK0RjXn8cQMNFQ2j7+IcjZTPrR4/1/14H0OI2Si+nCYo11xl
	cudG4XPZVi+uMesbwiK1SXgcSsrQ7nfHogd/e8UiQEaT7yYdCvMV42VC8NdPQD4Q
	Vh++z4i3eL3+VJETP8Vh7JYbudlGzBsa+E8ZYDRnFNx4Fl+cIHNOIz5gvCL1Ojk/
	hpvXhCbymHebLhXvGdR6QSgqqrBIIonftKnOq+I0MxoJnfWYyL+fmvJ1mPJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663579916; x=1663666316; bh=V0o7LEef+BZuEidJK6a/jvVmiWZ9
	XRI7Dey6frbpCPk=; b=I2bfSFrcOnMc6+xYDDMwW8dye5KJa46GzTzKhBHM26a+
	lQcwJqJfrxMkN7hGy5qGDS8Yb7OW4ojzzqPaiodQ+O1UepGLM5jAo6E5Ig6ETqgb
	wz1QGaFzLQAMNuh8pAUazhZcTVBbyOUf9zal+7cDkQ2id3jCWBivEcW5CJZmmMRn
	oGOeFn0lLyM9P2fe1gxhZtPfOykcoG0jxXZLoByNC0+/5CZhT2YFa1NQhOLExKk9
	GHgZx6oxO3Qxd6TOHIYtRogGp7rseQOGyJbfLJrsAuZOJWx35yOAOzxkurDzqa+a
	nvxVI5jVQJYDRLHNybSCXuk7jdzG5DgUxYzQKLbnfg==
X-ME-Sender: <xms:DDcoY-N1INGZqGF6Omi4QOCScnI4OUQwoDnkh8hYkBrc49uphyYwmg>
    <xme:DDcoY88_9gNC2cPybmgl2wOlVlZ3vi8Y4EFLUN_DXmCEBMn-UUX4ORJRRUJ7mVve_
    eLkFq177DO-fw>
X-ME-Received: <xmr:DDcoY1R9YTmgAY0Klsoh4uhks_vOgQC5J7_GVh1hw4WWp5jJFcxNwNqMtcc2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvjedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekje
    euhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:DDcoY-tAb6tZ_QcyeApGlk3lfl5DXtxruRqO_SN2g27UONvrJRnOkw>
    <xmx:DDcoY2eKmdGEqlu375C2KRf23PguPbIXx3Iz1O9MBNo9tgSPjJAXzQ>
    <xmx:DDcoYy0Uk5rA1eHMjxHFn4bzIUnwUsyKN0iasz9iiPCSFbsHcAb67w>
    <xmx:DDcoY3uZlR4e6DEivEyVIwRZ6mCdzZ9dgz8K-v8Lhqs-TskkiYqMTA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Sep 2022 05:31:55 -0400 (EDT)
Date: Mon, 19 Sep 2022 11:32:24 +0200
From: Greg KH <greg@kroah.com>
To: Li Zhong <floridsleeves@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	etremblay@distech-controls.com, l.sanfilippo@kunbus.com,
	u.kleine-koenig@pengutronix.de, robert.hancock@calian.com,
	ilpo.jarvinen@linux.intel.com, matthias.bgg@gmail.com,
	p.zabel@pengutronix.de, jirislaby@kernel.org
Subject: Re: [PATCH v1] drivers/tty/serial/8250: check the return value of
 clk_prepare_enable()
Message-ID: <Yyg3KKDCLaQUb2P0@kroah.com>
References: <20220919085455.1582310-1-floridsleeves@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919085455.1582310-1-floridsleeves@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_023204_737176_3CC18BD3 
X-CRM114-Status: GOOD (  16.27  )
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

On Mon, Sep 19, 2022 at 01:54:55AM -0700, Li Zhong wrote:
> Check the return value of clk_prepare_enable() which could fail when
> cannot enable the clock.
> 
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>  drivers/tty/serial/8250/8250_of.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
> index 1b461fba15a3..23e9b9e8c940 100644
> --- a/drivers/tty/serial/8250/8250_of.c
> +++ b/drivers/tty/serial/8250/8250_of.c
> @@ -298,7 +298,8 @@ static int of_serial_resume(struct device *dev)
>  
>  	if (!uart_console(port) || console_suspend_enabled) {
>  		pm_runtime_get_sync(dev);
> -		clk_prepare_enable(info->clk);
> +		if (clk_prepare_enable(info->clk) < 0)
> +			dev_warn(dev, "can't enable clk.\n");

Again, you check but do nothing with the error :(

