Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAB9C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 12:07:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0840C60F00
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 12:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0840C60F00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oNQJuqeGLiVNuqNmgdfsNxP5Qv52/VSX+cKARQP9SE=; b=GXBanW/OOPIQDy
	44C9hc3jRbLONUBQ1OR/qPMm5lAvT6rrkM36HNgdvQq8cUiFdRXB8aFvRL9Rxo+EpwkbHV8Iqxu63
	ABFC5r+ABGqPK7apubBE1ZNQWgap7UhkzHcFpyn7tQhIPzX1bmgq8E6TJQodoZGN+lEkEjgCmfbHT
	LqKWaICD48p02bpbVYuQZFLXKd5LKp8/yc5zxO4ZWyJPHp4R5EQAz/ZPyKitkVxktGrVf53zt/7jf
	QTD0l6/g31cnDDonOszX6Wm8KHBXO3zTWagvWjRqqO5z4gaKhtGqPxGb07gOwB1SZ9Ov3LMEOiIGQ
	QOdwQyoect8BuncXhbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9RIB-008Uvf-W3; Fri, 30 Jul 2021 12:07:08 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9RI5-008Utz-Pl; Fri, 30 Jul 2021 12:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627646799;
 bh=FOQ3kf7nC91N2pAcyJy+ukr7C27FR3nQ3DekDqj8uEI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SlQlS2e/5cr5IQ2fa8QR7A4b+mf+myEnxGLmMZJMRsxc7C6QbaN6sxtPbeJ9DKjcQ
 KTKVbDH/GfqMcD9V/ooYsKa4KA0Vbhdx9noBM6+LD71cRA+6UXJPVBriHDvNN0DmKI
 yyEtUDQVHUJ5U48CFjKqPjhfuocD8p842IRX/jRs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.200] ([217.61.152.200]) by web-mail.gmx.net
 (3c-app-gmx-bs05.server.lan [172.19.170.54]) (via HTTP); Fri, 30 Jul 2021
 14:06:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-166e2707-ca11-4d84-803f-43732de72e2b-1627646799181@3c-app-gmx-bs05>
From: Frank Wunderlich <frank-w@public-files.de>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel
 <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Evan Green <evgreen@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>, Will
 Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, yong.wu@mediatek.com,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, Matthias
 Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com, acourbot@chromium.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Eizan
 Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com
Subject: Aw: [PATCH v7 00/12] Clean up "mediatek,larb"
Date: Fri, 30 Jul 2021 14:06:39 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Ju8UvQ9aQQ211RZizAddcu/LK0Fbm40eWbtOgPOujam+ZiApQCh89ygqJKUfghzFx3Em+
 2gYhue+9Tw2MD6gxpnG7k1n49GwJ96zbYr1t0dKh0XNlowbze19Bdjyh25AQrFqjwwEBD5zmvd83
 mhgHUGlB8Ek/ujixS17y/tmLUcS6lj6J3JAEdYwCmEJOBtpSoiNFM3NNFkq6C1Kia0XV7mTPl8vn
 vIhfuilUuastgrBdB7uKylodyw+GkvQKNLmACZ0chLIvF4sg96dcRXaudTEuldb+NRZCXQ2lp6Fe
 X4=
X-UI-Out-Filterresults: notjunk:1;V03:K0:A1JU1CJi+pQ=:iWEaNtvfYekBmQdj4p6NXW
 UCTDP5kHinGH0vNnqhIZRPdE39sbNxHrVO/p9Q24RiiXHAyeUJq8L+93SGGOg4tPCbdTxfiKV
 QNPWJF70uYhxy7mgbZlvInK5n6x9M1/K1gNBf3lccsTjt0t4n7WcI4NKCruv73h/djU0LVXne
 u+0SY70AaL3ley93WPeezkfjb8VSz88R2HcvX9McS6Od/X98F06af4B/GbOm1djPXU1SXfpKo
 KUIyySiyy6TRpyKROR56bXkdpixhsjixdqQCnx1NOPihzse8xL39ftyMRCoEojHVSiXTDrgV0
 wYLpEHQ3csdA1t3aEvcUXJrFC/iilayKyvXe9HrWP5LjD5hZlvX++dSXMC2bS+sjJ+eOU4CkG
 q5M0m7y1SLgWSah28VRg6keBpjwkiusGHwSeFrJBy9o+wBg7RZq2fwYkcq/79Mq9yixMZOoR6
 nhiymGdyIERrtxqU6M7A2syxtcjcXbLCmxadopF91xMgIPyRJLQmESawqxIuX/JKCRU8WnICX
 yaVOTYoq5ZT+yOg7fTBack7iK2KxkkNeuDn9dy/MhyU31tAOibr7pfGIyuHmU+MKjqOSn8sD2
 yJIhbYA42sZeUNd4oYzJMShnDHIkHHbMBy5uAgWrxznbOECqrG5/wUBFgzPZW93EAvMmi7d6r
 lk0vBXlmisYQWoMoO9WVZCx1Jf118gMwBc5emj7E35X/YicRI/KoVpTwSfgLVwFIUf/8E1yYK
 NxOYhTRYoQfJZSsRL/ySFrn1KZ2Wx9AntKI1JV3pQblcuhCCvu9yfmLU+oxe/6k6j32YmVzRy
 sVTI6932Tsaqfe0g/gNwzm3RroETnuenND43TwPhPdSsqPyflo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_050702_154259_F3BEA92C 
X-CRM114-Status: UNSURE (   6.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Full Series tested on BPI-R2/MT7623

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
