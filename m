Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514CBC48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 20:00:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F4A8613B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 20:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F4A8613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6LEfCNcghX7svHOiL9pKcm8SkinvqLx1nFBraWz8DE=; b=enmV+VOKuWAk4X
	Sotm04enTiCH+28ztrqffkptp066DUbZf/O9jKSSfUiovLlhdkKsvnfDpG+BxOknGddJB2LkjB2hI
	ghpgRSjuhaTh3eHA1BfL9igGqgAkKWlfOmpcRecmftmm9/MRfR7fRQ1cZ9z7B83hy4NNXAT9t045h
	CqNbjsiimIKFR2BEIkuhoQmkzntvb1c22a/jR1e4RunxYD2YZo5NvKWSqPU1KGsPkhiU1zM6oyn5j
	DAAOzhLU1LAgAJ+Rvbo1/5/7fLMb3dbQOFaEtcXNLEurw5nnmyIvWVHOr23G2kx65nIqTWbZeKjU2
	uKl61Va1FYBj1qP/qFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFEH-002dUS-Ff; Tue, 15 Jun 2021 20:00:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBJC-0015xm-4j; Tue, 15 Jun 2021 15:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=78uYSMX+bFEaSGGCmBdDbEjHKmglB3uhbFkxXkEtPxc=; b=RwP8ffaWabgwZPB5llgBnwCjTx
 PBgF+xvaXM8GD8zrIuzssNxc9eBbROxNpcORuLPfHNBJtqX7Jtg/8fFiGMWssztEggqgH2AEOK+BE
 EowZDaDvXcXtfdDoMlm0rpY2QVvp2Lv53Lohjf1BvdfKEZb3fgF+iQ1c7xX2i6f13gXD/EK0IvKNm
 PZpBT6nBreB7yfKNhKqzIcn4y98SAo9tLt6UYIvSJBMpkPX5Yil+ZU8GIijqfrvZhFwk1D+cAB7Ad
 h56IDfhbEptcGxU0S04Ff1dBh9Ysijm1yc3t0iFAAqTOB7YMtAwE1WnmVhU1lvKxatkVUIKy2Rxnz
 oZLDiVGg==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBJ0-0081QG-My; Tue, 15 Jun 2021 15:48:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44B9E6162A;
 Tue, 15 Jun 2021 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772114;
 bh=adBEG7zv+ENyu9SHmLOWViXi62cNurLlJQCxTzrZxb0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B5sZ89flkwNesEg/LjcUMguT0YpbTKcE93cvdvDmFHwO5vb+ZvWSmgtT5K4xa5WX/
 dC1iCTAM+S4kaYl95WdNrlegxuZfS8F8SBQwcEsxG94qncLvgsTueaW9OFe5BzlakM
 OCGYfUuHBDeL4MQVzNcySOo+C8kj9JAzoAE+1IieIPRpjWhaft2mgLg3jlyr3lePGD
 OfdXIgoZlcccJt0EhBe2/Z05MOexMy4UcsaMwrRMyVBATjcJhIxyRO+BxUXjkIfwPr
 Pg3QG/IPrxs/UpxvCmaJJaa69kciljSTmiJk+zFG8ep/Dui9GzadU0bznT2fQUUxLR
 0oP6xvRZTf30Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Axel Lin <axel.lin@ingics.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 08/33] regulator: mt6315: Fix function prototype
 for mt6315_map_mode
Date: Tue, 15 Jun 2021 11:47:59 -0400
Message-Id: <20210615154824.62044-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154824.62044-1-sashal@kernel.org>
References: <20210615154824.62044-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_164853_742453_6E6C32DA 
X-CRM114-Status: GOOD (  10.33  )
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

From: Axel Lin <axel.lin@ingics.com>

[ Upstream commit 89082179ec5028bcd58c87171e08ada035689542 ]

The .of_map_mode should has below function prototype:
	unsigned int (*of_map_mode)(unsigned int mode);

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Link: https://lore.kernel.org/r/20210530022109.425054-1-axel.lin@ingics.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/regulator/mt6315-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index 9edc34981ee0..6b8be52c3772 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -59,7 +59,7 @@ static const struct linear_range mt_volt_range1[] = {
 	REGULATOR_LINEAR_RANGE(0, 0, 0xbf, 6250),
 };
 
-static unsigned int mt6315_map_mode(u32 mode)
+static unsigned int mt6315_map_mode(unsigned int mode)
 {
 	switch (mode) {
 	case MT6315_BUCK_MODE_AUTO:
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
