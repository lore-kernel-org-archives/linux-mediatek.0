Return-Path: <SRS0=A4vX=IL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831EEC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 23:38:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5692F64EC6
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 23:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5692F64EC6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T+bFBLSGn7ewxcRZjouwew/9pjl1Wwpw+Y1ZRFZ00t8=; b=h9CX4dqTBsoGTA9YgrR+EyHWxG
	2yfMTiuMkw1IIRNqMnP0mfURFN0LjiqJmAod6v/MAtIHptd1eAVQxZbEHLBnl0CLPJ+bBAlUNQKKD
	kAH4UIB8D/ivMvt7AQmPpFqZeoui/+Sd9pxP5oi6K+JVjpAH+SPLo865Quc06Pw7UUagTLKWoO7zX
	RHhku07pEAQVoLKrjjLGABGBJrk5Xlw3z5KII+qmMjW+6RXg9w7a4FGpabV89rAPR7mffnaQEHCHU
	/fCjGWJqNv+KUTnwB5UfJYfWSWJLrwuGMLG41RP44n3pOW3k4pHtbAK261yviYmYw7GYcvZZVWsBp
	0Vgbssvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLDpK-00DiyW-Vl; Sat, 13 Mar 2021 23:37:47 +0000
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLDpG-00DiyC-VA
 for linux-mediatek@lists.infradead.org; Sat, 13 Mar 2021 23:37:45 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id 82D3A4612BF;
 Sun, 14 Mar 2021 01:37:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1615678660; bh=pvIBmRAw8d1VUyi9V/SeXV0tyYF89ThqAif8y8U7n3A=;
 h=Date:From:To:Cc:Subject;
 b=zht9rfBCY5gNRpSipU3V0FSXLxWa2evvyzeFaQYGj20zBl8q126KGE8Vrv7CKigZA
 KQJ8cJUGUlGFXFTiTPCzVYAOPk/nbvb/0ugBjUbINxD8ESdqNgS6cgmi+aTgv9Cvba
 UvbfOsnhuz9mln05OJV4DRlSemsfPO4S2/oqpyzo=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 5E8614612B2;
 Sun, 14 Mar 2021 01:37:40 +0200 (EET)
Received: from pc (unknown [185.176.222.57])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id DF06F1BE0154;
 Sun, 14 Mar 2021 01:37:39 +0200 (EET)
Date: Sun, 14 Mar 2021 02:37:35 +0300
From: Boris Lysov <arzamas-16@mail.ee>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] arm: mediatek: dts: activate SMP for mt6589
Message-ID: <20210314023735.052d2d35@pc>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 6N1mkJY3ejOlglu/QnzYGwQ1rTRMW/GWher6j11F7wj3TUiYHDwAURW+m25+SXi8vSM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_233743_192334_3B6D14D1 
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

This simple patch activates SMP for mt6589 by adding the missing
"enable-method" property. After applying this patch kernel log
indicates all cores are brought up:

[    0.070122] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.071652] Setting up static identity map for 0x80100000 - 0x80100054
[    0.072711] rcu: Hierarchical SRCU implementation.
[    0.073853] smp: Bringing up secondary CPUs ...
[    0.133675] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.193675] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.253675] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.253818] smp: Brought up 1 node, 4 CPUs
[    0.256930] SMP: Total of 4 processors activated (7982.28 BogoMIPS).
[    0.257855] CPU: All CPU(s) started in SVC mode.

Before this change CPU cores 1-3 didn't start and the following lines
were in kernel log:

[    0.070126] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.071640] Setting up static identity map for 0x80100000 - 0x80100054
[    0.072706] rcu: Hierarchical SRCU implementation.
[    0.073850] smp: Bringing up secondary CPUs ...
[    0.076052] smp: Brought up 1 node, 1 CPU
[    0.076678] SMP: Total of 1 processors activated (2000.48 BogoMIPS).
[    0.077603] CPU: All CPU(s) started in SVC mode.

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 arch/arm/boot/dts/mt6589.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mt6589.dtsi
b/arch/arm/boot/dts/mt6589.dtsi index f3ccb70c0779..70df00a7bb26 100644
--- a/arch/arm/boot/dts/mt6589.dtsi
+++ b/arch/arm/boot/dts/mt6589.dtsi
@@ -17,6 +17,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "mediatek,mt6589-smp";
 
 		cpu@0 {
 			device_type = "cpu";
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
