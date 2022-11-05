Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54546C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 22:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vha6l5/R6y9hIXiMXJ5jKcqQLuxX7o7wXWqhZuvi4Xs=; b=F3U2b0xl8f4c2evQnF9/cH8qOy
	q6rzPsPip0DBXpjtpSMXXXQb98JctkoG4QH3k99/dV6BYQVlKvZTJ2FzV9jt1y11u3xdF4qTISeau
	rXZQDk5Vf1+Pmiy4i0sGBAmzKn7eCYDbjEeaeFkPqOuOjnvyEjvU8P152GshNK/6WA0CUJbng//9y
	aYYfyp2wmd+iHIGPihIgfUJyXEHA0/H92FfPQAuo6ybRI7GKX/6h0D9yE6nx8JxWZMEq/jt1epAxD
	c+4dXhHaQygO1p0GiiESXMMXz4aFtUplHWqyfdBq4VJwZ8N4T8TBZEKJyZtCMlvFFLQxCledpuM1C
	inRL5Jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRmk-007KEz-7t; Sat, 05 Nov 2022 22:37:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRmi-007KDL-4u
	for linux-mediatek@lists.infradead.org; Sat, 05 Nov 2022 22:37:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B01160B78;
	Sat,  5 Nov 2022 22:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B3FC433C1;
	Sat,  5 Nov 2022 22:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667687823;
	bh=aekRNA0fmpdgo5jsqTiIl1w1VyTVSk/fDt6LH0NC+Ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c+EQiRh8VqWSAoT55EMiJO9TWGVIgkdg6T0N3K2j+9q6Z3pGBHyce41qCAWnbngf7
	 vC3upkSEoU9D6Ja5wrpwSZOz/seUi26rdDLyc6UL6Ip5Tlxv0TIzeHnuKX8B1gE16U
	 KWk5GKr9nJu/bXRFHo9BrUwXLacPfTC6D6F05H6t1iVZbilGhYOvJIqQ/vuOTwr126
	 /Sc9OSdnrx13b/8w9RuR2lPe2LSwkyrZYhyhk9J4w1mywZeEkYMSDGR2PDjYyV1oDb
	 iQ+MiipgLF06b9q+sJBeOExWp2i/29zIxMYYnkW0B94FvH5IzMlZcs2tZIANHkvJAl
	 EUpXxR06kFwtA==
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
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v4 net-next 8/8] MAINTAINERS: update MEDIATEK ETHERNET entry
Date: Sat,  5 Nov 2022 23:36:23 +0100
Message-Id: <d9d798bad6835d031ca0135ee29469c44ba73bf0.1667687249.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667687249.git.lorenzo@kernel.org>
References: <cover.1667687249.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_153704_243141_4FD2A173 
X-CRM114-Status: UNSURE (   8.91  )
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
index 95fc5e1b4548..51be68e90f6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12925,6 +12925,7 @@ M:	Felix Fietkau <nbd@nbd.name>
 M:	John Crispin <john@phrozen.org>
 M:	Sean Wang <sean.wang@mediatek.com>
 M:	Mark Lee <Mark-MC.Lee@mediatek.com>
+M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/mediatek/
-- 
2.38.1


