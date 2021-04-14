Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF39C43462
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 14:48:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6788611EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 14:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6788611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V7iJxLINs6MVWkITdRWiuBewRt5OBKl+RAmoIB02Wb4=; b=HGIstmaN/BrHiv2UmQ992zSei
	w39/lhQnYRoJND9skF/HXChbDObKLx9EGUh/Iuuij99wNHCUSas/JSHX/F456BJ20tnVwY4+Euo2M
	Ev5TK/E2AkLvf0f/93QZ3ZnlqCAuSpRG9KQgTdmFJiOng/R7EsKJtq1uErfmNmy6nfwKs2GgbVfq8
	avqR0RAi6/Jyg3Wsfo+KHR7Y6194nIiw3o17jGqq5OBR47JIOJoknPxD8/axiDcELEq+Pn59ZsFJw
	Qk/U8tbCNePnz5cD+zgHhyXdp913Yl6Dsjd13FOwRwueHeCBgxUliOiJye2uXvXNmXGox74iqQ5V1
	m4u1liZkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWgoK-00Cvwe-2t; Wed, 14 Apr 2021 14:48:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgnA-00CviL-S0; Wed, 14 Apr 2021 14:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=nPKbKrd0t42PLAUUQ03RGse+8kpIfzbSn6CIW355Zxc=; b=K1mkHdGt4cRGiNyQbt6OGSIxbn
 HXq7zZ5CXmJn33vOO+ltFzx1GS8Z+YonXL9gwzqm6QRrooy43uE9d6O+xcFR0AS+gVJim8KO3o1mz
 k5rUYly734jN5Wx6By8fOScksNfj0zeKenE5wdvznxG3TNK5rxKdG14StUPZBbuCMAJicDXQzp4n8
 VmWgtXegOX6wszbzQuVjiDsSmNM13ilNY79QkVQVuRokcmgRE9YvpAcuM6CSg7yibUpzTnZV2lNab
 JucRCFM9+IA/7GszA0+RFUDEkb2Mf8BBCQ9T/SbqTbsCP8sPmkON8LayqJJyOS/upt9nwJGwUeUGX
 fLKUGbCw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgn8-007q7O-ED; Wed, 14 Apr 2021 14:46:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 507E061155;
 Wed, 14 Apr 2021 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618411614;
 bh=rs15LF3rKUgaMNwrFb8ZdV4uSTpiASPmNfBhf2NkQ8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BlWgvxSQ2ZbOX8yA6z647CrPNNwHdGVIuyKWyZAmtLTGxcIfIADJz56cYeUX8yGPt
 UaEwZ384GIUt45h9yTeGAJ9LCbrUnhSyzprk6G6IAgXjbxv/gr1rOt7repANA3QTUO
 TYibzSlsDiR4I8QWliFjqdpDecZP8/yvHFn/fAXfdhLjRpAerflaNUloy9YkVOeMI5
 qje6uKz0HDdsCddm6t+E2x7DET6ZMQ80eVDkVJN+CFhlpM2kBHvCLEVz4AJgx30n5P
 0mQ5/XmpUHKnc9DYaddEvFdt6IHBaWlQb+AuaiTo9FyUara0+Lz5Ba0dqB/GejEixP
 geBE7lYrdoXkw==
From: matthias.bgg@kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Fabien Parent <fparent@baylibre.com>
Cc: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: mt8183-kukui: fix dtbs_check warnings
Date: Wed, 14 Apr 2021 16:46:42 +0200
Message-Id: <20210414144643.17435-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414144643.17435-1-matthias.bgg@kernel.org>
References: <20210414144643.17435-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_074654_529290_CB1D8CA8 
X-CRM114-Status: GOOD (  10.59  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

The dsi children don't have any reg property, so we don't need address and
size cells. This makes dtbs_check happy.

CC: Hsin-Yi Wang <hsinyi@chromium.org>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..f4dca6a33168 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -251,8 +251,7 @@ &cpu7 {
 
 &dsi0 {
 	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
+
 	panel: panel@0 {
 		/* compatible will be set in board dts */
 		reg = <0>;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
