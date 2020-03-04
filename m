Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFC2C3F2CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 11:07:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ECD720705
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 11:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r8TEiEXL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iL1xXm9c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ECD720705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIPU0mP0xh+/zRmzcEIKQqZKC6ySRMFGohRrOr1bsuc=; b=r8TEiEXLdlD4o1
	H/IsYk8CNitgUcZKTxYgQwtt4dNbyrQEHAZ1Vwbbaq70JRq4+GpJKqM8baTs0t1WSeaiRmBo9YsLI
	xWyIE+C8tjvdIetHdkSxjyiFl0DuSqMpRIc9KHeSJZRKEtbCKe4EFq9dBeoMFvccKoh0FzhO48NNc
	xEeR8Hu+jKEquy/+GO6y/r8Efaz8M4bYY2g3sSokmCD8fiMy25m9tVLvvqV9XnE8t8LkYCuMlyZsT
	4ZbF8BQEOnqiw6B8o0WkEgywqnxNIgVam0jPGCYZVnSam6vGOVIzQqFiA/ycBo7e/FaP1jjf1JaDH
	JO0y7vHEWh27Dpa/leSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9Rrt-0001IC-Fb; Wed, 04 Mar 2020 11:07:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9RrD-0000Ri-H8; Wed, 04 Mar 2020 11:06:33 +0000
X-UUID: a0b740cc388640b1933cfee2717cf4be-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=THhbz1tL3bdIddSTgCLGB9wEcIKzP7y2s4qGL9MX0uI=; 
 b=iL1xXm9cedEacKajITcE/TndPEmJrwudrCU42VrU7NmynGvgoOAbbghnnMmG4d/fmhaAl3yhg6xiWuqdQQ5KIOu0OAiXK9Gy1OF58FLlSUt1+nQm+rgfbIRfonOSrhwz/RM779ydtd+epO2NwrOIMNJ/9ZuocrqdvpdiT255hjI=;
X-UUID: a0b740cc388640b1933cfee2717cf4be-20200304
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 410742253; Wed, 04 Mar 2020 03:06:21 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 03:07:38 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 19:05:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 4 Mar 2020 19:06:17 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [v3,1/2] dt-bindings: pwm: Update bindings for MT7629 SoC
Date: Wed, 4 Mar 2020 19:06:12 +0800
Message-ID: <1583319973-20694-2-git-send-email-sam.shih@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583319973-20694-1-git-send-email-sam.shih@mediatek.com>
References: <1583319973-20694-1-git-send-email-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_030631_597398_94014A5C 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sam
 Shih <sam.shih@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This updates bindings for MT7629 pwm controller.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
index 95536d83c5f2..29adff59c479 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
@@ -19,10 +19,15 @@ Required properties:
    - "pwm1-8": the eight per PWM clocks for mt2712
    - "pwm1-6": the six per PWM clocks for mt7622
    - "pwm1-5": the five per PWM clocks for mt7623
+   - "pwm1"  : the PWM1 clock for mt7629
  - pinctrl-names: Must contain a "default" entry.
  - pinctrl-0: One property must exist for each entry in pinctrl-names.
    See pinctrl/pinctrl-bindings.txt for details of the property values.
 
+Optional properties:
+- assigned-clocks: Reference to the PWM clock entries.
+- assigned-clock-parents: The phandle of the parent clock of PWM clock.
+
 Example:
 	pwm0: pwm@11006000 {
 		compatible = "mediatek,mt7623-pwm";
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
