Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381E7C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d5E+3PKlxbfGjEEZmC5WyTIcXVJieqdeCZUgJSSU6Ac=; b=QdL8sqrl2FcWx4l+ErjOC/XIfB
	orslUrxywAC1I6ryTokqei9Om2+m7P/gMG0ZHwiyzYuq3OaTvLWTM7/scyerY88UsevlNj3NdT+Mq
	IbfVtCiH0Yaf9N74DEfCM18u9Qj4oWMlpDUJXGfsCumVsyeOiSuiConUysnV0ubY4Nro/a6JEWXCY
	NxF0BOAbUMHmTbiIp9XZjq3XrOuGj/wzNeSp/UljtRd3mlatrct/db4vjUc9WwhO2bmNIKYhNBwtg
	ezfDHnGNOQHsqFNWzmGdJlJI2IeWaQZBX14QZoVjtEVEwSDKUKvsXgVj75rLecm8d7xrbG63qtUKK
	Q8FzvgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAYW-001bhK-Mt; Wed, 18 Jan 2023 15:40:52 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAYK-001bd2-Dz; Wed, 18 Jan 2023 15:40:42 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pIAY6-0007gG-1J;
	Wed, 18 Jan 2023 16:40:26 +0100
Date: Wed, 18 Jan 2023 15:40:19 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: Steven Liu <steven.liu@mediatek.com>,
	Henry Yen <Henry.Yen@mediatek.com>, Chad Monroe <chad@monroe.io>,
	John Crispin <john@phrozen.org>
Subject: [PATCH v5 0/2] thermal: mediatek: add support for MT7986 and MT7981
Message-ID: <cover.1674055882.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_074040_484600_ACD018F2 
X-CRM114-Status: GOOD (  12.11  )
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

As requested in a previous review, first convert the if-else selection
of the raw_to_mcelsius_* function to instead use a function pointer
added to struct mtk_thermal. Then add thermal support for the MT7986
SoC which can also be used on MT7981.

Device Tree bindings have already been merged[1].

Changes since v4: Only use switch statement where requested[2] and keep
if-else logic in other places.

When submitting v3, it looked like the patch series submitted by Amjad
Ouled-Ameur ("thermal: mediatek: Add support for MT8365 SoC"[3]) which
also adds this function pointer would be merged first. However, a
re-spin of this series addressing the comments it has received has not
yet been submitted. The change introducing the raw_to_mcelsius function
pointer is hence being applied independently.

Changes since v2: Rebase on top of pending patch introducing
raw_to_mcelsius function pointer.
Drop left-over macro extracting the unused adc_oe field.
Use switch (...) instead of if-else-if-else-... statements.
For now, return -EINVAL as default in case of unknown version. Imho
this should be BUG(), as this version is only defined within this
driver.

Changes since v1: Drop use of adc_oe field in efuse, Henry Yen
confirmed its use has been dropped intentionally in MTK SDK as well.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/commit/?h=thermal/bleeding-edge&id=071e99848ccc1fbe238c4c9c7cfffd83f1dfe156
[2]: https://lore.kernel.org/lkml/0b72a12c-286f-79d0-09e9-b1761530850a@collabora.com/
[3]: https://lore.kernel.org/linux-arm-kernel/4121bb6b-30db-7a23-f4c8-40afdda7a0b5@linaro.org/T/

Daniel Golle (2):
  thermal/drivers/mtk: use function pointer for raw_to_mcelsius
  thermal: mediatek: add support for MT7986 and MT7981

 drivers/thermal/mtk_thermal.c | 143 +++++++++++++++++++++++++++++++---
 1 file changed, 133 insertions(+), 10 deletions(-)


base-commit: 9ce08dd7ea24253aac5fd2519f9aea27dfb390c9
-- 
2.39.1


