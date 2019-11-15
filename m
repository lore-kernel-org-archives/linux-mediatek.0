Return-Path: <SRS0=MjbJ=ZH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535BAC432C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2019 13:43:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26ECA20715
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2019 13:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YwA7/tjv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fXpOKUav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26ECA20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Rum0L5FqlNGN82HZWgnyCq56tCnw1PSXhXRXOVGdWY=; b=YwA7/tjvFHqXs5
	2XaAjaSRjLKVO0jqY0qnxW9hmkwHFkjM0jvnY3L8FfeKC/tp4gPoX0VAcrsJGBXErzafIVsnaZChO
	Yj/5lKG0sfHyjneQ3aGeSJrjKWsVX/QUBR4PPRtlki1GUJEzkrhUyedIEnO7ukR5TipdabUhHxjBG
	vdvj83M8fs5O/DbWEaUHqeN05Y/5fy1F3zsgl0uzDvPJ2Vcm11H3LakuZJGEcDt26kpx8JTZuWb5a
	YBiVjNStGQ+PH5k63uDcN+0xWFnOMrZzeLcoJxRduSZ6rBXrJcaCr3XaqQjuSrzONmPfhwrpjwkZd
	rATMSvCNRBqyDagwAX5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVbt4-0000nI-EZ; Fri, 15 Nov 2019 13:43:46 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVbt1-0000mm-Mu; Fri, 15 Nov 2019 13:43:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFDhENw021665;
 Fri, 15 Nov 2019 07:43:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573825394;
 bh=0GMF8waTlZ/mMmEu9OdTiNMpJgRZ1U+24RV0VdCAq3s=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fXpOKUavZPJUxNL9lEFn7zZNVLFYuhGojcJgORZ0h/BB4qyRFo6mrlCOsH4ERQeHs
 h9leKq2A0Fj6bzJ4IDPmzVMYiipwgHWHf4mYsJ2/6ss1dHgt4T7A8cxc/hktAUYZHd
 PabnC59jQNgb5DLLinNwWV5dTN5f0x+2iBMNsWMU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFDhELd079797
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 Nov 2019 07:43:14 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 15
 Nov 2019 07:43:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 15 Nov 2019 07:43:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFDhEow098885;
 Fri, 15 Nov 2019 07:43:14 -0600
Date: Fri, 15 Nov 2019 07:45:30 -0600
From: Bin Liu <b-liu@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 05/13] usb: musb: create debugfs directory under usb
 root
Message-ID: <20191115134530.GB12511@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Felipe Balbi <balbi@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Peter Chen <Peter.Chen@nxp.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Cristian Birsan <cristian.birsan@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kevin Cernekee <cernekee@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Colin Ian King <colin.king@canonical.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Yangtao Li <tiny.windzz@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
 <1573541519-28488-5-git-send-email-chunfeng.yun@mediatek.com>
 <20191112152857.GA5853@uda0271908>
 <20191114032018.GA122287@kroah.com>
 <20191114140234.GB5853@uda0271908>
 <20191115032153.GC793701@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115032153.GC793701@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_054343_850519_67AF501F 
X-CRM114-Status: GOOD (  25.49  )
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
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Yangtao Li <tiny.windzz@gmail.com>, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kevin Cernekee <cernekee@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Cristian Birsan <cristian.birsan@microchip.com>, linux-media@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>,
 Felipe Balbi <balbi@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 15, 2019 at 11:21:53AM +0800, Greg Kroah-Hartman wrote:
> On Thu, Nov 14, 2019 at 08:02:34AM -0600, Bin Liu wrote:
> > On Thu, Nov 14, 2019 at 11:20:18AM +0800, Greg Kroah-Hartman wrote:
> > > On Tue, Nov 12, 2019 at 09:28:57AM -0600, Bin Liu wrote:
> > > > Hi,
> > > > 
> > > > On Tue, Nov 12, 2019 at 02:51:51PM +0800, Chunfeng Yun wrote:
> > > > > Now the USB gadget subsystem can use the USB debugfs root directory,
> > > > > so move musb's directory from the root of the debugfs filesystem into
> > > > > the root of usb
> > > > 
> > > > My opinion is this move is unnecessary. I breaks existing debug tools or
> > > > documentation which is already published on Internet. 
> > > 
> > > Having a "root" directory for a single random driver seems like you are
> > > making your driver a "very important" thing in the overall scheme of the
> > > kernel, right?  What's wrong with using the usb subdirectory like all
> > 
> > Agree, it wasn't the right thing to do at the first place. But now
> > changing it adds support burden, because people very often refer to the
> > old information on the internet which no longer matches to the new
> > location. Basically, it is a cost of ABI change.
> 
> What information says that /sys/kernel/debug/mdev/ is the location for
> this?  Is it in-kernel?

No, they are not in-kernel, but many places mainly on https://e2e.ti.com
and http://processors.wiki.ti.com. It basically says to get musb
regdump, cat /sys/kernel/debug/musb-hdrc.{0,1}/regdump, or to enter test
mode, do echo _testmode_ > /sys/kernel/debug/musb-hdrc.{0,1}/testmode...

> > > other USB drivers use (after this patch series is merged)?  That feels
> > > like a much more "sane" way to handle the wide-open debugfs namespace.
> > 
> > Though I commented on this musb patch, my opinion is for this whole
> > series, either drop the whole series or apply the whole series.
> 
> I've applied all but this one and 2 others that did not build properly.

Okay.

> > > Yes, there are no rules when it comes to debugfs file names and
> > > locations, but let's try to be sane please.
> > 
> > Fine with me. I can still support questions such as "can't open
> > /sys/kernel/debug/musb-hdrc.0/testmode: No such file or directory".
> 
> What tool looks for that?

I wrote a usb diagnosis tool called chkusb.sh, which basically checks
usb related information in
  - /proc/config.gz
  - /lib/modules/`uname -r`/kernel/drivers/
  - /proc/device-tree/
  - /sys/device/
  - /sys/kernel/debug/

So whenever I got a report on e2e.ti.com saying that usb doesn't work, I
just post this script and get a log which would give a clue if there was
any fundamental mistake in kernel configuration or deployment.

But not a big issue here for this tool regarding this patch set, I can
update the script to check both locations - /sys/kernel/debug/ and
/sys/kernel/debug/usb/.

-Bin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
