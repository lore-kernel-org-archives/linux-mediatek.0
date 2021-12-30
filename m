Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A8FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 12:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sMizgiev8ZjsXIKG5ZmJ8D8Mhj4eQCizUvxhLASWrUI=; b=ILnbrcD2U73XF7
	tV2iJtC/gyYrbLpkr6Tgv+2Rwq237qi8Bk1qVAv8AULLb4QzlWxTzW0dEmz2KWcqH+bFf0QcXwimZ
	CEY4VUWHzXfxxa0CJ03oXCzmI6OJ26/9gOWUQElYWhILY7nGfUfzhh0YHa9Zt1Ht/bD+W3VsRofHz
	qZzV7leQc44r3bYvCs0DSioCGcuqzC1/mi38KL4KRFm/TFVV8Xc6/M/6uqE/T5IKnzX0vkKDoY2P4
	TmugWIvATTG2+eMMx+WN1UCRQAbgL2g/Fy8Y+S3lJKjOB7x7kIEaazwXfojDHnEQ5ia34a/tAqKIM
	zJBXaiHsEdzgFSrzzGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2uuu-004OyB-G5; Thu, 30 Dec 2021 12:52:24 +0000
Received: from smtpng3.i.mail.ru ([94.100.177.149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2uuY-004Oum-Ud; Thu, 30 Dec 2021 12:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Mr3OPbGfdZv2acimE3GKBnV6ABp9DngLyItpAMsR1EM=; 
 t=1640868723;x=1641474123; 
 b=UFa1KE1HqgRxcTtlRry2aoQnLcpmEcEnmG1t/e3dz1xNuJWgTLJLWUD/yXtbNP8aWXc0I0Tr1QXqLrTnd/3hy8c+eCPHSm+SX6yL+CIT2mOqmKaT/cr3BW0T+Ins/I7mQG28uySZeafjpV0m/cxjH5TjcPHm4gPyOVdhxpiEV51o7flIJTV9U/IeLn3FVCR2poK1QNJOca72H059QRNAHnWGST3EDtE1boSikYJr69H4MFxec9mPQPJiMokYpW7GDe78p/DP3eYt20z/EntrfB+kFJuQe7+yVYJ+S8S3WH0pSBk2qpDiGK/ki4SVbUqKfnUIfrELBeo5UnCFa6tRZw==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from <gtk3@inbox.ru>)
 id 1n2uuS-0001Tn-EK; Thu, 30 Dec 2021 15:51:56 +0300
From: Maxim Kutnij <gtk3@inbox.ru>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: Maxim Kutnij <gtk3@inbox.ru>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: mediatek: add smp bringup code for MT6582
Date: Thu, 30 Dec 2021 20:51:50 +0500
Message-Id: <20211230155152.48715-1-gtk3@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=gtk3@inbox.ru
 smtp.mailfrom=gtk3@inbox.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD94D5EF110843E6A67C325213A5E2C0E449CAC477A2A6F0E15182A05F538085040D44ECFBC32F42193FB61FBFD3B931568476AF814F00C598CF5EC25122E9958EF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AD2F2D6F6013FF7FC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE77C1346FE4B18DC51EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6A698B691B9FCA0A4BAC9B3D349B4D65E20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FA18204E546F3947CD2DCF9CF1F528DBCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637CAEE156C82D3D7D9389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE493B89ED3C7A628178125A4AB119743A3B3C4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C98DCDA00E0158592B3D8AC402627D226E8F6AC43113E6A989C2B6934AE262D3EE7EAB7254005DCED179A508CD82A26DD1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B069F8FEF10F1C2C2993EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D340A58BF0C7EAC340FAA0F38CA127064085198DA8F6EC469BD3EE52C4A9FB55682F99958E839884D7F1D7E09C32AA3244C2187BB0E0678AD2A76948ABE2D29758655E75C8D0ED9F6EE8D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj1qmHCAeuKqOjkqr2/CpP9A==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D6AF8F064E25D51A3A2A58C97B59C27E9F8F8182784CE3FA142B2697F7A04D759B04FC54F637BA925032C609A2DC06202998FD9B05CC386A12349DB15C680E247222B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_045203_388354_DF974F4A 
X-CRM114-Status: GOOD (  12.38  )
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

This patch adds support SMP on MediaTek MT6582 Cortex-A7 quad core SoC.

Signed-off-by: Maxim Kutnij <gtk3@inbox.ru>
---
 arch/arm/mach-mediatek/mediatek.c | 4 +++-
 arch/arm/mach-mediatek/platsmp.c  | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index e6e9f93a1f0..aefeb661405 100644
--- a/arch/arm/mach-mediatek/mediatek.c
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -20,7 +20,8 @@ static void __init mediatek_timer_init(void)
 {
 	void __iomem *gpt_base;
 
-	if (of_machine_is_compatible("mediatek,mt6589") ||
+	if (of_machine_is_compatible("mediatek,mt6582") ||
+	    of_machine_is_compatible("mediatek,mt6589") ||
 	    of_machine_is_compatible("mediatek,mt7623") ||
 	    of_machine_is_compatible("mediatek,mt8135") ||
 	    of_machine_is_compatible("mediatek,mt8127")) {
@@ -38,6 +39,7 @@ static void __init mediatek_timer_init(void)
 
 static const char * const mediatek_board_dt_compat[] = {
 	"mediatek,mt2701",
+	"mediatek,mt6582",
 	"mediatek,mt6589",
 	"mediatek,mt6592",
 	"mediatek,mt7623",
diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 16a4ee6c959..e1c7ad52f77 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -49,6 +49,7 @@ static const struct of_device_id mtk_tz_smp_boot_infos[] __initconst = {
 };
 
 static const struct of_device_id mtk_smp_boot_infos[] __initconst = {
+	{ .compatible   = "mediatek,mt6582", .data = &mtk_mt7623_boot },
 	{ .compatible   = "mediatek,mt6589", .data = &mtk_mt6589_boot },
 	{ .compatible   = "mediatek,mt7623", .data = &mtk_mt7623_boot },
 	{ .compatible   = "mediatek,mt7629", .data = &mtk_mt7623_boot },
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
