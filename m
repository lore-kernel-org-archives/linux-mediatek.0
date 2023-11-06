Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393BCC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iBcomyVmEjUD0j9FWrWDHeKOOAm715NJTMxNulSKnM=; b=IHPv6zFKnYvUKlprrvitSJsNp/
	ROumQpz9enSRwSCgLEMQs0eSkHyo9oMy1zBwfcqUM8IphCHMJ4xgsUpePwa/9XBH/8mHvStQgBqrJ
	pgAStAy2fsX22EAnXteXvMhUQT7uEczkObwP9ahFcUCEMes+yRMjRYlZKJuBRgw4RP6Ix4FE0DsDT
	/Gzunha+bwAui5qaZM7x8sabUlEOa17uY33aCwWefcuGI5wrRwH5YBDQUClfDmQ4z8RcemoQm2+ZT
	UTWiKx8jTbaDVT32mxvEcrZkM5cCTy0J770wg7e0OJPGidfwLXU98skVLS+RNgDJTL4BokVnSI//g
	6XbW5EaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvF2-00G5yO-0P;
	Mon, 06 Nov 2023 08:45:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvEy-00G5xq-2x
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 08:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A3F5603F4;
	Mon,  6 Nov 2023 08:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44892C433C8;
	Mon,  6 Nov 2023 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699260347;
	bh=5xXvKddmOjkdvmlwD2/AMNw96AW1goSPQvOR6hvcnSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxZpzL8V3jwPQhb6yPwdi0HNmb1wBHdOZ5HiIEIFeQa8GS8p/5c+oytF+XeY4mm50
	 /zlSiUdM/Mwmz4HGgrhr83xZ7cc1GV9PeYCtBPVwuetEcIuoQeTUF8iNyAQQ4ONEl5
	 CiZX14JqbsAA+oLXtqUfmQ2xszB5JwnE9W1POUoY=
Date: Mon, 6 Nov 2023 09:45:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: Re: [RESEND PATCH v4 1/1] device property: Add fwnode_name_eq()
Message-ID: <2023110623-alongside-credible-833d@gregkh>
References: <20231106073141.1250344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106073141.1250344-1-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_004549_008546_79981296 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 06, 2023 at 09:31:41AM +0200, Sakari Ailus wrote:
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides NUL) is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> ---
> Hi Greg,
> 
> Could we merge this via the media tree?

For 6.8-rc1?  Sure, feel free to:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


