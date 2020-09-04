Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9183C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 07:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E06B20748
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 07:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GndGoa4r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QY77KP/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E06B20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DXyB3UhNo5y02aaSHc2DLJ+v9VS3PW/WSZRxV/s6uIY=; b=GndGoa4rmdMpVq4opmEvF1Ldx
	0g/vQOVJ4+635Dy7aNraeTurpcaIVYw/dIj11gZi7sillS8ZPyP15f/Ir+7i3UdS2/3DjvUrtKyfD
	H9+uyAQxpi2ykALvmW7jzwRmnvufzQL6ztBbdnDpzj5pqSDhXSKYvxtln52M+HHYUkU1+11jSK3/O
	BQSLpHnsVQVQjyhdRuttS1o1cHEWS4YcN4O/X1HLRjCckdX4aDLb4+jTsyilQGg/2ByLTET19+zyu
	Dt/UBlvOviZdl1QLlxQPOgbCgTSkSg0/b5zy0g6EFah6qQYOBCmwTHvDNCvRrTFsp7FXDdQYa312e
	5lX242sVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE5sc-0005iu-KC; Fri, 04 Sep 2020 07:11:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE5sZ-0005hM-Qg; Fri, 04 Sep 2020 07:11:25 +0000
X-UUID: bf7f81e0c7b746c0bad8173f9ec185c2-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CyHUeypPO/Ndn/UWpqExQLdOaqCCxuHfTXODMb4fNLY=; 
 b=QY77KP/GPYLBitsHIpnBNeB3FQ67IpyyY9NmFS2Z24kMHBNBVcPxFgVXXDwv1lxCf+j1t4txJlifnOIuI3ZeZAXJDUGkw+qy3FC49dFHbO+4fiNQCL39PppoqOHj2eqXbgLd9GaCJ6QuWeBL298+N30sBe/YEa0XroQZSnctOOU=;
X-UUID: bf7f81e0c7b746c0bad8173f9ec185c2-20200903
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 589746067; Thu, 03 Sep 2020 23:11:17 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 00:11:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 15:11:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 15:11:11 +0800
Message-ID: <1599203472.23494.3.camel@mtksdaap41>
Subject: Re: [RFC PATCH 3/4] usb: xhci-mtk: add support runtime pm
From: CK Hu <ck.hu@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Fri, 4 Sep 2020 15:11:12 +0800
In-Reply-To: <1599104065-8009-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1599104065-8009-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599104065-8009-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 96AC799E9DAA4A371347207BBDCE3525EE2928E9616996B2C6A4D0A8CF3D57042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_031124_075130_3305C96E 
X-CRM114-Status: GOOD (  16.18  )
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
Cc: linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
 Zhanyong Wang <zhanyong.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Chunfeng:

On Thu, 2020-09-03 at 11:34 +0800, Chunfeng Yun wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> add support runtime pm feature
> 
> Signed-off-by: Zhanyong Wang <zhanyong.wang@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk.c | 446 +++++++++++++++++++++++++++++++++++++++++++-
>  drivers/usb/host/xhci-mtk.h |  14 ++
>  2 files changed, 455 insertions(+), 5 deletions(-)
>  mode change 100644 => 100755 drivers/usb/host/xhci-mtk.h
> 

[snip]

> @@ -562,6 +794,31 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto dealloc_usb2_hcd;
>  
> +	INIT_DELAYED_WORK(&mtk->seal, xhci_mtk_seal_work);
> +	snprintf(mtk->seal_descr, sizeof(mtk->seal_descr), "seal%s:usb%d",
> +		 hcd->driver->description, hcd->self.busnum);
> +	ret = devm_request_irq(mtk->seal_irq, &xhci_mtk_seal_irq,
> +			  IRQF_TRIGGER_FALLING,	mtk->seal_descr, mtk);

In interrupt.h [1], devm_request_irq() need 6 parameters:

static inline int __must_check
devm_request_irq(struct device *dev, unsigned int irq, irq_handler_t
handler,
		 unsigned long irqflags, const char *devname, void *dev_id)
{
	return devm_request_threaded_irq(dev, irq, handler, NULL, irqflags,
					 devname, dev_id);
}


[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/interrupt.h?h=v5.9-rc1

Regards,
CK

> +	if (ret != 0) {
> +		dev_err(dev, "seal request interrupt %d failed\n",
> +			mtk->seal_irq);
> +		goto dealloc_usb2_hcd;
> +	}
> +	xhci_mtk_seal_wakeup_enable(mtk, false);
> +
> +	device_enable_async_suspend(dev);
> +	xhci_mtk_runtime_ready = 1;
> +
> +	ret = add_power_attributes(dev);
> +	if (ret)
> +		goto dealloc_usb2_hcd;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	dev_dbg(dev, "%s: xhci_mtk_runtime_ready %i",
> +		 __func__, xhci_mtk_runtime_ready);
> +
>  	return 0;
>  
>  dealloc_usb2_hcd:
> @@ -584,7 +841,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>  	xhci_mtk_ldos_disable(mtk);
>  
>  disable_pm:
> -	pm_runtime_put_sync(dev);
> +	pm_runtime_put_sync_autosuspend(dev);
>  	pm_runtime_disable(dev);
>  	return ret;
>  }


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
