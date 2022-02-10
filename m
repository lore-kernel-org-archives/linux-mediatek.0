Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B063C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 06:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDteH/yV3XK3uG9kMyysrHszi0mquX+adxeQHYSiPA0=; b=wjMDwQwjN5Ubbn
	vESRE0tohPxf856xPI7nZkC4zU3CU76H8SG0WyMX6y8iCGjqgsXjRLANCEIAR6ENIQRiL0G+GTSun
	cSKcBvxxFDkBcciRtvoIGTOFCGbs4sitxNfKmypUoYKYXzJRSeZ1au4IgK8RV1YfEP+cNX4Qd8ytl
	20TH83exJ7sq8gvtuzLUXXXYXEyjWDtnQyb1ST7k3U6OWGmlm32f4R5nmcYMQCD7U3gAZvw0+AhmY
	UHnjYjNB0mzCjCev9Hk+GCBqRo2oFCOV8lOWUzsj0BhABfLcFpSkdf6w0Ec/lpYzTGONyLU5jLdaB
	4UWy/N26iLl+OJdC7vtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI3IT-002otw-LA; Thu, 10 Feb 2022 06:51:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3IG-002orr-Te; Thu, 10 Feb 2022 06:51:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55F1AB823DB;
 Thu, 10 Feb 2022 06:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A05C004E1;
 Thu, 10 Feb 2022 06:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644475861;
 bh=NF5vEArqU6PoLBzuHWME77pDLNnZmgMubj3ipXB1Ugw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mn6ZZ4D0+DS9UVw8tI+547ZjxwpwdWNllSCaYBjRHhmwLpzv8MB9XOoOPD1GwJQhz
 REoQsKRszN1l1abuPdYb9cD+sMOSC2gEfHdN6jZa6vMkp3za2R8iNWQj01CuGFDrC1
 LcBK4hWCPRaUsfQdOisc95l9652125xwbG2vL5Ns=
Date: Thu, 10 Feb 2022 07:50:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: qizhong cheng <qizhong.cheng@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 chuanjia.liu@mediatek.com
Subject: Re: [PATCH v2] PCI: mediatek: Clear interrupt status before
 dispatching handler
Message-ID: <YgS10ZUCzgjRs6LQ@kroah.com>
References: <20220210012125.6420-1-qizhong.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220210012125.6420-1-qizhong.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_225105_126987_19B00629 
X-CRM114-Status: GOOD (  16.13  )
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

On Thu, Feb 10, 2022 at 09:21:25AM +0800, qizhong cheng wrote:
> We found a failure when used iperf tool for wifi performance testing,
> there are some MSIs received while clearing the interrupt status,
> these MSIs cannot be serviced.
> 
> The interrupt status can be cleared even the MSI status still remaining,
> as an edge-triggered interrupts, its interrupt status should be cleared
> before dispatching to the handler of device.
> 
> Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> ---
> v2:
>  - Update the subject line.
>  - Improve the commit log and code comments.
> 
>  drivers/pci/controller/pcie-mediatek.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
