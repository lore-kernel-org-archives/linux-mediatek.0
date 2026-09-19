Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B36C982CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2026 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0OCTyA7s/r9aQUp6Mw8/8jVPFE4DEknKW9HCUStOOjc=; b=vGE8PuVpxmrhvu
	vfjJyyZSDpqMsy+Uue/hQAiUiPZvuoxOwVZ3yZNu0w4GPW6whubEeQ0faJBJqIw3tgu5hScJKluBU
	kbtEHqD7Dq0/nbXJGnZhYOd2uUD59i8xm+2cD+dndB1vVXjyYui6u55G1tTMd1BAj7WGU8Lypyhwo
	tblWmsKqWyG+dailB8JE409TE26PAao+tBNvi/NqR4XYsI9xGirWq7f129LVRlOWc9jcEaATqltVC
	4+GqOUyecF4UWXZLkzcqS3mMtX18+YnE8EgtyCBj4L7SxCYyWkRgOTkUen4IcfVOfrzon9RaG+XPI
	3I13e7mLpMT9UUsHgALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7tY0-0000000GDqI-0rDE;
	Sat, 19 Sep 2026 11:48:00 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7tXx-0000000GDpB-0EmI;
	Sat, 19 Sep 2026 11:47:58 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 8176F606C4;
	Sat, 19 Sep 2026 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789818473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0OCTyA7s/r9aQUp6Mw8/8jVPFE4DEknKW9HCUStOOjc=;
	b=MWvMKCPlr11NeW/bYzee3d+HGfxrg/HP6EmFopACA3PF4gDHDkD10G/jeQJFRg1s4LGI2z
	4o0qKn9pelV0/EkFtBTrEZCE5u6EmCpfowXY8+TmVpefjyPRrMdiZsRy4cSIRgevBAAZ0X
	cENQgALFqYaNFpp+vDBEBHgO7yn938E=
Received: from frank-G5-5590 (fttx-pool-194.15.85.231.bambit.de [194.15.85.231])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 360F41200CB;
	Sat, 19 Sep 2026 11:47:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH 0/2] Fix mt7988 usb with shared phy
Date: Sat, 19 Sep 2026 13:47:39 +0200
Message-ID: <20260919114744.46777-1-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_044757_427071_85BBBB35 
X-CRM114-Status: UNSURE (   6.84  )
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
Cc: Frank Wunderlich <frank.wunderlich@linux.dev>, linux-usb@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, Mihai Ordean <research@mihaiordean.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

One usb-port (ssusb0) on the mt7988 shares its phy with pcie and here 
sometimes it happens that a trace is printed while bootup.

Mihai Ordean (2):
  clk: mediatek: mt7988: keep combo-lane U3 PHY ref clock enabled
  usb: xhci-mtk: power down u3 ports skipped by u3p-dis-msk

 drivers/clk/mediatek/clk-mt7988-infracfg.c | 12 +++++++++++-
 drivers/usb/host/xhci-mtk.c                | 13 +++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.53.0


