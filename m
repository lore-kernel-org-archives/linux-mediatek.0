Return-Path: <SRS0=UIhI=6X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CA1C28CBC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 09:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DD1217BA
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 09:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nFbI2m5D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39DD1217BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnO+QUgCr/ZKkl6eman0xx6G1j3qcOaGy2lJnIlBn5M=; b=nFbI2m5D7KXuV/
	KeyGJovk9dZcvPdef+h96/pD5NVATiN+3SlKJB4icPDHIyKstHFKKe9lsuRQuAEaYTxTGL//VagDY
	oOpQg2u4LQHC1+0ckNhuzD2f9G8E618wcYYeGOB4fFZgzg13lyA63kad+9xx+4rkloQvF73dD7FbH
	zMTjbZfyOyNPXLH0wqqWWbv+gdjYmliCon8Us7lyjwiGHQop/uu2chIC1dNVWhKr45qdtpZnhbj7U
	cej8Z16RINdtR3hP668QaEY/PZwUMnFv4l6Ug5K92SxfhBBTYqWO9HoTx4m6iIJDz6cA6XzREQdrs
	Z1QV9fl2Xn6soQJoKQWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXLxG-0007P6-Ec; Sat, 09 May 2020 09:39:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXLx8-0007HF-JI
 for linux-mediatek@lists.infradead.org; Sat, 09 May 2020 09:39:27 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1jXLwx-0002uz-Fz; Sat, 09 May 2020 11:39:15 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1jXLww-0005mD-2O; Sat, 09 May 2020 11:39:14 +0200
Date: Sat, 9 May 2020 11:39:14 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v6] Add mtk matrix keypad driver for keypad on MTK SoC
Message-ID: <20200509093914.qidkjwkp32gn6td6@pengutronix.de>
References: <20200509020458.8359-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200509020458.8359-1-fengping.yu@mediatek.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:36:19 up 176 days, 54 min, 170 users, load average: 0.06, 0.07, 
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_023926_630044_D8529F48 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yu,

sorry if this is not your first name..
Something went wrong with you v6 since you are sending diffs to files
that are not present in input-master/next.

Regards,
  Marco

On 20-05-09 10:04, Fengping Yu wrote:
> Change since v5:
> - remove unnecessary include files
> - remove redundant comments and newlines
> - use local irqnr variable instead of member variable of mtk_keypad struct
> - use regmap to read and write registers
> - drop kpd_get_dts_info directly into probe function
> - use devm_add_action_or_reset to avoid goto error handling when do clk setting
> - use devm_request_threaded_irq api to request irq
> - remove platform_set_drvdata
> 
> fengping.yu (3):
>   dt-bindings: Change keypad documentation schema
>   drivers: input: keyboard: Add mtk keypad driver
>   configs: defconfig: Add CONFIG_KEYBOARD_MTK_KPD=y
> 
>  .../devicetree/bindings/input/mtk-kpd.txt     |  61 -------
>  .../devicetree/bindings/input/mtk-kpd.yaml    |  93 +++++++++++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/input/keyboard/Kconfig                |   5 +-
>  drivers/input/keyboard/mtk-kpd.c              | 151 ++++++++----------
>  5 files changed, 163 insertions(+), 148 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> --
> 2.18.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
