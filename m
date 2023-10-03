Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B473E7544F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+IUYqkMrdUXuRzIygmnFhaKFKKjEP6TsNBOTnRPfrI=; b=g0jWwLyZq82tG82pb3d1bkS7Xw
	HH8GGAaikZL+1pQSSt2KrDk2XVkD32WU+qD+fZgqHrBiatU333pjvV4+AgJVSf3YpTpnZq27f671q
	OTdYNa9a48Mo5Sh9Gtw2wY2NcsmakUf5F/CyTHSdD08gzAZYvyDlfrrZ+HMbtPOS7AVzOHiytThjA
	VRH+U43PIih67OdS2A7mftOZDy/Os4zvEwDjMb76lbRZlHcTBCKhvejy7Ah2lf2KTBFLMW84V9eGS
	RmDAHjsh6y5Q0SgyayLQK7QTgMKFLrZvYwHwmfpimInh8BNVDluUA2xJPWA/0pIkum5y+pQY6iBu6
	hRcPx5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qndLm-00EVFI-04;
	Tue, 03 Oct 2023 11:14:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qndLg-00EVAH-2S;
	Tue, 03 Oct 2023 11:13:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C4026607325;
	Tue,  3 Oct 2023 12:13:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696331633;
	bh=UO7hVIO9relB+JvuVz+PxxqsIIDZTWVoNwtpPPpJAHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XlvIHte13uNTQywA8mO/EUDLbFh+8uBxQX4Koc4oFuhvLsCNQtT0vI39LxbmgzOeR
	 D1XNuk3clQsAsPonI2PONHqVVhF+M/TEL7tkz9aFpQEWWbuwWDU2tiIJsSadakdE77
	 ZBlWH+Cpfuzp0mBG2yusXyZUsR56xuRoRemEqTqDit7uUWAn8w0oCoaQgzC34MhHav
	 4FZcmsq8fVytNQmW89q6GJg0IBspUXuIkj9uaZW2zDu2XtFvffvcfROijr3B6fYHlI
	 TgTXZDjHv6Pz00pFoUaVBfPixK413Ne9D+JK1sQwI1FC5MT2BQnBqNh9FskvQWM1eb
	 s2C1DvBvCk18g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Tue, 03 Oct 2023 13:13:43 +0200
Subject: [PATCH 1/5] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231003-mediatek-fixes-v6-7-v1-1-dad7cd62a8ff@collabora.com>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Miles Chen <miles.chen@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, 
 Frank Wunderlich <frank-w@public-files.de>, 
 Jieyy Yang <jieyy.yang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479;
 i=angelogioacchino.delregno@collabora.com; h=from:subject:message-id;
 bh=UO7hVIO9relB+JvuVz+PxxqsIIDZTWVoNwtpPPpJAHY=;
 b=owGbwMvMwCU2y4zl/NrpLRWMp9WSGFKlv+e/ufF/tX3u6QLfx94+3wLjsqLSNI7nLN8+t1lwk0F1
 6JS3HaUsDGJcDLJiiizqd2uyn69ZyXik/WwJzBxWJpAhDFycAjCR27wM/93Xf/UT8z67M/9X24NV/a
 VFE14pqvVLb2GdtPJ61IHOR5MY/vDOcJNK+NN7Zsa2++/2zXKYr6zz43WEzJSpy3ezWUjpXWYCAA==
X-Developer-Key: i=angelogioacchino.delregno@collabora.com; a=openpgp;
 fpr=57152E620CAF29C5DBE574766833ABB5BEBAF7B7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_041356_932985_0AB4ABDC 
X-CRM114-Status: GOOD (  12.12  )
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

I am a top reviewer mainly for MediaTek SoC related patches in most
subsystems and I've also been upstreaming both improvements, fixes
and new drivers and devicetrees when required.

The MediaTek scene saw a generous increase in number of patches that
are sent to the lists every week, increasing the amount of required
efforts to maintain the MTK bits overall, and we will possibly see
even more of that.

For this reason, and also because of suggestions and encouragement
coming from the community, I'm stepping up to be a co-maintainer of
MediaTek SoCs support.

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20230929082009.71843-1-angelogioacchino.delregno@collabora.com
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..57f82fcea1e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2327,7 +2327,7 @@ F:	drivers/rtc/rtc-mt7622.c
 
 ARM/Mediatek SoC support
 M:	Matthias Brugger <matthias.bgg@gmail.com>
-R:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)

-- 
2.42.0


