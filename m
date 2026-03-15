Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25624D58B18
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Mar 2026 10:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Jgnt0lCswQY2X7FzKdIHrGZgEWkyIhP0iPIEiyxkq4=; b=JFDODA8i5DHtkS
	qdOp0byNq6+JoVT/KonohXPY/UY8JkfXEnQkIFBPhC74BhhFNOPfStZ0e8QfNfc5M1fp4e3o05fdI
	2RI+Pe8YwkPj77lb/XTWVSpUT1Lcr+WG0IAk8ZbjuIsGvbmYzwj++9+kK0Gp8DzQ7ustt826P/ZPJ
	ht1Z3VEk+zjTuUgR4Ah1Z4+NPXsHebHoDK1N+2wVmI8z+6ssxTbXElROEiEiz3Zs72DlSEVzYXdNS
	zh7YVci/s9WlLoC/hxNQ3Ib3hTqXddE56+3FgxZt+7/TLton4q0M3pDHMJ9mONsCVqVSlRQikwfAa
	OTWmtImpDYDZlR125VZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1igj-00000002XOE-2ewm;
	Sun, 15 Mar 2026 10:27:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1igi-00000002XNw-247B;
	Sun, 15 Mar 2026 10:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73D8660008;
	Sun, 15 Mar 2026 10:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6FEC19424;
	Sun, 15 Mar 2026 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773570431;
	bh=9eAzYooisbP12oFc8Fb2q0lVRb3E7ZJX32SroUaFStQ=;
	h=From:Subject:Date:To:Cc:From;
	b=mRBkCMy9F69Keoh+WtONtq7vPc6ZwdtwagaN9exgvKWRSNxLz4w3rbJkn/kRLzLX8
	 9+PihIjxmpyhPzNqxuYVl8XvfodSH357CC94DG3zw2eyUSOeKsbk86E1RB/wkwgFPP
	 Io9H7dBUOwr7wQcqMbFlXSTp6yl5hM9fLZpPly6m6HLmZOEBz4gcGEhSLtPa0disgX
	 UEsVX5sUpCeGTP4zCi0Klc/ajExh+BVCAuTH7lh2kgMYO4OpLJpOg0PMMWepYXrmgg
	 IhY0sAoM57DU8dqq1+//V1lC7h+HAVDwblq7pb/JvUqb1tsReIjnSvU22/JdQ6+COd
	 Th7oSGuDrK5vQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/6] wifi: mt76: mt7996: Rework vif/sta links
 management for link reconfiguration
Date: Sun, 15 Mar 2026 11:26:23 +0100
Message-Id: <20260315-mt7996-mlo-link-reconf-v1-0-a8a634fbc927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrDuQjDVNehVx0cZRh2oiiZSC5
 O4NLv/i/RMyJ+EMz+aExF/JEkMNfWvAL68wM8pYG0iRUUQat+PhnMFtjbhK+GBiH8OEXctvy6O
 7k1VQ8Z54kt817qEaA0Mpfx85TFhuAAAA
X-Change-ID: 20260221-mt7996-mlo-link-reconf-53eb8ed94280
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Rework vif/sta links management since MT7996 hw requires to remove AP MLD
links from MCU configuration during AP tear-down process (e.g. running
mt7996_remove_interface() for vif links or mt7996_mac_sta_remove() for
sta links).

---
Lorenzo Bianconi (3):
      wifi: mt76: mt7996: Rely on msta_link link_id in mt7996_vif_link_remove()
      wifi: mt76: mt7996: Destroy vif active links in mt7996_remove_interface()
      wifi: mt76: mt7996: Destroy active sta links in mt7996_mac_sta_remove()

Shayne Chen (3):
      wifi: mt76: mt7996: Account active links in valid_links fields
      wifi: mt76: mt7996: Move mlink deallocation in mt7996_vif_link_remove()
      wifi: mt76: mt7996: Add mcu APIs to enable/disable vif links.

 drivers/net/wireless/mediatek/mt76/channel.c       |   9 -
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |   2 +
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |  22 +--
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 208 ++++++++++++++-------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    |  66 +++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h    |  34 ++++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  11 +-
 7 files changed, 255 insertions(+), 97 deletions(-)
---
base-commit: dab5edc5546c90674cfff033abc2b797b3ad4bf4
change-id: 20260221-mt7996-mlo-link-reconf-53eb8ed94280

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


