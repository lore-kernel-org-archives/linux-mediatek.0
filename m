Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C70C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nAjTzz/iG1v1opbM3qJK//bn4XkKHpAAb1i6AxhuEFU=; b=mMcTP7yOxufPMK
	OnE/dqTmYRkoeeJ2sxvU052bhWeJhUx9w4+mGBrRcw3APuY+6WJrmxZGoiKfHtRPr3xabjPk25VIt
	S/IJ9Bhx71EoJy0JPP5ZYUhjWZYQ917ukJWsT58IvzGiUC6KZ2zCVerrrrwxxMdfzo18bJBLrIzN8
	CgsNzZ1sVZ4m9uDF39IIEOSTmYVq73VCuWayc/cfoO8jczSBJAQcUcNsnytNlCblzGb9bpswu9pcl
	gTZ3q8hGLdXRpMZieo7tOo1XT9bWpvxK9Heh32bCQ6kexiqFPov4conpnbXflBc1ReQV1cz55Slil
	hFsnxNAaCAmlq1Nbfs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYu7-00H0xs-1j; Fri, 13 May 2022 17:16:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYtr-00H0rP-OT; Fri, 13 May 2022 17:16:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 64F731F463B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652462182;
 bh=ep3jRpBIJW1bdO4ml6xT8OEnFPxxL9DD9DvNn1dh3JM=;
 h=From:To:Cc:Subject:Date:From;
 b=k/stz5y6+b9rlyVbMpTBmuA/COetVN3T6fGAR2yQCBTSuOcBHemKQxnjdzSVRITRW
 fflBmWJNAyAY+rURBGixkvcB7WAyXJkbw3tuIcjuxjmltYf5N+9COgENmEWP0eMh2F
 nu4o0U4KiKX0ri2E2xQAXqQkXA0mFsnbtRdcCm2UqIVFiQKM1mILcD2Wul33WwetQT
 s5TI2ZgkpHzqyK0YpnM5d5rsOod0Y0mzmwzhmyuTP6F8QFpGU2EQ2TGw3sYcDy0zs0
 smliAl3ulpOECgpZO0xPsfUI16Qk/9TkS82Vl5/46c+Siq75Sc8hxbAP+Iq10xixEk
 QLlA6Mu6XOkow==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/7] MediaTek Helio X10 MT6795 - Devicetree, part 1
Date: Fri, 13 May 2022 19:16:10 +0200
Message-Id: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_101623_962290_B743E243 
X-CRM114-Status: UNSURE (   8.24  )
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

This series modernizes the devicetree of the MT6795 SoC and adds a
couple of nodes that are supported by this SoC.

In my local tree I have much more than that (including the dts for
that Xperia M5 smartphone that I always mention...), but I decided
to push the devicetree commits in multiple parts, as to get these
in sooner than later because that reduces my delta, and this makes
upstreaming a bit easier, especially when having to rebase things
around, which happens a lot.

So, this series *does NOT* depends on any of the other series that
I've pushed and is mergeable in parallel.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

AngeloGioacchino Del Regno (7):
  arm64: dts: mediatek: mt6795: Create soc bus node and move mmio
    devices
  arm64: dts: mediatek: mt6795: Add cpu-map and L2 cache
  arm64: dts: mediatek: mt6795: Add Cortex A53 PMU nodes
  arm64: dts: mediatek: mt6795: Add watchdog node to avoid timeouts
  arm64: dts: mediatek: mt6795: Add fixed clocks for 32kHz and 26MHz XOs
  arm64: dts: mediatek: mt6795: Add general purpose timer node
  arm64: dts: mediatek: mt6795: Add ARM CCI-400 node and assign to CPUs

 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 244 ++++++++++++++++++-----
 1 file changed, 189 insertions(+), 55 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
