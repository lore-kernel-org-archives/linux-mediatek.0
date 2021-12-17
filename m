Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A04C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 17:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5Ug2CRV+E1sOdMswY2P8iQr9wlodZxukwXO0UEyoMOs=; b=vs86i28CDjmqkO
	ayuDKr+yRO/PPDrUqbmwWxDhygodewltas3fXChliQcDA2MgeMWk514v6L9QSyexNa37yxkN9nVU1
	rmkCnVu4GrtQ8e8tZz7xsqd3md9jhsvpchfBlq3GS6GSlW0cHFWPxXFOG2mJ3pYM3ew318h9Nzf5l
	w6RMs2u8hiSOJsYhDtw+G3wI/BwJfP/1OleDxCb/m0+orQ20IzX5QKwhyxVtDA4HLFJvOWbjKU9mu
	YTUvxqnCO33ZcC6JSwR35qGSu9SOGxotz64qrcO3Hf0Cwaht8G0fmGHDqf9he9VIWfNoR/1YvxNha
	cvughK5jyCOqVqh+dseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myHAc-00BVja-3O; Fri, 17 Dec 2021 17:37:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFzL-00B94L-2v; Fri, 17 Dec 2021 16:21:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7017B82966;
 Fri, 17 Dec 2021 16:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9D0C36AE1;
 Fri, 17 Dec 2021 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639758099;
 bh=huC7uz1dGwNTuzWeqgiNaG3sk3EcmBrJ63xBA1P61zw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=mxARPdYm02vkR1wXFYlvgPaemHFGDbK6rk8Q8VKGK2inUv6cF06cWgLjrlNCcE57P
 k7NnlyE+Ps3w+SWlHxqIrKLJ6XKiQCWVG5XcLm/rHuNfTyMonUPDp8z1FClHNR2zK4
 3js6fQKPxr2k1IwbKvO/i/1skiFSDdm388/qqWM80bXKWTJd8oHyGjJcLP4b5xTIiX
 mUjkl5MXsfB+7cUKnej+WTSwJVFtBVZOY06cecM/ilXUM9YUdUidyUZcYFdDo6YE4y
 Ohkr6d3W22cfQoYSrx3w/f2X/pL9xyeQC3zRKocib623SbWB4yqaT6yel7pSGgimjI
 KeJ7pC5WHXPvw==
Date: Fri, 17 Dec 2021 10:21:37 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, john@phrozen.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 09/14] dt-bindings: PCI: Add support for Airoha EN7532
Message-ID: <20211217162137.GA894954@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217112345.14029-10-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_082143_365291_D59C730E 
X-CRM114-Status: GOOD (  16.34  )
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

On Fri, Dec 17, 2021 at 12:23:39PM +0100, Felix Fietkau wrote:
> From: John Crispin <john@phrozen.org>
> 
> EN7532 is an ARM based platform SoC integrating the same PCIe IP as
> MT7622, add a binding for it.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: John Crispin <john@phrozen.org>

Needs a sign-off from you, Felix:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v5.14#n418

> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> index 57ae73462272..684227522267 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> @@ -7,6 +7,7 @@ Required properties:
>  	"mediatek,mt7622-pcie"
>  	"mediatek,mt7623-pcie"
>  	"mediatek,mt7629-pcie"
> +	"airoha,en7523-pcie"
>  - device_type: Must be "pci"
>  - reg: Base addresses and lengths of the root ports.
>  - reg-names: Names of the above areas to use during resource lookup.
> -- 
> 2.34.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
