Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ED2D1CDC5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/LDR3CW7P+5Df74nOMvvJeZJ7+emgI9+9nPKJ3AWvw=; b=jDeyr9xZWTHQrg6j8T5v1dmFD8
	BRY12tT9qWacUukvCNaonzKTwPZgz4NJ4vya4dtVOtLm0TVbiZ+juZ491TxYUW7BgN61zRVAxSn9O
	KL1xtDTFrCQnhmpeGhHFjdk3/iXq/xrtqtZZ/4r2oKNjHyLA9FfKncanpuA2oRmnb5IKzBfH2jkI9
	MpNpw86vej4mXag25qle7nmN7dADr+s5hq+rkCh5hg96kBegv/0rExu/DNxbOU5wNBq+ZOiDu03ry
	9q8FHcfb+SQfeJin8Kf2Fui6rtNiH04OMatgqos0T8oyx8Sk8KUBGE92C/wHWbDeyzu9QeB/7BWLN
	ZsI7wjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B2O-0000000AJzQ-1dt1;
	Tue, 22 Oct 2024 09:18:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Azt-0000000AIwz-0Hiu;
	Tue, 22 Oct 2024 09:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729588571;
	bh=oZqxNr5h3vQ0uP3hNOVEPnUyAFkS2/lR0RHev89YgiA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EV3teINFeBEch8w6KugJk2OFI6Ya5fJFBqHZg/PkqGeyqzNKzOPAwFE+6SoS/oQFV
	 jx4rCvydgo/uTYh28ADiWp3tHSfMtW1kPhcxW+qQ4DWOARtIUUbLbd+hXC+MtWH88C
	 Qa35boR0yFp5vIys8pCFbXtkJU7LvF8c+isELSDrceKxrTiy1XHcalGNgtLjot/BEY
	 YHTVBb+ZbPHepd7a9x/xtPFe50TVM6lRI6zqj01z8aZOxKNaIts5l55GBehXpN2Vu7
	 w9jPHxfXgIhmuA+af6rDCLJ1Za2mn8SdGaQMQgQgwclZpiBgc+a3yxano7HCJeVUEK
	 Vbc/5TUfuQmZQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7F4317E12AC;
	Tue, 22 Oct 2024 11:16:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241018082113.1297268-1-wenst@chromium.org>
References: <20241018082113.1297268-1-wenst@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8186-corsola-voltorb: Merge
 speaker codec nodes
Message-Id: <172958857070.72613.8421801066398473811.b4-ty@collabora.com>
Date: Tue, 22 Oct 2024 11:16:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_021613_317212_82BBEF51 
X-CRM114-Status: UNSURE (   9.27  )
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

On Fri, 18 Oct 2024 16:21:11 +0800, Chen-Yu Tsai wrote:
> The Voltorb device uses a speaker codec different from the original
> Corsola device. When the Voltorb device tree was first added, the new
> codec was added as a separate node when it should have just replaced the
> existing one.
> 
> Merge the two nodes. The only differences are the compatible string and
> the GPIO line property name. This keeps the device node path for the
> speaker codec the same across the MT8186 Chromebook line. Also rename
> the related labels and node names from having rt1019p to speaker codec.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186-corsola-voltorb: Merge speaker codec nodes
      commit: 26ea2459d1724406bf0b342df6b4b1f002d7f8e3

Cheers,
Angelo



