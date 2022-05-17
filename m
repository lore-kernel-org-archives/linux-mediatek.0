Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4029DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J1jMXeHAZNQeDPkkHLGn/XEL0zC17daD3a+hD4vcgHI=; b=MmbylahMFeqH19
	rd8WlXp0hGzTTrZsYMHqu3hbymenR9BAl5FdFQ31Vvv78kkuaH3vajRoD0JAkNiQTDZpCGONYHC2y
	tIRC9VBcJbQWbheFx16YVceTxfBtcrupDDEECSbtb2GJYizZ4VkWjL0xREEUpMbbBeJDNfpvINkb6
	4/Ff8YFVt4yMmR4GhpBay5/gtUYJdhGMBYfaInZSjMaeWfeaks6qvygUG0dfb8+S4BUxvzbzNZzjS
	gkr8p26HFzoTx7ut86ejNKc+LLHAewPqliLlfOXDyW3XExVmSe6/AU810WnH3dOJjNLn3EdaByP6r
	KIs11femz8kZvTWtffjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquFH-00CzgL-SJ; Tue, 17 May 2022 10:16:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquEb-00CzLb-Nl; Tue, 17 May 2022 10:15:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E48A91F443AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652782519;
 bh=/ybxZchoatmstITV+vbv8WNDUQQ26yVZNo8ucCimxO0=;
 h=From:To:Cc:Subject:Date:From;
 b=Lat5GG2dhJTa99ZFin3wL/unvgIMD5hfspmaBRa8DIOeK40XUqL++OACY+H9T+M4K
 W2KVp2peUKJROJsBHpPClT2DiZ2v0d6lJWjPbqEl28kSS5s2FpTauqtmdpKkMAud5j
 XK5SzJ++3DY+1cNWfuBuBVVJPrLXakcuBSPgf7l/bWw9w0PiTsMK00ckQhC68ozM/c
 4hg47ViypSbwevMtvor9ucs3m0zt7dW9/JNl3lWZLciPZTWzncL28rY5JBVw0TClmj
 JHJQ6hOksP0XdMPEJg/OGmHWOIGT1ufiyxK3zCAWARnzK7TzelTp5wS/7g88NBFm52
 UB7cXDcQRDctg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] dt-bindings: arm: MediaTek: Fix clock bindings
Date: Tue, 17 May 2022 12:15:08 +0200
Message-Id: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_031522_037776_1BF2A762 
X-CRM114-Status: UNSURE (   8.37  )
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

As per Rob Herring's review [1] on my mt6795 clocks bindings patches, for
which I've used the already upstreamed ones as a base, it was found that
these bindings have some issues.
This series is addressing the issues that were found by Rob on my series,
which are present on all of the already merged bindings.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220513165050.500831-5-angelogioacchino.delregno@collabora.com/#24859953

AngeloGioacchino Del Regno (6):
  dt-bindings: arm: mt8186-clock: Remove unnecessary 'items' and fix
    formatting
  dt-bindings: arm: mt8186: Set #clock-cells as required property
  dt-bindings: arm: mt8195-clock: Remove unnecessary 'items' and fix
    formatting
  dt-bindings: arm: mt8195: Set #clock-cells as required property
  dt-bindings: arm: mt8192-clock: Remove unnecessary 'items'
  dt-bindings: arm: mt8192: Set #clock-cells as required property

 .../arm/mediatek/mediatek,mt8186-clock.yaml   | 29 ++++-----
 .../mediatek/mediatek,mt8186-sys-clock.yaml   |  1 +
 .../arm/mediatek/mediatek,mt8192-clock.yaml   | 46 +++++++--------
 .../mediatek/mediatek,mt8192-sys-clock.yaml   |  1 +
 .../arm/mediatek/mediatek,mt8195-clock.yaml   | 59 ++++++++++---------
 .../mediatek/mediatek,mt8195-sys-clock.yaml   |  1 +
 6 files changed, 71 insertions(+), 66 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
