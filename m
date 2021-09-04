Return-Path: <SRS0=vCgL=N2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1559FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 16:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C041860F55
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 16:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C041860F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGXk+S8IA6SDJTdzVRH7123HWdeAS3KjU8oO0rCf2Uw=; b=lJAEs0gVkLjHbX
	tZk08g7RuXl2K2zZeupRiTYpcYo0YPANCOCQcwurxvaWr78QPusqdFZsgMhkiXvXxpV4hOVs3VV01
	c9qF1b7+GMHUCpGK5jtchs3cHLGFEfd+I8Xn7SAZR4KQsJJFsX9Kr3RNSVGTl04zsrhvvnOA2QlM2
	Q7uWtT3NDkOT5jlxqnJvJafE9tbgJgQZR7+lCedrCFIqMmzzQtAJhx6beWpMsUVA4e8juHP8FRWad
	blhr/84PUomSYW3UJOm540AaYrf1HDP3546kb50eTSIqJTxSlYUwavredZ4zzc/3jqv/cND7rD7SN
	XhPo3obDNnuJfRhyW6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMYle-00ESXI-Cq; Sat, 04 Sep 2021 16:43:46 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMYlR-00ESW7-3u; Sat, 04 Sep 2021 16:43:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id k13so4686427lfv.2;
 Sat, 04 Sep 2021 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wh1mYqXbigd70L6uyNc1nuoAq3q+tfDVrUyZbdPnbZg=;
 b=iXLM08nMa44bOzPVU5aaFVmqvZKrs+Ybnrz+NmNg88DHQv5tvS8yqQWkjL80Wqry1T
 ExBK71a+BdNdvsuJVFKy9eiahchEbwVZ4jrJxzuyxjjqOZwtW57wdrF1YEzTAli4ouNU
 OVDw1gYu+lRFtE8FF0msbNC6OdV9SwrDM1zF1Iy6fiCD6jsnMr7saeojM17d3QdPPWML
 ucxLHdZvULFpx/qqiBhryZ96yZNkS2CYPZVKXnIIhNxA3uj+cNXlbRaZEJIUYmY+9kPG
 TMXNq+W5dKR4BeXQ3wEs+1Ix/WRRjN54hXoKEJ8A4w6vI1GR5R+QJd3wFhP8jgmHAvDp
 B96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wh1mYqXbigd70L6uyNc1nuoAq3q+tfDVrUyZbdPnbZg=;
 b=OPBeayk+SFjnFzlRlhH+tVuF3QFeVDYhAVAnwPI9ADx3CY2Tv2c+/tzswy/UA2R+dy
 p3d9cuJ4Y5fi3u4ZkxeSterdNOCKZH5N/cz107JkNLYaCJiXdcFtRVx+x/OEvF1vtbNK
 ffsd3dtFkya420SUAqpk+u+1CPpXqjjrKRtJYyLKwzIeA5x6PYQhJOTWfsYsGVSLUE6t
 Q5sUGsSdUBqfo9BoTcvFdPr58bgcqkvSUsqi3V2g+iG1XBVq4xYpZ8Gb5OiGnP5fl3JV
 nGDVAYfqbenEZqGciB0DUWHbo0LkzZdI9Fk1mn8TNW/CJVi1lOSp/tUg51C5bFFRHeQQ
 WnVg==
X-Gm-Message-State: AOAM531RQR1ZidqkF7KKTqOc4Sb2V/droT2eUllyauvVWAQkcvG9SEUe
 96FOe8lyvoo3GAYgtT0j2VoMHvfhuq5fa4sBgnk=
X-Google-Smtp-Source: ABdhPJwZ+0KMEOizcDmymxx6a0MZNPjAp4tyydXooOiL8jAkWr0KSCGNISjKPFpo3S+RDol2iLdbQioP35eJnUnErmQ=
X-Received: by 2002:a05:6512:108d:: with SMTP id
 j13mr3483211lfg.113.1630773810406; 
 Sat, 04 Sep 2021 09:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210904152946.32042-1-miles.chen@mediatek.com>
In-Reply-To: <20210904152946.32042-1-miles.chen@mediatek.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 4 Sep 2021 13:43:18 -0300
Message-ID: <CAOMZO5AE4uGXk47uhWKLch8RDmUrvvw0zDPM+wxgz4uWJD6eGA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: imx: use module_platform_driver
To: Miles Chen <miles.chen@mediatek.com>
Cc: Abel Vesa <abel.vesa@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP Linux Team <linux-imx@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_094333_226798_9EE87696 
X-CRM114-Status: UNSURE (   7.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Miles,

On Sat, Sep 4, 2021 at 12:29 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> Replace builtin_platform_driver_probe with module_platform_driver_probe
> because CONFIG_CLK_IMX8QXP can be set to =m (kernel module).
>
> Fixes: c2cccb6d0b33 ("clk: imx: add imx8qxp clk driver")
> Fixes: 1e3121bfe51a ("clk: imx: add imx8qxp lpcg driver")

The correct Fixes tag would be:

Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock
driver as module")

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
