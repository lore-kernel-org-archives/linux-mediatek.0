Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7639EC5DF61
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 09:06:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4805A2178F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 09:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qrdr+KqV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4805A2178F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ki2KpkGROhJ27LJSE+GdHN9UgzHfJT43kUMYQARk+s=; b=Qrdr+KqV6RtsZV
	R0c5sn54ZqPNI35H9D2UTBWRblkXq5awdOdXuR+JayRQ7Z/JhhevOe51InK5rU0K8ktB9P3EcldTf
	gPPW8lCDrj978hWQVyj7bHTGdfxqdgteiAMltv+i/l2Gq0LzZVVSzXZuvh51gzltvuUe8wxwHl/Dy
	Clr7ih/2l35zDYn4kD5Zwl3xbZvDbBAil7CkbFTeGJRbfWIou7KoXumTrerp7U6IrBtSxfHgjfitu
	H/GCBK0okbGl2s2+gH4z+LXZLl4onrfDUWf2/Q4CGatSCeKRpJRU7il8yL8cw+LoJFclD/NVBWtHR
	9mVqJcDBRlPwBBA02uyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSdkf-0005DB-6s; Thu, 07 Nov 2019 09:06:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdkc-0005CP-MR; Thu, 07 Nov 2019 09:06:48 +0000
X-UUID: 6100387defc044798a87cc7e64676bb9-20191107
X-UUID: 6100387defc044798a87cc7e64676bb9-20191107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 471151249; Thu, 07 Nov 2019 01:07:12 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 7 Nov 2019 01:06:36 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 7 Nov 2019 17:06:33 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 7 Nov 2019 17:06:31 +0800
Message-ID: <1573117594.18464.87.camel@mhfsdcap03>
Subject: Re: [PATCH 01/28] usb: common: change usb_debug_root as static
 variable
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Thu, 7 Nov 2019 17:06:34 +0800
In-Reply-To: <2e793636-04a6-8589-b4a5-259f79a5ea02@roeck-us.net>
References: <8cb137d5376b4e317dc22dcb9e81a1125b781f8f.1573008519.git.chunfeng.yun@mediatek.com>
 <79fd2ebd-b8c6-ee00-c71e-782475a20de6@roeck-us.net>
 <1573031491.18464.70.camel@mhfsdcap03>
 <2e793636-04a6-8589-b4a5-259f79a5ea02@roeck-us.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6BBD5DAFEDF8B2AA407B7F583D4B16F14955E806B4F4D7282E4AFA677F2D72A62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_010646_739958_C0CB0792 
X-CRM114-Status: GOOD (  21.20  )
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
Cc: Peter Chen <Peter.Chen@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Wolfram Sang <wsa@the-dreams.de>, Yangtao Li <tiny.windzz@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Mans Rullgard <mans@mansr.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kevin Cernekee <cernekee@gmail.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
 bcm-kernel-feedback-list@broadcom.com,
 David Kershner <david.kershner@unisys.com>, Hans Ulli
 Kroll <ulli.kroll@googlemail.com>, Cristian
 Birsan <cristian.birsan@microchip.com>, linux-media@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Mathias Payer <mathias.payer@nebelwelt.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-mediatek@lists.infradead.org, Minas Harutyunyan <hminas@synopsys.com>,
 Simon Horman <horms+renesas@verge.net.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>,
 Felipe Balbi <balbi@kernel.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Dmitry Torokhov <dtor@chromium.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Colin Ian King <colin.king@canonical.com>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Greg,

On Wed, 2019-11-06 at 06:00 -0800, Guenter Roeck wrote:
> On 11/6/19 1:11 AM, Chunfeng Yun wrote:
> > On Tue, 2019-11-05 at 20:03 -0800, Guenter Roeck wrote:
> >> On 11/5/19 7:15 PM, Chunfeng Yun wrote:
> >>> Try to avoid using extern global variable, and provide two
> >>> functions for the usage cases
> >>>
> >>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> >>> ---
> >>>    drivers/usb/common/common.c | 16 ++++++++++++++--
> >>>    include/linux/usb.h         |  5 ++++-
> >>>    2 files changed, 18 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> >>> index 1433260d99b4..639ee6d243a2 100644
> >>> --- a/drivers/usb/common/common.c
> >>> +++ b/drivers/usb/common/common.c
> >>> @@ -293,8 +293,20 @@ struct device *usb_of_get_companion_dev(struct device *dev)
> >>>    EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
> >>>    #endif
> >>>    
> >>> -struct dentry *usb_debug_root;
> >>> -EXPORT_SYMBOL_GPL(usb_debug_root);
> >>> +static struct dentry *usb_debug_root;
> >>> +
> >>
> >> I don't think it is a good idea to declare this variable static
> >> before all its uses are removed. This patch will leave the system
> >> in a non-compileable state until all patches of the series have
> >> been applied.
> > Yes, you are right, I'll fix it, may be split into two patch
> > 
> >>
> >> I am curious. What is the rationale for this change ?
> >> Did exported variables run out of favor ?
> > Personally, I think it's good practice to avoid global varibale,
> > it may not a good reason.
> 
> Personally I don't think it is a good reason at all. When you are done,
> someone else may come in and declare the opposite, re-introduce the global
> variable, and drop the new functions as unnecessary.
> 
> This is ok for new code, but I think we should leave existing code alone
> unless it is broken and needs to get fixed. This is not the case here.
What do you think about this, if you also agree with Guenter's opinion,
I'll abandon this patch.

BTW, how about moving udc's debug directory into usb root?

Thanks

> 
> Thanks,
> Guenter



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
