Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305D3C5320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHig4yX8au1r3TtcT9eBCAOmm/FD7eddCZPr8er7leU=; b=b4s2+v45oB4hD7Y2gtzeVX87Lo
	cX7ZwU1gvlIatZH3QWFFyWuNcW7YqrNJvZHVBa/EaMnwRyPy7+eWg6w6XW3aEOm3zZ+p0hi3jUdrv
	ETsstpQ7VQxdVoZFB/vt4a4Ivqggiy4Y7CpjYPbDWBaZtOn8xhyT2W0gGl+pozmw44p6U7s+LFtmW
	YxDQ9+2udtij6VCcyCmSUcBXmiaQ/wKWgJC1ebBNxoEdCkGZ0We3lZtnP8gUcQfRR6xXaiIe7NKq0
	/JzjR2u5f23QZAFXV0kJGWaj4Bbd/kDaWEgJNd03b+WNYGE/dkUl/K1z2ZwAgp/6MWYMTwh1WFZc4
	WNSaVktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh2q3-0000000ByoJ-1HaO;
	Thu, 22 Aug 2024 08:06:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh2op-0000000ByTw-1AVv;
	Thu, 22 Aug 2024 08:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6694A611EC;
	Thu, 22 Aug 2024 08:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76EFC4AF0B;
	Thu, 22 Aug 2024 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724313918;
	bh=wzcR7Mwh1azPYWH7HlhLg0p7e/OQR5Zp88DKFu/CYRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AS+9ZdGu6JUQClGjWqbtpra4pNvHKg1LIAudkqiZZsaJMYpeJTIdEF6dR0pgoWuqi
	 aB4jC76ktQJp1pRl0fvX7TkkzHgXgGzVmzpzoGPaahLWN/au2K/PQMDYdOaILAP0mK
	 MUfV7+l1kEvJYurK4ZMaxSfMIcXJMbFjmHQSD1LP+hspUIlAg5TMBv9ZtoWUIuUEfP
	 uM1EB8egTIbPSHvseKlqrhOs8dD87piVvrGlGkUJIkdD5Vw4bTyhrX50PeZ98Pm8yo
	 hs1M9QKykij2HoBz0yYc5PnYUtcEpy4JTggss+Vb8PfHLzmPLIxZ4ynwQSJkm+C7PD
	 hq28yAwqV8AIA==
Date: Thu, 22 Aug 2024 10:05:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "friday.yang" <friday.yang@mediatek.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/4] dt-bindings: memory: mediatek: Add mt8188 SMI reset
 control binding
Message-ID: <2iqqjryrwimu4hi3sgdmujc6g3qxehruxxs32k33nmgle3wl67@bcz4ahhqt724>
References: <20240821082845.11792-1-friday.yang@mediatek.com>
 <20240821082845.11792-2-friday.yang@mediatek.com>
 <1160a651-b758-4aa2-ab13-599df8518914@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1160a651-b758-4aa2-ab13-599df8518914@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_010519_418543_7DD63AC2 
X-CRM114-Status: GOOD (  13.01  )
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

On Wed, Aug 21, 2024 at 11:28:17AM +0200, Krzysztof Kozlowski wrote:
> On 21/08/2024 10:26, friday.yang wrote:
> > To support SMI clamp and reset operation in genpd callback, add
> > SMI LARB reset register offset and mask related information in
> > the bindings. Add index in mt8188-resets.h to query the register
> > offset and mask in the SMI reset control driver.
> > 
> > Signed-off-by: friday.yang <friday.yang@mediatek.com>
> > ---
> >  .../bindings/reset/mediatek,smi-reset.yaml    | 46 +++++++++++++++++++
> >  include/dt-bindings/reset/mt8188-resets.h     | 11 +++++
> 
> Also, your patches did not reach DT patchwork, so something is odd.
> Maybe they got flagged as spam? Please investigate with your IT
> department. In case it keeps missing patchwork, they won't be tested by
> automation and I will generally ignore them (not apply). :(

Update: they reached now, so maybe this was some Patchwork issue. You
still can double check that you send patches correctly.

Best regards,
Krzysztof


