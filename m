Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3463C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 07:06:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F40FB207C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 07:06:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uKlzua9Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="H5v+1OSy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F40FB207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RCP8U52G7x2yQ8+W6yvyb8Fu6NnKnrD2zlSwaFRYPd4=; b=uKlzua9Y+gJrH84XKRK0jjJNHR
	Hv+ksQKaBtH+sA+Nf3a49fmQy5uiekQpzgOE1OoIpj9e3X1JP+woazeIgFw+KgS+Sy7R5+uJ7PhOT
	Jkt3EOiJtn5tLClIbADmY9r4Lqvj7Bixjz7vXGWswhpSdjP0w5NYDAW9O+7CIbDxE7YenqXv5PrHm
	+a5jGTD7pWf4pNC8UywXYR7T78OdbR9cv/rnZBKWb61fNv8xtzJaAHOpdQo1MyEKXmH+sS/JqnJV1
	mVtxg4z0V+yHA2aIcQ02L0KI2nCrN1D/jnPOqpjcLydnZU7FgTXwLIg3uqN9XTx+EZLlirMI85hX5
	6YqKniHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBE3-0000Um-PJ; Mon, 07 Sep 2020 07:06:03 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBDz-0000TM-Ai; Mon, 07 Sep 2020 07:06:00 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
 by mxout4.routing.net (Postfix) with ESMTP id C6DDA100464;
 Mon,  7 Sep 2020 07:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1599462351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=onds+3xjlybr9ir+dspQaREPX8BcKz9b6Gb01qJhOFw=;
 b=H5v+1OSy2SHAT35gF1NOqNI/Nsr0lePa9HK8oKtewbND1nF9q0vTk+lVDySS6ZzsFqxFEk
 3oOhrkJEC221bZiTPbqm5AIfdliiOxe1gzMqu6gV0QJsk7Q9eFe9KT3HAfnsQURtpr7+i7
 HvKWKZepAeamq+bGyuDGtG5Gk/sY81M=
Received: from localhost.localdomain (fttx-pool-185.76.97.104.bambit.de
 [185.76.97.104])
 by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 09C90401D3;
 Mon,  7 Sep 2020 07:05:51 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] arm: dts: mt7623: add missing pause for switchport
Date: Mon,  7 Sep 2020 09:05:17 +0200
Message-Id: <20200907070517.51715-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_030559_603560_9FC622B2 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <landen.chao@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Qingfang DENG <dqfext@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

port6 of mt7530 switch (= cpu port 0) on bananapi-r2 misses pause option
which causes rx drops on running iperf.

Cc: stable@vger.kernel.org
Fixes: f4ff257cd160 ("arm: dts: mt7623: add support for Bananapi R2 (BPI-R2) board")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 2b760f90f38c..5375c6699843 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -192,6 +192,7 @@ port@6 {
 					fixed-link {
 						speed = <1000>;
 						full-duplex;
+						pause;
 					};
 				};
 			};
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
