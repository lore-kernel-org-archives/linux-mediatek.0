Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ADEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvlm6xT5I10VaPWksudiDqqCq1QKUeXQUejV7j9HGrg=; b=yThFxxMG6snQyw
	Y2cJEEACzWPknr/57wVQXjYA1uz3dE02qCceBmBM2A4IhuNm6ipUrWu0VpktDFFwPWyrDbkABgXNe
	u+di1baiH772U8/iuh+lI74e/D3ld46tn+eS+iIM28FCFHIioVV4mE6HGKJqzikPuWXY2tVPHSc8J
	qa9V41NSzL09IaJnFWpum1rDEMeNoXr0bKdyywJURSShfE+fEprAekXQunefaJE0WwJWy4Tzu5jv5
	EsXIrvcqpCSCyzCd1VANsGBSi0KBVyg8wdsLcslPVqS53e3y6SRbcpz3whcSy3fAHSt5PZTgz882w
	tH2Nh7BdcBfilStkyycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbiq-007YPs-PX; Fri, 10 Jun 2022 10:18:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbiQ-007Y9S-Uf; Fri, 10 Jun 2022 10:18:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3DBD2B8338B;
	Fri, 10 Jun 2022 10:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81020C3411E;
	Fri, 10 Jun 2022 10:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654856282;
	bh=Mgof106cR39tCNt2/D1vN1oOa5Rp+UIYZiiD80oMBuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgpKivqT9cZqXAgrW/tfIVrc5r8vOzX/GEqwOLFyBG2EaoIOyj128iD8Gi9w0U5MZ
	 Gr/rM4W9g8rimCzQAq6pifSKCrHsQm22eg0Gkzrb14KZKep8f174nubAuG3Pem6HnX
	 dhD2abwlHXkE+xhfVXWHQGjR+2/Sfz7fXjhbgmw8=
Date: Fri, 10 Jun 2022 12:17:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, bliang@analogixsemi.com,
	qwen@analogixsemi.com, jli@analogixsemi.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Message-ID: <YqMaUroS87rjnCny@kroah.com>
References: <20220309023404.1221453-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309023404.1221453-1-xji@analogixsemi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_031807_197112_A2C7ACCE 
X-CRM114-Status: GOOD (  13.83  )
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

On Wed, Mar 09, 2022 at 10:34:01AM +0800, Xin Ji wrote:
> USB PD controllers which consisting of a microcontroller (acting as the TCPM)
> and a port controller (TCPC) - may require that the driver for the PD
> controller accesses directly also the on-chip port controller in some cases.
> 
> Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> 
> ---
> V8 -> V9: Add more commit message
> V7 -> V8: Fix Guanter's comment, remove unnecessary explain
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c                        | 3 +--
>  drivers/usb/typec/tcpm/tcpci_maxim.c                  | 3 +--
>  drivers/usb/typec/tcpm/tcpci_mt6360.c                 | 3 +--
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c                | 2 +-
>  {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h | 1 +
>  5 files changed, 5 insertions(+), 7 deletions(-)
>  rename {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h (99%)

I need an ack by the typec maintainers/developers before I can take this
(hint...)

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
