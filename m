Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5F2C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 14:48:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE856117A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 14:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE856117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R9ZDLkkLuMuEKMohCTxbvb8qvFe4mfSXCZk748MtSlg=; b=J7Mgd1TzICr+hS19EJP0qA4ZJ
	ebNzK6k/2freTQwreojz40qnrpPsYJGcIiu+oA14DeFDl3nZmSPDnB2nCdPXGEDDsXAivc7G84v0D
	rHOn34mrfO+oNwPLbfaQRS0pYeQSyA4CXvs2SofAwrqJIukTLSx8LLPMUULhKZskCT09Xdq2cl9sb
	sdKu51RhOuLXoLXHfPekTKy2Q9gTGaoxHhOeDwDSzv8uv8eggjWWL0Enb7mZTDyHxjW+7t1E2ZqkE
	bCFEROgiz/8ZVI386aAUul64Q3dQJWa7mu3VUlNcIduguDNDIegUlfBzDvDMztArxx0dKF+3h6mWY
	l3iTQO3Dw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWgo5-00CvsV-N9; Wed, 14 Apr 2021 14:47:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgn8-00Cvhe-TB; Wed, 14 Apr 2021 14:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7SZZAHrH/zVE6kWA9goC6VcQU25D+nSg2dMQ8I7tPB0=; b=jycsRHSMLXti9PJ/+4Jt1dghOB
 t62UUONEfBEH7ve/gYKca3diMSoOU8MlzVuvf60sokn2WDQpjmNDmoOEk5fKSg9bFM1AREmUL5NLU
 KXrbnBlKRaqHjoEiO/pigKvo56Vc6sCTYSymFVUJzCsCwe3mPqXj+0KIhln3UyGCJe9cCMsBWJIJh
 LUtLYEZRukWk0djKWecK5EpRVV1Pa0iSQiRX+RgeGSo0bzHzPuvNqsDQJsLDX8/yjUdqbPS7glcfj
 ALYX2+3eFcptAsouUeX/Lv+IFPlOKwnT8fnpO4AaHp4HxpfH4y6IJ06SMvy9BRQzAsQNkA9Y9kL2d
 Eh9ygSyA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgn6-007q6x-7H; Wed, 14 Apr 2021 14:46:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07D2D61164;
 Wed, 14 Apr 2021 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618411611;
 bh=YLtyAFJeomBajzoh5PxbskaF/iR0wrKupgy2VNPOWTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=megLohX3SKAY66HWnNTjxa6YAMzgksi/MPeucbEd+FPELgZMGaMk8nrQj0gmlVAY0
 fWdpMbIaj5EEsLFmWNX7B6Se1WBd7iSELBcqFqCLm9zrnfWsVh0h+Tck2i9CNnbXQr
 lWFf/0R1wmp04b8LVYUDEIEjDzsDNXhQ6G3ncqpcYBGwfw9cQAKxTGR1us2eh3BU8Q
 pB5IkkmaNz2ilMxv55IT9+kScVY/kdvTk5QXMGkPIr/D3f44i7mEPSmo4xl/ksXBic
 jiDy3EgMlHUk2kKul5DMK6YHbAgc5uUMET7ATH9Nts2o+KOL3bBfiRWbHz3vMZoSq0
 peSohydKJrk4w==
From: matthias.bgg@kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Fabien Parent <fparent@baylibre.com>
Cc: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mt8183: fix dtbs_check warning
Date: Wed, 14 Apr 2021 16:46:41 +0200
Message-Id: <20210414144643.17435-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414144643.17435-1-matthias.bgg@kernel.org>
References: <20210414144643.17435-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_074652_307785_F868DF6A 
X-CRM114-Status: UNSURE (   9.84  )
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

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 0ff7b67a6806..c5e822b6b77a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -681,13 +681,13 @@ cpu_thermal: cpu_thermal {
 				sustainable-power = <5000>;
 
 				trips {
-					threshold: trip-point@0 {
+					threshold: trip-point0 {
 						temperature = <68000>;
 						hysteresis = <2000>;
 						type = "passive";
 					};
 
-					target: trip-point@1 {
+					target: trip-point1 {
 						temperature = <80000>;
 						hysteresis = <2000>;
 						type = "passive";
@@ -1103,7 +1103,7 @@ u2port0: usb-phy@0 {
 				status = "okay";
 			};
 
-			u3port0: usb-phy@0700 {
+			u3port0: usb-phy@700 {
 				reg = <0x0700 0x900>;
 				clocks = <&clk26m>;
 				clock-names = "ref";
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
