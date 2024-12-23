Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C913BE7718E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CqXGSMvIKDBhr8CZLeVtg0JqgAcyBVaX1PMtALLT/0=; b=b9S+L+WZUKC2WjnA8v1vae2+1C
	ocGRNPefY3cQ1921vwLQmpgT011pEqWvLchkxnITh14LkHoqvbxBuhu4JpH/F467J8NR3QfG+TRts
	yojca5E8H53LuRs16KG2FB68B9GGDYeqjesOXMmA3zu6G4vJET+CfkiOyMhM2Es7aJbplshzeLtsd
	5QXxs4lF6nLovPFcGaQBc8M3U+hFeAdWQsA+BYgjMWdbFi5eYp7yoNc7mpfY1V5u8AO1l3DmoIRbO
	rEvKXMKudQnovzU+gL+fhvcZR6rWVLM6tgr/PKlka/yi3mP/cWIB9QTawc7YbHq3WWMy12TCChAAv
	igmgdzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpMI-0000000Aj5P-3UHf;
	Mon, 23 Dec 2024 20:48:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpMH-0000000Aj4y-01MO
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 20:48:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH94w3CSYz6K5lq;
	Tue, 24 Dec 2024 04:45:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C27E140517;
	Tue, 24 Dec 2024 04:48:55 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 21:48:53 +0100
Date: Mon, 23 Dec 2024 20:48:52 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Zijun Hu <zijun_hu@icloud.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, James Bottomley
	<James.Bottomley@HansenPartnership.com>, Thomas =?ISO-8859-1?Q?Wei=DFschu?=
 =?ISO-8859-1?Q?h?= <thomas@t-8ch.de>, <linux-kernel@vger.kernel.org>,
	<nvdimm@lists.linux.dev>, <linux-sound@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <linux1394-devel@lists.sourceforge.net>,
	<arm-scmi@vger.kernel.org>, <linux-efi@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-hwmon@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<netdev@vger.kernel.org>, Zijun Hu <quic_zijuhu@quicinc.com>, "Alison
 Schofield" <alison.schofield@intel.com>
Subject: Re: [PATCH v4 10/11] cxl/pmem: Replace match_nvdimm_bridge() with
 API device_match_type()
Message-ID: <20241223204852.000021d5@huawei.com>
In-Reply-To: <20241211-const_dfc_done-v4-10-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
	<20241211-const_dfc_done-v4-10-583cc60329df@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_124857_350450_7EE35F12 
X-CRM114-Status: GOOD (  15.26  )
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

On Wed, 11 Dec 2024 08:08:12 +0800
Zijun Hu <zijun_hu@icloud.com> wrote:

> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Static match_nvdimm_bridge(), as matching function of device_find_child()
> matches a device with device type @cxl_nvdimm_bridge_type, and its task
> can be simplified by the recently introduced API device_match_type().
> 
> Replace match_nvdimm_bridge() usage with device_match_type().
> 
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>

I don't see any uses of is_cxl_nvdimm_bridge() other than this one
Drop that as well?

This one is a bit of a trade off because the way is_cxl_nvdimm_bridge()
is identified is kind of an internal detail, but it's been true for a long
time so I'm fine with this change.

Jonathan


> ---
>  drivers/cxl/core/pmem.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cxl/core/pmem.c b/drivers/cxl/core/pmem.c
> index a8473de24ebfd92f12f47e0556e28b81a29cff7c..0f8166e793e14fc0b1c04ffda79e756a743d9e6b 100644
> --- a/drivers/cxl/core/pmem.c
> +++ b/drivers/cxl/core/pmem.c
> @@ -57,11 +57,6 @@ bool is_cxl_nvdimm_bridge(struct device *dev)
>  }
>  EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm_bridge, "CXL");
>  
> -static int match_nvdimm_bridge(struct device *dev, const void *data)
> -{
> -	return is_cxl_nvdimm_bridge(dev);
> -}
> -
>  /**
>   * cxl_find_nvdimm_bridge() - find a bridge device relative to a port
>   * @port: any descendant port of an nvdimm-bridge associated
> @@ -75,7 +70,9 @@ struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_port *port)
>  	if (!cxl_root)
>  		return NULL;
>  
> -	dev = device_find_child(&cxl_root->port.dev, NULL, match_nvdimm_bridge);
> +	dev = device_find_child(&cxl_root->port.dev,
> +				&cxl_nvdimm_bridge_type,
> +				device_match_type);
>  
>  	if (!dev)
>  		return NULL;
> 


