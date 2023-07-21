Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FDC0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3tEZZdf4DhY+IbCNyfUIDbi5zcsCRJJs9LD+YxqzkxA=; b=ws11cbXGiGWtsdfk9K/XZi09nE
	jDKdJPvSj6IyhlVPgANnEem3Boe5z2ae6QNPsX6vDpoe6kAKq3LRXsMKGP+C1mviVyqgxrGilQm61
	WHapDVwiexAYakiC3keWFtywu7jFpRWqzD/+LfFeDUJ1Ng7Ys/Qik8RvUnNVKHvfDm+lHgx2gXLgB
	8XhBTPpr1NHknUfuM/96bhah0cCxg1pj8FdDfCHQVunFFfQzdwD/4MIdbIGo/eyL/SrOFin1vGEPT
	99fRbLE/WYHDuB4doad0jo4bX8070FaABdLJwroxmNFvQzCd/kEWRl3NmdaIozHRvtolk2f3nogie
	D2MrZIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlV4-00DMxc-1x;
	Fri, 21 Jul 2023 08:28:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlV1-00DMw9-1m;
	Fri, 21 Jul 2023 08:28:32 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 59DD96606FD8;
	Fri, 21 Jul 2023 09:28:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689928110;
	bh=S2daYs/q6aqCT0TpIyUa+05O3Rn3ykyFm+Hh/ppB/7o=;
	h=From:To:Cc:Subject:Date:From;
	b=DlxTsX6WPi0EA46bobSmiVfjhwZ8LHFFBtVF+XfvRpKH7CXzKB+/qw9JTWxh8pD0g
	 1AqdhIk5T5PrVyyT68YHM2rMLggw9WKJwbJzjVKLEjAYTM5/MkZAX7jze3h/En88gD
	 m+PXLAS0PCZdOlSEenpzqo3PKTGbnmoCk873F8Gnn9o8we9UNwUM1Gv7FeDNAakpDa
	 EHCfpc3VGhljELNiKnvGqWnOh31jcIWx5xC8vl8fDc00ynpCyKkcIYPVPFzDTYJGU9
	 5YDTM5/D7BQxxf6TAPt6jbfeKugn1JFg50sClKB8PxxmOmnwyTjMX25d5zBcAe8usb
	 tXOz1C6M9aFjw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/3] MT6795 Helio X10 and Xperia M5: Display support
Date: Fri, 21 Jul 2023 10:28:19 +0200
Message-ID: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012831_720508_7784B02B 
X-CRM114-Status: UNSURE (   7.26  )
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

Changes in v2:
 - Changed/clarified copyright addition in patch [1/3]

This series adds DSI display support for the MediaTek Helio X10 MT6795
and also adds support for the specific DSI display and its backlight,
found on the Sony Xperia M5 smartphone.

AngeloGioacchino Del Regno (3):
  arm64: dts: mediatek: mt6795: Add support for display blocks and
    DPI/DSI
  arm64: dts: mediatek: mt6795-xperia-m5: Add display backlight support
  arm64: dts: mediatek: mt6795-xperia-m5: Add DSI Display and its vregs

 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 101 +++++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 251 ++++++++++++++++++
 2 files changed, 352 insertions(+)

-- 
2.41.0


