Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10451C63797
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 00:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCnLlBafyh4GwT6zVHEN0+uHO/uAkzlVBLePEGOwfww=; b=FPDTcdxeCdcz15k31ARHHzq8Vt
	t+RjRYlnY4FPFYuEGBfYMaPxU9oXDQrsNIXNaIEGOeOfrCcr8ADZXt3g6A0J/1/6Se3jxSfVYVqUD
	YYu2C07c5pwOd5NQ1p9hMOUH7G1eZoM4BFZrV5FseXe6tCWcKKmDMwTcTurvGEGHhsClQLQsfF51f
	RW8UVZhgE1F4HY14WSh0TnVwEIETwfHGInBRxCh3ENKm3mPJ6W93BrDYjyMno+yiu8tQNMU8Q0QYj
	j32ktmGow2sMT0D1T5t31XVs9OzXtqbyoWAn+TUS02weP1B5TT9tJ8RechudoHCvV11f+dCB3sgld
	xiobeGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG815-00HacU-Ce; Fri, 13 Jan 2023 00:33:55 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG80y-00Haa1-LE; Fri, 13 Jan 2023 00:33:51 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTP Server V5.0(16491:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>); Fri, 13 Jan 2023 08:33:08 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 13 Jan
 2023 08:33:08 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Fri, 13 Jan 2023 08:33:08 +0800
Date: Fri, 13 Jan 2023 08:33:07 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
	<matthias.bgg@gmail.com>
CC: <gregkh@linuxfoundation.org>, <gene_chen@richtek.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH RESEND v2] usb: typec: tcpm: Fix altmode re-registration
 causes sysfs create fail
Message-ID: <20230113003307.GA4232@linuxcarl2.richtek.com>
References: <1673248790-15794-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1673248790-15794-1-git-send-email-cy_huang@richtek.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_163349_176880_B61A6499 
X-CRM114-Status: GOOD (  25.09  )
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

On Mon, Jan 09, 2023 at 03:19:50PM +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> There's the altmode re-registeration issue after data role
> swap (DR_SWAP).
> 
> Comparing to USBPD 2.0, in USBPD 3.0, it loose the limit that only DFP
> can initiate the VDM command to get partner identity information.
> 
> For a USBPD 3.0 UFP device, it may already get the identity information
> from its port partner before DR_SWAP. If DR_SWAP send or receive at the
> mean time, 'send_discover' flag will be raised again. It causes discover
> identify action restart while entering ready state. And after all
> discover actions are done, the 'tcpm_register_altmodes' will be called.
> If old altmode is not unregistered, this sysfs create fail can be found.
> 
> In 'DR_SWAP_CHANGE_DR' state case, only DFP will unregister altmodes.
> For UFP, the original altmodes keep registered.
> 
> This patch fix the logic that after DR_SWAP, 'tcpm_unregister_altmodes'
> must be called whatever the current data role is.
> 
> Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Fixes: ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together)
> Reported-by: TommyYl Chen <tommyyl.chen@mediatek.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Since v2:
> - Correct the mail sent from Richtek.
> - Add 'Reviewed-by' tag.
>

Sorry, it seems I focus on the email testing and forget to attach the issue
log in the v2 patch appendix.

If anyone check this issue. Please refer to the v1 patch link.
https://lore.kernel.org/lkml/1671096096-20307-1-git-send-email-u0084500@gmail.com/
Inside this, the issue log show how it happened.

This can help better analyze this issue. 

ChiYuan Huang.
> Hi, Greg:
> 
>   Please check this one. I have strongly requested our MIS to remove the confidential string.
> 
> ChiYuan Huang.
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 904c7b4..59b366b 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4594,14 +4594,13 @@ static void run_state_machine(struct tcpm_port *port)
>  		tcpm_set_state(port, ready_state(port), 0);
>  		break;
>  	case DR_SWAP_CHANGE_DR:
> -		if (port->data_role == TYPEC_HOST) {
> -			tcpm_unregister_altmodes(port);
> +		tcpm_unregister_altmodes(port);
> +		if (port->data_role == TYPEC_HOST)
>  			tcpm_set_roles(port, true, port->pwr_role,
>  				       TYPEC_DEVICE);
> -		} else {
> +		else
>  			tcpm_set_roles(port, true, port->pwr_role,
>  				       TYPEC_HOST);
> -		}
>  		tcpm_ams_finish(port);
>  		tcpm_set_state(port, ready_state(port), 0);
>  		break;
> -- 
> 2.7.4
> 

