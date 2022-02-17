Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34429C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZ9zH8w4bwXefQTNgeIEpFlK4gMyx0Tba9cs2CkRdvY=; b=IgBF3Cox0eUd9f
	O58aLZMWRdl2jS6RqvnUf5C3dNovFbqZsnqU/tfdjjr6vR/y0QjOKdjPBwSQadg2varWaB+fHXA97
	YJzlNAHNPQ36z43bowEcbv44dR9YGQgMUvpOcarkpEvyOxhfTtq6+pAJihIBcMLJ+DsA3nUrN190q
	W3MraiVaLn7ZOjVIIj4iie5qzmeeH5k6yw442z2E6vMX2LsnP5xVeOejdaCFuC+DHx+kiartTWwym
	ZrExN8RJlg9lBTLQFiT4sHh8NTE2Vxs/xuDPj57yLMrtk19/T0bkSweSfweVAmwDDImQwkaLQ0ifs
	A3AS/k6nkfXvmcRQOjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnH5-00C1k2-Ke; Thu, 17 Feb 2022 20:21:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnGo-00C1dH-UX; Thu, 17 Feb 2022 20:20:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 114CE61DAD;
 Thu, 17 Feb 2022 20:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B4BC340E8;
 Thu, 17 Feb 2022 20:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129253;
 bh=HrP+7GNrdhbAXiZ8Uit4X+HY/MnbUJRngC8GMYY9pyE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Bo5FcVVvDIJNq4n943F2NoBLSM4Bzx+1wg1iuo6jCDd45BFqKHRSrfVAycJsZO2fQ
 uyV+KbTgd3JcMG7qnJgN6VKt64j6w5NghcWuiOpnhQlb0AMFuvTOtVOQz+PEuRvsDS
 73gGbaum2z822iJjEVXY7HBF0XqO969HKBKbupSbffj3TDUaMNSxyUU/BLPlir7Ud/
 TBgx3d53MBDJZWyX7eBrgRDRG3J1Smwp9QyMXZOmQgnMHF3yAcqiUxDOzw5aQkM11b
 k/2qSPoq7tYCGFBkVrCCdSYOhrTmekw1qZC5R6VlWt3ajMKWamryRBo038vX7SE+E7
 WuCpTMk12I0yA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-4-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-4-wenst@chromium.org>
Subject: Re: [PATCH v3 03/31] clk: mediatek: gate: Internalize clk
 implementation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:20:51 -0800
User-Agent: alot/0.10
Message-Id: <20220217202053.61B4BC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122055_046070_C4C14C90 
X-CRM114-Status: GOOD (  10.18  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:06)
> struct mtk_clk_gate and mtk_clk_register_gate() are not used outside of
> the gate clk library. Only the API that handles a list of clks is used
> by the individual platform clk drivers.
> 
> Internalize the parts that aren't used outside of the implementation.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
