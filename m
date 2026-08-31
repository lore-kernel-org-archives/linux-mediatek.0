Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BF8C624A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDMLTGyDExhkLcZpqbxSmWLDuT0h+t2fawHIBti8sLw=; b=eCsXPKUDO3TGmq7lHo9jKz4yZS
	bX+rpaHd8l2jgLO+R7Nv6v76mhaihkO+Gp5mHyxadqkCVyLeuUy0F8yxDLQqjnSpY9Eeceeh0VV1+
	3rQABT/zr5WO77wzGpvEAsP/11Bk4J0z2rKOp+LhjFAGTiYT6d8xbq8hy+Fl7zEavwJhhETdWd7kV
	mlk0LdoVGHrBOJ9aHrcpMEFHfH0jwFHvpPIlS5iNXozO+e7yXsz1BnU4KMUVP0GMuUk51tyVsp/qT
	EecDnl0ZnBj4wrQEKN6D0AV0OcjgWBlnBzFjQnd8E3Nwrj9bJg7v2TcJbLBzuk2KWlmMiuQb6+zln
	J1rachmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12EZ-00000009SEt-2Yb3;
	Mon, 31 Aug 2026 13:39:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12EV-00000009SBp-1dOy;
	Mon, 31 Aug 2026 13:39:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ECB6340D61;
	Mon, 31 Aug 2026 13:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6B51F00ACF;
	Mon, 31 Aug 2026 13:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183570;
	bh=PDMLTGyDExhkLcZpqbxSmWLDuT0h+t2fawHIBti8sLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NvF0/SXQLFQoOj+m8GxFCBifRM9Xopymz34Xqcs159cJH6pJ/qputhUfZLJriZDnX
	 JMSSc3dUW0c7CnAqYm2S0TbQCd6OuA4VXKhp1PJLGGNBTPefCivW7AVaea+tC1j6yP
	 L4vHYKMKJR5waIfpiD8OOwEVb2kEeJQZmim2byJImhaoClFiTTmmmziwRc0MUcbtjQ
	 zsqNEcEvYDYbQy37znOlwwqsY3ioG17CbiFe4aL3EzYjrzTlDqQLrIV3e+D9LUkAlm
	 cAA46DvlfqcUw6XSR7Y9nXxS7itXUXB6JB5c7qaDKQfy2l7nTmFzn4HMlROPubkaUz
	 deorJYyalJFhg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tuo Li <islituo@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.18-6.12] ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()
Date: Mon, 31 Aug 2026 09:23:23 -0400
Message-ID: <20260831133314.4125787-175-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Tuo Li <islituo@gmail.com>

[ Upstream commit b8948ac26efc395264a47f9a743889065adb5cff ]

mt8365_afe_suspend() allocates the register backup buffer with
devm_kcalloc(), but does not check for allocation failure before using the
returned pointer. This may lead to a NULL pointer dereference when
accessing afe->reg_back_up[i].

Add the missing NULL check and return -ENOMEM on allocation failure after
disabling the main clock.

Also propagate the return value of mt8365_afe_suspend() in
mt8365_afe_dev_runtime_suspend() so that the suspended state is not updated
when suspend fails.

Signed-off-by: Tuo Li <islituo@gmail.com>
Link: https://patch.msgid.link/20260528064107.470824-1-islituo@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The background searches finished with no matches: the fix is not in this
v6.18.44 tree, and Tuo Li has no prior commits under
`sound/soc/mediatek/`. That matches the earlier analysis — the buggy
code is still present and the patch is a valid backport candidate.

**YES**

 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index d48252cd96ac4..bf92c8922c236 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1975,10 +1975,15 @@ static int mt8365_afe_suspend(struct device *dev)
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
+	if (!afe->reg_back_up) {
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
+	}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
@@ -2012,11 +2017,15 @@ static int mt8365_afe_resume(struct device *dev)
 static int mt8365_afe_dev_runtime_suspend(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	int ret;
 
 	if (pm_runtime_status_suspended(dev) || afe->suspended)
 		return 0;
 
-	mt8365_afe_suspend(dev);
+	ret = mt8365_afe_suspend(dev);
+	if (ret)
+		return ret;
+
 	afe->suspended = true;
 	return 0;
 }
-- 
2.53.0


