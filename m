Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EEAC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2y0epCfrExVk2Vw4+YbyFZaZm2mEs7x7HfDEhOKwlg=; b=dOVJjHtt/jrbVLx30Ii/UvtgO+
	hJ8vHGY3qlMaJPaeijvrYXS3MUK2NvIbttl0GEVeiHyaBfyaK/b6rGyjJ1L0MMB12VV9eCivNJa7q
	Ml9PRsYhEjeDgeMn39oBT076vonoPHAbDevOB81FHyaavSfBJetho1SUqHOiDe6u43Qc7PENUGjbG
	4w1aCW0Cj7CYcgc7Q+eZ3SYw3IICC6hcsHvUri2tvJWnUU66YMaLdqFqkSXDK4RLd9EgNbWiL1mGz
	16RsiCow2iELrg1ocw0KIow+OSujV12HCyUAUo1GAUH3O7xALP26p8qRUblsDpC4UwLkTxyzVBFuO
	r9Ajcrpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGSS-007Co6-54; Sun, 26 Feb 2023 12:48:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGRs-007Ceh-QN; Sun, 26 Feb 2023 12:48:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 03598B80B46;
	Sun, 26 Feb 2023 12:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399FFC4339B;
	Sun, 26 Feb 2023 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415692;
	bh=emNCSAQUMhHTUG3lVSOQb0USv0AarsCt9Z41ZbfcyGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eWex+5QWuA6TZ8OOVdB12xYiI1kQADxNAwu5NhBut5ClnmQAbMMYw8CFHq4g+xOj1
	 jrK+VC1MLG28KEYsp7jQ5TiB2zMQZ2QT3R9Oz5Fgv2V19iZgVndui5Sg8IV+Ds/Xn+
	 Q3gqaW82BfVvJ5IaOcD7cL9UhWCRpHsERZjBjQODzFxlZSzovNRoYKL9hddBXPy5DW
	 h8UVQj+7rSsRSjCE8S4XzPLvVPtt2HLELc36tGR3+CH567Wpln+GSf2DI1ssiYQgNy
	 DiMueKkAcJPTEDbv4VAL24Fl07op9FueCfcihpML+kQjKsKKdXCGGUodH2nVDxV6bD
	 iSBocuDVAavjQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 26 Feb 2023 12:47:58 +0000
Subject: [PATCH 3/3] ASoC: mt6358: Remove undefined HPx Mux enumeration
 values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-asoc-mt6358-quick-fixes-v1-3-747d9186be4b@kernel.org>
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=broonie@kernel.org;
 h=from:subject:message-id; bh=emNCSAQUMhHTUG3lVSOQb0USv0AarsCt9Z41ZbfcyGE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1UCvnHtC8Y2FK2g3UW6t8hM+fV6KPpUPjMtvnTx
 6rGLlNGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tVAgAKCRAk1otyXVSH0KsZB/
 0S4IR6aezaldfEMIQi+pLvwztcvY+0JlipzO8KvE+KJaAcGy7xMknnanzY+SUc8fT/kODECUFt9eQQ
 YRpQhGHoTxzbJ7nLHXkU1L8qtW0KPKQTmii6TOcyCXdvfMPKIMpYMcyqjv2TUlowRMAfl3Ea/kBkYl
 OJ4PHrpQjOoamOiHuDs84/KrG/cCXhcXcXwl9pPBQLimzQjOUu4LBw+FRN7AJFDZnTqF3hjv2+UJVl
 xa1u5E5GNuIjoX6BftzBZlqtBr08S/BWkTiwrja04VIW0qldf1bHVg5AXXQ8VgbBYvpCjwr2QL8ypT
 W0EpsI82xGERoJQcHv8w3iMJI8jJqC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_044817_077733_94C24246 
X-CRM114-Status: GOOD (  10.42  )
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

The HPx Mux enumerations define values 5, 6 and 7 but describe them as
"undefined" and map them to the value 0 on writing. Given the descriptions
and behaviour it seems that these values are invalid and should not be
present in the register, the current behaviour is detected as problematic
by mixer-test:

# # HPL Mux.0 expected 5 but read 0, is_volatile 0
# # HPL Mux.0 expected 6 but read 0, is_volatile 0
# # HPL Mux.0 expected 7 but read 0, is_volatile 0

Remove the values from the enumeration, this will prevent userspace setting
them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6358.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 89d0dcb2635b..b54610b27906 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -637,9 +637,6 @@ static const char * const hp_in_mux_map[] = {
 	"Audio Playback",
 	"Test Mode",
 	"HP Impedance",
-	"undefined1",
-	"undefined2",
-	"undefined3",
 };
 
 static int hp_in_mux_map_value[] = {
@@ -648,9 +645,6 @@ static int hp_in_mux_map_value[] = {
 	HP_MUX_HP,
 	HP_MUX_TEST_MODE,
 	HP_MUX_HP_IMPEDANCE,
-	HP_MUX_OPEN,
-	HP_MUX_OPEN,
-	HP_MUX_OPEN,
 };
 
 static SOC_VALUE_ENUM_SINGLE_DECL(hpl_in_mux_map_enum,

-- 
2.30.2


