Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2575AC2BC11
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:39:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71FFD221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:39:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oshtPZNp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RrPviiA1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71FFD221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fxx/NUS7gmAmEYrcPiHsKC9/cMF0HWfpoRIHgD2tEK4=; b=oshtPZNpcEaOxqulzcI4MGtNj
	G3VPYsJlYbkWc7xgNXLv0cNf6IHaemWRw5GggffCXC/4/brCR6qvUB+7O//CNmCs3Gcm7D0xTXNhy
	bUXuUf71lVAOcvY+2A9e4xNMQq9X7GN5DDYGAXuMNvZHjv+4coYedEtRdt3DYGSyeff6m1sSf0rG4
	Q2kVQFAvztVBizafgNXQlSATuZhEEQqC3B+R91U/z3Z5qVRkcUDhR0M0C/4SPK5IE4VNAeUqc8gHW
	IKd3Jx+ZrBKDizDmd9Xfj7MCeLTVK0i6MmRpNH7b7SludOzmPquAmjq1UQxe9qUKONfEVjFQtbPJ7
	AwXdsDd3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfWp-0004Rj-GX; Fri, 11 Sep 2020 09:39:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfWm-0004Pl-Vc; Fri, 11 Sep 2020 09:39:34 +0000
X-UUID: 4cad5fe6cc3b4322b47b197f1a531f95-20200911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9Aq51FOERNaMNDKcW34Pu/zomNrhFzlYyLddBNePP8k=; 
 b=RrPviiA1n+MOMvMaMxY9I3sOn0TTRqs+F3uW7kwj19JVoca3aOo5DyJFnzYg8ISWubie8YiETntxksi5o4ivDdF+0FQP4eVBKfnZQqDMOZygE1PG9b1MQdkCYMwatT3S5fTw8RJev/SFqlxjtTeiI8DsdQtfCaVXBBqpI+GCxCA=;
X-UUID: 4cad5fe6cc3b4322b47b197f1a531f95-20200911
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1828146505; Fri, 11 Sep 2020 01:39:24 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 02:29:21 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Sep 2020 17:29:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Sep 2020 17:29:17 +0800
Message-ID: <1599816442.29909.10.camel@mhfsdcap03>
Subject: Re: [PATCH RESEND v3 04/11] usb: xhci-rcar: convert to
 readl_poll_timeout_atomic()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 11 Sep 2020 17:27:22 +0800
In-Reply-To: <20200911083421.g5cidlnwfiksggvk@holly.lan>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599726112-4439-4-git-send-email-chunfeng.yun@mediatek.com>
 <20200910131212.wm7zskxvcesl652c@holly.lan>
 <1599791601.24609.5.camel@mhfsdcap03>
 <20200911083421.g5cidlnwfiksggvk@holly.lan>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D9BF7DBA819C0CCA0CE8880A27C525BF3E313AFA5C9FA45D086E4A91339CB2422000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_053933_250514_94BC79C1 
X-CRM114-Status: GOOD (  28.29  )
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
Cc: linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Jann Horn <jannh@google.com>, Chuhong Yuan <hslester96@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-11 at 09:34 +0100, Daniel Thompson wrote:
> On Fri, Sep 11, 2020 at 10:33:21AM +0800, Chunfeng Yun wrote:
> > On Thu, 2020-09-10 at 14:12 +0100, Daniel Thompson wrote:
> > > On Thu, Sep 10, 2020 at 04:21:45PM +0800, Chunfeng Yun wrote:
> > > > Use readl_poll_timeout_atomic() to simplify code
> > > > 
> > > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > ---
> > > > v2~v3: no changes
> > > > ---
> > > >  drivers/usb/host/xhci-rcar.c | 43 ++++++++++++-------------------------------
> > > >  1 file changed, 12 insertions(+), 31 deletions(-)
> > > > 
> > > > diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> > > > index c1025d3..74f836f 100644
> > > > --- a/drivers/usb/host/xhci-rcar.c
> > > > +++ b/drivers/usb/host/xhci-rcar.c
> > > > @@ -6,6 +6,7 @@
> > > >   */
> > > >  
> > > >  #include <linux/firmware.h>
> > > > +#include <linux/iopoll.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/of.h>
> > > > @@ -127,8 +128,7 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > >  	void __iomem *regs = hcd->regs;
> > > >  	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> > > >  	const struct firmware *fw;
> > > > -	int retval, index, j, time;
> > > > -	int timeout = 10000;
> > > > +	int retval, index, j;
> > > >  	u32 data, val, temp;
> > > >  	u32 quirks = 0;
> > > >  	const struct soc_device_attribute *attr;
> > > > @@ -166,32 +166,19 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
> > > >  		temp |= RCAR_USB3_DL_CTRL_FW_SET_DATA0;
> > > >  		writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > >  
> > > > -		for (time = 0; time < timeout; time++) {
> > > > -			val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > -			if ((val & RCAR_USB3_DL_CTRL_FW_SET_DATA0) == 0)
> > > > -				break;
> > > > -			udelay(1);
> > > > -		}
> > > > -		if (time == timeout) {
> > > > -			retval = -ETIMEDOUT;
> > > > +		retval = readl_poll_timeout_atomic(regs + RCAR_USB3_DL_CTRL,
> > > > +				val, !(val & RCAR_USB3_DL_CTRL_FW_SET_DATA0),
> > > > +				1, 10000);
> > > > +		if (retval < 0)
> > > >  			break;
> > > > -		}
> > > >  	}
> > > >  
> > > >  	temp = readl(regs + RCAR_USB3_DL_CTRL);
> > > >  	temp &= ~RCAR_USB3_DL_CTRL_ENABLE;
> > > >  	writel(temp, regs + RCAR_USB3_DL_CTRL);
> > > >  
> > > > -	for (time = 0; time < timeout; time++) {
> > > > -		val = readl(regs + RCAR_USB3_DL_CTRL);
> > > > -		if (val & RCAR_USB3_DL_CTRL_FW_SUCCESS) {
> > > > -			retval = 0;
Here will set it 0 too

> > > > -			break;
> > > > -		}
> > > > -		udelay(1);
> > > > -	}
> > > > -	if (time == timeout)
> > > > -		retval = -ETIMEDOUT;
> > > > +	retval = readl_poll_timeout_atomic((regs + RCAR_USB3_DL_CTRL),
> > > > +			val, (val & RCAR_USB3_DL_CTRL_FW_SUCCESS), 1, 10000);
> > > 
> > > Directly assigning to retval at this point will clobber a previous
> > > -ETIMEDOUT error.
> > > 
> > > In other words if there is a timeout waiting for FW_SET_DATA0, but not for
> > > DW_SUCCESS, then we will return the wrong return value.
> >
> > Yes, agree with you, but seems I keep its original logic unchanged.
> 
> I disagree.
> 
> Your patch does not preserve the original logic. Your patch explicitly
> sets retval to zero if the second loop succeeds. The original code does
> not do this. As a result there is a change of return code for one of the
> error paths.
> 
> 
> Daniel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
