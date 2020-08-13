Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB6DC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 05:02:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 283AC20768
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 05:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0gSsY8Pt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nQIRT8+H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 283AC20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lytslA4t8Cpzj4sQu8Wg3p77NGk1aUYRblbuiprbKRg=; b=0gSsY8Pt99pMkguRHuQ4zd/ov
	BnfhdTEqqkbI44pTFhF4BUXSERZCN6My2/rFmvoYpr7P8xEJpsqbWo4ax92i237PFelJUNfP2k8uB
	ehK4WwK890er6yBUoDaRl9Q202vpSgm3WJG2BPaj+bgGSS4IUngX9o9iQfuIC5jLlXT1yi1a8mhSl
	MxtVuEjXeOCZJwi8IMIUW51PBWELKBRRQBU7Xk8GMu77hS69DA9DPX/di6NWy1s18YAxYCDsxIokj
	IAVxGeCT7voaHKWPPqE1XZydwvjOp1YllL9CYudMjS3sQ6CPXtXtO6FwI1Uo2LoYUyEfsVtF0yWvL
	yqeR4tv0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k65Ny-0007vT-L0; Thu, 13 Aug 2020 05:02:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k65Nv-0007ud-9w; Thu, 13 Aug 2020 05:02:40 +0000
X-UUID: 1359d4a49b8e4485b1d3f1f4ed5be80c-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vc0/8bE6UotQMHbyr5S0xQjHvklXp5WypDibcqFMXHo=; 
 b=nQIRT8+HQ0fCRyWTUobaV1i5dmltDjpkPegt6WMx47+4xcaROz9Qo0leU+Fk6FsLqoMObf8bnARUmtk2XFN8XM4XYnxmQ+o7NF5Yn8ndkmV1wz7x2rjSGn6iASl6RvwLWIPfsKjWQbhGQzmzM0Ls5aMmAoriPP+oci/VCMAI7qY=;
X-UUID: 1359d4a49b8e4485b1d3f1f4ed5be80c-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 412545462; Wed, 12 Aug 2020 21:02:30 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 22:02:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS32DR.mediatek.inc (172.27.6.104) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 13:02:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 13:02:24 +0800
Message-ID: <1597294944.31472.2.camel@mtksdaap41>
Subject: Re: [PATCH v17 1/3] dt-bindings: Add bindings for Mediatek matrix
 keypad
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 13 Aug 2020 13:02:24 +0800
In-Reply-To: <20200812221357.GS1665100@dtor-ws>
References: <20200810064058.6467-1-fengping.yu@mediatek.com>
 <20200810064058.6467-2-fengping.yu@mediatek.com>
 <1597110443.22273.5.camel@mtksdaap41> <20200812221357.GS1665100@dtor-ws>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA401CDDF3393E80B94BDC4FC2C3180630F59DD1B08243174249AEA12A760DA12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_010239_488119_304F4AA5 
X-CRM114-Status: GOOD (  29.10  )
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
Cc: devicetree@vger.kernel.org, Fengping Yu <fengping.yu@mediatek.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-12 at 15:13 -0700, Dmitry Torokhov wrote:
> Hi,
> 
> On Tue, Aug 11, 2020 at 09:47:23AM +0800, Yingjoe Chen wrote:
> > Hi,
> > 
> > 
> > On Mon, 2020-08-10 at 14:40 +0800, Fengping Yu wrote:
> > > From: "fengping.yu" <fengping.yu@mediatek.com>
> > > 
> > > This patch add devicetree bindings for Mediatek matrix keypad driver.
> > > 
> > > Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/input/mtk-kpd.yaml    | 87 +++++++++++++++++++
> > >  1 file changed, 87 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> > > new file mode 100644
> > > index 000000000000..d74dd8a6fbde
> > 
> > <...>
> > 
> > 
> > > +  keypad,num-columns:
> > > +    description: Number of column lines connected to the keypad controller,
> > > +    it is not equal to PCB columns number, instead you should add required value
> > > +    for each IC. If not specified, the default value is 1.
> > > +
> > > +  keypad,num-rows:
> > > +    description: Number of row lines connected to the keypad controller, it is
> > > +    not equal to PCB rows number, instead you should add required value for each IC.
> > > +    If not specified, the default value is 1.
> > 
> > Your source code can't really handle dts without rows/columns
> > properties. Also, the default value doesn't make any sense. No IC will
> > have rows or columns set to 1.
> > 
> > Since these are IC specified, not board specified, I think you should
> > just have the correct numbers in driver.
> 
> It is actually property of board to decide how many keys it wants to
> wire up. In extreme case it will be a single key, i.e. number of rows
> and columns will indeed be 1.
> 
> Thanks.
> 

From the binding "it is not equal to PCB columns number, instead you
should add required value for each IC."
Driver code use this to calculate bit position in register, which is IC
dependent.

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
