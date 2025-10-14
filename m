Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD2DCCD184
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a9YMkSYMEsMPrNl64yxHwm2ASSAKsT5ODQsJvYcQC4o=; b=g5NFLliidbiXgYTrvnzLNohhnl
	46GTmJH7m6/MPC7g90Ug/7iFWyb0Pk9E6fjEvC+lx+gpl9A1BnEofncJdOe6FthjFruwae1D11k/7
	ZqYCHA9Xb7WX/LqBx+wFhtb94tGM9eYhHqL+CHiOSVI7IyFRMFlIpZ8xSnZcPq6DZJAaRHAVnnE/U
	21GJ7sWt+7o8K2iByliL8cwUciZwvNoyLNEaBfFdIzP4KB6aOSHUmoucrj4byJMPHo2nq1T1N4qdR
	0ZImC3Jy2cRWNhhkiyqQ+HonEcaa7gzsQJnWB4I8gODff9b+pNTnYOvMXx7E+4WKSZeQtsJQn/eZA
	eu7VNKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8f5b-0000000GUQx-2yWf;
	Tue, 14 Oct 2025 13:29:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8f5Z-0000000GUQY-3hjs;
	Tue, 14 Oct 2025 13:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=a9YMkSYMEsMPrNl64yxHwm2ASSAKsT5ODQsJvYcQC4o=; b=F6VvZyQ3JbCGJqSZ5Z9x/2URUK
	aBmOHxZ0ZM0tAbk8tSKJpWQ9rnqMhKWRLEKzBJpAJFTeohrNrQ4nVRxUGCcYpmzRUyf0bjmdPGkWh
	TPl9/WBacq9/jjiIxsG0hDEONgY1UC9Y8BhYQQZCZ+jPNRdHcYX90GV2z5hn0J5GVncFCxDoFyc94
	njRfWEz/9/iQcUWPoFq0DT/zOYyAbKOZ2Lry+13dgaWomkqvHNBMzmRlbXVZQySpHohvCAtLacyPc
	OM7a9uHrzKuVMMjh2MLST0x14AY05swHDRfzFF/VqRfjtGR/3rYT8JXp1eI8XdvyAj3g3veM3GNyS
	0eyaDEYw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8f5W-00000005Cm4-1ACl;
	Tue, 14 Oct 2025 13:29:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D22A4010B;
	Tue, 14 Oct 2025 13:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B5AC4CEE7;
	Tue, 14 Oct 2025 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760448550;
	bh=yrU/wVuLdmgKHx45LWjxxFJNQ2uyG8EC9y0uqLydue4=;
	h=From:Date:Subject:To:Cc:From;
	b=hRvpWAu13U8ZgPlwKZJ1kACJFoY1FOfAtWwgaAO5STTY4NbZUniTde/HKDDIoOpFp
	 rNB9oIhVaM+i25hdQssI1VR44PBfyXuTQ6ws/6DzvnOVNi0IexyI8zttZI8gWyiIOa
	 /khIwGPWg5R4+woqcJUK9HJWUY8cOO6k0rGEdX0FIPoiXaI/qsdOPzF3RohbL7hQee
	 Goa4njmgj4mJ2R/DdrQ3NcsfFKSR3LG6/8aG3ou+UUIZ2ne6F0/IgbvTRNZRhR0zgo
	 lwbKQ4XA/aZmpt4FjPmzYKlKO92d3dtGvkj82CYKDVDcPfgeGMee9u4/BBe/iMShcG
	 dzL2D/tdP9f2Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 14 Oct 2025 15:28:53 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Remove useless check in
 mt7996_msdu_page_get_from_cache()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-mt7996_msdu_page_get_from_cache-remove-null-ptr-check-v1-1-fbeb7881e192@kernel.org>
X-B4-Tracking: v=1; b=H4sIABRQ7mgC/x2NSwrDIBQArxJc94FKY2qvUoqIeTHS+OFpQiHk7
 pUuZxYzJ6tIASt7DicjPEINOXUQt4G51SaPEObOTHI5Ci7uENuktTKxzrsp1qPx2MxCORpn3Yp
 AGPOBkPZtg9IIunMfeOiRc2Unh0qy3i6ES/j+v6/3df0A4F66gIcAAAA=
X-Change-ID: 20251014-mt7996_msdu_page_get_from_cache-remove-null-ptr-check-895006a7ce62
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rex Lu <rex.lu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_142914_715251_CB6B15A3 
X-CRM114-Status: UNSURE (   9.35  )
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

Get rid of useless null-pointer check in mt7996_msdu_page_get_from_cache
since we have already verfied the list is not empty.

Fixes: b1e58e137b616 ("wifi: mt76: mt7996: Introduce RRO MSDU callbacks")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202510100155.MS0IXhzm-lkp@intel.com/
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 9501def3e0e3e20132fdbcfe0b1f489694afdc5f..284f2eea71e5bf0a34c7fe84084d998164a31a05 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1681,8 +1681,7 @@ mt7996_msdu_page_get_from_cache(struct mt7996_dev *dev)
 	if (!list_empty(&dev->wed_rro.page_cache)) {
 		p = list_first_entry(&dev->wed_rro.page_cache,
 				     struct mt7996_msdu_page, list);
-		if (p)
-			list_del(&p->list);
+		list_del(&p->list);
 	}
 
 	spin_unlock(&dev->wed_rro.lock);

---
base-commit: 94aced6ed9e2630bae0b5631e384a5302c4b6783
change-id: 20251014-mt7996_msdu_page_get_from_cache-remove-null-ptr-check-895006a7ce62

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


