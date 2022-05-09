Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=46V14hy9oQS/vQF3CgOqLGS4f3vxZxxY1zJuNDoAxPM=; b=BfOoLfqD0HfAMz
	me2RGyzR/G/1JE4s3U7SaBw5nMkxmZpzWheN644GmUfskGnG6vE1/Sxb2j2Jh46OEqjowCjFERpK9
	W7pTciTYPBACGNdilWZHy+5+ikJV077K1/p95KLJFfw8OUfLPa8T2JZ0fqSkcRxvDn+Mc6ncLKcdD
	z2jd22eVYQsqD3LhSavEzxu/xmGZWlNeRTbzorYjaWE+gOcpaF4eaAXTmcJIKJfX4UZ+hV5YI4U9b
	0KYrDqHykqooD5MTpPTcVdsAvnXTaBjppK8tgwcfmKOI19wMIDkjda08qHG4lJ2IeLEZ8slEj4rj3
	+DxYyGhYyktPrfgH/5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no0Wm-00DjSo-DU; Mon, 09 May 2022 10:22:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no0Vr-00Dj1n-5W; Mon, 09 May 2022 10:21:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BBB721F43752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652091668;
 bh=kFY6xdvfRk2XofodD/pcIzhqwLnHWFBwbwW4/mpaiGk=;
 h=From:To:Cc:Subject:Date:From;
 b=lCQetSKw8oY2VFDLVOJDfP0OQrIwkQXWFqrQ58A1/O1es7qBNOttUR2OO2BMPkXAO
 c97xn4YW7SwxEf3ydcgUynbM26lydrJk6kJ5bE696XBO3SxD2Tc4C1fitRD6AHichg
 1wBeQmoQUb8SYPJlsOneogQpDjNxw5kjIHwxf3bZEjVX7DcCQFEwDGBvWOGVdqK4L6
 i+XNIsE5/pGvIzA/bNm1XrBOw6NseY7cOD4IUUVkAOauAIDWTtqGfxioHFK91fD6Br
 lhBzsFkxvT/dkbOx2BTPFS3M65xwfb0uq4BdWIS1w3HtEeJ4m+2hoC0dBBVTDl87DX
 jnu3WzBUcHJ0g==
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
Subject: [PATCH 0/2] MediaTek SoC ARM/ARM64 System Timer
Date: Mon,  9 May 2022 12:20:56 +0200
Message-Id: <20220509102058.3064215-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_032111_485671_DCFFD26D 
X-CRM114-Status: UNSURE (   8.19  )
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

AngeloGioacchino Del Regno (2):
  dt-bindings: timer: mediatek: Add CPUX System Timer and MT6795
    compatible
  clocksource/drivers/timer-mediatek: Implement CPUXGPT timers

 .../bindings/timer/mediatek,mtk-timer.txt     |   4 +
 drivers/clocksource/timer-mediatek.c          | 118 ++++++++++++++++++
 2 files changed, 122 insertions(+)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
