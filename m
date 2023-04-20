Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812A2C77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D1RU/9ERxO3xyR2oZk+ctj3O//0hxc3aPGLigMxWi2M=; b=wCQWpbQ5GlObQIjrsaD5kK8Gxi
	Tix5vUZHvUlkxpPBzG8LDKpTq3HxFj7a5TiNYkFzyNMMaMCMMJP68bgYB0nA/lVdBvo++26BXn7eo
	VilbNR7IDDRVEpv+3WgDiTr+nNqzXz2JoxxLKGi25nuylL9KrfWXRjKwf7prJJBYTBsfWVdXxq+Cm
	uMJRWn6cFwDbkeUDYlvnkEVBegS4SkrSqdIyH9b6ValZ9voRpEF9OxQ4KQe4KNDGvueGXq0ZzNrq7
	nezGuvhd5Ft6BRJP9bRUyA4pdJUqoO32nHuqAx6Hg8Vu1H1WQSwPxEDjlCeac4pJ6wkmyAh5mL1Ad
	VHFenqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTVe-0085CW-38;
	Thu, 20 Apr 2023 12:35:34 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTVc-0085BE-28;
	Thu, 20 Apr 2023 12:35:33 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppTVW-0005Um-1n;
	Thu, 20 Apr 2023 14:35:26 +0200
Date: Thu, 20 Apr 2023 13:35:20 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Subject: [PATCH v2 0/2] Support PWM on MediaTek MT7981
Message-ID: <cover.1681992038.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_053532_697999_0368E752 
X-CRM114-Status: UNSURE (   8.27  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for PWM on the MediaTek MT7981 to pwm-mediatek.c as well
as new mediatek,mt7981-pwm compatible string to the existing bindings.

Changes since v1:
 * use pointer to reg_offset instead of u8 reg_ver and if-else

Daniel Golle (2):
  dt-bindings: pwm: mediatek: Add mediatek,mt7981 compatible
  pwm: mediatek: Add support for MT7981

 .../bindings/pwm/mediatek,mt2712-pwm.yaml     |  1 +
 drivers/pwm/pwm-mediatek.c                    | 39 +++++++++++++++----
 2 files changed, 32 insertions(+), 8 deletions(-)


base-commit: 3cdbc01c40e34c57697f8934f2727a88551696be
-- 
2.40.0


