Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316E5C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sKFCvGofSvmKvRwvVCVNlfN0H7L2g+hlz+mIguaMUxw=; b=xdi2SUFfQZ0xhV0wHn782PbOmE
	QHAyq/fU8jjuQ9VJzG++Ew7q6aChBYew1Qbp3AOoBhuG/ZKEY1ixU6QEnlCyslLyfOVkLqhVrLVeI
	2TLXRb5w7QeMQo5hIYCx0pMCp37WBI0raK9KhSqto/1g6fAIQc15/MKR10OLo4or6A5NWeCNp4kWe
	31IN75HK5+2SdBcaOlte1JKsdBGxDQCr4ksygIlU1y153EhGbxAmhxjb3e8mAA0w6Y9EGgrVr4dsa
	pFNqQBexqxI95frsrMbW/Md4j1Bx4JK9eQBPtLs2eqkl+cz/Omy9y2OOnWk9Cy6YTa35vk+A8uvws
	OGFUuZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8Fx-0000000DKI0-3A5A;
	Fri, 28 Jun 2024 09:51:01 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8Fn-0000000DKDd-1kdu;
	Fri, 28 Jun 2024 09:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719568248;
	bh=CffpkilqOr6oKwfETinZOL1etCI1pR0gFsxhx1qzNVs=;
	h=From:To:Cc:Subject:Date:From;
	b=fZjkd941FpqgRS3MGGo02AXgieGQrJArjcMXbNa4ef6g1unPiqhFzDDJiUEDQ1xED
	 6a8xtXJX44T9sNBmNFxE5cAT1J3pa762c7wRyqTRkDBf/LfsQl/REa3NxF6PvxFdRu
	 yVjtB80ULMKZEyLO6ZHRg/NZHoQiPrtxkeudhAzTcdivrsV8DPiquOvNkQp12WVmt4
	 sfMT2RBx8QgEnFBLDNbOj6QYptQ1Hx1Lx934+0iG24T89f4jXjOuo62BSdeuyeLpwp
	 5fBG88D6vFOAD8xlxWrjWlSnnwiprLyR5h8qEWbL97ALuufw2mvbU4bgpb0y2n0aYR
	 51RD4pnJTUs6A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CECF83781115;
	Fri, 28 Jun 2024 09:50:47 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/1] MAINTAINERS: Assign MTK Airoha to MediaTek maintainers
Date: Fri, 28 Jun 2024 11:50:42 +0200
Message-ID: <20240628095044.132276-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_025051_626609_CE89D150 
X-CRM114-Status: UNSURE (   5.20  )
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

This is a single patch assigning (MediaTek) Airoha ARM64 to the
current MediaTek maintainers.

Krzysztof Kozlowski (1):
  MAINTAINERS: ARM: airoha: add entry to cover Airoha SoC

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.45.2


