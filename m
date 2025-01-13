Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5444C02180
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2025 17:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4muWke9H2WAVf+L762qmgkGuimUiHnSY2t6rCZkL3M=; b=m2jQON6+TWHlplF8FMSrI6QnXP
	H9Bqt+SkHOt3c+XSql3nErFCI8XIzgrsNExAO5BKwIhx5EuiJbJGcf/siFbv9ALgnTkludz4D7E2k
	SHE209wMPTNx1fGWVo9/SzHdQvCpNbNN/LHWE3hPWfOVVFQTNdvaKrQSuRdxqxxhciH8KrJU+3onh
	mBv7VdH/C9+iAf1kJoN0lVbQCcHDd62mPTxzS2NYcRS+pFdBRo+CPdB7YygjMYceYX1gn6xlOCYWj
	t3EoVoBTaY7exkz4BYsuDDUH2KZeNhPTNexEbZZF99Fwrqm9XVbr9KizjoI0j2Z5eVYGhNp00lppy
	HB/NEOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOIU-000000063A8-1cP2;
	Mon, 13 Jan 2025 17:32:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXN4X-00000005nvX-3KkC;
	Mon, 13 Jan 2025 16:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736784827;
	bh=I/Eu5PyVUWwxt7+WHjFCNjClAcEG0i3DEgLcWXIsrzY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=avKf0pAos+HeOh/45PO/SzNWC8xsmwMdxoy8vvEdkWVQlNT2r8QamalkoD8YSESp3
	 FZKwfgzWNPDwgW6tSAmFhzdL/PQFWbqGiylGpbg5366YDE8+K2wvddMrLm1y25nxYH
	 NNuBdNZYy/ID9cwMThj/uki3iuFDn5+eMK78MVb4pf8t9tqcbI4K5drLfBlupLKzWQ
	 qinRTxkQVCDi3kY0T39zwnyCDSvJWXzRs0WPf4FKanCQ/wzqhyvcHUZ+MQcqaRvMao
	 U/iPkfT52GmvOnktmH5Bmrcg7FscGbe6soM++XoFDWFEgpOKcYi7oj8YMWDxGJnWD3
	 SGS7tDVbYohDg==
Received: from device-327.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D560417E0CF4;
	Mon, 13 Jan 2025 17:13:46 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 13 Jan 2025 17:13:23 +0100
Subject: [PATCH 1/2] soc: mediatek: mtk-socinfo: Add entry for MT8370AV/AZA
 Genio 510
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-mtk-socinfo_genio-510-700-v1-1-cf5112b325b7@collabora.com>
References: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
In-Reply-To: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736784826; l=1033;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=I/Eu5PyVUWwxt7+WHjFCNjClAcEG0i3DEgLcWXIsrzY=;
 b=UIzQcaZTEG0UuYqyH+rSRkiRKXLspiShzBwjfcnNGeAc7CspG32Gd1lpB+SzT5Z3gKjNrQVDe
 UEIlDdulnFwCGDGWyrbt+Pqjl4GYSyd+0xWqDaGhP1kVyeDCPd8WiMh
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_081349_998384_328134A1 
X-CRM114-Status: UNSURE (   8.47  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add an entry for the MT8370 SoC with commercial name Genio 510.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 123b12cd25432b5db3033fddbff1dcd6f57ed8b1..060e39cc8407dc85a8cd2a6020d187acce73106d 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -56,6 +56,7 @@ static struct socinfo_data socinfo_data_table[] = {
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195GV/EHZA", "Kompanio 1200", 0x81950304, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EZA", "Kompanio 1380", 0x81950400, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EHZA", "Kompanio 1380", 0x81950404, CELL_NOT_USED),
+	MTK_SOCINFO_ENTRY("MT8370", "MT8370AV/AZA", "Genio 510", 0x83700000, 0x00000081),
 	MTK_SOCINFO_ENTRY("MT8395", "MT8395AV/ZA", "Genio 1200", 0x83950100, CELL_NOT_USED),
 };
 

-- 
2.47.1


