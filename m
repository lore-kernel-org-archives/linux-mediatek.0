Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 00:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFC0dEjHuBkBRYg2qgbP65OPiAebhMkdypX7FU9pRuQ=; b=A/Ka0ZQy43LMMK
	mEpxLQ5lyOrmewoF2sKtJjTB9Rp2Y6azICGTdjbdcvezesOL1iAS+UFN/jhYUvR71Kped66utYZRa
	79XqeYbNntkHtpVhWGGl1ADZUzMJNkRpL4NV8+Ix/0eRZJxDwGR9IXwLjgg7qgKb+xUmMpl5ErzWn
	QaIHskWFQknItMXnxd5Xu5tkJZwmi01v4N88td3LSgVbI2XnQa+LHlN/QAOAjaJ0E6QH6FCTq/Y+X
	fg9+Peccu1O5NVvEPpK1myFyaMvrUNkp9cdw00soQvsqVLUv8TvLY8BzVjDirW7HKa4vFq7eK4wKf
	10Rf7YmO1+FgqsoTi40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrU1x-004UMQ-AN; Thu, 19 May 2022 00:28:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrU1l-004UIs-16; Thu, 19 May 2022 00:28:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68791B82263;
 Thu, 19 May 2022 00:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F77EC385A5;
 Thu, 19 May 2022 00:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652920106;
 bh=1+Ve81jnUQKmFYBZA+Izq7rgffaqeZ8+yGQjo73k7vE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=aN/YapCN5WzG2CzLXsVxJsSyCyRpZrREdQXBxUh/ZjkDKP+KUVl/foBEj6nY2qORY
 nrHqTcuEs49KsNQbIobCsp4iEC/ey075j0yB7JyfZgJsbLE7AxtUVTF1HsBBHmM5Gp
 kbM7kEYfuN/6g4282B4JnY56/jt4D6d3amg67lTF8/omMcclVXJn33qXCPg3gOPdb8
 on9GeJMWR/atVHNoYllqIopYaYGLInlV5Ibxxakls4bcKegvwLLBNhjiRp7BlmBi1i
 v1onNrx8uKPTd+tihXzFjkUytCgKaYLiZTUUztzCVulVzsVavxo78YjeXKtgfgFQ4L
 OBOFCYyYHwY+Q==
MIME-Version: 1.0
In-Reply-To: <20220509090939.845-2-sam.shih@mediatek.com>
References: <20220509090939.845-1-sam.shih@mediatek.com>
 <20220509090939.845-2-sam.shih@mediatek.com>
Subject: Re: [PATCH 1/1] clk: mediatek: update compatible string for MT7986
 ethsys
From: Stephen Boyd <sboyd@kernel.org>
Cc: John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Ryder Lee <ryder.lee@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 18 May 2022 17:28:24 -0700
User-Agent: alot/0.10
Message-Id: <20220519002826.0F77EC385A5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_172829_248315_570EBBE7 
X-CRM114-Status: UNSURE (   8.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Sam Shih (2022-05-09 02:09:39)
> Update compatible string of mt7986 ethsys clock driver to fit the
> devicetree bindings document.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
