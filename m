Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F81FC388F9
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 21:53:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3275A20780
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 21:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BHqNoohj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHJ3YSUn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3275A20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=L8mrjpZnf77JM9dRsTKCxXQHxKOV9Uq8BQCeC35qZMU=; b=BHqNoohjGN4R+mwSy6OV1RqQq
	Bm365LYnjsXCuaxjSBaomgCwUNTkTLOkd9vOiOw/PaKaInPhoUfehX56oPBUr3EtPB3NJGdOJeehl
	wRdHEZ6Wcv0MHOdfTsDfeS05Sc7KPt8ZmimWJqx2VjHGy58FA3BrycoJKui+PMx8JYRBRT3s/c71w
	cGsO3N45oqB+21hNlQ2u9axvIy4bPx7nvBlX1q6sQ+h9UWQqD8odwufKBibtinq0zJix4VyasiZZm
	WcIDF5r43j6rTsl4RCAyq+ubtFAnsYHLQ27v5NYLyqlwd5HPuxcmUOB1FsVIghZeeCKJq40ZadjQc
	DbaCGWd3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka4Em-0000vn-6d; Tue, 03 Nov 2020 21:53:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka4Ek-0000v7-AI
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 21:53:07 +0000
Received: from localhost (230.sub-72-107-127.myvzw.com [72.107.127.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1647420780;
 Tue,  3 Nov 2020 21:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604440385;
 bh=yoBMHGcgRu6treiQlSwNvpxiAT/18A01oukKu7Eg8Co=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=vHJ3YSUnWQcayJDc4n52S8eMzMfoUSY4xVboDBfH25nai0+liUgeyDVB3BO+u/TFx
 39fHwXM5ktxZFadWuWTVZzF4PLYNs6ne4tnbGC8oS8GinPMMyBH5F/FDJG4+U+OomR
 lYriSuuiytYA+rr+KvvkgdR/AGK20v8r2wzGWJDM=
Date: Tue, 3 Nov 2020 15:53:03 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] pci: mediatek: fix wrong operator used
Message-ID: <20201103215303.GA267664@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2418edb8c8c81bc646ce9c508939dc27e848dcd7.1603817008.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_165306_453280_CD53141C 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

  $ git log --oneline drivers/pci/controller/pcie-mediatek.c
  ...
  0cccd42e6193 ("PCI: mediatek: Add controller support for MT7629")
  6be22343cc54 ("PCI: mediatek: Get optional clocks with devm_clk_get_optional()")
  ff7a5a0a8562 ("PCI: mediatek: Fix a leaked reference by adding missing of_node_put()")
  cbe3a7728c7a ("PCI: mediatek: Enlarge PCIe2AHB window size to support 4GB DRAM")

Make yours match in capitalization and sentence structure, e.g.,

  PCI: mediatek: Fix ...

On Wed, Oct 28, 2020 at 12:51:48AM +0800, Ryder Lee wrote:
> Fix the issue reported by Coverity:
> Wrong operator used (CONSTANT_EXPRESSION_RESULT) operator_confusion:
> (port->slot << 3) & 7 is always 0 regardless of the values of its operands.
> This occurs as an initializer.

The important thing here is *not* fixing the Coverity warning.  The
important thing is fixing the *bug*.

The bug is that we computed "func" incorrectly.  The commit log should
mention what bad things happened because "func" was incorrect.

  #define PCI_FUNC(devfn)         ((devfn) & 0x07)

  func = PCI_FUNC(port->slot << 3);

So "func" was always 0 before, and from the code, it looks like that
means we only configured FC credits and FTS for function 0, so any
other functions may not have been configured correctly.

And it looks like this only affects MT2701 and MT7623, since those are
the only devices that use mtk_pcie_startup_port().

This is all info that should be in the commit log so users can tell
whether they are affected.

It's nice to still *mention* Coverity since it gave us useful
information, but all we need is a reference like this:

  Addresses-Coverity-ID: 1437218 ("Wrong operator used")

> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index cf4c18f0c25a..1980b01cee35 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -760,7 +760,7 @@ static struct pci_ops mtk_pcie_ops = {
>  static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
>  {
>  	struct mtk_pcie *pcie = port->pcie;
> -	u32 func = PCI_FUNC(port->slot << 3);
> +	u32 func = PCI_FUNC(port->slot);
>  	u32 slot = PCI_SLOT(port->slot << 3);
>  	u32 val;
>  	int err;
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
