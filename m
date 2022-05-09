Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=re15AmGYiX4P5i7zJYQx332KpFr2iQ6YIHapYmb4p6k=; b=LsLrhNcKJVPJr4
	l3d9+ZntiEBqjeESWoK5mRBbCHWvXdGl7lMvP4f3sWHPXjwQUZGPrxfbLdeNFhmROsBU7Y5QJwx79
	DjMgz2F6V5NJwvQ69OGWyHmejV4oXan4AjPtL6KCLYH/ukEDVqLYCYp1vAXKgyUqEMmm3k1ef3IXe
	nVJSg/UbGlgCm5YmCp132dKZPZQSUpmNCqA7DgvFKUub+oW+keKK9L6HsQSmZLi77pdr9F6dd/CDa
	FR1lqdUAzV8eqj7oPJcgOihs+zVct+bYIsw3DQ+FgI3dGByGeKywbwGRq61j8OWYwPC2TjB1UEnhM
	ekHL5d0YJoA6vH4P+9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noAbr-00GHWI-1D; Mon, 09 May 2022 21:08:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noAbd-00GHRW-5B; Mon, 09 May 2022 21:07:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DE5E41F430CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652130467;
 bh=74FyHDOOizk+TMT3i3Kx8M2B5GpKxJp/DqS60eMcOH8=;
 h=From:To:Cc:Subject:Date:From;
 b=hrucb9ZEUOvcrLczb4CqvrxAcAGDIWXe2oBJDiJDfkI30WAO2cPhDUWIM9tHp3Qqi
 1RAuGwyA4d1JrjsAiVAv8kxuyHm7COrblIg0GIfE7v5rqkOWIV/no3ohYRgkSgIhiJ
 9/e7vcUnzlL0NiazyVf1JrzpSmSRRr0Hrhff4xbRtsCjCHgzNIZD6aAbvbFiwGqmm4
 3yXyuxBxjHkpdHwEJZWltTFVMQDf5xEF19BunbEv1aQMolhdUuuUDGpGW+kFywNqy2
 Q+UJJyqOLju4wg74xYC7JBjtsYmdZK98sEE0tzKv9HHkGGD6qp60N9Tvnn3XUKi9tx
 0vVlqmd7aaVFw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/2] MediaTek SoC ARM/ARM64 System Timer
Date: Mon,  9 May 2022 23:07:38 +0200
Message-Id: <20220509210741.12020-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_140749_379840_9C7C1A8C 
X-CRM114-Status: UNSURE (   8.80  )
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

This series introduces support to start the System Timer for the CPU
cores found in various MediaTek SoCs including, but not limited to the
MT6795 Helio X10 - and will most probably unblock many developers for
the upstreaming of various platforms.

For a broad overview of why/what/when, please look at the description
of patch [2/2] in this series.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

Changes in v2:
 - Added back a lost line in commit 2/2 (sorry, commit didn't get amended...!)
 - Tested again for safety

AngeloGioacchino Del Regno (2):
  dt-bindings: timer: mediatek: Add CPUX System Timer and MT6795
    compatible
  clocksource/drivers/timer-mediatek: Implement CPUXGPT timers

 .../bindings/timer/mediatek,mtk-timer.txt     |   4 +
 drivers/clocksource/timer-mediatek.c          | 119 ++++++++++++++++++
 2 files changed, 123 insertions(+)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
