Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6844C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 14:47:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 786D8611EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 14:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 786D8611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Uxh3gT6CHvNo+jrpau5HXsGV+RXAToH8fhJjA9r/Kk=; b=dPHHgg4873SHEIfRMa2bP/Gyik
	Et1AvKWt5XZUMN/+RVx2b+4WjY38Vt2BH+DSjM8rbtvrshxzJ2RN6Nx/Ze4YDLeqEzUeuG/+FIVDj
	HU0PLHu/c7HnmBTptM+Snx5MGmuN9PwaiuyqSiMVav168t3U6EaTHQs0uIDg75ZVvo0Sp67SCLYi3
	gaTnUTh7+ZqdgcW0g6sGoziAeEfhGCfYMNmkeclx0BqKG2x7eePRJea0L+9QJqxeDiNR5vl8eFms1
	9qe1+mTsaD3yCHLgk3OEkDKg+xPW876jjZ+0Yh2ZEtCsnBgYNO3vrY7eLdudpz6e4plg2sK8ZGr7j
	RloerYwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWgnU-00CvlH-Ol; Wed, 14 Apr 2021 14:47:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgn7-00CvhQ-Mf; Wed, 14 Apr 2021 14:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Yji6sV7so1uK8YW4pDnLQwnZ3/iY+69sxjTVpBScdcY=; b=dbx4N6cpXn9vW5aBAJ6ed4G3+F
 wFMX9fDcVslDKhKkvLZDjuIIwcT+2Hy1wS2FcKS4Wbw9m+S2SDlkapKLh2FJ3GCaT5JrWV8tzMl/c
 2yQZyeOSenHFc09dI10i6unDHqMVUgAfrWMZfRwVhB6OLoPhA3bcMnE/fDiE1EAvc59/kDRRb8HBi
 vL57YIxXWTJOLi/5oOx1tF9UahtnFdkgJWRRLG9oS+fxfe92LNcd92jOiFVYklThZ0cDzU+ton2tl
 ohv4UrwjB1vVp2aCOY2i0xifCHBpgg4G2htnMWIbY+iI/nAcVhSc2q31agq08FdtPeImyjE+A2Cmd
 VaqsCxag==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgn5-007q6P-BC; Wed, 14 Apr 2021 14:46:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC694610FC;
 Wed, 14 Apr 2021 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618411609;
 bh=mV0aVkgGwraofiwbxZzUURU+kqmVHxLHqfUqgDMGMTY=;
 h=From:To:Cc:Subject:Date:From;
 b=XKly5Hl5D4cNiuuozFA63HKdiJ+3SQ77WQpLjIMuU6fuRjjnYg0Zu5WfpcJwnkta9
 wd1gDYbvDKEcPIpResLcNLsrfTV3LvVbc5pDlkZUY/jCyI98dmLRovyNki3Tmcl5Ik
 XWjzwBUd2iLOuEmKHD9gJIhi85PbDgkL1m5drmy2jfhITZangHna7gnIe/QvkCcs8h
 2xheWYaJYlPsf+Y2Hrp7KufwqKDfv9zt/PJzBbmm5o+5LTr3VC4b1WMEyvUcX5LXNK
 ngt9g3LStBpXkG5Dw/ahVzPlLdgJz5+aq2+/fXaClpo2wAh4nXi3VVPe8sTnyVaVCn
 ez2ooJtEyXfjg==
From: matthias.bgg@kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Fabien Parent <fparent@baylibre.com>
Cc: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: mt8183-pumpkin: fix dtbs_check warning
Date: Wed, 14 Apr 2021 16:46:40 +0200
Message-Id: <20210414144643.17435-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_074651_426863_B5C12E37 
X-CRM114-Status: UNSURE (   9.37  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Fix unit names to make dtbs_check happy.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index eb6e595c2975..0aff5eb52e88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -32,7 +32,7 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		scp_mem_reserved: scp_mem_region {
+		scp_mem_reserved: scp_mem_region@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
 			no-map;
@@ -55,7 +55,7 @@ led-green {
 		};
 	};
 
-	ntc@0 {
+	ntc {
 		compatible = "murata,ncp03wf104";
 		pullup-uv = <1800000>;
 		pullup-ohm = <390000>;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
