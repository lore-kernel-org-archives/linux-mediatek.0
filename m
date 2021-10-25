Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 11:07:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822A360EDF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 11:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 822A360EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=improbability.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LQc/hgnpbCbRYKQS01ElJWpkGqXMsY6GMiFwhNzf4OE=; b=CwdHMLB6YIWogO
	H1dQ9x3YTukZGn3eJvggm8VV1cndqUPXXjG3yPrejAdkv3904+x7Qifpji2kmkXqfyxNGI05SJYi7
	jLw2dAx4AzIcBtiXvHOdcJhepSc0ci3Uk0Ih709esk5oeigfdvVBmVkUbFQ7PgIRvXZkH1X31lk+r
	ZWclJ6mFpm4O+fQd32v37q+jCQkzGOj0QK5m4+uikECKKal2c4RWlKKFcj0d0dIj6CX8ZkTMmS4Bg
	kveO4u/PO5P2bX0zOzZgKuSWrrbi8Urix0xFQWh2CeIRMSSSp8fe5wKh1h97bzCfNkemT7DhhPyam
	oCn5EcuH20jpzBdbD9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mexpG-00GDpt-5c; Mon, 25 Oct 2021 11:07:34 +0000
Received: from relay2.stackmail.com ([185.151.28.66])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mexpD-00GDns-NL
 for linux-mediatek@lists.infradead.org; Mon, 25 Oct 2021 11:07:33 +0000
Received: from smtp2.mail.stackcp.net ([10.4.72.76] helo=smtp2.n4.stackcp.net)
 by relay2.stackmail.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alan@improbability.net>) id 1mexp8-0008Db-UR
 for linux-mediatek@lists.infradead.org; Mon, 25 Oct 2021 12:07:26 +0100
Received: from slartibartfast.improbability.net ([51.155.134.81])
 by smtp2.n4.stackcp.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alan@improbability.net>) id 1mexp8-0000AR-Kr
 for linux-mediatek@lists.infradead.org; Mon, 25 Oct 2021 12:07:26 +0100
Received: from trillian.improbability.net (trillian.improbability.net
 [192.168.1.20])
 by slartibartfast.improbability.net (Postfix) with ESMTPSA id 4FB0089
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Oct 2021 12:07:25 +0100 (BST)
Message-ID: <7e20cf11f400462a4fa72c61e0e3a783198d805e.camel@improbability.net>
Subject: [PATCH] arm64: dts: mt7622: fix cpufreq 300MHz node value
From: Alan Swanson <reiver@improbability.net>
To: linux-mediatek@lists.infradead.org
Date: Mon, 25 Oct 2021 12:07:24 +0100
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-Authenticated-Sender: alan@improbability.net
X-Scan-Signature: 20989a9fa3d052d9c6e48bc59dc06a3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_040731_791059_6DB3F075 
X-CRM114-Status: UNSURE (   8.34  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Descriptor is "opp-300000000"=A0but opp-hz value is "30000000"
missing a zero.

Fixes: a5a80f78657f ("arm64: dts: mt7622: add cpufreq related device
nodes")
Signed-off-by: Alan Swanson <reiver@improbability.net>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
 1 file changed, 1 insertions(+), 1 deletions(-)

diff -u a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi	2021-10-25
11:30:11.000000000 +0100
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi	2021-10-25
11:30:38.638229331 +0100
@@ -24,7 +24,7 @@
 		compatible =3D "operating-points-v2";
 		opp-shared;
 		opp-300000000 {
-			opp-hz =3D /bits/ 64 <30000000>;
+			opp-hz =3D /bits/ 64 <300000000>;
 			opp-microvolt =3D <950000>;
 		};

-- =




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
