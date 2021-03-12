Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F55C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 08:40:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9418664FD6
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 08:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9418664FD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bz1T0/B/Q7zMCrEHwVd3SJ5q+7dJMb97CvCpqWU/AZM=; b=IKi0AJdL9VBNo7jwKSK5hgTa1
	+WwLocdem5Gl9oXbeJY3Jtl6aaxMDy8NEu07JuKK4PNC9GN0p5maEO7nIzVobNoVr6Orh0DAyCUDV
	rl/E8uZCowXilBrtwERgvHkkFuUoFtlrIezi17fxEkkLmVgs3M55XcJLLCGs5rp7IUZCDbU7lQrXo
	qyZ8MfifmbK0YY0K3VJS4+WEQfmTLxorYoITAVH70chPQgT91PGrDWWkb+ucn7BcgiWgTS8JeF8M/
	E4WozeWeh+Hf+FUD4FN9IRJQlf+xw8EuC0ccO3YSVW8xDexCzduGlxOfiBvunQ601D6AcjpAzolNS
	6YLUelu8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKdKw-00Au4E-VN; Fri, 12 Mar 2021 08:39:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKdKo-00Atyu-L0; Fri, 12 Mar 2021 08:39:56 +0000
X-UUID: 973dfcb8d2734db187ce14f2881899d5-20210312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ooolB54WEfgbIJQeSEoMg6RBJbHlc/MSHt7sIJf1I14=; 
 b=dtgSGVVf2N0DxciA1yLPF8jCfRPP1t8MKi1K4RMRuB1gHARw6Nx4baw4XlQhkEWqQhvL6SDIEHez8Ng3GO/hmnghHDSaXVKoyvVO1nWVOb0dqTxz8uhVDJkvBawdpkAIsbcQJxox1qtjsrp3TPjbhlcxSGhBp6Wa1bjStIVK9YE=;
X-UUID: 973dfcb8d2734db187ce14f2881899d5-20210312
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2020296266; Fri, 12 Mar 2021 00:39:44 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 00:39:42 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 12 Mar 2021 16:39:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 16:39:38 +0800
Message-ID: <1615538378.26498.8.camel@mhfsdcap03>
Subject: Re: [PATCH][next] usb: mtu3: Fix spelling mistake "disabed" ->
 "disabled"
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Colin King <colin.king@canonical.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 12 Mar 2021 16:39:38 +0800
In-Reply-To: <20210311092529.4898-1-colin.king@canonical.com>
References: <20210311092529.4898-1-colin.king@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 487E2A8EC44F9185C890BAA7B2219ED185BF448F8161F73B2E49435334052B482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_083951_536414_1D9E2C4F 
X-CRM114-Status: GOOD (  17.19  )
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

On Thu, 2021-03-11 at 09:25 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable u3_ports_disabed contains a spelling mistake,
> rename it to u3_ports_disabled.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/mtu3/mtu3_host.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
> index c871b94f3e6f..41a5675ac5ca 100644
> --- a/drivers/usb/mtu3/mtu3_host.c
> +++ b/drivers/usb/mtu3/mtu3_host.c
> @@ -109,7 +109,7 @@ int ssusb_host_enable(struct ssusb_mtk *ssusb)
>  	void __iomem *ibase = ssusb->ippc_base;
>  	int num_u3p = ssusb->u3_ports;
>  	int num_u2p = ssusb->u2_ports;
> -	int u3_ports_disabed;
> +	int u3_ports_disabled;
>  	u32 check_clk;
>  	u32 value;
>  	int i;
> @@ -118,10 +118,10 @@ int ssusb_host_enable(struct ssusb_mtk *ssusb)
>  	mtu3_clrbits(ibase, U3D_SSUSB_IP_PW_CTRL1, SSUSB_IP_HOST_PDN);
>  
>  	/* power on and enable u3 ports except skipped ones */
> -	u3_ports_disabed = 0;
> +	u3_ports_disabled = 0;
>  	for (i = 0; i < num_u3p; i++) {
>  		if ((0x1 << i) & ssusb->u3p_dis_msk) {
> -			u3_ports_disabed++;
> +			u3_ports_disabled++;
>  			continue;
>  		}
>  
> @@ -140,7 +140,7 @@ int ssusb_host_enable(struct ssusb_mtk *ssusb)
>  	}
>  
>  	check_clk = SSUSB_XHCI_RST_B_STS;
> -	if (num_u3p > u3_ports_disabed)
> +	if (num_u3p > u3_ports_disabled)
>  		check_clk = SSUSB_U3_MAC_RST_B_STS;
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot


>  
>  	return ssusb_check_clocks(ssusb, check_clk);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
