Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF7EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKTewyrnhpQ1F53x4v45gH0+Zm/vbdAFcBiFtRsy1Zw=; b=sp+D+OH/4fx8RVMAit87OLo7fB
	anvjtn6cmw5wMxsqOZdnsGEaAcR+LlewY7abqBn195VyA+3/bvps3tPHNc0QAE9whn++1hGrGeCFy
	qpykurOhd8C7lSxSgPSPrK32Mp997BdH02K4gYtmeOFaSzW98RGjEBGuomyUNv9ySrULsPGktvwcP
	+gpThoP4hcYIhdb5HjzM69xAaS8ppHnIKjU5EDQ91ZwgizmLnGy0XypYk42lBLZJ1PumzfdTBnOsc
	3DSKIhgtJqKK7ICBy3tbXPhEKfeBR3Yjh/LxUiLRRKvVZryqjwjuMWmM18mN9Dh+mG5qKqv1R3vva
	5UsITK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWZm-00GwzN-LZ; Thu, 03 Nov 2022 09:31:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWXB-00GvpF-3i
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 09:29:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8B2B4B826A6;
	Thu,  3 Nov 2022 09:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE06C433D6;
	Thu,  3 Nov 2022 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667467750;
	bh=B/U8fjOrOcTUs3/L5mJw71YthuNrt+CD4lE1Aj11sjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uhfiIxFYdDykFSJ90KjtBljy2e64lIDURT0tgo9hQ7R7T5drWE5JE2SClyC9GcFB0
	 pXbJdEuYTj70LUwNQHd/90Xdq2et8FB4W/NuIHqtnjNd7RRky9IYGjHRzXd52gZinu
	 uXsnr0iWh+ayVACGhtxwnINMm+wEwqjW/n91IVOI/kwrVtzGxEcZIozYJzmLwmW3Zk
	 WMySFEGUuoGKeSQM54txRCGHsLn3lIWMTDeUFuuQ3slnXbp9CBkcybwj7738prM+1S
	 Dwb8w8EDTi2r6YJWlerMH0Na7jWw5VdXwcJeF/GCBQ35xVvZK0af5W/okS1gPVY1P3
	 JETVU3WQrXcjg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 net-next 8/8] MAINTAINERS: update MEDIATEK ETHERNET entry
Date: Thu,  3 Nov 2022 10:28:07 +0100
Message-Id: <a13a62d87d37b98d3c8d93a63ee30dc2508ef75c.1667466887.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667466887.git.lorenzo@kernel.org>
References: <cover.1667466887.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_022913_341732_4574B58D 
X-CRM114-Status: UNSURE (   9.39  )
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

Update MEDIATEK ETHERNET driver maintainer file enty adding myself to
maintainers list

Acked-by: Felix Fietkau <nbd@nbd.name>
Acked-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d44c5a6607d..b277dbde70ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12920,6 +12920,7 @@ M:	Felix Fietkau <nbd@nbd.name>
 M:	John Crispin <john@phrozen.org>
 M:	Sean Wang <sean.wang@mediatek.com>
 M:	Mark Lee <Mark-MC.Lee@mediatek.com>
+M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/mediatek/
-- 
2.38.1


