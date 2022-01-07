Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C61C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 02:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fU+TNoQSDxKdHshDH9dezXRfV6vZFo8vTNr/NVn50ys=; b=2rCYBooo095+cX
	asAYiVbD7ILCWGo1D3asbqf2XHQ4pYsqYVdfel07Xq0jGeY/VTB4+i/i3EacGve2De5/gH8NgIJS7
	aDTb6kNFKeyl0HpZa1xN/P/MQ+woRnpBdrY6SGPxgqnw3JDxYTOA0ZEs4TMpKNbWdOg0JDDaZSI3m
	jm6VMRDhjoPC5aASmd9btcQxrd1aedihucMGM+zrOpORQ0zCsKjbuogP9dBweoV0NQFewfgPiEDgU
	bbjoNA9o+uNrqgDje1oxtH0SKVGdZIfn/LyYPFt2jZgqXrTWGLRa4AR7/83rOtoOtg/nTEgeKi187
	xafAoLhKS1VdgHrHKSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5f3A-001y2p-Hr; Fri, 07 Jan 2022 02:32:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5f2x-001xyt-3P; Fri, 07 Jan 2022 02:32:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B4C161C9C;
 Fri,  7 Jan 2022 02:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCB9C36AE5;
 Fri,  7 Jan 2022 02:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641522722;
 bh=wqrLQ8xJsAam3WCj6CV+t05ORa4KMZ45YTRPs1CsPdM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=bdLq406E1iS5TVhx6sKs1n0wokbRjZ+4+K+xYFY0mVK3/soFuRPeqdj6Lt7m43MOu
 usBEblfxAVVnAeSFO+Y0omdCsgFSG1QfScKvS6HL5NgvZHA+E/O75aLVfn/c+mrEkk
 1Fcl7Upn73/gNRKMJW0/6J/x0ia6hC7fntGUs/QwlXgEHk8XirNGCsk80qB5wqDfJG
 bubkeCafx4AH2qd+K9zrmSJL2EFDr5kwe81vMBRIoPUkWbkA7YX1nlzIZUeKiqrq3+
 bc7gTqSd/YMuQF0TruXGS30z2aQ1MN59hREgaZMkjygsLHsX3QUAI6r3/c9gXP0Qxt
 nxIwKg09AIpiQ==
MIME-Version: 1.0
In-Reply-To: <20211217121148.6753-2-sam.shih@mediatek.com>
References: <20211217121148.6753-1-sam.shih@mediatek.com>
 <20211217121148.6753-2-sam.shih@mediatek.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: mediatek: document clk
 bindings for mediatek mt7986 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>,
 YH Chen <yh.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Ikjoon Jang <ikjn@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Thu, 06 Jan 2022 18:32:00 -0800
User-Agent: alot/0.9.1
Message-Id: <20220107023201.DFCB9C36AE5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_183203_203452_D6AE9DBD 
X-CRM114-Status: UNSURE (   8.29  )
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

Quoting Sam Shih (2021-12-17 04:11:46)
> This patch adds the binding documentation for topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
