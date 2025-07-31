Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B10C87FCC
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GLwEC3vkkwzK4un+dz4KfAz5r6/sm15i/w61klm+2w4=; b=ZRK5uMnd4djtf+
	Qgr+eok5OpI9E3IJH3i1V0+esa7eyJgILS8PbJ25uvhH0vT03uSKGWnTbbDUNomhFE84blsDZwgZe
	1GNFrW/GoKgJ+d0YiQ1e7VuwwQS2cVCXkxOJw0xaEo6iucZBPMbYlwoY0rgwCeYn3N2jTtQ9+UGQe
	XAUDjLC+ewFIgDUhxDFh/jmmVCzSkZ4yLdkclxqNZnxRD4eknIEgD9GzU0H/JLhDNLn83kKcvNZNz
	EAawFOZV6ODbyJZZhvgxLZLxKIPgW7JXjhJkkzs65etsr8QlD85b4qHtXioF5EY5M/DxvGE6cAd9N
	4bKvsUKEZFRH1243r4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQnN-00000003OqB-0Jpw;
	Thu, 31 Jul 2025 10:45:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQjJ-00000003ObQ-3LGp;
	Thu, 31 Jul 2025 10:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B53144A5D;
	Thu, 31 Jul 2025 10:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE183C4CEEF;
	Thu, 31 Jul 2025 10:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753958505;
	bh=DAwA9+gaYkoHzADBWAkFXV0TI+WZQncLcPZpV8x7n1I=;
	h=From:Subject:Date:To:Cc:From;
	b=BpXjbWFyNn63BTKtPVovFDxaGKe3iDrl+zVnbu6CQpvXU17N4MBfu7ood+PXwbHzn
	 DNcpisg2MjwclmKYeaG40uRikOWcMmFBILZ13S0jY94lIkSJiqPHktQZpZaieBA2Wo
	 5JXKMvRShSClZNkpUlAtBzFoaMFJvliVkk58X0PuTMkjHbHHVhCrEVBlU01pieyvlw
	 T4ZdrO+0sHSJWNl9pmMdWfGDEeyymvk9IAkqtSrCuvCf0uvnxJM81MRB6KMpdiW2mc
	 OBJ76jz3nmS6LQGqMKyKbuBss2ndWzeeukUDQ7pmur8CV8k2LQnEcfLflzlhj1vrTG
	 H68aqNrshA1ng==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/2] wifi: mt76: mt7996: Fix connection setup for
 MLO-capable clients
Date: Thu, 31 Jul 2025 12:41:22 +0200
Message-Id: <20250731-mt7996-mlo-devel-v1-0-7ff4094285d0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJIi2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc2ND3dwSc0tLM93cnHzdlNSy1BxdSzNLsyQDo0SLlLQkJaC2gqLUtMw
 KsJHRsbW1AOOtdERiAAAA
X-Change-ID: 20250731-mt7996-mlo-devel-9696b02a8dfb
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_034145_861053_5D351BF5 
X-CRM114-Status: UNSURE (   4.95  )
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

Fix connection setup for WiFi7 capable devices.

---
Lorenzo Bianconi (2):
      wifi: mt76: mt7996: Set def_wcid pointer in mt7996_mac_sta_init_link()
      wifi: mt76: mt7996: Set proper link destination address in mt7996_tx()

 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 35 ++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)
---
base-commit: ab82ccb7840901200a8a75d32d13cc56f9597966
change-id: 20250731-mt7996-mlo-devel-9696b02a8dfb

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


