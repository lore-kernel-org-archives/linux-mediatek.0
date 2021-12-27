Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED07AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xsDr/PZwo6LzWylBKEfndKrlWgGR4r088OtqgL2v1vw=; b=S1+sdMmOb6t3Vk
	1d4osSsCbpJZstDDO2sP410rHRGfreKwg5iE+2d1nzlDy7xfqKEKGgLneK600Da6H1gwULnfbcOJ4
	NK8yLwSw0LA0vP+PVUjXKBDzvUPfcTZsiws/xhZMdrKMlITluqQSwS7d9SmBYsLNUK9BTNAIt6J6a
	l/qogh7HonMaoHJnAQgHp1S0cM49CrK1tWcNLLHvpxXbFvC7kmEUPz4ZiW1ndDA+cCRoGhpPG1z7G
	wBIXheeP3DENaznxhNHsLQSEzdsqVUUmmo5YLI486mJ/sratHS4qyW0UN4ACKYk8JRrVxiJW3p5wW
	p3aQcdSf+14lTpKDqYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1vHc-00HLfA-TI; Mon, 27 Dec 2021 19:03:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1vHQ-00HLcr-K2; Mon, 27 Dec 2021 19:03:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03C5361151;
 Mon, 27 Dec 2021 19:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4389EC36AE7;
 Mon, 27 Dec 2021 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640631810;
 bh=WY7/IBQQ7PCl+D+qAmJBhE5XKqIk0FCvNlIT9/7d9Q8=;
 h=From:To:Cc:Subject:Date:From;
 b=J8ngXBKahixF83dT0V7W8ipBzgGEeJq1b4oLb5mMznhSNIN3eNAE9cDvz4dD6JeL6
 wUMRktxHO1It/46XEeSqPxxVoqaQdvdkWjbYR0crKXvDyL5LUPM2sLxAv0l0z/Ev5p
 JMERrwTyG6dtGVmL26T5n1oEj32qgGyteu2oiZPTdoKoLD9RqmUFhjzrtDRDuv2Jxr
 nwO8Zk+KzR3l3gVsg8LkHd8P9RdcsPn8eSLPuZSSv4SnI0NgrNY03VsSEi1vMpwazK
 owAqZvrT4hBo3O5xBWQpjnjTt4iZujWubLrMvreaQMtkjsnD+Csjpw/m/gdvHEAXyM
 cnKvL/JYMTYBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>,
 sean.wang@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 01/26] pinctrl: mediatek: fix
 global-out-of-bounds issue
Date: Mon, 27 Dec 2021 14:03:02 -0500
Message-Id: <20211227190327.1042326-1-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_110332_741663_3687E464 
X-CRM114-Status: GOOD (  12.44  )
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

From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>

[ Upstream commit 2d5446da5acecf9c67db1c9d55ae2c3e5de01f8d ]

When eint virtual eint number is greater than gpio number,
it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://lore.kernel.org/r/20211110071900.4490-2-zhiyong.tao@mediatek.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 45ebdeba985ae..12163d3c4bcb0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -285,8 +285,12 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
 	desc = (const struct mtk_pin_desc *)hw->soc->pins;
 	*gpio_chip = &hw->chip;
 
-	/* Be greedy to guess first gpio_n is equal to eint_n */
-	if (desc[eint_n].eint.eint_n == eint_n)
+	/*
+	 * Be greedy to guess first gpio_n is equal to eint_n.
+	 * Only eint virtual eint number is greater than gpio number.
+	 */
+	if (hw->soc->npins > eint_n &&
+	    desc[eint_n].eint.eint_n == eint_n)
 		*gpio_n = eint_n;
 	else
 		*gpio_n = mtk_xt_find_eint_num(hw, eint_n);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
