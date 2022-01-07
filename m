Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C82C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 02:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBAsuObDujwrZbas9ueaTdniX5Di8v3ipFN+ai++2es=; b=Gm+irEOrABIrEh
	UKViSA2dQivHGmrYlQajY5wqspJJH8SSCQW8TIOyzGHn9+1GL6oYzCerGTc9lbP0dHw+WFOtZ0muV
	vQNR7aJKSz/dmyxbJ0ARfRSuaO1wyHihX/DgiFHsssZar6JOuEq9SNSZD407o1ypTNFqWSZcLng4P
	kJ8Jgmo3O+XX/o0bk+P5fhkKTOWr5VwWR5YjeuksbNCWeR2vB2/7cWCxYO29/12zjjHaTBKb0XlVE
	lnEJ7shJ0cKRuGZA88FUc4RPyyNCJXaKYw3aMmMcvp1lba5Qh8AnMA69arsdzoh5VlP5egUpdwEWo
	RJ4yfO9160N3sSjL7QJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5f3M-001y8P-JW; Fri, 07 Jan 2022 02:32:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5f35-001y12-HT; Fri, 07 Jan 2022 02:32:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3198AB824A4;
 Fri,  7 Jan 2022 02:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77FDC36AE5;
 Fri,  7 Jan 2022 02:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641522728;
 bh=YdNMm3YLxoeg6thWoy3+z5Vvy8+bQlB7/0IAGCZ6NYQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=F2Ix41jkwDOQe4+TZw78JUswoRPNj/wZu/gkOJHP/zuvkLxYuNCh2epnfj2jX8jkH
 ODPjDBISHEFR7CxOhlXTOcZwuZEHQWWanjufn9WC3jcX8WRhpcDWZvyK3/U/RN7zAO
 g0U1goXPfDmSGWnlAYcfDeVLvnqIDt8kkma9Opw9U8e+4HtD8XGAhcEPAmy77UouCX
 46T14bJexGUXH+ta/tEY9jnjdj4OfHo0m8gp6pVawFRH0E+z10VahKAtCUuNcxo8av
 /kSsOVFsFkwIdbRa57NqjPVhC8Mjgpz67mDQfITEI9gvgD0pQhbMC6S7Ql+6npymNq
 aOTAtFutYEk6w==
MIME-Version: 1.0
In-Reply-To: <20211217121148.6753-3-sam.shih@mediatek.com>
References: <20211217121148.6753-1-sam.shih@mediatek.com>
 <20211217121148.6753-3-sam.shih@mediatek.com>
Subject: Re: [PATCH v7 2/3] clk: mediatek: add mt7986 clock IDs
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
Date: Thu, 06 Jan 2022 18:32:07 -0800
User-Agent: alot/0.9.1
Message-Id: <20220107023208.C77FDC36AE5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_183211_742149_B85920F9 
X-CRM114-Status: UNSURE (   7.10  )
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

Quoting Sam Shih (2021-12-17 04:11:47)
> Add MT7986 clock dt-bindings, include topckgen, apmixedsys,
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
