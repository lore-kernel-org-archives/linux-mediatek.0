Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55553C7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=83DCRrtSJq8aIhSri57P8Nkhk9kMsmJ33d/Kt/QPqOM=; b=uI1oP2tlVnR8jEHEH7rvkvlfCX
	rDrORQZ5dGBhHXlOt9G1QpQb15moxi47z73/2LLi8EaYBZ+tUcE2HaPTR5gvd3R+KDkhDdXCvM+8a
	SnP3BjIPDVtvowifQ4FvYazRjygmEQqlDUAo0+ObumDQ/2YIg44BKYW929hT5abgECA23wSvvTROw
	0RoyaNSKNBBSqhUJghYe1fD1ieMxM6C6N0roPXzzRNH1+yzP9fRqKithHYogf/n43/9MK/d6tqv0e
	DaF9JM4bRq9K2AaD/1dj1IkFmkhdY+DvnUwrayjphxD3sXoNQhDY9thhJ4pwiF452Ko9nYMi+lbAY
	Aj0JRc9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQeq-007cDb-2P;
	Thu, 06 Apr 2023 14:32:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQeG-007ba9-2P;
	Thu, 06 Apr 2023 14:31:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF201648A2;
	Thu,  6 Apr 2023 14:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A63C4339C;
	Thu,  6 Apr 2023 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680791494;
	bh=fS1epBKc6/LIuAlKccrK1+yZRgDIBGUB741ssPvpdOQ=;
	h=Date:From:To:Cc:Subject:From;
	b=SjiLsj18bWuofLs6hhWeLC/lLw/a3iNtZ9wlEueFZEmCpkNlYBNfrW2g/JfGJHGTi
	 vet9hVGN3GV90yUx+3gAa/XNftBN0j39XOMRCSz2X9AIryTOjRKZkau8WazkdAVbKe
	 7jo/OiVuhS8JxGUofx57NN8frKBM2tj4fn33MN5OokPIYjhPFpYfjxIVlje0uFnNYq
	 o+keawWHSe/sdTrcyzxIyVKkwcke3vee+fUSrJSER8RnbtzoGn6X9DOk/pfIaR/jlM
	 ZoF5CIu1w4YilJ9YwXKoTj0fnpznmfu4LCYmI1CVH3mBWnGcBheecAhLYWYKRmVcUM
	 1CooyEc8vqBvg==
Date: Thu, 6 Apr 2023 08:32:12 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: Replace zero-length array with
 flexible-array member
Message-ID: <ZC7X7KCb+JEkPe5D@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_073136_845720_9E5EBB05 
X-CRM114-Status: GOOD (  11.70  )
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

Zero-length arrays are deprecated [1] and have to be replaced by C99
flexible-array members.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE routines
on memcpy() and help to make progress towards globally enabling
-fstrict-flex-arrays=3 [2]

Link: https://github.com/KSPP/linux/issues/78 [1]
Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index a5e6ee4daf92..9bf4b4199ee3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -127,7 +127,7 @@ struct mt76_connac2_mcu_rxd {
 	u8 rsv1[2];
 	u8 s2d_index;
 
-	u8 tlv[0];
+	u8 tlv[];
 };
 
 struct mt76_connac2_patch_hdr {
-- 
2.34.1


