Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4030C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmz8miNTevKnlq7NJw3MnvHPi/CrAgMxl2tuCQsqo8U=; b=HAyw6+fw52iEXo
	y5ZEt7oFgAc66gizEsRER3DXPfjFZaKC2ZG5T/XHe8pds7bKT4SYTxlHFlauolJcg0OdbN7croQK2
	L9zTRY1Bhc6JBpcazSTLiO5P3Wx0eAH30NNmhAz7owxIq927rCaca/lrN8yXRrs2rf7Rp/LwTHd59
	1OXluQ4D02qAGkGPpArWmg680QyyUj/G97C902E4UFd673u4fj6J0600CcTLFVXUCYlliTGQCdLjc
	Nh1FzUCtug9Vhpp/9h+vzmVVxva+UCWjy/+44YMEfEzCOuw1jub2zJ8bLjpYHSPynDWbtPrs84XVd
	POmlFoUEeUVhip8SrAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh6e6-008KzB-Mt; Wed, 20 Apr 2022 09:29:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh6dp-008Kqf-4i; Wed, 20 Apr 2022 09:28:54 +0000
X-UUID: 4e042c22a0ec4f7cb20fe1a61c029f42-20220420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=THCkqTvTC/urpREcUW2nJckfaJQCFmmrFdWmBf1Ynzc=; 
 b=uvteZlDLhbb7xESSLnt4/bhrGxC3DydOcWt/2xYi6QdkFApoWlpysvOYcNUF3GJHyYab6Vz9IFOPHEx9rTqjISvbGywBnWzv546wad3Lia9cKeWPxOD5d59BLpbmAQEyb/kTYDMNsMxWTuTx7FXrm05hfgLL5WK+vzbbOtKFgrA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:5a78dc2c-6b01-493a-9684-f5552479239a, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:3ed181ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4e042c22a0ec4f7cb20fe1a61c029f42-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2039835429; Wed, 20 Apr 2022 02:28:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 02:18:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 20 Apr 2022 17:18:40 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Apr 2022 17:18:39 +0800
Message-ID: <37276fd01a518dadff57ef66c7971b78baa9dc15.camel@mediatek.com>
Subject: Re: [PATCH] usb: mtu3: fix USB 3.0 dual-role-switch from device to
 host
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Macpaul Lin
 <macpaul@gmail.com>, <stable@vger.kernel.org>, Tainping Fang
 <tianping.fang@mediatek.com>
Date: Wed, 20 Apr 2022 17:18:38 +0800
In-Reply-To: <20220419081245.21015-1-macpaul.lin@mediatek.com>
References: <20220419081245.21015-1-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_022853_234091_02E73416 
X-CRM114-Status: GOOD (  20.91  )
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

On Tue, 2022-04-19 at 16:12 +0800, Macpaul Lin wrote:
> Issue description:
>   When an OTG port has been switched to device role and then switch
> back
>   to host role again, the USB 3.0 Host (XHCI) will not be able to
> detect
>   "plug in event of a connected USB 2.0/1.0 ((Highspeed and
> Fullspeed)
>   devices until system reboot.
> 
> Root cause and Solution:
>   There is a condition checking flag "ssusb->otg_switch.is_u3_drd" in
>   toggle_opstate(). At the end of role switch procedure,
> toggle_opstate()
>   will be called to set DC_SESSION and SOFT_CONN bit. If "is_u3_drd"
> was
>   set and switched the role to USB host 3.0, bit DC_SESSION and
> SOFT_CONN
>   will be skipped hence caused the port cannot detect connected USB
> 2.0
>   (Highspeed and Fullspeed) devices. Simply remove the condition
> check to
>   solve this issue.
> 
> Fixes: d0ed062a8b75 ("usb: mtu3: dual-role mode support")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Tainping Fang <tianping.fang@mediatek.com>
> Tested-by: Fabien Parent <fparent@baylibre.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/usb/mtu3/mtu3_dr.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
> index ec6ec621838b..b820724c56e4 100644
> --- a/drivers/usb/mtu3/mtu3_dr.c
> +++ b/drivers/usb/mtu3/mtu3_dr.c
> @@ -21,10 +21,8 @@ static inline struct ssusb_mtk
> *otg_sx_to_ssusb(struct otg_switch_mtk *otg_sx)
>  
>  static void toggle_opstate(struct ssusb_mtk *ssusb)
>  {
> -	if (!ssusb->otg_switch.is_u3_drd) {
> -		mtu3_setbits(ssusb->mac_base, U3D_DEVICE_CONTROL,
> DC_SESSION);
> -		mtu3_setbits(ssusb->mac_base, U3D_POWER_MANAGEMENT,
> SOFT_CONN);
> -	}
> +	mtu3_setbits(ssusb->mac_base, U3D_DEVICE_CONTROL, DC_SESSION);
> +	mtu3_setbits(ssusb->mac_base, U3D_POWER_MANAGEMENT, SOFT_CONN);
>  }
>  
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks

>  /* only port0 supports dual-role mode */
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
