Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2710C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 07:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K8H7J0OVetCepYmOt91n33mtbHirNHAw9y7TORZgnOo=; b=5Agn4OSaiFStsq
	XlpVxDcIrJb3qfCBmewbteULQaEW+xnzcNHEzOHgN0vDJehyDQtPz85QB5j5fciRFfE2q9XUf6yDF
	sXaHnPJyStLWzYC6th8IJREGBEFg3j7ZK0A/HMmZvr02eXu6VDxQzoWGcJhVxPEXOvPycJhfsrkdy
	i0dBI6DKIoz7GFKE05tnv5l861rba5An61QWN4hi354wrVvlHoKDh4SAMHGwqoP2/SI+XA5Q7zodY
	2XOsfZWWWDpJIPj8pFLi13pzJ5G3RWhA/v6sZ9vEVjzNm245Cu4roiq9V97vwBhdK1aSDudIgseb5
	JQKKNUtofBlsBLE6GVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZphW-001AIh-T5; Thu, 31 Mar 2022 07:58:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZphK-001AGB-U0; Thu, 31 Mar 2022 07:58:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 119661F463AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648713502;
 bh=q+KkXh4Pi0KibB5c7kl1SmkyDO/TsKJGH9MCkwBZDHU=;
 h=From:To:Cc:Subject:Date:From;
 b=GMvRcREW1cy7oMzB9xtXztHtyYLyMopePT1upmpmVdQUDsKoWudWaIdGFyDAN1dps
 NUcctXekdvSAi2VJf7bc5ElGnw2PneAE1o7ESKBIEIoXvdEeTQj6jiFoozKShnAxHw
 tmpYfL2vSdSxvyoNJlT8fje7gyXC3VJWqdtxPAKC6+vlY8d1PbSkEOH2TeWPSzaMSD
 zUGrJCuYgZHS91v6KDZhv2Lln88+fwyKAVR4HgQQ2Yl6n341xcOlYMpUNK0RtljRNF
 JZHpbvIIKYQyqGFr7GH923Ta0H73SCYH7Wo4kkFY+5QWaN7SD95UuXsA5P1kNcUlii
 gnu3ptbYxkzHw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/3] MediaTek PMIC Wrap improvements and cleanups
Date: Thu, 31 Mar 2022 09:58:14 +0200
Message-Id: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_005827_200193_02A1B7C5 
X-CRM114-Status: UNSURE (   9.43  )
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

Changes in v2:
 - Fixed a critical typo in patch 1/3. Thanks Nicolas!

AngeloGioacchino Del Regno (3):
  soc: mediatek: pwrap: Use readx_poll_timeout() instead of custom
    function
  soc: mediatek: pwrap: Switch to
    devm_platform_ioremap_resource_byname()
  soc: mediatek: pwrap: Move and check return value of
    platform_get_irq()

 drivers/soc/mediatek/mtk-pmic-wrap.c | 73 +++++++++++++++-------------
 1 file changed, 39 insertions(+), 34 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
