Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495C9C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 15:09:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E55DE610CA
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 15:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E55DE610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jx+DHYDUW5hMKxeE1DGixNQd1x7yYj69+2mGv7fSPhg=; b=KJs8+e+TpIugM60wEXZpyiksc
	BKRzax8s9i6xdQymSTi44x7NaayjD/3SpuT6OrUCyxOM7+PmL91Q4p7rM7KXLwIuMCYGjAb+Ixxmy
	1FtQOJFtk5+DBPZBv5P4sDSZNIQ62rX6MAGDG9SCnj93d+kzMaCLDXUKn6RpjAVil+paH80qgHywv
	Yy/tS+JmufGyvIOS7SS5P5IGxkgO5w9P91OmPSF2R2ZCDorFBLI9Euu/2kza2q7Sq5nvSOwkhhipc
	cd2LsZFRRcsQjIf89HXVs3rICChVIWcgcD7lf6jqCcz2xIudVObhjtHWtO4M4BkIs72rdbRSVG7BV
	ZxKag9JQg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUslH-000yqB-52; Fri, 09 Apr 2021 15:09:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUsl5-000yp7-DF
 for linux-mediatek@desiato.infradead.org; Fri, 09 Apr 2021 15:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FD7SPvxehe3Wfb0kir6VteSjlAe2ssVc3bppfontmTk=; b=o+H3OVMH04ycJW7kv859V2jeRj
 fJRaFUGWH5Led+tCmfEOGTFlUR7wsWmIoWk9cWn6WnQdcmoMC3mQXbFL6vvzuMwgF47qUYBkkBaZY
 K92VRswdCKrmnMCUAU15WhF+VVrHiFbGb60WtpBBRiqQqvklKOBqEvp+bQMaB7H7YZACH8J2BJ2UG
 1qUWJxHXH4mV2BYpnvYUHuezWxrWL534AcNpuyk4toSNbf4e1rHDOiFxF93o+ptCM8XkV+w9W4LCH
 pl4UqVihVODQldXJtCqhOFGVZzl93rP0xFgCgTq5+ptwPFBc5xh26OvqIzE+csnXYncPdyqp51t/6
 btOSJSwg==;
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lUsl1-004buL-Q4
 for linux-mediatek@lists.infradead.org; Fri, 09 Apr 2021 15:09:17 +0000
Received: (qmail 1334363 invoked by uid 1000); 9 Apr 2021 11:09:11 -0400
Date: Fri, 9 Apr 2021 11:09:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nishad Kamdar <nishadkamdar@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [RFC PATCH] usb: core: reduce power-on-good delay time of root hub
Message-ID: <20210409150911.GC1333284@rowland.harvard.edu>
References: <1617935947-24045-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617935947-24045-1-git-send-email-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_080916_028303_EEA40F79 
X-CRM114-Status: GOOD (  15.89  )
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

On Fri, Apr 09, 2021 at 10:39:07AM +0800, Chunfeng Yun wrote:
> Return the exactly delay time given by root hub descriptor,
> this helps to reduce resume time etc.
> 
> Due to the root hub descriptor is usually provided by the host
> controller driver, if there is compatibility for a root hub,
> we can fix it easily without affect other root hub
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
>  drivers/usb/core/hub.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 73f4482d833a..22ea1f4f2d66 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -148,8 +148,10 @@ static inline unsigned hub_power_on_good_delay(struct usb_hub *hub)
>  {
>  	unsigned delay = hub->descriptor->bPwrOn2PwrGood * 2;
>  
> -	/* Wait at least 100 msec for power to become stable */
> -	return max(delay, 100U);
> +	if (!hub->hdev->parent)	/* root hub */
> +		return delay;
> +	else /* Wait at least 100 msec for power to become stable */
> +		return max(delay, 100U);
>  }
>  
>  static inline int hub_port_debounce_be_connected(struct usb_hub *hub,
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
