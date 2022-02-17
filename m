Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E87C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPCB0qZpfDH5oHGKX3c3LOZSHRdeq9G7d6Rna2JWSwg=; b=YfdamvkOG9J655
	7K677JKD9/avmTlmj+peKiVskYLJBGu9vbfg19R5WYPc7oopzgFp1QB2SmbD2/KI2sW9PXj8Hpy9V
	Eh5jp4REdxzgKhBpgw+r0Q3JNhylpXt7RLxo/ecM8AP7oJZHtb+MCgxY/DfSCwLqSa/eN5S2OG6U+
	ke+zy14iDpA33zsfu1XPNEUlcOU6OZ8ZjMOR7sYzt9KZ/QI5+wYbHkZlmxQGQTtBx9mNFqVJS3ysh
	M1qGzUcxG51zEATEe1U8y2tsy9ZB57zAacZ8o5GYIxQ1YZwfebvMIWXIq8nHub/cs/+JOzf1+d+YF
	JGvf/zU8yeX37kU1CTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnT2-00C7pC-R7; Thu, 17 Feb 2022 20:33:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnML-00C4VN-Qs; Thu, 17 Feb 2022 20:26:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64C8961DF6;
 Thu, 17 Feb 2022 20:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D4BC340E8;
 Thu, 17 Feb 2022 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129596;
 bh=L08hTw8zTV+JKtdGBctd84i5lTqRbbrmlmUsysrPN5I=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BbeqNWiRYfgWP5tn8m+8lWlPis9ecHt9e61Z8xkbqF2zUdk59OfM1tawz0gdfUzTi
 j+i1pC+Jtwsej2GBAfT070p/d+yY5CQ/0lNbvdVTcuN0VRn1McB24sAQ1ULkD5go3b
 IzqzGuTvkG6C93tfNxtg9RmVwh/u4xelud4iD1LjLON8u+pMqvgZGvitY4qcx2vCPP
 4tP20BwT09Hrqo1GiQ5doGJGxsB0p9VALF628oh18JFmX2MmgcK/hHJ/yXj/sVddEV
 cBF1u7Vzi2qbe23PZ+SF19+sxfPYCR/pAkg+67xF9dOJoWyhtw6ysepL8PFisjyEuo
 d6BWdXNadWJJA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-20-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-20-wenst@chromium.org>
Subject: Re: [PATCH v3 19/31] clk: mediatek: Add mtk_clk_simple_remove()
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
Date: Thu, 17 Feb 2022 12:26:35 -0800
User-Agent: alot/0.10
Message-Id: <20220217202636.B4D4BC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122637_945905_A4BF6E9E 
X-CRM114-Status: UNSURE (   9.60  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:22)
> In commit c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to
> simplify clock providers"), a generic probe function was added to
> simplify clk drivers that only needed to support clk gates. However due
> to the lack of unregister APIs, a corresponding remove function was not
> added.
> 
> Now that the unregister APIs have been implemented, add aforementioned
> remove function to make it complete.
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
