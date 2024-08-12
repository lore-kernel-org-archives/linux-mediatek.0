Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F9BC52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pajeKwVmCHYKYe6e64KzbpO2jnBiZASKVeRA+7OwpMg=; b=fznX4WyhhVE6hm1nsxILONQZvB
	zw4/1DYg73v2bq4lu+fjCzpxFM0TSDOKGyJqgFGEWR0jsvGCrgdwkcet0MKRq/+dy7bAx30ZJ4g45
	ja3nUZsEkhhuGdG3wtr9VkyO+5nW1WDoST3pwKWEtXX8O7TqXtHH8H/8PLyRrKumhKe+I8CiYs+0E
	VNp+MX10LKUn7LFJyZag1WsVkTPYs4z1wAKwN12l8QAXqrt9q7qoiXMHmzS3dicHznYctH+sowX/s
	anZE61pJbpk2dTpaZ9FIYoShLivpffsv7ir0Wm4K/p5yJIdBN51eKnxsPmd2EP24jADAp11L32/c8
	WgIoHIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdSYr-000000004bE-0n7E;
	Mon, 12 Aug 2024 10:46:01 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdSYn-000000004Zv-2mXl
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Aug 2024 10:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1723459545; x=1724064345; i=spasswolf@web.de;
	bh=pajeKwVmCHYKYe6e64KzbpO2jnBiZASKVeRA+7OwpMg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M7LF/bXroAcKL/vRSBlThceY6U9JzbBnJxYqdqiFn0BfDB743jJaEuw4U3kUDfyO
	 07bImy8VRXNH/7f8c0pisDNAgeCAhkrR2vCv3ZkeqOAM6DT2cB2kiV5M82XMxlswh
	 jaBrdwrp8QvRX51XfTp/9lBKHhWzpryYWPAeA9vDMsFe2gz4+WUAEJCZntL5ygjzJ
	 ANxJktnXuyw/l5Zj+RGxDaMWlag5gxMjKD1wRkD4d0P/HvPjfF9KmcwwVec1+CHJV
	 SGRqt1p81Y3ZCJSGBcNirKTU54OppZn0jPkQvBJvj0zjzr6+BTKilxm1801w2JyXd
	 wY8vTJ3D7KI2vjknBA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MaHWx-1siaoW38Uf-00QegC; Mon, 12 Aug 2024 12:45:45 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: linux-wireless@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
	Kalle Valo <kvalo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@kernel.org>,
	deren.wu@mediatek.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	mingyen.hsieh@mediatek.com,
	sean.wang@mediatek.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: mt76: mt7921: fix NULL pointer access in mt7921_ipv6_addr_change
Date: Mon, 12 Aug 2024 12:45:41 +0200
Message-ID: <20240812104542.80760-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0A98Q129rSHz9r1PkU50MFrjDmOd5fuQgJPBQxv2kkwsh2jXG6U
 kQ4eb2XnT4QUzVoMRdQVygSxjVtn0gNW8lAOmQheDUoYS+te3sR6XaQV3DdnLJ+9w30zk08
 aPrbU/JgembuNxGkusGpeVduVLi1kW6L08FnKoVzbVEoEthR0IChXGxB0LyRZwyYcZw6xXw
 WIBrNHbgL2TRrZbJuUfvA==
UI-OutboundReport: notjunk:1;M01:P0:IbSThmmD9cw=;YN1Mb4K1Y4uVZEne60oy5XSxeoW
 99UcTjTJM/hIdCvraU81zi53xwLLK0wNdFjSXCnpXHBzDdK2khVExHU9exyMMAZcIedd4iper
 W8QgJ80d0vw5SiAXDowB6FzkJzXfLUCLacynqU2gDOuqbiUgi7lzvV5uGOY23fikodWsSVTLw
 rKytF3b19f0JpHrPNnTn1yAdg6i07yvm+dGaj5khtc3ikpZ4mzw3tcDbxfu/tUa4A5rOg4zBb
 mWQDFlpRKQ9euNddFCbpp/DtB7QwDKp2y88Sn72QnU0sUBonbJn30zEVxt8uSRZ2F2FBaPiwO
 wcZBP/IlUErb7asfRoGd6eL1kwlfiMHqvK4gwMiLw6on8XVbxUY2jbek20luvzMy4WG3UmrCe
 wBGXBavAg2Nf5kLDxhp8WUrYJTOj9lnG2LOnhhs4z6iisnRDTIgJ20N8YDQLo3w1ekZul9g6n
 l+eQtyFtKz3xwI/dR+cV3x/ftQQgUOy7WVqfXHnLPKOjHJ57uKnHTVBUBHYRaMPh813mF6TNv
 ObNtpSbNaA+cutMmDw869MSJytLJIUbcmvPZVGjhnKr0My8Eh6V84Eu5+EP15fU01nQwkWdZk
 4/rlQQMFxq3o7lqjlBAWhjEe5WS+DFBc/BOJyXTLU/bN4vXnNKd1NurvpkWvo2YHYBCiu2e9G
 JnsFFfs9uTfDC08IhV7Sdbc+W6c+i4uLrs4YwCpFxT6qJIH1/w6P0V29Xe1OGLtVuna9ZrN1Q
 /Cac5dev3db1NzVf99hoqaTfqWsk9TIeWWhyunN8Am3KT5yWDbCFy6+ng4h9joIw7zi6sWpF4
 wQp2OiXHGLJhomi5K+Wy9/Xw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_034558_025154_99C69B0F 
X-CRM114-Status: GOOD (  10.04  )
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

When disabling wifi mt7921_ipv6_addr_change() is called as a notifier.
At this point mvif->phy is already NULL so we cannot use it here.

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
=2D--
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/main.c
index 1bab93d049df..23b228804289 100644
=2D-- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1183,7 +1183,7 @@ static void mt7921_ipv6_addr_change(struct ieee80211=
_hw *hw,
 				    struct inet6_dev *idev)
 {
 	struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_dev *dev =3D mvif->phy->dev;
+	struct mt792x_dev *dev =3D mt792x_hw_dev(hw);
 	struct inet6_ifaddr *ifa;
 	struct in6_addr ns_addrs[IEEE80211_BSS_ARP_ADDR_LIST_LEN];
 	struct sk_buff *skb;
=2D-
2.45.2

As the solution comes from Felix Fietkau I put in a Signed-off-by for
him in the commit message. I hope this is ok.

Bert Karwatzki


