Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7FAC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 17:55:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F37C321534
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 17:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zhpKZWy7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jjMRPabh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AkjdE5Xr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F37C321534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K3PKln7j8IWDyICFjrAflNTjGgcOMzXW87m0ju3b1fg=; b=zhpKZWy7dDtxWexIUu+ibUKat
	jE0Z92tUKTvnvn7aIdJuuMch10V7w4NxKb6OKxQ0MBPWvcXXSOG3P1h0rp6hrnY2RJyW8LjAzjbwj
	3b512r5XjKYiIE8PPgDKkNQIGClD5YT1aoQbD6JKlI50i1aBcgUKfPJiZ6S1xmsUdWOrbE2c6GvjW
	jHHuUC1/xxNEJpophIgphySn5r8Oy/Fn4HdKByCE+9nSgqTDeqD8UFXLs++dJtACmVrqOgzHrZqm8
	1FskGTI9spfoXMcGpgjn5NpIG5jqDZRWEneTWt8c+xP6VQHYCd0osxBZa/t2w35W9OKTC1N2dBsXQ
	6D+TeOPFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZHZI-00033T-LC; Sun, 01 Nov 2020 17:55:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZHZG-000339-9p
 for linux-mediatek@merlin.infradead.org; Sun, 01 Nov 2020 17:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=WsQvKHHWSLI7xF1JzIgcRmub4R8wiDN5c/q+ZOqQmyE=; b=jjMRPabhNvn9sd+MgiCdntH6dp
 6DAKQD2gQCac+V0LzrdwpqjiSPm/OdxOOSYMBLyR9ZhbTIeeVS0tvk3bQ68foxD3e5dt3bQMfAQbu
 fpuEb+MazW4fotRNtLAm4MTU7WTxgDGYwek83xfCXeoDy4F7eQcrBNisY/BUCzXUb4pDWp+xUAdVI
 Meu7T+G9clgPOCZvkRNTfedKvrvl6mhVfvXZfxwyQ4mxxQy72rMURe21rqDlLnPe9KwdZh5Qrniza
 UjtDXTY0kq6Gr8VC+G9EhSKr2S9+oTguW/dHMkKp0Oxw7b3ooXFi8RxdvICPc1DTE42qHSlJlqwGd
 HcM810lg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZHZ7-0000hq-Lu
 for linux-mediatek@lists.infradead.org; Sun, 01 Nov 2020 17:55:01 +0000
X-UUID: 0d089efe8de744bbb165ba4adf570954-20201101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WsQvKHHWSLI7xF1JzIgcRmub4R8wiDN5c/q+ZOqQmyE=; 
 b=AkjdE5XrtjDDYnMDqjkVFruHTDFUA++eVqDg90UpavXqCy8kcB6I1x/e9GsnpxKdZBSQdNjY/C73R/PRHfdNS5XF8sa50vZHC3QHD8IAVoyGmyJHNDPhDsGXS/myvxOohv17gSCLNbK8DS8I2xMWCFDdpGMmSWkVYhoH/6+EU5k=;
X-UUID: 0d089efe8de744bbb165ba4adf570954-20201101
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 721935095; Sun, 01 Nov 2020 09:54:31 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 Nov 2020 09:54:29 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 01:54:20 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 2 Nov 2020 01:54:20 +0800
Message-ID: <1604253261.22363.0.camel@mtkswgap22>
Subject: Re: [PATCH] pci: mediatek: fix warning in msi.h
From: Ryder Lee <ryder.lee@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
Date: Mon, 2 Nov 2020 01:54:21 +0800
In-Reply-To: <87lfflti8q.wl-maz@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DFEE9065E4A27B1C12B5A3B4E528B0D7B43E8E7FB97307B71B385155CFFD21FE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_175454_196930_80438781 
X-CRM114-Status: GOOD (  27.72  )
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
Cc: frank-w@public-files.de, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-11-01 at 11:43 +0000, Marc Zyngier wrote:
> On Sun, 01 Nov 2020 09:25:04 +0000,
> Frank Wunderlich <frank-w@public-files.de> wrote:
> > 
> > Am 31. Oktober 2020 22:49:14 MEZ schrieb Thomas Gleixner <tglx@linutronix.de>:
> > 
> > >That's not a fix. It's just supressing the warning.
> > 
> > Ok sorry
> > 
> > >So it needs to be figured out why the domain association is not there.
> > 
> > It looks like for mt7623 there is no msi domain setup (done via
> > mtk_pcie_setup_irq callback + mtk_pcie_init_irq_domain) in mtk pcie
> > driver.
> 
> Does this mean that this SoC never handled MSIs the first place? Which
> would explain the warning, as there is no MSI domain registered for
> the device, and we end-up falling back to arch_setup_msi_irqs().
> 
> If this system truly is unable to handle MSIs, one potential
> workaround would be to register a PCI-MSI domain that would always
> fail its allocation with -ENOSPC. It is really ugly, but would keep
> the horror localised. See the patchlet below, which I can't test.
> 
> If this situation is more common than we expect, we may need something
> in core code instead.
> 
> 	M.
> 
Yea, mt7623 (mtk_pcie_soc_v1) does not support MSI, so that's a way to
handle it.

@Frank, could you help to test it?

Ryder

> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index cf4c18f0c25a..52758b546d40 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -151,6 +151,7 @@ struct mtk_pcie_port;
>  struct mtk_pcie_soc {
>  	bool need_fix_class_id;
>  	bool need_fix_device_id;
> +	bool no_msi;
>  	unsigned int device_id;
>  	struct pci_ops *ops;
>  	int (*startup)(struct mtk_pcie_port *port);
> @@ -435,6 +436,9 @@ static int mtk_pcie_irq_domain_alloc(struct irq_domain *domain, unsigned int vir
>  	struct mtk_pcie_port *port = domain->host_data;
>  	unsigned long bit;
>  
> +	if (port->pcie->soc->no_msi)
> +		return -ENOSPC;
> +
>  	WARN_ON(nr_irqs != 1);
>  	mutex_lock(&port->lock);
>  
> @@ -966,11 +970,13 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  	port->slot = slot;
>  	port->pcie = pcie;
>  
> -	if (pcie->soc->setup_irq) {
> +	if (pcie->soc->setup_irq)
>  		err = pcie->soc->setup_irq(port, node);
> -		if (err)
> -			return err;
> -	}
> +	else
> +		err = mtk_pcie_allocate_msi_domains(port);
> +
> +	if (err)
> +		return err;
>  
>  	INIT_LIST_HEAD(&port->list);
>  	list_add_tail(&port->list, &pcie->ports);
> @@ -1173,6 +1179,7 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
>  };
>  
>  static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
> +	.no_msi = true,
>  	.ops = &mtk_pcie_ops,
>  	.startup = mtk_pcie_startup_port,
>  };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
