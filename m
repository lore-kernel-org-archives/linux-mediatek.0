Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BC9C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:40:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4BA227BF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB4BA227BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PejLPuK362A3vyAfvqQxPXEvTTUE2cIM0q5qt6OPV8A=; b=jmZzKvC+heafDUo3tyosEL693
	g6/oTudve8qjMsvAkRygwHAywpN7GU0qpjDcia1rAmPMgM4Ou9SJ/UvmSYNFeshjewNaVQ2I5u/82
	l7FDMLoTSHKATSLA6RRSx922xs1biTx7WmzDQf02v76p5NGbShiTvzJhZB9NWnhrX0R9uGAazmXla
	SgxoBWDgcIjlPRHrkljLH6aqHEj4RJirmp5NMO1ZnMR031qAVbIGZIfRrzKUptxrh2d2VWVmd4/iW
	EW5MSQogUMAcJDJm+km75DaZjfWMZ2RyYube+s6iz7HnQOOcFosQFybNT5NNnykHC6PYoXG1W2ZR9
	V1qgUaf0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7ZV-0007t7-Ux; Fri, 04 Dec 2020 09:40:13 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7ZG-0007mC-1a; Fri, 04 Dec 2020 09:40:00 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnSMx3MYTz15XW8;
 Fri,  4 Dec 2020 17:39:25 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 17:39:47 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Karol Gugala
 <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Pawel Czarnecki
 <pczarnecki@internships.antmicro.com>, Stafford Horne <shorne@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media <linux-media@vger.kernel.org>, linux-serial
 <linux-serial@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, devicetree
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] dt-bindings: mfd: correct the node name of the panel led
Date: Fri, 4 Dec 2020 17:38:13 +0800
Message-ID: <20201204093813.1275-6-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201204093813.1275-1-thunder.leizhen@huawei.com>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_043958_391035_ECBA5455 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

According to the definition in leds-pwm.yaml, the node name of each led
must match the regular expression "^led(-[0-9a-f]+)?$". "led" or "led-"
followed by a decimal or hexadecimal ID number.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/mfd/iqs62x.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
index 541b06d80e7337a..044cd7542c2bcf5 100644
--- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
+++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
@@ -93,7 +93,7 @@ examples:
     pwmleds {
             compatible = "pwm-leds";
 
-            panel {
+            led-1 {
                     pwms = <&iqs620a_pwm 0 1000000>;
                     max-brightness = <255>;
             };
-- 
1.8.3



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
