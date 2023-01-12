Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D56C54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 13:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoRGbn5Ysrpy1iEWIkxZOwd/x/73M58afkRdG4whFx4=; b=TcD/0pGaH1vifUF3kN5Vw49VDu
	VmimSqbdl9Ak1J2o8N5gqwv7rGQU6V3QQlTExmMHTNVf2wey+OHIIUbVUaZvH0cdJo75XCgTjbhFO
	KcTDoC7eIUFtqeKAq1cDE/8e6VTsn4xaX6slYaTbCuge+4JYUzCwlP/MFdceWoJP26oIHWi5NBY6A
	IjMBRc/8h8G7lf+KXu/R1vDIJeaC7ItO171rmpQQ8ZPktTRsPqbaLLWnbh9Oz05vs3yhCowPQJUvK
	hBFLMVA+abtolLt04Tz/Gu4/zs5orbSEv5m60tOcv/ADP79uDfw+nSoMIzj7DohnWFEJlgXcsn09j
	h/6aUT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFxyn-00FF0e-HV; Thu, 12 Jan 2023 13:50:53 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFxya-00FExb-Oz; Thu, 12 Jan 2023 13:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673531440; x=1705067440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nye+I+Clrq9SBmvHly5ZfjOGJz5IMOrCCli65DwBb60=;
  b=YIZBSIXiqzU1b+luZSMcQiHf7fOF0bhvVOkDqXnrHtFALu/TDi5vVGQg
   N6YCpG6aKIdCUHqIfQzZ5SdXNALRz+kVbXtnXesVzPipB3rf8AqoAtrtp
   wTZFZB9OkCs5Aw5kiyZ8X43RVXLEodd50E9o+uczsIdPULCVzU466KINt
   uMELdlDhnM32+AjsZN2jPyGxjBYuJg+vpEaU8Hacvh+mBId3/XkIa9Fop
   EChMNzhUvF6B5ShKJu1QAlUXegPYa6BjrMDboTa0M5lEUKleBBQwM0dPD
   05S8aA4nFK6Q8E8nKfQ5O2QVGtPZSwOk/zQKONi3JN3xNCgOxuw4o+vAQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="325730059"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; 
   d="scan'208";a="325730059"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 05:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="800213443"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; 
   d="scan'208";a="800213443"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 12 Jan 2023 05:50:07 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 12 Jan 2023 15:50:07 +0200
Date: Thu, 12 Jan 2023 15:50:06 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: cy_huang@richtek.com
Cc: linux@roeck-us.net, matthias.bgg@gmail.com, gregkh@linuxfoundation.org,
	gene_chen@richtek.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH RESEND v2] usb: typec: tcpm: Fix altmode re-registration
 causes sysfs create fail
Message-ID: <Y8AQDtBq9j3SmIUu@kuha.fi.intel.com>
References: <1673248790-15794-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1673248790-15794-1-git-send-email-cy_huang@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_055040_911927_5FCAC876 
X-CRM114-Status: GOOD (  24.73  )
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

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Since v2:
> - Correct the mail sent from Richtek.
> - Add 'Reviewed-by' tag.
> 
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

-- 
heikki

