Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09ADC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SvlkoeKowfsPCSgEcDhTecKaiZsQ0uIbfz7tpllvqA=; b=0zcEA2eOWbbjPcPG4D4eC2wAN7
	dXhDEquBkxPLrYGV3cMcfcaqiCpmBfTDWPQ2Z7lacvZHu3QP3xT5VUgkjYE86A69eYzBjMNt5owHq
	GzeBBz+PkZbQwE8BKiRV0b6pgbih5QQUS1vJ9qD4wVsBLaadNpVlzth4d6HC+yDP4tlBzxumjTvya
	y09NHCn6MTnoDeNgec0umjnZ/+ZcITnGYkR/h4lr6ezQXnEZvIDBlFwbBZoKdB5uocCQi5Dmgt7gi
	4DXNDvwbyqZfcqNtMvYnImtDBdx0WpDgduhbDlERD1cULNHEPJETGDrfKoiV1EphcGH76zeBn3c+k
	spryoyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrl3-005g9d-2b;
	Tue, 31 Oct 2023 16:38:25 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrfJ-005chS-09
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Oct 2023 16:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698769949; x=1730305949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SAVUUSy6kEq+VaAk+hGdPRfOn1rye2cEo6cJ7P/cJ4A=;
  b=Mhvf6wW83Q863cl15m9l7p1+fArk9M+mDE9Jv9NB4xKr9vg/P1BHRU0l
   ObcNTzyGtkVPdbBg+nUpcIXAhQITg0osUwGWI6QJu82WoK11P5AjjDK3P
   zeoeW6pbiHD7u+a+XMNl5YIqRmPxmJxBivSCZ70rWa31ER4xVzxTM0nkD
   2q+L5eWQxDuUcSIYOkzxVow1ufp8+8LiNfAI6QVca+CmuJ0YzfOuXkaTd
   yjpk/Z0gbCV25zDyfjwd9vJVe/3WIbdIU06opu/MlJYVYCdQ6vZXRzsMF
   hYKkpJloLPyVIEfjJDSZRGWCoX8yJMzeXPuuiIloD0XW7fajTO7G0RUab
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1172521"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1172521"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 09:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851293283"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="851293283"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 09:32:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qxrf8-0000000ACil-13uQ;
	Tue, 31 Oct 2023 18:32:18 +0200
Date: Tue, 31 Oct 2023 18:32:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-acpi@vger.kernel.org, linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUEsEQQTTlXmOHPt@smile.fi.intel.com>
References: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093229_166110_D4B7F236 
X-CRM114-Status: GOOD (  12.26  )
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

On Tue, Oct 31, 2023 at 03:53:06PM +0200, Sakari Ailus wrote:
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides '\0') is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.

Some comments below.

...

> Would you be able to use this to replace of_node_name_eq()?

Can you point out to the use case? Maybe it can be rewritten using existing
APIs?

...

> +	len = strchrnul(node_name, '@') - node_name;

> +	return strlen(name) == len && !strncmp(node_name, name, len);

Seems like this is reimplementation of str_has_prefix().

	len = strchrnul(node_name, '@') - node_name;
	return str_has_prefix(node_name, name) == len;

-- 
With Best Regards,
Andy Shevchenko



