Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0D8C25B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToPOnUT2WK9Nx6feHTnRedyzzlQdAalJ24wXgMwa6dM=; b=eM0Qv+Ff2k+OJCyRNEsMbmwL8t
	NobnNSNFC9csEapd78yKBh4D6gcs5uTXFPiF7rm4G5Xozfy8PNWZCxiWeM3bCwR1Lm9yW8cqr9EoP
	EIfLTOLFDLdIe3HAbzIE1UoA9dp4qJ/1VugUhwaRFpj4v5vrSNdzbEyAF3BYpTtEJMoKLE9t/9P/f
	Op3fj3c+5l3Qu7jcOziNQwECPyLE/G6rz8cQFWWKHKUCT/4TfGbHEE52xGga8k7nQn8bpAsL/RmOn
	lMuWzLqiUYOK2cfYq53jHmZqMs+2ktCWU2Ebf3xkjmQGPV9zjmjiLRp4QqtzJu9ERgvOTgzNVQtay
	UqLuSZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcBe-00000006qR6-2dgO;
	Thu, 30 May 2024 09:35:06 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcB3-00000006qCV-22De;
	Thu, 30 May 2024 09:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717061668;
	bh=JeJtrJYP14haTBAvSSoeGgTEideRd3CraAXWHiFMcnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oLQ+2E+cQBx2k6JhXRhzsUjR6utDpVOzpOFCPfimc3nrmaeu+SHjrs1eOCHiQqC90
	 3FAPBPC6jcERo1CMU/KAqZaKz3RnKLcAp55KVrUtIW11u+l5aUzIA4ziQAVci0YEy+
	 e6CV5aQDJV7EHbZdrNaTV88onPAXsn4vuu64DT5GHEIvGE5ebajcKsVUnfOBYJj0tS
	 ZlO8j00zOZKCltDB57V8G2RCeXXzXTwYm4g+F2BgI5CLkfh/yJFRzAp0BzloZQaebr
	 nfnqSlsEqOq+xofabVMlLoklVdfNjbkcutOBJmN+RXmbKzenCtGcGITzHIP67mA9HE
	 RCuG9HH5bpt+A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EFF0837821AF;
	Thu, 30 May 2024 09:34:26 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	bigunclemax@gmail.com,
	dlechner@baylibre.com,
	marius.cristea@microchip.com,
	marcelo.schmitt@analog.com,
	fr0st61te@gmail.com,
	mitrutzceclan@gmail.com,
	mike.looijmans@topic.nl,
	marcus.folkesson@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/4] mfd: mt6397-core: Add support for AUXADCs on MT6357/58/59 PMICs
Date: Thu, 30 May 2024 11:34:09 +0200
Message-ID: <20240530093410.112716-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_023430_222240_86D1157C 
X-CRM114-Status: GOOD (  11.06  )
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

Add the relevant AUXADC driver entries to the MFD cells of the
MT6357, MT6358, MT6359 PMICs to support their Auxiliary ADCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mfd/mt6397-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 4fd4a2da5ad7..c2939e785818 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -135,6 +135,9 @@ static const struct mfd_cell mt6323_devs[] = {
 
 static const struct mfd_cell mt6357_devs[] = {
 	{
+		.name = "mt6359-auxadc",
+		.of_compatible = "mediatek,mt6357-auxadc"
+	}, {
 		.name = "mt6357-regulator",
 	}, {
 		.name = "mt6357-rtc",
@@ -175,6 +178,9 @@ static const struct mfd_cell mt6331_mt6332_devs[] = {
 
 static const struct mfd_cell mt6358_devs[] = {
 	{
+		.name = "mt6359-auxadc",
+		.of_compatible = "mediatek,mt6358-auxadc"
+	}, {
 		.name = "mt6358-regulator",
 		.of_compatible = "mediatek,mt6358-regulator"
 	}, {
@@ -194,6 +200,10 @@ static const struct mfd_cell mt6358_devs[] = {
 };
 
 static const struct mfd_cell mt6359_devs[] = {
+	{
+		.name = "mt6359-auxadc",
+		.of_compatible = "mediatek,mt6359-auxadc"
+	},
 	{ .name = "mt6359-regulator", },
 	{
 		.name = "mt6359-rtc",
-- 
2.45.1


