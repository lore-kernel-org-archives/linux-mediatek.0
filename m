Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCBAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86QZpWDe6ajLqMi3KweIDQOIvuKIqe5jm/35eWWK9AI=; b=jknzxkQ/+D4Os3
	9LDjbvVxPtA1JHF9juTbnbG2X/r3tymvxRIDUK2DNp1j+xdYF4ESWtRrEwTeH9nkSyD+XhlPRVgxR
	yNuaYCt+i2rX83+LoM8ybUz9gKlw99iWqapLIuh7asKbx3Nle2OZzGUncPWWfgsj+n5mkJn32L2RX
	tYYgrx8bRKo6hH9E3wUH0kaIeSqpO9UmUZuqBPBoCHkbl69+2Qd8YmyVXvJhwz+cl0JprIRdEAlTi
	xDLgEW7ewzzJQVUG1X3h58b6+SFvhWJmIxjIOdUfmHAVp0ik29KbLT6zTv7pTYxz5OiTD7XjnkRfj
	R5YviwiCz5I3Oyq6Kr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1wG-00CO84-F9; Fri, 20 May 2022 12:41:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1vz-00CNyz-C1; Fri, 20 May 2022 12:40:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E96BB1F462B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653050444;
 bh=x06V/XCPzZpmYAgHXtWkmjUfcFKK5jjJPN9DpP31Kf4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fCgpRhpqMw/ZILDXfIXuNwSGMGuhlTYvHEygdNCG1eH2qI0jLyRRDUa7Aye9np1nV
 KwZKc2Ot/lDUwGKswK5NfQ65IwflRg2Bpm63k3hUQYZhm3EbZdi/UtGJLeB9h/fgtX
 Dddji/ANIrrp6oMbS6b3tI5dubjyWLHOVkZXpcdYDcrj6UrhCPyGbRe4LvEvCK981v
 l6rSpENJmrUGVTZBbhoFqm3HJ3FCC8mk1yvvV6kT25IXgFxnDerQM2RrA/q6LOlSJ+
 fQywzCUNb9VTAWVX5vDoLa9BvI3y7SFyLk4cwRIr86R8R3PeY2JF0UYJn4Q8DtZlYU
 tAenNqqD0cTzg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 zhiyong.tao@mediatek.com, henryc.chen@mediatek.com,
 johnson.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] soc: mediatek: pwrap: Add kerneldoc for struct
 pwrap_slv_type
Date: Fri, 20 May 2022 14:40:34 +0200
Message-Id: <20220520124039.228314-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_054047_654048_08B03F8F 
X-CRM114-Status: GOOD (  10.50  )
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

In preparation for adding new members with name abbreviations describe
the struct pwrap_slv_type with kerneldoc to enhance human readability.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index d0c79ee4c56b..76b1f7bc8217 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1155,11 +1155,17 @@ struct pwrap_slv_regops {
 	int (*pwrap_write)(struct pmic_wrapper *wrp, u32 adr, u32 wdata);
 };
 
+/**
+ * struct pwrap_slv_type - PMIC device wrapper definitions
+ * @dew_regs:      Device Wrapper (DeW) register offsets
+ * @type:          PMIC Type (model)
+ * @regops:        Register R/W ops
+ * @caps:          Capability flags for the target device
+ */
 struct pwrap_slv_type {
 	const u32 *dew_regs;
 	enum pmic_type type;
 	const struct pwrap_slv_regops *regops;
-	/* Flags indicating the capability for the target slave */
 	u32 caps;
 };
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
