Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38D3C64E7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 03:48:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC4121D7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 03:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC4121D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tpByosgH0abrvIyB5i0rKu4iocA9PVPONdLRqsplQ0M=; b=R7jUviJ7o9VowI1CUKF+u5moF
	1lzgciJOi49Y7euWgQXzdTH4+n5VrT9pWOtv+MsBERYFrqr4+mh72bf+IXhHNI0WAyINgHWgLgOPI
	k5QWWY6GrwQi0JNiyanOfUTXY4OrT53h6EgXkfr7XA+T4AOAFp06LWDnj46hpBCvesnfsmFSAFbiA
	qqVsaY54smqciRqtfHLSwMSXdLA/H4Nb0/9VOXEXCMD5IwepjD+1QsSY3YjqN3g/NuvSNydM9qsaI
	sMLw5SUvq6vwn+uZJpldcfsPrHjPiMXMMTzxRLKCpgRu/4D9nScX646598M8MV2fL+t794v0vHtzq
	PBBLOZOvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkfbg-000179-JD; Thu, 03 Dec 2020 03:48:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkfbb-00016V-9k; Thu, 03 Dec 2020 03:48:33 +0000
X-UUID: 5e19400c6f434852bb256553cdb51070-20201202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=egwE3BGfFnVU42RB8G4cDpSLIosNS6Hpw+CGdp7GE4A=; 
 b=JoFETGIITk3xxYGUSEELhsvLMpKEcfAQthxQIoAIJnguHQxvN3ThP/MFYtoRK3wDD4S9zuoyg6Sc+6HOA2XX0OOVF6P6+St0sx2GQxEb772Izjv9qvkD92s8OSKfnEWyh75sQC4/q6u+vrExbe78fKsk7stV56Kt6sDjDiIKQBM=;
X-UUID: 5e19400c6f434852bb256553cdb51070-20201202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 8780239; Wed, 02 Dec 2020 19:48:30 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 19:48:26 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Dec 2020 11:48:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Dec 2020 11:48:18 +0800
Message-ID: <1606967298.14736.67.camel@mhfsdcap03>
Subject: Re: [v1] PCI: Export pci_pio_to_address() for module use
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Date: Thu, 3 Dec 2020 11:48:18 +0800
In-Reply-To: <20201202134903.GA1419281@bjorn-Precision-5520>
References: <20201202134903.GA1419281@bjorn-Precision-5520>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B083340B9C9A9BFA0D69806F47BFEE28F5C6E5BE94BE9DD35B07D24188C0507B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_224831_545692_8A83880B 
X-CRM114-Status: GOOD (  19.97  )
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
Cc: youlin.pei@mediatek.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sj Huang <sj.huang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-02 at 07:49 -0600, Bjorn Helgaas wrote:
> On Wed, Dec 02, 2020 at 09:12:55PM +0800, Jianjun Wang wrote:
> > This interface will be used by PCI host drivers for PIO translation,
> > export it to support compiling those drivers as kernel modules.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> 
> Please include this in a series that adds a modular host driver or
> converts an existing one to be modular.  That way we know we have at
> least one user and things get merged in the right order.

Hi Bjorn,

OK, I will include this patch in the next version of pcie-mediatek-gen3
series.

thanks.
> 
> > ---
> >  drivers/pci/pci.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index a458c46d7e39..509008899182 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -4003,6 +4003,7 @@ phys_addr_t pci_pio_to_address(unsigned long pio)
> >  
> >  	return address;
> >  }
> > +EXPORT_SYMBOL(pci_pio_to_address);
> >  
> >  unsigned long __weak pci_address_to_pio(phys_addr_t address)
> >  {
> > -- 
> > 2.25.1
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
