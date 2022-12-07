Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F786C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 16:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2gZxVDRSgNhczwL0jmLPqk9fVEXg0i7s4V4i2FAUxYc=; b=XSNynHXMXXe2T5yrtx9sc//Thl
	PjII5AJ0LSFa/r3c6NF3hp7pBJr2wFqxls0S3FatqSZL9mI81HjKCw+hUYLIL//nVTlGmWHNBAA4p
	FFwPugiRRjbsGrADPQoLMUGZbG7ETee0twuXJGDgqQWfsliljhAftLE/QkIVeTXHUwCyV/TcLjJ7x
	QaD6h+Ga+Fnzg99g9V8QW8jn33H0tXfzkXJqiccMpzV5phn8kmew8djk4m3uyuhlJZ2e5lvriFKwE
	1z5s4m0cwn7/rtWxG8s464P7WTz3TwEW1XeQUeVdQuAOvDAXd1tbbZJEhP617xyHFQIw/nGzjgsk6
	PSLvaijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wtv-006LB3-2V; Wed, 07 Dec 2022 16:04:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wts-006L7o-Cn
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 16:04:01 +0000
X-UUID: fcda6509be3742f68469068646785425-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2gZxVDRSgNhczwL0jmLPqk9fVEXg0i7s4V4i2FAUxYc=;
	b=s/j/6uUxGm8Kjuo2PKhPSS4oYMJqGqOvEPZ5mwsrRliBKnoykcqlhvXR4Kkbz3a8zh4oNSDtT0FSF3re0Zi3oXCr/8vJ6FlrFgSw3BZoTElAOj+4lrkRS3XN81k06n/9USJu2PBB6rYFKClHzwM0GTh8O5kTKT3nLpujxpfE0yI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:bf905fbb-0bca-4276-8e36-f13328b2bedf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:9c759924-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fcda6509be3742f68469068646785425-20221207
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 761319604; Wed, 07 Dec 2022 09:03:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Dec 2022 00:03:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Dec 2022 00:03:17 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2] wifi: mt76: fix coverity uninit_use_in_call in mt76_connac2_reverse_frag0_hdr_trans()
Date: Thu, 8 Dec 2022 00:03:10 +0800
Message-ID: <bde6335dde0a79d2c2b43323167fd5c2beb45645.1670427543.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_080400_611406_1DC304FA 
X-CRM114-Status: UNSURE (   9.94  )
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

The default case for frame_contorl is invalid. We should always
assign addr3 of this frame properly.

Coverity error message:
if (ieee80211_has_a4(hdr.frame_control))
(19) Event uninit_use_in_call:	Using uninitialized value "hdr".
Field "hdr.addr3" is uninitialized when calling "memcpy".
	memcpy(skb_push(skb, sizeof(hdr)), &hdr, sizeof(hdr));
else
	memcpy(skb_push(skb, sizeof(hdr) - 6), &hdr, sizeof(hdr) - 6);

Fixes: 0880d40871d1 ("mt76: connac: move mt76_connac2_reverse_frag0_hdr_trans in mt76-connac module")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
v2 : add Fixes tag
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index fd60123fb284..c8d0c84e688b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -930,7 +930,7 @@ int mt76_connac2_reverse_frag0_hdr_trans(struct ieee80211_vif *vif,
 		ether_addr_copy(hdr.addr4, eth_hdr->h_source);
 		break;
 	default:
-		break;
+		return -EINVAL;
 	}
 
 	skb_pull(skb, hdr_offset + sizeof(struct ethhdr) - 2);
-- 
2.18.0


