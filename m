Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8FEC001DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztn+eLZkTHFb+ZjFA65kvoe2gbg5SdsBEfUevSG+PUg=; b=1cNwsC9X4HX7DAvM9FGs1GD6e/
	+mlA5c/c07TWgBGlJXBgxkoAuRg7KSKu0d1h3Y28LLZpaW+7KKdsVe4NmzNInmqfs2pRuYDyOL1HU
	nwszK4sO7V/hnV5IJxs+rLoMNSpi2Nh+pWwrwmZ9mc3pnaqg5I937nINcLSBIYpK0bGa6ErBugFkv
	5pwnHDBqtJycLjyBtR6RJC7qEcta8E7ekSaQyRGm3XFBtNkgmvrzIK9rzKeglykG2y1AHWiiG8Mx8
	OkGT/Vj8VoLbVCWzd+tq3ahRcBQj+qywZ/pOe+yM+FL7E3nyfq4s0T5r1SdfA6eG4i4gXLG4gXz9E
	iJnGxsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9Zq-004huG-1o;
	Wed, 02 Aug 2023 10:59:38 +0000
Received: from [192.55.52.43] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9Zm-004hpS-2d;
	Wed, 02 Aug 2023 10:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690973974; x=1722509974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ls2G1xZpM5/lbUHq74LPMKvPhw29G+3cVxNx/NY0Txo=;
  b=EObGliJ1Bp1NnqrTaGQ1gmK3VcGR0EGiyXIleuUWl9XDr3PFrAxsAhj6
   jFzVI67vqA53vFBgQ2YIFE3+GwdXfw2FPzl69SqTjN05zaxUmoA7UBO/9
   r14s+sIM0j7PDozVtfSbKsxL7BtDF30hMAjT2xgKavjYbjNDmkD7ngup0
   UYpegnndRv5Npd7mY4xjQEe6pzXSC9kWpOTtlhcaEQMjexFe5S4Fkryye
   MuX+25dsBugWuTZ2ghgtOwuH0ncEmVD44H7T48f4+p7t8hYY/6hzbWV+6
   GEro9Op/nnUhP8Cmy+tzAFCsdd69HrnuJYmQ4eiqbmmhBjXeFrAbfeRd3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="455916756"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="455916756"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 03:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872437933"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Aug 2023 03:59:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 02 Aug 2023 13:59:24 +0300
Date: Wed, 2 Aug 2023 13:59:24 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Zhu Wang <wangzhu9@huawei.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH -next] usb: typec: tcpci_mt6370: remove redundant
 dev_err_probe()
Message-ID: <ZMo3DNX4yHkuTnpF@kuha.fi.intel.com>
References: <20230801122834.89168-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801122834.89168-1-wangzhu9@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_035934_889002_B1CCD332 
X-CRM114-Status: GOOD (  20.07  )
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

On Tue, Aug 01, 2023 at 08:28:34PM +0800, Zhu Wang wrote:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to present error messages.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_mt6370.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> index 2a079464b398..9cda1005ef01 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -147,7 +147,7 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
> -		return dev_err_probe(dev, irq, "Failed to get irq\n");
> +		return irq;
>  
>  	/* Assign TCPCI feature and ops */
>  	priv->tcpci_data.auto_discharge_disconnect = 1;
> -- 
> 2.17.1

-- 
heikki

