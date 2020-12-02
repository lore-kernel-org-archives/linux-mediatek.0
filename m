Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD744C64E7C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 13:49:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BDFA2173E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 13:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BDFA2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=m7G5pNxkJwH6geu3/vtnu8Tj2/QcNkmpR5dEK1K5h/k=; b=uuaqK8RJm/h/gV6TKkqjrkk/V
	3OiNbeSNpk5pEK+rP1XTJBk2+cl48RyiaYfyFBn20UVBdxbGeBTeW50QVME5Rkq4DRilbAym/43HW
	uVVuzuaQ7OWNGtJRb+AX8zvDMUirqUKPGKzMAWIwR4ZEqCmrZm0fHJiEbBxo/b5riYHbfsT5js2s6
	62DQpbPS5FoGSiKlhnygyKeDKZ0GbhQqzZbCnRCnIBy8Ugj7bodApRPE7iQkHBDsJlOARosj4tuix
	eXihxw6+L5SH69SppesqpFjb6nqKvFDzi9C9Y7DKIZJB4L3kG70oh2xRc3p1oumdERaX1Hsu5qIPv
	72OoTvp+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkSVK-0002Tm-3e; Wed, 02 Dec 2020 13:49:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkSVF-0002SH-Tb; Wed, 02 Dec 2020 13:49:06 +0000
Date: Wed, 2 Dec 2020 07:49:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606916944;
 bh=b/Xu8QFJnFffNq+YXrCB3fOxEiWxD3U0avrdF1PeCVQ=;
 h=From:To:Cc:Subject:In-Reply-To:From;
 b=O1HEZyDTBcrhaOHEmudAXKJuxUTiKzsV6vBtEG6fiPd7TZNPtXd6NHjbPlW9dftgo
 zrrwWLOw1lTT0+YrZqnWuW6jxIvxIOXUwXM4vRLbXFFe6VlEitzJAVPRi9Ed5ajptY
 WcqxutReaW5Vlyyno0RnDmtkDFcw10kgjIEKrC8c=
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v1] PCI: Export pci_pio_to_address() for module use
Message-ID: <20201202134903.GA1419281@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201202131255.6541-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_084906_175110_EF4BD740 
X-CRM114-Status: GOOD (  16.53  )
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

On Wed, Dec 02, 2020 at 09:12:55PM +0800, Jianjun Wang wrote:
> This interface will be used by PCI host drivers for PIO translation,
> export it to support compiling those drivers as kernel modules.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>

Please include this in a series that adds a modular host driver or
converts an existing one to be modular.  That way we know we have at
least one user and things get merged in the right order.

> ---
>  drivers/pci/pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index a458c46d7e39..509008899182 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4003,6 +4003,7 @@ phys_addr_t pci_pio_to_address(unsigned long pio)
>  
>  	return address;
>  }
> +EXPORT_SYMBOL(pci_pio_to_address);
>  
>  unsigned long __weak pci_address_to_pio(phys_addr_t address)
>  {
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
