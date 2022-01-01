Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A503C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jan 2022 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOttO1MvyOkC/PfPre2UVjGe3J3CEnRDuS5AXW6Xkjg=; b=dnIDNZmFdDxr1c
	rXXeoZBa75jaV1HWikM31ne03Dj/ILIRiXI9Sjc2IVrtmMgUh2qz42+j+rEvlfuwSEzSVAD6bci95
	JngX2A28+qln8UXQFd53P/qwuo7p3xHUUkLaAPC3+5Va2lawYI6KrcH/p7wwv6t0IPQGVXjBtzxyp
	66CWnUYcjCF5bSaavU+UmXAoZx3OR4v2FWYmlvN1YWpivrzcKZQuMWk9uyotAO5YjZr08W3H0IchL
	E4Z9c77ITn0oy6uTtPJXAPFSsNM+WJeRuk3ipFgiSlpgSgQ6tE2hZBuCoq4MZLMpjLO5QSFjWMPuK
	e6XtlFb381mr7fsQd3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3eyU-0076Va-Fo; Sat, 01 Jan 2022 14:03:10 +0000
Received: from smtpng1.i.mail.ru ([94.100.181.251])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3eyI-0076US-1A; Sat, 01 Jan 2022 14:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DiWUKuSkGF6p5mizZhXlR2tJ1F0K9PMZt5QJC+2hB6I=; 
 t=1641045778;x=1641651178; 
 b=NjYDPAVn1hEp2Cu1eSrJ/uX85FlIjgBc9D5qiVQ1JsqLf8pLUVLSsOKAvZoCG74j/WUiXAEvmKMf321EB0rEsshN1ng90Ui5xeZzY5laPiNt5A4xH5soFtXgPICkQpuPzDsxQbrUA0MUCaubp27e5oqZiWm2hZmcc9W9W7uQWetV+BH+7lGoc2Rr6dLRUyH9dhAGDeGjz5zGfmEQ0+qlXIXKfcK8ppO80cjRJz67bdgItrhpJY6Agm2L842VVRo/qPecLGvC/4nMbBT6U5exHl8ZzCqOzm/IgGq2zgBtE83ZQ649ExSeEuLJF5xVkXF6EtJw2fFHR44CJhd/n3AieA==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <gtk3@inbox.ru>)
 id 1n3eyD-0008TK-VI; Sat, 01 Jan 2022 17:02:54 +0300
From: Maxim Kutnij <gtk3@inbox.ru>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: Maxim Kutnij <gtk3@inbox.ru>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: mediatek: add smp bringup code for MT6582
Date: Sat,  1 Jan 2022 19:01:36 +0500
Message-Id: <20220101140140.4119-1-gtk3@inbox.ru>
X-Mailer: git-send-email 2.33.1
In-Reply-To: dda186e0-38e0-4061-f60e-e297441d9fed@gmail.com
References: 
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=gtk3@inbox.ru
 smtp.mailfrom=gtk3@inbox.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9059F52CFE4D0B70A3182EAA8D6D52E873A1994A0A58B3679182A05F5380850404C228DA9ACA6FE2770EC1BE4B0A9857E6979F502FE3FB0810B0C6E9BC1DBE2F1CDD3A89687622077
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FEAC828D2BF6EC3CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CF58BB58AE3180708638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B23F8FE78000A35E1E6A61D05692D1EF6F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCAE9A1BBD95851C5BA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18F04B652EEC242312D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B670D51CA322917D6D089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C357A67C6196E73BD052C76992E68C5BDF63D558AFC78F3309C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EF15519F706774CB6A699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F1257DC9690AEBA17DC4691ABE95C32262CB4E95B1B5458B3626551DB270B2E3082DB3A08A46D8311D7E09C32AA3244CC9A9B1F89D90A51834130A1DDE7519F781560E2432555DBB8D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzdjxcBf1eR7IaHzwSrR3VA==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D6877C163FC9F125F2BF1B4592C9EB3CE68F8182784CE3FA142B2697F7A04D759B04FC54F637BA925032C609A2DC06202998FD9B05CC386A12349DB15C680E247222B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220101_060258_285045_2165029A 
X-CRM114-Status: GOOD (  12.42  )
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

This patch adds SMP support on the MediaTek MT6582 quad-core Cortex-A7 SoC.
And also enable GPT6.

Signed-off-by: Maxim Kutnij <gtk3@inbox.ru>
---
 arch/arm/mach-mediatek/mediatek.c | 4 +++-
 arch/arm/mach-mediatek/platsmp.c  | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index e6e9f93a1..aefeb6614 100644
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
index 16a4ee6c9..e1c7ad52f 100644
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
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
