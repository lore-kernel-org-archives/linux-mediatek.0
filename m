Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07E9C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:12:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BDF1208E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eGScCUPa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxW9JQar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BDF1208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rbth9jvtDK4LI/LAgLYLbRxdTMH/iOGP7uPJZca5yAA=; b=eGScCUPacVn4XxgxFF+y0Apmf
	qQVnJBHKwD7Y9DbQ+X5Jah6pePLuWR/2VlKCW2DJE9JoXK4pafEjdzzNySkyZy/1Zb/FcYtKps8i1
	X7Qo8+4aCGCUMXc9bX0ZSBrfW+k31brSG8AEfqPe6t5stJYoBcokIhGvdEi7C14Hkw2oTiqjhiMjL
	BigGkbuelXoCDX6WSl09wDXc4fIDOPKFMOST7CVAniBzrUusYrdbwahxzlMgKoJINj9Tri0Sw/zgI
	u43iIrJUW2bMSDoV09InQ7kyX4PC8sB75qXfo4L2u30usnHm38YWR9BKWvFUwG5vDIPdjwuhHb/2g
	cS0o3JLwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGMNA-0004Eu-9Z; Thu, 10 Sep 2020 13:12:20 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGMN7-0004DM-QW
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 13:12:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id a17so6650475wrn.6
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bq+U/roPoyR+PFGiWvFpI6j3vo6m28j+pYae81Oydrk=;
 b=LxW9JQardfe6ovRqT818t4MTPCbypCYUo6YFqdrT244gD5a1S0M2FecEI0fJMIgCzr
 Ar89gXm/TIGENRR2BL49FoHZo7vujerVPjd5M+e2s3HXP4Wo7+O2P4figtbf5/nmwDS/
 Q2R1sft6rUH2GuRa5ewLVT4dLProx4KzE35qEa4E6nG7xI6czJpWrd4mlBvx4KBv1Ccz
 A73yWuTvok4lQOj7F9He312DDKguKWTUTaFTwJ9WMRqZBv5IIXVbgFL3+SKSF4xaBQqF
 6f2aAKtqQ+uZhXhgjIwYfEadfGfIDAA1hYNVQFQSDpaEu0fH3OPF+Cxvx5kbZQoNIkpH
 Yvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bq+U/roPoyR+PFGiWvFpI6j3vo6m28j+pYae81Oydrk=;
 b=FQiDIY/cqdty5RIYjmUFBW9z5fTus+18dBPj/nx+swCGNk2+VYjqOW6+rYQxpFGD+b
 9N5/FzIrdHZtDo9oU5Y+V0C0LwCwXODYePzspEoSHnzM9Ah8hMNuI+23WSzjsoEantY/
 7d36UAqCZ58GRklQ9amlJRsoOOH7lo2/SYQZIHhVsbH9eMj0LhXXLU0T7coGEyQVlzSh
 vTQg4dcuHrYqeO9lArw+WJo7YXgzTWuy/MsyxNHifvFXc114XeuMvvvlNki03GIYZmgi
 ZFCB55avJHAB0CKujrP34oFYrLshpljI595gl3Y8xGC1q16z9QSrJsfSwKLei5ZCYRs7
 TF8Q==
X-Gm-Message-State: AOAM5338h6G/P1T6Z4ewU6+Z4+l0K35UCaUzg5bo8gMu9Nuw24ad7f3W
 W6mU/Wu6Q1KmHNb3qBJgd6JUgg==
X-Google-Smtp-Source: ABdhPJx2Dvf8nFJMefE2zEyQsiA8oS3cus97b9p96If1Q7HdqZx1B5j3NrbyrLIFhtzFYQ1R++dhWQ==
X-Received: by 2002:a5d:6301:: with SMTP id i1mr8482460wru.323.1599743535091; 
 Thu, 10 Sep 2020 06:12:15 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j14sm3301883wmj.19.2020.09.10.06.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:12:14 -0700 (PDT)
Date: Thu, 10 Sep 2020 14:12:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
Message-ID: <20200910131212.wm7zskxvcesl652c@holly.lan>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_091217_954619_E296A145 
X-CRM114-Status: GOOD (  22.01  )
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
Cc: linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Jann Horn <jannh@google.com>, Chuhong Yuan <hslester96@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> Use readl_poll_timeout_atomic() to simplify code
> 
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v3: no changes
> ---
>  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index c1025d3..74f836f 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/firmware.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
>  	void __iomem *regs = hcd->regs;
>  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
>  	const struct firmware *fw;
> -	int retval, index, j, time;
> -	int timeout = 10000;
> +	int retval, index, j;
>  	u32 data, val, temp;
>  	u32 quirks = 0;
>  	const struct soc_device_attribute *attr;
> @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
>  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
>  		writel(temp, regs + RCAR_USB3_DL_CTRL);
>  
> -		for (time = 0; time < timeout; time++) {
> -			val = readl(regs + RCAR_USB3_DL_CTRL);
> -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> -				break;
> -			udelay(1);
> -		}
> -		if (time == timeout) {
> -			retval = -ETIMEDOUT;
> +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> +				1, 10000);
> +		if (retval < 0)
>  			break;
> -		}
>  	}
>  
>  	temp = readl(regs + RCAR_USB3_DL_CTRL);
>  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
>  	writel(temp, regs + RCAR_USB3_DL_CTRL);
>  
> -	for (time = 0; time < timeout; time++) {
> -		val = readl(regs + RCAR_USB3_DL_CTRL);
> -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> -			retval = 0;
> -			break;
> -		}
> -		udelay(1);
> -	}
> -	if (time == timeout)
> -		retval = -ETIMEDOUT;
> +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);

Directly assigning to retval at this point will clobber a previous
-ETIMEDOUT error.

In other words if there is a timeout waiting for FW_SET_DATA0, but not for
DW_SUCCESS, then we will return the wrong return value.


Daniel.


>  
>  	release_firmware(fw);
>  
> @@ -200,18 +187,12 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
>  
>  static bool xhci_rcar_wait_for_pll_active(struct usb_hcd *hcd)
>  {
> -	int timeout = 1000;
> +	int retval;
>  	u32 val, mask = RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK;
>  
> -	while (timeout > 0) {
> -		val = readl(hcd->regs + RCAR_USB3_AXH_STA);
> -		if ((val & mask) == mask)
> -			return true;
> -		udelay(1);
> -		timeout--;
> -	}
> -
> -	return false;
> +	retval = readl_poll_timeout_atomic(hcd->regs + RCAR_USB3_AXH_STA,
> +			val, ((val & mask) == mask), 1, 1000);
> +	return !!retval;

This function returns a bool so !! is either wrong or redundant... I
think in this case it is wrong and should be a single ! .


Daniel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
