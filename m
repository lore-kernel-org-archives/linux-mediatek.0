Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378FAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ZXpJP6GgEW79E8GNIm2CevK2CxoCuyzDvkBb2YuBPU=; b=ae2rK6d9bgTnpG
	q4MZtm0b+iz9Uhfa2KuK1WrEPhoI2vaISjgtfQF15vbit8mDygNeqxQimw1MHn2JaHSwhWoyLPlS/
	mOL5x/S9ynape62dj83jIBbgSTeFqjnlANsruoZQk8z3PTwrcLRI+RtKeQNmQEG8zsZ7ov2tET8Oy
	VlhwZBEYyrhzr2wEF4cjerGk070uHFRAvjtlQciOuKgXA8bY8shUeAFnII7xt4EfQVUMD+upNN6RY
	8KJNjNVBvC+LpT66ug3CxhqvUK3lmM7dKYZRn600hhYMEyE7Uzikejsd/yvFh7Ci9C8GfxrSjqrnG
	mlBFPTGCXl9GXLqzqzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns279-00CTuv-Sb; Fri, 20 May 2022 12:52:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns26Z-00CTby-Cz; Fri, 20 May 2022 12:51:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 62EEF1F45FDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653051101;
 bh=3EisikqzrQ9SiBDG8rG2N5qm30MIM4ElapWwrOg92Jw=;
 h=From:To:Cc:Subject:Date:From;
 b=U3k2lxCcKHZ+zfeBezpU56l0hosb77sjUaBAawfj3ZfaQPzhw5q3nJiKwS6T+ow+a
 1RJTJVxD7bUyD4JHWB1nTfMVi51GDhNWyWSex5ShggGhj2cIgP8jGkS9IYxvibNyo5
 00+Li/ZnvwKXSsCsEVApAwdwzZwF9tUvTg6/nh3TpyhsPEAL6lKIIo73NVpjYtyfo7
 ktLfUZ7Z2ikJC/aCr+wjnx1TCuWbrDpdXEsn2NKAn1qqfRqksQQ2zdHe0PVOHPrgXs
 oA8HsGWWW1u8FAGoHfMMFzcsVmICLoC1KwxgQiKzlLtU+MIMtGRMmzjyyWorE0UqX2
 u9K9lXYFRsVZQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] MediaTek Helio X10 MT6795 - MT6331 PMIC Keys
Date: Fri, 20 May 2022 14:51:27 +0200
Message-Id: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_055143_627151_593BF2B1 
X-CRM114-Status: UNSURE (   9.14  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series performs some cleanups in mtk-pmic-keys and adds support for
the MT6331 PMIC's keys.

Adding support to each driver in each subsystem is done in different
patch series as to avoid spamming uninteresting patches to maintainers.

This series depends on another two series series [1], [2] named
"MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper" and
"MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD integration"

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.


[1]: https://lore.kernel.org/lkml/20220520124039.228314-1-angelogioacchino.delregno@collabora.com/T/#t
[2]: https://lore.kernel.org/lkml/20220520124617.228808-1-angelogioacchino.delregno@collabora.com/T/#t

AngeloGioacchino Del Regno (5):
  Input: mtk-pmic-keys - Add kerneldoc to driver structures
  Input: mtk-pmic-keys - Use regmap_{set,clear}_bits where possible
  Input: mtk-pmic-keys - Transfer per-key bit in mtk_pmic_keys_regs
  Input: mtk-pmic-keys - Move long press debounce mask to mtk_pmic_regs
  Input: mtk-pmic-keys - Add support for MT6331 PMIC keys

 drivers/input/keyboard/mtk-pmic-keys.c | 128 +++++++++++++++++--------
 1 file changed, 87 insertions(+), 41 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
