Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370C0C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 06:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/+Wi3BUJhv36lva8OA2yxU2buWYcd4oY4qvz+SbxjkI=; b=X4AtS4gpc+icWl0a9E2SuXV3zL
	H7Gydagvvc79HOJPLzrY/c6h0xuhvpxd/tAS8546a46vGXZVDA2FZvedGMRhE1iV2AQg/6pej0ERl
	pQ6iEtpP+PaM2QA5/lIIn8C6MC9YBTMxMz5hIo1pwNPAayX3bUFPWTvpIrgFxo5WFz32d5tEnYmXC
	PrQ14uoB8/gWplWXLsbRo7Zmyod27xnSXa6rSTgp1Z8opS33QYsoqH+7eKZ1vFkWlpwB7WrCJWmW1
	LcYQRTGkyqGfVrDuJ/jZFNRCsLZoTs9AaDZQEb+TW7nxYYHnwQdV9epIMFb16B+08MhqPu+6opVp6
	CgFvOxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp12w-004Alq-2y;
	Wed, 19 Apr 2023 06:12:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp12r-004AjE-1h;
	Wed, 19 Apr 2023 06:11:59 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3DB2660318E;
	Wed, 19 Apr 2023 07:11:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681884711;
	bh=h0rGIVuQj6zUdLHPgaxEP/V/HKYWI6abOEae2aWJ0Ms=;
	h=From:To:Cc:Subject:Date:From;
	b=K2xWN1RlJGJC9gWo22yxoMW1HP91SRmetxnkQ1wu6urDdcGWQ0K65/q9hSncyk15a
	 M76In6U3k7AHq9LGCjzxb/R9FEpOPZNjQMow3rO7XHHgtvchPCXu5B8Hjb52D/BKn8
	 wG8rKnr7UWv9E0IZOOJJQih0pwZFTbMEovIXf5PccjgAGZTVvDq4neiUeNL8Kj2uxR
	 ZxVveDJcZRHw6lsB0gwqN54lRsUrVGIMBsyQaHTA6jv0PGjmj0YpL/uRihZnAtJov9
	 uUl/WV0CJvrTY9qhaG0S2AeAD2c/hIspXPoGzxgFSzl6K8Hf4NxbIdNpJykzlOaZbX
	 AhkXa5rqYMfxg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Cc: daniel.lezcano@linaro.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	aouledameur@baylibre.com,
	bchihi@baylibre.com,
	daniel@makrotopia.org,
	ye.xingchen@zte.com.cn,
	hsinyi@chromium.org,
	michael.kao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] MediaTek AUXADC thermal: urgent fixes
Date: Wed, 19 Apr 2023 08:11:44 +0200
Message-Id: <20230419061146.22246-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_231157_777163_7584053A 
X-CRM114-Status: UNSURE (   9.90  )
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

The AUXADC thermal driver unfortunately has issues with a fixed wait
at probe, as this is not only SoC dependent, but actually depends on
the board (and even aging...): for example, that works fine on the
Chromebook that I have here in my hands but not for the ones in our lab.

Some machines are working fine with that 30ms delay at probe, but some
others are not, hence I started digging in downstream sources here and
there, and found that there actually is a valid temperature range for
at least auxadc-thermal *v1* and can be actually found in multiple
downstream kernels for MT8173 and MT6795.

As for v2 and v3 thermal IP, I'm sure that the v1 range works fine but
I've "left room" for adding specific ranges for them later: this fix
is urgent, as many MT8173 and MT8183 Chromebooks are failing tests in
KernelCI due to thermal shutdown during boot.

For the KernelCI logs, you can look at [1] for 8173, [2] for 8183.

[1]: https://storage.kernelci.org/next/master/next-20230405/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-kms-mediatek-mt8173-elm-hana.html
[2]: https://storage.kernelci.org/next/master/next-20230405/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.html

AngeloGioacchino Del Regno (2):
  Revert "thermal/drivers/mediatek: Add delay after thermal banks
    initialization"
  thermal/drivers/mediatek: Add temperature constraints to validate read

 drivers/thermal/mediatek/auxadc_thermal.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.40.0


