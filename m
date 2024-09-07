Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB7BE6FE49
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 00:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGxLNONYUNrglpD4rMLTDj4ZY+Nt4PLarg59UF67efQ=; b=icQO9OoAukQwynkE3HaSDRrMvz
	UgsbUI/Gif7hlfiq0UtIRu61V523mI+jq6BUuX9TKWRFQece0Uxk995Qzzn77+05PP4tSdrbPsv6V
	A+u/QMUF/4XvHWHgWBvDxf7mH8TI7dof44QC0m1lSq5nCSSgtrl9IbUNuqzZIYnTGafEPETFJkIGV
	dZaKrTJurQ6kxsgLUIB982m7pI0UR05YcCA6Pj2GTsR41262MXHQ3n2iPQ1XKZapQe7YnktIcsqc4
	7OgmDq5cBMNPsDpk4aujGxB0IBfpzFi2tKctBrd/g6OXp/pTWlrv53QhXGM9qgnggbJb7EpYMwjCD
	m7sMcRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjnm-0000000Dz5Q-09TE;
	Sat, 07 Sep 2024 00:59:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjjs-0000000DyIP-1J1V;
	Sat, 07 Sep 2024 00:55:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FEE95C5AD7;
	Sat,  7 Sep 2024 00:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF96C4CEC4;
	Sat,  7 Sep 2024 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725670543;
	bh=hVRqy/YIqXha3+LEl7UForQK+FCn9cErocX8XXm3AKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o847oYZWd7bYXkrO1HkLBhr+TlIVBzWfFXa4UWPcLjK4iCjkdMCK47gPKpQwSvn+s
	 8HwefoWa2/rlUG6GHo7nFI/dsEHqZIQ08+rFIZnhUutSmUFZeIEqnWh+l4X1oCzXsl
	 RZixxkkxRscQOlj9QX8DO9RW/ZZ6ZWbc54bQaBVpFNZEb37zqlyEZuVEmkex0oUWQO
	 XJo9AlDlLr7pbVjLMnai3Gejzu5osrGL7HuXYoh14JkR6rrKX/Mf2wlG32YvQLBJ04
	 tsEomX6ggOIdte8O8uKEvna8XYrw42biWB5xmZqTCyIyId3+Sg2NORZKl4YHzj/7TD
	 9saAWIhTgrxMA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 07 Sep 2024 01:53:28 +0100
Subject: [PATCH 3/7] ASoC: mt8365: Remove unused prototype for
 mt8365_afe_clk_group_48k()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-asoc-fix-mt8365-build-v1-3-7ad0bac20161@kernel.org>
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=855; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hVRqy/YIqXha3+LEl7UForQK+FCn9cErocX8XXm3AKo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm26R+ODYn9QHBhO3Jkdnki3jclFXaxvYiwoG+8
 QyvUQtzqjKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtukfgAKCRAk1otyXVSH
 0CmqB/9Ts6+nuGtv/dpT+wN/BSZumRSYevRraXg/+TUAeyiDK+2w1k7FPwdO3wPbLxngyt8I3fM
 gsxul/IKy+2d8AzfEw5V7jvbWpNMZGYYwi6NCKdJttHZpJOqA9Hyyrzurf1EI1RqCgteUhvKqln
 DQ+gNovUMRS3caTw+Y3SY06Pe8e9k6C5g37teJRGt1eVxZeyYOxMdhPe2LorkEJKNot9lAicimk
 x01FN96AC2gNPACvKzkI/NT8R/gs+OFqAEgqyWDXUi/mNDiihOlz1qwCpRxTqwBPKIWWtZ7Rvcf
 j48gzPDBihukvOJq59RhGjMWx6NZ8jdIwP5zvhswyP58orjg
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_175544_426599_3A8B52B8 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The function is not used outside of the file it is defined and the
equivalent function for 44.1kHz is not prototyped so remove the prototype
for this function.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8365/mt8365-afe-common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-common.h b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
index 1fa87e54a57f..731406e15ac7 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-common.h
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
@@ -421,7 +421,6 @@ static inline u32 AutoRstThLo(unsigned int fs)
 	}
 }
 
-bool mt8365_afe_clk_group_48k(int sample_rate);
 bool mt8365_afe_rate_supported(unsigned int rate, unsigned int id);
 bool mt8365_afe_channel_supported(unsigned int channel, unsigned int id);
 

-- 
2.39.2


