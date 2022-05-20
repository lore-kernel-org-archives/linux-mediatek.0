Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDEAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rUj0Ja1rkECoQLcorxzxxzvUZlXkzAFiovHItLuUy4g=; b=UARM4501lJOIwz
	f2Hof1ha/sO1OfijHMl1f4pPTED+Q8KhF4k/w7PshyzJ1/OCoIQM7qj/zXuOGzGnIVkLGgUdy443F
	35ogJVe/ccLUGVqZBePWPLuIJplKZX83wWhloEpPSgK4OiW+sk7oc2bOV/BejvV1BmCuQJDGBJzSF
	E6A0oMivwA6ta1opecUjWoUGUNVPR1jxVBEDTwfu1A5tJTxKD4REcW10MwJMC7auIDGOjKZrfQSKQ
	fcZuFZYXefwSSYlLyNBQ1VuvQXMXRgp1lBGy1UuoX6m9blfFlb9+vTY6aKWunKroRPWB2BTwEVDvS
	IqjwWcWpebYUg6cexwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1xR-00COuJ-GT; Fri, 20 May 2022 12:42:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1vz-00CNyN-CY; Fri, 20 May 2022 12:40:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7F4261F462A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653050443;
 bh=xWMNR+zE+UnsdH+9w2byRvIquFAh3MbREE3UdlA2/kw=;
 h=From:To:Cc:Subject:Date:From;
 b=eZa/Mw01gwpR5TW2F0uF/2dR9lSUFwkMtgGkX5+74375/19+cXM3TmNM1Y/4yfH8A
 nUX/owvhX/WQE0lBu3nnf9ojmkg71Os26Xgx/pXC2Al30rxd1EGDTWWiyCAfs5+Ufs
 5xAD92MHp6keq828bjx2tkC4mgx0XcuX8xX5bsFoSOMG6NhnZcDfBElzsLoiTKOJUr
 EayO3WQfU/vRIhPhiO+rVA2zhwxPm7N/rJWZiDFSKdvVtLZAJOATke/0lCCUg6KVsu
 i3nwyqKgXFg9U8uJvQJVjF28yUMbOTRSO/ne7jJJuvrMzHOI15PPngogFtgeGbD0Ql
 d6XSX5MN4143w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 zhiyong.tao@mediatek.com, henryc.chen@mediatek.com,
 johnson.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper
Date: Fri, 20 May 2022 14:40:32 +0200
Message-Id: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_054047_661067_E830A6E6 
X-CRM114-Status: UNSURE (   8.97  )
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

This series introduces support in the PMIC Wrapper for a different PMIC
topology, which is commonly found on smartphone boards, using one main
PMIC and one Companion PMIC;
be aware that this kind of topology is not *specific to* the Helio X10
SoC, but common across many kinds of MediaTek smartphone oriented SoCs
and board designs.

That said, support for the PMIC combo MT6331+MT6332 is provided in this
series in a form that will be able to initialize the PMICs with crypto
and DualIO but nothing else: these PMICs are very featureful, so I have
decided to add this support in more than just one step, as there will
be multiple patches for multiple different subsystems (..it's a mfd!..).

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

AngeloGioacchino Del Regno (7):
  soc: mediatek: pwrap: Move PMIC read test sequence in function
  soc: mediatek: pwrap: Add kerneldoc for struct pwrap_slv_type
  soc: mediatek: mtk-pmic-wrap: Add support for companion PMICs
  dt-bindings: mfd: Add compatible for MT6331 PMIC
  soc: mediatek: mtk-pmic-wrap: Add support for MT6331 w/ MT6332
    companion
  dt-bindings: mediatek: pwrap: Add a compatible for MT6795 Helio X10
  soc: mediatek: pwrap: Add support for MT6795 Helio X10

 .../devicetree/bindings/mfd/mt6397.txt        |   1 +
 .../bindings/soc/mediatek/pwrap.txt           |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 287 ++++++++++++++++--
 3 files changed, 263 insertions(+), 26 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
