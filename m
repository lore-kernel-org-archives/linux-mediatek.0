Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DD3C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 19:24:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241DE613B0
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 19:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241DE613B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=eV2o7zl+aQSrGINxatUftSG4jkF2fZfFvDcjNK4dlbA=; b=RpHc/SZt0GVlqcdJXYQtLYcHb
	6A003/SmKxZ9XXjQV/MsZLxaQJOcPV8Y2nPO+7mcmvarRa93A9hUTN9T39iiRNDTJ4wnTbVjBJ8eK
	KaX+Grta1L928qHWdlXzjPAr4jsKhGcDTw5Kx/xGIdT9c+ZF9Wc9JUOqis3gBzDUTKBlB5Vgxz5/m
	bos8tDWv3z6K2YUROmsf5k4qTD7jcaJKX30LekS9U0P/A2QG6pDn80ola455rSnE2/Fl/Nb90vP/P
	4SRZMnvdemNoQv1uM401+7lPwaMYLY0isBcFlsGS9Nx11BdW5HCVyY7GroFN6TExUYFFKGrU+Y9Kr
	AQFF5lv5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXU4o-003DAE-VV; Fri, 16 Apr 2021 19:24:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXU4b-003D7M-Hm; Fri, 16 Apr 2021 19:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To
 :Content-ID:Content-Description:References;
 bh=Y4CGOQ3VVzVOoh+l3/YBmQlewKvatoJkaq/GIU/YJuU=; b=JHJWc0gvVaN9uvkH+msk4TWR/K
 5xx/ZwG8xYt2ZVQJXDxlu2/omLX0XkKhLbkwzSLdQhZ3hbWk8Mj/rsdYNVS5DkmnUuyrVo5JbK5Ra
 Jvn6H0wGXkqDPdXpyLkJsfNuuVtkeJRWaZ5cavWL9OOrM/KZbMiYzHRWopiqfbLqf13PHeLHY5AcZ
 J9T56B8s4JIPSAQ9CKpWIfI0Vh56oMN+5GfkHrXrAfaCHOMF4nonIGHBdzQ7LyfHy5xC//wjub0G+
 3Mi/J+qgrVtg9zq+4S2eXGY+v1agV/lcU7ID0p0KDfc0lsBG68pGrsbjawNM3xYMAA7BkAxqw3K1E
 gC2yPo/w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXU4Z-009ecW-2W; Fri, 16 Apr 2021 19:24:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B84B6137D;
 Fri, 16 Apr 2021 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618601050;
 bh=qHawK0oSTOLvJhEkLLbelkvEtYDRemD5y/71PvXJsow=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=i+nsE09tHA0GPcdM2/MeTaNM0szdQ0WdGtOryocd2mlqAtBAPS//L0i0bzZXsO8/u
 fkLV7Gvab0QGNzDId6j792QJPu/gog3Dicsi9l6jZFfqUa3Plj723IeLds1pJpEKyr
 6OgPJZied02D4CRJM27ck/2DbUH0P6noqZEX7ncjo7RzthjBNAzaObjGEgxy17r7VL
 +SzfZO2eKYv3O9Q0TMm2hz5GTNKJ/yfV2ONFoik610B/49nvK59V7cy8m7CfnUYsqV
 5lioX2gDeS8C6LthsG8R30YIzz9snIrCPJCSf5aLBXNxUvo3ks8yjt+OS6lELHHJwv
 0hfkytCmujThA==
Date: Fri, 16 Apr 2021 14:24:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>
Subject: Re: [v9,2/7] PCI: Export pci_pio_to_address() for module use
Message-ID: <20210416192409.GA2744791@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413095257.GA21802@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_122411_172698_600CB567 
X-CRM114-Status: GOOD (  21.83  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 13, 2021 at 10:53:05AM +0100, Lorenzo Pieralisi wrote:
> On Wed, Mar 24, 2021 at 10:09:42AM +0100, Pali Roh=E1r wrote:
> > On Wednesday 24 March 2021 11:05:05 Jianjun Wang wrote:
> > > This interface will be used by PCI host drivers for PIO translation,
> > > export it to support compiling those drivers as kernel modules.
> > > =

> > > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > > ---
> > >  drivers/pci/pci.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > =

> > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > index 16a17215f633..12bba221c9f2 100644
> > > --- a/drivers/pci/pci.c
> > > +++ b/drivers/pci/pci.c
> > > @@ -4052,6 +4052,7 @@ phys_addr_t pci_pio_to_address(unsigned long pi=
o)
> > >  =

> > >  	return address;
> > >  }
> > > +EXPORT_SYMBOL(pci_pio_to_address);
> > =

> > Hello! I'm not sure if EXPORT_SYMBOL is correct because file has GPL-2.0
> > header. Should not be in this case used only EXPORT_SYMBOL_GPL? Maybe
> > other people would know what is correct?
> =

> I think this should be EXPORT_SYMBOL_GPL(), I can make this change
> but this requires Bjorn's ACK to go upstream (Bjorn, it is my fault,
> it was assigned to me on patchwork, now updated, please have a look).

Yep, looks good to me, and I agree it should be EXPORT_SYMBOL_GPL().

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> > >  =

> > >  unsigned long __weak pci_address_to_pio(phys_addr_t address)
> > >  {
> > > -- =

> > > 2.25.1
> > > =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
