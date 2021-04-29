Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F59C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 22:39:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD5B61463
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 22:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD5B61463
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=vbvJfxqB1NtDbpSG5lNhb/zM91r7l5y+fZiaEZO6oVs=; b=dLrOMPfuXi8wMmbNp95V1xM82
	6MaSfO7sJoI6Jg1SweFVj1kOLHKrTK+yl1af4sWrB0n866t2S3uwT5LcsB3Wnenlr0SEdWXBNvRSW
	Wj1A4ely+150KBfEpF4hTr0IlIRplwQu7QLi6hiNg0L0uH3pGdE8vADJAUlHOxW04oGpYn2OIB/WQ
	On4rqdaZchftvgch32CQosML2aBvggmzjaN96vx6VG5LppSwPiLsk1PGikk3lJMCi4pn9YoDICTQR
	9ORqtxR2Vhf21y/DE3VvCHy1Ok9ELiuUj7jEpSkMDVftKQNrhJl9Rwrv8YV3kYSHRmmQycVtxPXSc
	BEehlEO1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcFJM-006eOh-4z; Thu, 29 Apr 2021 22:39:08 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcFJ7-006eKd-C4; Thu, 29 Apr 2021 22:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=goLQw1v3dhb+PKhIuYeTbTJl+hOVIz2fLpl2tx6M77M=; b=U3rCXe937gnSmWzviJDOe8WpkI
 ikdgHB5gHpl32G5OjjrV3928GRfUdZ1DBvDbu0hTlQFZR5D2ZYpxpM0VmBlhO5b9Qg0/MfKA3Gb2e
 d23BcrywfK2vYWNcqLmIw3qJHwsncqGyeOWsEy3+WsR3Ij7WnuatOmkschKIx+k+Sv6Jixa2YUxv7
 52DLMG9KHQWF4MzdgTK9CYF789MgKnlJTmTZYIZMNP62NAop5iCN+Uam4D0GdPPqNz6DSEzp34it/
 XgfTRQaa9eVkQrWlzYF5/i0u+lUEcOkoKo3d0pfq8Ixh02oLtqZhsQAvPtbxSmA2/6/nsf9APmDJv
 QQS6hluA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcFIu-0010pd-Oz; Thu, 29 Apr 2021 22:38:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 069696143A;
 Thu, 29 Apr 2021 22:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619735920;
 bh=FJMABtH4cJ+ulkHtvdjpFRnQDT287AnLQBcU7uZ3HuE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=gbNHxJKNLFLiIv667svdxfipXsmqwezyoKN/2QseSq68pQHGrhCXFI1k5WYaonlPa
 HRSLQp0J02skiT876VSW68SmZQKq9ghR3q9P79Hg0lp9ExFqadO+4CPN1Qx1FxKINA
 +CQnaHo4GEKHUeY8JMU8SZJDOyqBHvtM/8k4+1kM18OL90GlTkbJQkfCu/yzf9UBIO
 uiR5Uiiv+Bk9uhNQqii6u4+AKkw7/V2ndzQx3rhOGODbDkUoz8ImsgsK7cf5b+yAj2
 TRaTD0P0MPnV/JFKoQVCsruDhTwD4eHs505iuu97gvowpVPYBDnw8X2rjCdAS7wewv
 l0KQ29yN4laxA==
Date: Thu, 29 Apr 2021 17:38:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Amey Narkhede <ameynarkhede03@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek: Verify whether the free_ck clock is
 ungated or not
Message-ID: <20210429223838.GA588275@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429134749.75157-1-ameynarkhede03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_153840_868123_38C92DAA 
X-CRM114-Status: GOOD (  19.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Can you make the subject say something at a higher level instead of
just paraphrasing the C code?  I'm guessing this means resume will now
fail if the clock isn't turned on?

On Thu, Apr 29, 2021 at 07:17:49PM +0530, Amey Narkhede wrote:
> Verify that the free_ck clock is ungated on device resume
> by checking return value of clk_prepare_enable().

Also the commit log -- this doesn't say anything more than the code
itself.  Did you find this by tripping over it?  Or just by code
inspection?  I guess without the check, we continue on and try to
resume, but accesses to PCI devices fail and maybe return ~0 data or
cause machine checks or something?

> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 23548b517..9b13214bf 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -1154,11 +1154,14 @@ static int __maybe_unused mtk_pcie_resume_noirq(struct device *dev)
>  {
>  	struct mtk_pcie *pcie = dev_get_drvdata(dev);
>  	struct mtk_pcie_port *port, *tmp;
> +	int ret;
> 
>  	if (list_empty(&pcie->ports))
>  		return 0;
> 
> -	clk_prepare_enable(pcie->free_ck);
> +	ret = clk_prepare_enable(pcie->free_ck);
> +	if (ret)
> +		return ret;

Most callers print an error message when clk_prepare_enable() fails.

>  	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
>  		mtk_pcie_enable_port(port);
> --
> 2.31.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
