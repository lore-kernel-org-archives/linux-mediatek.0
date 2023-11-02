Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F9CC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 00:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hOVGsFgn5d3osf3h1ZEuk/u4UxtMyZa8nWS8x28iVk=; b=DzIfWUWBEyRhIiRhjAdOfC2WRR
	8pGCZZwtuD7VcwSfIfXv5HLfp7r5JKgQN5DyVMoPKJNoXOUktOsYPCZ8L64BK5p/YCCfJPjc7NgaO
	VvsIL26veXfSyLXM5C6BT56ZD46S7r84Ae7NmQdsKzTYdrcmePmZctjlB8z7VRJjAEp7Wa7se0hBT
	47ce8Q/3mzjzLo54G4/johm/9Ys1Q4mNIH6aAkRheOZ4++TNM7JD5OIBmEB7FvkGd6bjD+01gadxj
	o+4f7gdbqVGvPnW5yrUYAx3zb/ZAoodPQ0Bf1vWgaik2GvItkSgqjQMXwNnpVh0W3fpzHjWaUk9+/
	M7q1NSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyLwE-008Qu4-1I;
	Thu, 02 Nov 2023 00:51:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyLw8-008QtZ-1X
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 00:51:56 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA29310A;
	Thu,  2 Nov 2023 01:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698886294;
	bh=cnWSsDL7WnE8Db7zl/3EgRYszJPpFWDJcMvcapCjdnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ReltFv63lzk2CVH5drftDEioWJxMoONkLKV11tL1jELsxlAUM3s2jismq39rh8XYu
	 qu55vVfNFL6J5jxJWv1YLQtojZAGVVCktpGG0SY2nYch6oer81VyiyZqSkxdY8Zfn3
	 SEFe9f7v6/09d5SKK935fILjm10hlH9ChAwvceNU=
Date: Thu, 2 Nov 2023 02:51:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org, rafael@kernel.org
Subject: Re: [PATCH v2 1/1] device property: Add fwnode_name_eq()
Message-ID: <20231102005156.GA5933@pendragon.ideasonboard.com>
References: <20231101072729.1142578-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101072729.1142578-1-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_175152_786855_5E39C620 
X-CRM114-Status: GOOD (  25.30  )
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

Hi Sakari,

Thank you for the patch.

On Wed, Nov 01, 2023 at 09:27:29AM +0200, Sakari Ailus wrote:
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides '\0') is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> since v1:
> 
> - Use str_has_prefix().
> 
> - Fix kernel-doc for @fwnode argument.
> 
> - Use size_t type for len.
> 
> The patch is untested.

Not anymore :-)

Which tree will this get merged through ? The thp7312 driver depends on
this patch, and I would like to get it in v6.8. If we can merge this
through the media tree it could be the simplest option, otherwise I'll
need a stable branch based on v6.7-rc1.

>  drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
>  include/linux/property.h |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 8c40abed7852..89a6e0833356 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -594,6 +594,34 @@ const char *fwnode_get_name_prefix(const struct fwnode_handle *fwnode)
>  	return fwnode_call_ptr_op(fwnode, get_name_prefix);
>  }
>  
> +/**
> + * fwnode_name_eq - Return true if node name is equal
> + * @fwnode: The firmware node
> + * @name: The name to which to compare the node name
> + *
> + * Compare the name provided as an argument to the name of the node, stopping
> + * the comparison to either '\0' or '@' character, whichever comes first. This
> + * function is generally used for comparing node names while ignoring the
> + * possible unit address of the node.
> + *
> + * Return: true if the node name matches with the name provided in the @name
> + * argument, false otherwise.
> + */
> +bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
> +{
> +	const char *node_name;
> +	size_t len;
> +
> +	node_name = fwnode_get_name(fwnode);
> +	if (!node_name)
> +		return false;
> +
> +	len = strchrnul(node_name, '@') - node_name;
> +
> +	return str_has_prefix(node_name, name) == len;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_name_eq);
> +
>  /**
>   * fwnode_get_parent - Return parent firwmare node
>   * @fwnode: Firmware whose parent is retrieved
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 083a1f41364b..096ade186601 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -108,6 +108,7 @@ struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
>  
>  const char *fwnode_get_name(const struct fwnode_handle *fwnode);
>  const char *fwnode_get_name_prefix(const struct fwnode_handle *fwnode);
> +bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name);
>  
>  struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode);
>  struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode);

-- 
Regards,

Laurent Pinchart

