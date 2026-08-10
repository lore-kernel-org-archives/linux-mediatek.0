Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B0BC5B56D
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0AdmS0+9+fwLhJajay5Wlura89yduV8D2X5f2OXIDQ=; b=4fZ+giDywePa8HIe/+4JDu5Z/O
	1q+XVVbUQAERp6yOEKBmuIQNbNxhZD0CHXDd2z+JaCO7/8vEm0sc35GEkAFQfSZoMiH70MAT0KYbp
	FehbkYQ5RKy3W/KgW3BuuKTqgIxK/wNTtlISFrDLu80B1hjym9np8WcIWCmcAM3kSgq6xoCSfBS3+
	iZQJsyzF89eQzUgbeNCbwqQQOrk7zAnUeWFi2CdCHzbtxPjc5h9y7EATOjJCJcLqSJh/vJ/vs/Kpn
	3CJJpIAYHqjH83bARjKYsAl4ryCJFeCRw+YRDDcP+IjFZ6UoYZdi7dZhujLV0pJJenO+NFT3ej2du
	tP87PDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSmO-0000000CNUG-1WK6;
	Mon, 10 Aug 2026 16:23:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSmN-0000000CNTc-15Qm;
	Mon, 10 Aug 2026 16:23:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AFFF4600E2;
	Mon, 10 Aug 2026 16:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39BE1F00A3A;
	Mon, 10 Aug 2026 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378990;
	bh=d0AdmS0+9+fwLhJajay5Wlura89yduV8D2X5f2OXIDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RHhq2xZoUFCgUI7UI6s1aaeIvL/fRyWwpBuKEbQAzqGhkI8dafmAQ0xxrTdSEMqCp
	 kWD2mxr1W8Mc4pR8K8h4kXmRp0bBKm3PFZ527M50UAZQNSKHdNi9drPgZbFHEAcxk+
	 ZJrLjmvEfQhCUa/C05YRE2iBCdrfdZotaUZy2yCeuk8wWA5iF2wcPMwbxU0LLpRilN
	 qLpUE9gxCE7x/e7GsHkouU4AiikecyE7mpDtdgMYMZHeYdQmhflFwyGhJ99Pp1svdY
	 vGUjl6F7LvctmxArlaEstfsywjuq2svHmTp47cb3mNxtKWfQaoI11cqOw5f68F8R82
	 FwbVbCUI9YrsQ==
Date: Mon, 10 Aug 2026 18:22:58 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v7 12/16] power: sequencing: pcie-m2: support matching on
 remote "port" node
Message-ID: <2qwnxzyxcnwepqpmjj2bc5jgo6dgytcuz7equqm6p4hruoy7hb@7lkl7dxksxgf>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-13-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724084328.3943997-13-wenst@chromium.org>
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2026 at 04:43:21PM +0800, Chen-Yu Tsai wrote:
> A USB hub can have multiple ports, and this driver needs to
> differentiate which port is being matched to. The USB hub driver now
> associates the "port" node with the usb_port device, so here we can
> use the remote "port" node to check for a match. Then fall back to
> the remote device node for the other connection types.
> 
> Also rewrite the existing "remote == dev_of_node(dev)" with
> device_match_of_node() for consistency.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v4:
> - Dropped blank line between __free() variable declaration and
>   subsequent use of the variable in conditional
> 
> Changes since v3:
> - Drop redundant device node validity check; device_match_of_node()
>   does it internally
> 
> Changes since v2:
> - Use device_match_of_node()
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
> index 83fe6a1396bc..691cad0a6dd0 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
>  	 * parent matches the OF node of 'dev'.
>  	 */
>  	for_each_endpoint_of_node(ctx->of_node, endpoint) {
> +		/* USB port devices are tied to the port nodes. */

I'd reword this comment to:
		/* Try the remote port node first */

With this change,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

