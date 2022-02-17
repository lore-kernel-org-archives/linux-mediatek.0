Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36849C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wo40tPg00a9gsB9I64i2GeqJA0IIMjHcSsLefCgw7tI=; b=mzLsHK77rzGak8
	6L+UjoZR0wjlIdLMP5hBLC2gpjE454FvJko+sOK0a5J6Qb5l8Lst+HX2G5PRwFqkshCyQdnoOsBQG
	lRwGavnJp/CoyBcQCTQuvrV9HNcoDvcHNmpcmrunbwDx4DjDIXSOIl1cEvc/FrQHyTiHM4WCiy2FV
	zj5NpH5g4shgBUltvKdsSUG5isjVaj/Eji8DoXag9FbhMA2oJP+f1Vz1es258JZduyq4N3h9Je+bZ
	O8fWq6lYVATtu2lCQgrw7Mjk1Q86PiD1mgQ6eq5JFF0disvtDuasnOYA/NSLV3V51GoQs9sL8DUmL
	atkPOHbonzZ29U/FB0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnX2-00C9t7-FY; Thu, 17 Feb 2022 20:37:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnNb-00C57z-Tp; Thu, 17 Feb 2022 20:28:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 639A7B82486;
 Thu, 17 Feb 2022 20:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0135EC340EB;
 Thu, 17 Feb 2022 20:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129673;
 bh=UdXLYBPmUR2sCF/V3tFgzzwHqBVkxJ76Iql4QyoYo0g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=O0egWXk4aBlBURCD/Q8XvZ8T0l5udkH/0Zd2e/DxuynVyXP+d85ShJwuxtT5erV0j
 rztwdBOt8j2li8wztlwbCcsem/LiJMMyRHzMoBDqs4VEgq4j3b6kk6xZ18XxDPodDN
 nzd77CaGFhYJPF2BD9qSwBftXzuhtp+22Aiq+CgA7AF7YkO1gMsnLDBdwWzrBW9cP4
 zwwCNyh9vwFRUuf6TYy2cLUaTKjNPiEnY9m/NopP1TdOnn9q43EPlRV3EEl5aVm5Fa
 iqSirWLvCRamres1Y3PN5UlMqVwtXGwDJxoLj/LgfjoAQEtqm8nKli9jD4Mpxatnr7
 xjnLacEx9N/oQ==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-25-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-25-wenst@chromium.org>
Subject: Re: [PATCH v3 24/31] clk: mediatek: mux: Implement error handling in
 register API
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
Date: Thu, 17 Feb 2022 12:27:51 -0800
User-Agent: alot/0.10
Message-Id: <20220217202753.0135EC340EB@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122756_192218_CDBC9615 
X-CRM114-Status: GOOD (  10.32  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:27)
> The mux clk type registration function does not stop or return errors
> if any clk failed to be registered, nor does it implement an error
> handling path. This may result in a partially working device if any
> step failed.
> 
> Make the register function return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, is done in the new error path.
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
