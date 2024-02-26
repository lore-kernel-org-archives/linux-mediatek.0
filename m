Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B93CC48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MBraTxg36JnBgn9IHlJS8oYwzkoIrEXfS54YRSZA81I=; b=aauqSaJmpQVdKcxIGVMsstYP2e
	7tGi4fehz+FUsqq2oM1NvH499Nu9ADp0A5KfYtUnsv3wGTGM8wkdlzJlIop65S2L09EJ/l5dB1mRz
	vwz1/ClohmvJi4nuDMZlW7v63/GHMYwdsivxyOKr1xOHhQLmcA2E1+oasGXSL73/rG4Ubs7hHxF/S
	Fo8NZ9uI8+4MxQkutRl/c5hS1qZwe9VvZdqeoa+ovDNXOGlmkJIspjAfc/9ZmNOwsIL56bIR0vtDg
	VrqhGj/7WMyRuJDqsUKFz2Wl9UxGXCX66OG76Vt9m+t8vLWssTf9oyA5JrgG9XqkjIFnrVlxWv/Fg
	T+4xJTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reiZf-00000002i0n-0EaE;
	Mon, 26 Feb 2024 21:31:47 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reiZb-00000002hyl-1lrg;
	Mon, 26 Feb 2024 21:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708983099;
	bh=Nw8AqS3nu8azYAdACy/sJRukGGhmKt9W7YfvtYGs9vU=;
	h=From:Date:Subject:To:Cc:From;
	b=vZsFFDfr3tqoQUbJYo1Y8oY/iBf7c396i8DkxKlJL/PFsU46fj1tdhbNK1gXRpxkl
	 maRB5srslRsUlKsXw/4u7xpVkYBMtpAHOWaOpX30ZlObwjG1tYCI06GnVWJUTzitnj
	 Z+y4NU7KVOuKj8W9F7SQUPobZA1+SC2dIgPGM7Gzm3g65OMLrD6amaRTpudMnWDJxo
	 DU4sluuy61XFb/mRdFEEQaS88Zp5EBTIL5rtS8M6BqhWaXS22RR6MMk01LyPzeYEzy
	 Gj52FWF4t7ylzPwOesB1SJWp/QVmC+vMsqqhQ/Fi/cI5MFinsZqUj7nuB/nvXupaPp
	 C+cPEHvohW7Zg==
Received: from [192.168.1.151] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 610EB3782075;
	Mon, 26 Feb 2024 21:31:37 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 26 Feb 2024 16:31:33 -0500
Subject: [PATCH] soc: mediatek: cmdq: Don't log an error when
 gce-client-reg is not found
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-gce-client-reg-log-dbg-v1-1-f0fff97c30c7@collabora.com>
X-B4-Tracking: v=1; b=H4sIADQD3WUC/x3MQQqDMBBG4avIrB1Io9XWq4iLmPwdBySWRKQg3
 t3Q5bd476SMpMg0VCclHJp1iwWPuiK/uChgDcVkjW2NtR2LB/tVEXdOEF434TALPx3eXdM780K
 gEn8TPvr7j8fpum4s7kuzaAAAAA==
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_133143_619056_8A8059EC 
X-CRM114-Status: GOOD (  11.17  )
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

Most of the callers to this function do not require CMDQ support, it is
optional, so the missing property shouldn't cause an error message.
Furthermore, the callers that do require CMDQ support already log at the
error level when an error is returned.

Change the log message in this helper to be printed at the debug level
instead.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b0cd071c4719..2130ff3aac9e 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -55,7 +55,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
 					       "mediatek,gce-client-reg",
 					       3, idx, &spec);
 	if (err < 0) {
-		dev_err(dev,
+		dev_dbg(dev,
 			"error %d can't parse gce-client-reg property (%d)",
 			err, idx);
 

---
base-commit: 41913bcddc83b131649ee8ff0d9ff29e01731398
change-id: 20240226-gce-client-reg-log-dbg-5ae9637a08ed

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


