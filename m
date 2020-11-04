Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C416C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 13:11:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0262071A
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 13:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AY0hTtEy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkPQO35p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0262071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=jNsidDecCjxRahEUpSKbe3rwtPpqOWu/LYkpISJP+S4=; b=AY0hTtEynZz0AudsZ9KwetSFH
	YCYx4ZGfwevL57UD6gELFA0nSiteZqRHa9HvbjauRcj0BWWtCfbawWJ9UoABg3tmTS1eWQ23Y+pzF
	p9OZ0GrEr0zvrNaXmFuJFKVIIQ45LfbLUMns2NofGTlnEqjN+4+1uKlkPfzNmz7gBX5nETe5bBx7e
	DRKLcEDDeg170pTdn2WsZ9FsCOQdPVuukhrXQZheghb8mvZ5m/512O/VjnkvROXiT3dOPKPkdQZF2
	+qFr7RT3Zf0FglBWTCsv0K3Do1NjEwkBb0I4MtbHDTy4z+6Wl3h742kfggyjVEQDAnv3I7TH1Acux
	J6nvKcL1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaIZ4-0007Ec-43; Wed, 04 Nov 2020 13:11:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaIZ1-0007Ds-T5
 for linux-mediatek@lists.infradead.org; Wed, 04 Nov 2020 13:11:00 +0000
Received: from localhost (230.sub-72-107-127.myvzw.com [72.107.127.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8787B2071A;
 Wed,  4 Nov 2020 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604495456;
 bh=kn+yF28RMt7e0fZL7+4iW/OsXTskEYiuJM+B99/2Rvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=hkPQO35pDKivkQ2XEOBVSDGBv3gl9uJk1HuP9Sl7/yndTFGdm9AQQaP5IXcODiauE
 HB2VRZHr4lRlZDaph8PQFmo0aKybpWVsA5lLrdc8+UOasvb2f7VGhompqVWYTb+cMk
 y50qT45u76PoctQVAMqjgK9n5WAmVmJNb6uYyxMk=
Date: Wed, 4 Nov 2020 07:10:54 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH v2] PCI: mediatek: Fix wrong operator used
Message-ID: <20201104131054.GA307984@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21f722bb80c440b69dd350b48f86cd7d076a8adf.1604443256.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_081100_026874_CF51FB19 
X-CRM114-Status: GOOD (  19.02  )
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

The subject needs to say something about the user-visible problem
you're fixing, e.g., functions other than 0 aren't configured
correctly.

On Wed, Nov 04, 2020 at 07:10:11AM +0800, Ryder Lee wrote:
> SoCs like MT2701 and MT7623 use mtk_pcie_startup_port() to compute "func",
> but from the code, the result we get is incorrect.

This affects precisely "MT2701 and MT7623", not "SoCs *like* MT2701
and MT7623".  How about this:

  PCI: mediatek: Configure FC and FTS for functions other than 0

  "PCI_FUNC(port->slot << 3)" is always 0, so previously
  mtk_pcie_startup_port() only configured FC credits and FTs for
  function 0.

  Compute "func" correctly so we also configure functions other than
  0.  This affects MT2701 and MT7623.

> 	#define PCI_FUNC(devfn)         ((devfn) & 0x07)
> 
> 	func = PCI_FUNC(port->slot << 3)
> 
> The "func" is always 0, which results in other functions may not have been
> configured correctly. (i.e. FC credits and FTS)
> 
> Addresses-Coverity-ID: 1437218 ("Wrong operator used")
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> V2 - revise commit log
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
