Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A864AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SJWemDU22eB5zoeysvzH0ooErLj0Zn8a+pOXCVrnS6o=; b=yZbrbdiqtpFOPQ
	bHXmCo81zeCKUnIcTuRfl631SBYASEKoQ0VtsgLaMOk8hg/fbFBZBOpGde7tq5n6oPjX4mWTKZyOL
	3L76NFknCP/OqClmhKnUMBnacEnmxtw+rPw6ETNtTJHOTL16l30tQiM1Shy+cJzVV2kwYIvheN5BM
	M4RniNow8G3gHnVJol2UQ+Zc0fAdl/idAJhyK7mKQ/hPgH64RxdAWxmRIR+sV0A//jae1qjMyrbwF
	dP8qSD6atbmnFQ2Nc+M+UoBO8SNkpssfufwHKjoepZ2ZvE8ELUcvuwC1vZNa8Z/OwvjU3epZQ5ny2
	SWmLpVHHmrGZX6L2cHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt65x-003dVO-6J; Mon, 23 May 2022 11:19:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5E4-003D6M-Qi; Mon, 23 May 2022 10:23:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75284611DF;
 Mon, 23 May 2022 10:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2C4C385AA;
 Mon, 23 May 2022 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653301426;
 bh=RKbhgRnFKOvcisV3ozO+bwt7WBkGZfXPEVSqBRPTwl0=;
 h=From:To:Cc:Subject:Date:From;
 b=MDRR+57dQIAYgbRtJ8m+9znwxcwJ94g+YoVvJ6g5GIMJubu5S4asMBLg9evoNasU7
 DJALQ0fCZbumlYu7Rls1Hv2rCWrpJN8LxkR88n1OaHy3u9ZYs3iWbvWEqhP5ZGYWKy
 KhJ36Ha3UHngZKhecbUGM69croNzM3esqKguhXep0lleY6d4AZsvPLPq5XW1fso/ys
 KV5rdDgkNoZxdi5MQOOaGB4pUEZlQqYwfoY/W7YTjpFdy0BqtCM8HWbI2FpG3CBZfA
 QOK45yK2MNYTi0EeBUUKz0WtnZxSYl7fpsVAKtWXydnknbl3FjYWIGHal5UVWYk8gL
 YW4c3OHrJU1mw==
From: matthias.bgg@kernel.org
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: allen-kh.cheng@mediatek.com, weiyi.lu@mediatek.com,
 chun-jie.chen@mediatek.com, linux-kernel@vger.kernel.org,
 ikjn@chromium.org, miles.chen@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Delete MT8192 msdc gate (was "clk: mediatek: Delete
 MT8192 msdc gate")
Date: Mon, 23 May 2022 12:23:37 +0200
Message-Id: <20220523102339.21927-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_032348_997439_1FFE67AF 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>


The mt8192-msdc clock is only a single clock gate. This gate is accessed
from the mmc driver directly. With
4a1d1379ebf6 ("arm64: dts: mt8192: Add mmc device nodes")
the only consumer of this binding was deleted. Delete the binding
decription and the clock driver bound to it.

Changes in v3:
- Update commit message to explain better why we do ABI breakage here
- add Reviewed-by tag

Changes in v2:
- Delete compatible in binding descprition as well
- Add RvB tags
- add Reviewed-by tag

Matthias Brugger (2):
  dt-bindings: ARM: Mediatek: Remove msdc binding of MT8192 clock
  clk: mediatek: Delete MT8192 msdc gate

 .../arm/mediatek/mediatek,mt8192-clock.yaml   |  8 -------
 drivers/clk/mediatek/clk-mt8192-msdc.c        | 21 -------------------
 2 files changed, 29 deletions(-)

-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
