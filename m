Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF451C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 15:37:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68FFB6508F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 15:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68FFB6508F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=kYLwfNHeNrz24uqsouN8kPBr4gpXRepz1wnl6skgQiQ=; b=BEpI6k/6DynQhBapawRFBt9FP
	a2UC64ntd1oRdh5u7OLfid46dGHtJ+UzizfVzyqAJRuKHGL8HL8qR4sLtcxuSqxohEymfybmJRNiX
	rI8Ydd4NirXjAKCQ8EWRTnSzzm6yifOr83iL07xgkk716dxZ2jJvDkxCKSpgWYxoTZwUhfjq/2F43
	7wj5m4Uz23BrQtSB24tMDuJbCBupO6BS60YSWMGqJ481H/i53V8kT/BECOKJdk6uCxRiXFPINtrLO
	2XayaH0SVjVvJn9o23EiJuUPONmftT3JskIMS3uEPby60XhWEccGCPV3Q4pqfh/EJO9BUv3gVqtCA
	4gGceXKcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lICVm-00FTKu-Hh; Fri, 05 Mar 2021 15:37:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lICVi-00FTJi-4g
 for linux-mediatek@lists.infradead.org; Fri, 05 Mar 2021 15:37:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5713265090;
 Fri,  5 Mar 2021 15:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614958620;
 bh=rbMzPDjT4HmtnkJbeXK9PYCr8n58NGk1TLIuSFpw8Eo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=m/gXkHAkJUvzGM2T9xnIEc8FAETryEb4epzy7G+Arv9SWZOoKErj66y8yuyM3xJHl
 dPZyDkd2755T5pNKGi0XH6o8W3DVC7vfG9RNKg+6GNuYhHH4EmqXLNNC0UaVXu9oDF
 BAztiUdwXX6k5FWomitWLlVA4kKzmmIXa4XFUtn6rQN0EKwVoSNM2HfuGbpfNuuOXc
 +xdTE14BhKLfgqXsXG7nifm6J0fADs/BXqShOawJXr7Z0r96CmnUfv2PgbrTqmS8D7
 qX75HFPQ1iyf98NfdP3KHZu1rrKgKfarWpKJqDhWDCUMYckyujMUlD8tAnkfGFPUxr
 g/cVkZFYvw6mw==
Date: Fri, 5 Mar 2021 09:36:59 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek: fix optional reset handling
Message-ID: <20210305153659.GA1098921@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305091715.4319-1-p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_153703_752142_288911A8 
X-CRM114-Status: GOOD (  21.21  )
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

[+cc Ryder, Lorenzo, Rob, linux-mediatek (mediatek maintainers)]

Capitalize first word of subject per convention:

  PCI: mediatek: Fix optional reset handling

But "Fix" is pretty non-specific; it doesn't give any information
about what the change does.

On Fri, Mar 05, 2021 at 10:17:15AM +0100, Philipp Zabel wrote:
> As of commit bb475230b8e5 ("reset: make optional functions really
> optional"), the reset framework API calls use NULL pointers to describe
> optional, non-present reset controls.
> 
> This allows to unconditionally return errors from
> devm_reset_control_get_optional_exclusive.

"devm_reset_control_get_optional_exclusive()"

This basically restates the code change, but doesn't say *why* we want
this change.

> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 23548b517e4b..35c66fa770a6 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -954,7 +954,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  
>  	snprintf(name, sizeof(name), "pcie-rst%d", slot);
>  	port->reset = devm_reset_control_get_optional_exclusive(dev, name);
> -	if (PTR_ERR(port->reset) == -EPROBE_DEFER)
> +	if (IS_ERR(port->reset))
>  		return PTR_ERR(port->reset);

Before this patch,

  -EPROBE_DEFER:           abort probe, return -EPROBE_DEFER
  other errors:            port->reset = -EINVAL, etc, continue probe
                           future WARN_ON() from reset_control_assert()
  NULL (no reset control): port->reset = NULL, continue probe
  valid reset control:     port->reset = rstc, continue probe

After this patch,

  all errors:              abort probe, return err
  NULL (no reset control): port->reset = NULL, continue probe
  valid reset control:     port->reset = rstc, continue probe

So IIUC, if devm_reset_control_get_optional_exclusive() returns an
error other than -EPROBE_DEFER, e.g., -EINVAL, we used to continue.
We would then get warnings from reset_control_assert() and
reset_control_deassert() because "IS_ERR(port->reset)" was true.
Since the reset control seems to be optional, I assume the port *may*
still be usable even though we get warnings.

But after this patch, if devm_reset_control_get_optional_exclusive()
returns -EINVAL, we will fail the probe, rendering the port useless.

If my understanding is correct, this seems like a difference we should
mention in the commit log because it took me a while to untangle this
and the subject line doesn't hint at it at all.

>  	/* some platforms may use default PHY setting */
> -- 
> 2.29.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
