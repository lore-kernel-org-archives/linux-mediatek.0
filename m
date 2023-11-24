Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD5DC61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 14:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPsuG7vi2uoLh4A5uMSs6lRJ2CLau+QA82P2L1XNZ28=; b=1HcQfIG7wD7p99I7BMC6LUUw1I
	d/+/Bw4XnjW4sYJzIiRM0UfOXMK3Ri2w3QvRBaX62I30Y/yP/+AyJ8kW9BYFLQ0+oLHGBC0nQTG7P
	OmRBcJvVv9KE9TjtD1YyT5vlwXpmon4SY3QgcKbIZT1pJROnnG1Ci911aJIYQo+ncn3wdvl1Npycb
	XxKubuIC20sSljj8lshpzuGzlhvMd++ywFwUBEH9cjBxZh7ZGyXLnZ5ZpKS6N+NMJAxu3SX3u0AA+
	VCxj2j97kby72iDTAHbEA42mK/a/nl1JZtgOpk6Jr3F6IYWfRNpdCEmK719h9uxk9Vxmxyfi0xByP
	mE/lVsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6X0v-007Nx8-17;
	Fri, 24 Nov 2023 14:18:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6X0s-007NuW-0E
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 14:18:36 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6327F2E7;
	Fri, 24 Nov 2023 15:17:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700835476;
	bh=cH6hQ38rzWHK5Tx77hbQ/OdrWbXxGqrkFq/hZ6xOdBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yrr1BimigSC8Vg0IdIB4qEf137I29BrgGVcFqQRoIdYpc3P8WLabu6sJP3Vzdj5zu
	 NQQmnT/GM/1nL4fA3hxMaMK2ZMtcC/eJtZbCNPeIaypObESRsCG0Do9Om3IJFNBmRm
	 LOB+5csLGQAQ8enbyfEfbihVnNlrSoZmLni8Zvko=
Date: Fri, 24 Nov 2023 16:18:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231124141835.GA25272@pendragon.ideasonboard.com>
References: <20231123224658.6959-1-laurent.pinchart@ideasonboard.com>
 <20231123224658.6959-2-laurent.pinchart@ideasonboard.com>
 <3886bc9f-62ff-4f70-a654-34ecf0f5fea4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3886bc9f-62ff-4f70-a654-34ecf0f5fea4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_061834_246174_513F72E9 
X-CRM114-Status: GOOD (  15.07  )
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

Hi Krzysztof,

On Fri, Nov 24, 2023 at 09:20:58AM +0100, Krzysztof Kozlowski wrote:
> On 23/11/2023 23:46, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > The THP7312 is an external ISP from THine. Add DT bindings for it.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.

The DT bindings have been fully reviewed and acked in the previous
versions, and haven't changed in v7. Do you still want to be CC'ed in
such cases ?

-- 
Regards,

Laurent Pinchart

