Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91E1C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 02:24:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842C920657
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 02:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byUQCkHM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Hxlm1x/8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 842C920657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbf0FxTGZBu2BHGFBtbuUtRGQYV8jbbDGINU20PMtO4=; b=byUQCkHMJ1MSVV
	Gj77L+ZTevcpt34cPIyT4+OT5REYX5NNDDQvVwmALjkst28x9ft5xcAmADREurR9BTCE0AQbrvmjR
	4Y6Jd9NWy/AHdYJuHxpvNzAbx90RJOsbpSUkhquUr3VE4FJn/LZ6Ctyn5LebKx/7no1qqHDtbTC5K
	H+NKeQ8aI38E8WCv+CO7ybtWJo8sHLXin6u8Gs9mXhmDsUOrzYAuoBBTvsxyPjV8R+MwPQq413VHF
	OxRViXKyU+ZsdDjcWj4Lkamr6p0hMqfNxlkR+2Qunh2V5enA99jXUHKDhp5yF/L9ca0LfD3IGAzEo
	aAPFV3hGr4A4NVZTIXDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgfYV-0002t6-LZ; Thu, 04 Jun 2020 02:24:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgfYS-0002qo-8Y; Thu, 04 Jun 2020 02:24:30 +0000
X-UUID: 731bef04e7b24905b4ebde70cb4cf738-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=E8q9qxxEPk8KKeZxjPDbo/SXRMzqkGo4vmd/SLjLzZw=; 
 b=Hxlm1x/8kMyMsc+m+tokXIVxwpz0sJG64jrHa7zBU3rsjXmrxm+VCLWJlglkFtB7PvUNkl28lDZMO8rfQZ5toWO05xRYEcntZMHu5z6CaC764/7oyDY/8yYe7HDVZpKu2WnmXHrJvfN6TrkOncYpPdW7WSzZcJE1WBj0FRsQUE8=;
X-UUID: 731bef04e7b24905b4ebde70cb4cf738-20200603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1496051464; Wed, 03 Jun 2020 18:24:16 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 19:22:11 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 4 Jun 2020 10:22:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 10:22:06 +0800
Message-ID: <1591237204.8804.550.camel@mhfsdcap03>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 4 Jun 2020 10:20:04 +0800
In-Reply-To: <20200602095654.GD29325@paasikivi.fi.intel.com>
References: <1590569355.8804.448.camel@mhfsdcap03>
 <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
 <20200527211628.GT7618@paasikivi.fi.intel.com>
 <1590636882.8804.474.camel@mhfsdcap03>
 <20200528072332.GW7618@paasikivi.fi.intel.com>
 <1590653082.8804.517.camel@mhfsdcap03>
 <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
 <1590978816.8804.523.camel@mhfsdcap03>
 <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
 <1591078501.8804.539.camel@mhfsdcap03>
 <20200602095654.GD29325@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC5061473807FB5FAEA43220556C92A855E1739EDF7A0C65A336E13C0824ECB32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_192428_323244_2E671219 
X-CRM114-Status: GOOD (  33.36  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Shengnan
 Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>, Tomasz Figa <tfiga@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>, dongchun.zhu@mediatek.com,
 Louis Kuo <louis.kuo@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sakari,

On Tue, 2020-06-02 at 12:56 +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> On Tue, Jun 02, 2020 at 02:15:01PM +0800, Dongchun Zhu wrote:
> > Hi Tomasz, Sakari,
> > 
> > On Mon, 2020-06-01 at 20:18 +0200, Tomasz Figa wrote:
> > > On Mon, Jun 1, 2020 at 4:35 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > >
> > > > Hi Tomasz,
> > > >
> > > > On Fri, 2020-05-29 at 15:43 +0200, Tomasz Figa wrote:
> > > > > On Thu, May 28, 2020 at 10:06 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > > > >
> > > > > > Hi Sakari,
> > > > > >
> > > > > > On Thu, 2020-05-28 at 10:23 +0300, Sakari Ailus wrote:
> > > > > > > Hi Dongchun,
> > > > > > >
> > > > > > > On Thu, May 28, 2020 at 11:34:42AM +0800, Dongchun Zhu wrote:
> > > > > > > > Hi Sakari, Rob,
> > > > > > > >
> > > > > > > > On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> > > > > > > > > Hi Rob, Dongchun,
> > > > > > > > >
> > > > > > > > > On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > > > > > > > > > +    properties:
> > > > > > > > > > > > > +      endpoint:
> > > > > > > > > > > > > +        type: object
> > > > > > > > > > > > > +        additionalProperties: false
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +        properties:
> > > > > > > > > > >
> > > > > > > > > > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > > > > > > > > >
> > > > > > > > > > Yes, if you are using it.
> > > > > > > > >
> > > > > > > > > Dongchun, can you confirm the chip has a single data and a single clock
> > > > > > > > > lane and that it does not support lane reordering?
> > > > > > > > >
> > > > > > > >
> > > > > > > > From the datasheet, 'MIPI inside the OV02A10 provides one single
> > > > > > > > uni-directional clock lane and one bi-directional data lane solution for
> > > > > > > > communication links between components inside a mobile device.
> > > > > > > > The data lane has full support for HS(uni-directional) and
> > > > > > > > LP(bi-directional) data transfer mode.'
> > > > > > > >
> > > > > > > > The sensor doesn't support lane reordering, so 'clock-lanes' property
> > > > > > > > would not be added in next release.
> > > > > > > >
> > > > > > > > > So if there's nothing to convey to the driver, also the data-lanes should
> > > > > > > > > be removed IMO.
> > > > > > > > >
> > > > > > > >
> > > > > > > > However, 'data-lanes' property may still be required.
> > > > > > > > It is known that either data-lanes or clock-lanes is an array of
> > > > > > > > physical data lane indexes. Position of an entry determines the logical
> > > > > > > > lane number, while the value of an entry indicates physical lane, e.g.,
> > > > > > > > for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
> > > > > > > > the clock lane is on hardware lane 0.
> > > > > > > >
> > > > > > > > As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
> > > > > > > > support lane reordering, so here we shall use 'data-lanes = <1>' as
> > > > > > > > there is only a clock lane for OV02A10.
> > > > > > > >
> > > > > > > > Reminder:
> > > > > > > > If 'data-lanes' property is not present, the driver would assume
> > > > > > > > four-lane operation. This means for one-lane or two-lane operation, this
> > > > > > > > property must be present and set to the right physical lane indexes.
> > > > > > > > If the hardware does not support lane reordering, monotonically
> > > > > > > > incremented values shall be used from 0 or 1 onwards, depending on
> > > > > > > > whether or not there is also a clock lane.
> > > > > > >
> > > > > > > How can the driver use four lanes, considering the device only supports a
> > > > > > > single lane??
> > > > > > >
> > > > > >
> > > > > > I understood your meaning.
> > > > > > If we omit the property 'data-lanes', the sensor should work still.
> > > > > > But then what's the meaning of the existence of 'data-lanes'?
> > > > > > If this property 'data-lanes' is always optional, then why dt-bindings
> > > > > > provide the interface?
> > > > > >
> > > > > > In the meantime, if omitting 'data-lanes' for one sensor(transmitter)
> > > > > > that has only one physical data lane, MIPI receiver(e.g., MIPI CSI-2)
> > > > > > shall enable four-lane configuration, which may increase consumption of
> > > > > > both power and resource in the process of IIC communication.
> > > > >
> > > > > Wouldn't the receiver still have the data-lanes property under its
> > > > > endpoint node, telling it how many lanes and in which order should be
> > > > > used?
> > > > >
> > > >
> > > > The MIPI receiver(RX) shall use
> > > > v4l2_async_notifier_add_fwnode_remote_subdev() API to parse the property
> > > > "data-lanes" under sensor output port.
> > > 
> > > That's not true. The MIPI receiver driver parses its own port node
> > > corresponding to the sensor. Also quoting the documentation [1]:
> > > 
> > > "An endpoint subnode of a device contains all properties needed for
> > > _configuration of this device_ for data exchange with other device. In most
> > > cases properties at the peer 'endpoint' nodes will be identical, however they
> > > might need to be different when there is any signal modifications on the bus
> > > between two devices, e.g. there are logic signal inverters on the lines."
> > > 
> > > In this case, there is such a signal modification if the sensor has a
> > > 1-lane bus and the receiver more lines, so the data-lanes properties
> > > would be different on both sides.
> > > 
> > > [1] https://elixir.bootlin.com/linux/v5.7/source/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > 
> > 
> > Sorry for the misunderstanding.
> > After doing some experiments about the data-lanes property under sensor
> > i2c node, we found the API
> > v4l2_async_notifier_add_fwnode_remote_subdev() that MIPI receiver driver
> > used indeed parses the data-lanes under its own port node.
> > 
> > Sorry make a mistake for the use case of sensor data-lanes previously.
> > Now We may encounter one new question for this patch.
> > In practice we haven't used the data-lanes under sensor i2c node
> > anywhere, if sensor driver itself doesn't parse that.
> > 
> > But there is still one reason to keep the exactly right data-lanes in
> > DT. That is, the data-lanes under sensor i2c node could be used as a
> > reference for MIPI receiver driver.
> > Just as Tomasz said, 'The MIPI receiver driver parses its own port node
> > corresponding to the sensor'.
> > 
> > Sakari, Tomasz, what's your opinions about the present of data-lanes
> > under sensor node or not?
> 
> The receiver driver doesn't parse the properties in the sensor
> (transmitter) device's endpoint. If that property provides no information
> to the receiver, as is the case here, it should be omitted.
> 

Understood.
Fixed in next release.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
