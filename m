Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B698C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 09:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A09E20787
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 09:10:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P64cP7Md"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A09E20787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpp0zn9M6R7iOe2VupqsFXZa6v18yyrwbT06wCeX1Lk=; b=P64cP7MdrNJRxu
	1N16eyzdXAy1t3/VJbIHxYwCPjn/qEGbOYmD1C1yzlJIt3F4XWzilKYYhvfvolO4wJbsOUX7tHfAh
	zVuZAIFRAyJHuPp4XUQWU3NVN7zFhUQjBVGesRX2TOG/Wq24oitnZrJs7u8rrretHbFDaUI2ABjiF
	hqm4ZVqJgBqrNHyDNoId6NQhOw2vaLG5QUoBqmPC11q9ZH8XFmX67Iv3DB6p9n23HUpHFZn7WjiJg
	PgO8i8O6KehQuAcNOJBq9MF5uCYDwbVog7QCgIxDFWwHREUI2FGNVF58SfWmjgRwB5ftplVBKJy6M
	VvNfiQf8G2WF32p4qARw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jds4l-0004rL-UF; Wed, 27 May 2020 09:10:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jds4R-0002h2-Ty
 for linux-mediatek@lists.infradead.org; Wed, 27 May 2020 09:09:57 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1jds4L-0002G2-J5; Wed, 27 May 2020 11:09:49 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1jds4K-0007tp-5w; Wed, 27 May 2020 11:09:48 +0200
Date: Wed, 27 May 2020 11:09:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v9 2/3] drivers: input: keyboard: Add mtk keypad driver
Message-ID: <20200527090948.tviafdsaaiuiso33@pengutronix.de>
References: <20200527083137.56566-1-fengping.yu@mediatek.com>
 <20200527083137.56566-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527083137.56566-3-fengping.yu@mediatek.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:03:06 up 194 days, 21 min, 194 users, load average: 0.20, 0.22, 
 0.14
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_020955_959712_AC5E1ACE 
X-CRM114-Status: UNSURE (   7.93  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

just found another typo.

On 20-05-27 16:31, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>

...

> +static const struct of_device_id kpd_of_match[] = {
> +	{.compatible = "mediatek, mt6779-keypad"},
				 ^
			This is wrong

> +	{.compatible = "mediatek,kp"},

I would also drop the generic "mediatek,kp" compatible. Instead we
should list all supported SoCs here.

Regards,
  Marco

> +	{/* sentinel */}
> +};
> +
> +static struct platform_driver kpd_pdrv = {
> +	.probe = kpd_pdrv_probe,
> +	.driver = {
> +		   .name = MTK_KPD_NAME,
> +		   .of_match_table = kpd_of_match,
> +	},
> +};
> +module_platform_driver(kpd_pdrv);
> +
> +MODULE_AUTHOR("Mediatek Corporation");
> +MODULE_DESCRIPTION("MTK Keypad (KPD) Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
