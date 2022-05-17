Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CEFC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U5rbC6nUEfNcf9utTFKtEpYmzRJUy9h1+NJjbX0Lbhc=; b=UVOOuMiPXRg8GN
	jQQWz0uwxlWr+tLOs4Z6eBOj7YjyP/PPbj3WVWC5SALlKm5C7X31mFxHdC4QVEc58l6Uavhls0eoO
	7Zr/mznzH5zUrohDO+Aovi/DlGABTKYiOTRa5ac6++cdeEZZkvY4/qX8Y4T2hUV+7hgTgE165krMM
	8IPwb0dI3bohmR/+Swgq8qvtX3vyGLyGopbiHTvv2n9GAlOsuNlysgZ2RJ86DoIRm7dXNM6bFHcq4
	+CGefgpRHvszJ1zU40bXghfSvL4ieV7+qZ3sT+0b3miULhJT78H5DdLziHw2WcmIKHJVc2oQU7vAX
	z3EHE/Orre/mntYQeFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquk6-00DCOJ-LW; Tue, 17 May 2022 10:47:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqujZ-00DC1Z-It; Tue, 17 May 2022 10:47:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 19BE71F444CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652784436;
 bh=bYMgEgCn3a8Bcf/XO+hS7bqnZvVx/+/SMVYi/R86hPs=;
 h=From:To:Cc:Subject:Date:From;
 b=NylxLWVXYMVBcdkxgTPEB8p03eKsjx9cQt5xMlhTzkmfHsvfib0WxViszQYLn+tQ+
 Ge9In22rDXzuJI1067vaG1+sVMC6cSEoIrnWx9uqcMEVGfdlbDYaGK2L+BZrOo/PU5
 oIchXHL08sb4evV/StxHXLlWJ1E9AzDcSB+b6eh+Xu0QULnSubC16Lncu2PSELqAAz
 pIU6JPmBJNfncSgiVA1EsN9jAh2RXlQp5Vks5bS05jF2S0eCVFNp3hNjw8P2CiQoDv
 coMhtuPr0xo8AmOEOr5RTwtrCGw602fY1lP1X9305bP8KOxB1BJktSM7UEfyIR3KFA
 +NuOd5qkobs7w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 0/5] MediaTek PMIC Wrap improvements and cleanups
Date: Tue, 17 May 2022 12:47:07 +0200
Message-Id: <20220517104712.24579-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_034721_877758_0B055C3B 
X-CRM114-Status: GOOD (  10.79  )
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

This series is meant to improve the mtk-pmic-wrap driver;
that's done by removing the custom pwrap_wait_for_state() function
and correctly using the readx_poll_timeout macro instead, which is
doing exactly the same as the former.

As also shown in a patch [1] by Zhiyong Tao (MediaTek), performing
a tight loop is not desired: because of the operation timing in the
SPMI PMICs on these platforms, it makes more sense to wait for some
microseconds before trying to read again, reducing CPU busy time
around these state waits. For this purpose, a ~10uS delay was chosen.

While at it, I also took the occasion to tidy up this driver a
little by optimizing its probe() function.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220329115824.13005-2-zhiyong.tao@mediatek.com/

Changes in v4:
 - Avoided moving call to platform_get_irq in patch 3/5
 - Dropped Nicolas' tags from patch 3/5 as it's different now
 - Added newline for readability in comment on patch 5/5

Changes in v3:
 - Added two more cleanup patches (4/5, 5/5)

Changes in v2:
 - Fixed a critical typo in patch 1/5. Thanks Nicolas!

AngeloGioacchino Del Regno (5):
  soc: mediatek: pwrap: Use readx_poll_timeout() instead of custom
    function
  soc: mediatek: pwrap: Switch to
    devm_platform_ioremap_resource_byname()
  soc: mediatek: pwrap: Check return value of platform_get_irq()
  soc: mediatek: pwrap: Move IO pointers to new structure
  soc: mediatek: pwrap: Compress of_device_id entries to one line

 drivers/soc/mediatek/mtk-pmic-wrap.c | 225 ++++++++++++---------------
 1 file changed, 97 insertions(+), 128 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
