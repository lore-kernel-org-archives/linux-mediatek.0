Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89371C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:42:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D88CD61166
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D88CD61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2nkdNiKpEfexiCMkh/fsII8hdu1fVpuCIGOV6nnJh0E=; b=RbNhK2ja4neXYzfSDHYSyEkFoC
	vvOieCb4LgDX8u0hbjP99qvtCCZHfgDRaRh8UxMgmrcrXf22xYNASExlvT8sR+yQ/tPhcPhWIkSU9
	aYdmrliR07qBiVMEgbtWhayL/QCWwn3D92vO3ot49kVSGkiUVVO1nl29gW4yoZ6lrAstW4BsG7yc+
	3bIO+E/pkfP9Rejo0yPfTtdU2gCbIfXCB8GUpoO3zMVDle8c05DhIy/EXthTtK2Uzx1QDxef3GQlq
	zqtFaw+VaxMFM/H7i5hmZ8zLO1R+zzDayB31lT1sQai1rCnnGtAEwCJ3K0JIlXOAjS9gGq52nZNb+
	CRg4Uu9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyVu-00FaO8-2r; Thu, 15 Apr 2021 09:42:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyTx-00FZkV-9W; Thu, 15 Apr 2021 09:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9R3f+tBaKWH0fO58cuLf8hfyC5v10OAnFBeJEdo2ghQ=; b=TFg/6cfFAFWZIFRENHJPKV0TWH
 3Xv6lu/sn4BTLqAlD7rm0gqoVkxvXbFPsxFQKH5Oom6xI1AuC3mLn1xz70vA+EJ/OuveuAXv7JlJr
 wHZa4YtIpeaheRDIqLcRtF0INz+0sZjfA1exjkz4+GmMRATpAm/wq4Jwh9fWMfNRMMYjMBRAGbSU3
 c7BXPlvr1yk27PZy4buikYYfPIlWwcabBUpMrk/7QM/D1JiWakLbeIOU/LyxElsOWXfExbGYmd0ly
 yMcCLahaMQt7iOwUiWFGZ8Cs1t5qH//1SOmKT+bYtcwlhTd/3saM5YubZ6BGVuvNwdANs88RhWXJf
 4hA2c77g==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyTu-008R3S-MP; Thu, 15 Apr 2021 09:40:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso12375615pjh.2; 
 Thu, 15 Apr 2021 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9R3f+tBaKWH0fO58cuLf8hfyC5v10OAnFBeJEdo2ghQ=;
 b=EDruGia5eWDwRiWxBWtWscWwBptpi2KyFfBdRW5V2J+MzdUshVRG/GtvcSn7ohfpUX
 bMrKayfjJ4+hwwKu1Xf9Y4rvZB/YWp8XWGsjX2G0HVeo55e89IQpSKJpy8maJHQRXkis
 avyI2ZKMrjyiW17s796c42qtYIoASEtyJ5GS1w5dqBoSnocjgjwde5+KoXvq3xTwAU/7
 U1RdtBQJkBu4ATbXswHdMDsUrrcIkrdlSoUBBYjisCQM62bdOqrvuMKd5136DtZIXyRh
 z548eQhQQEnV3tMr//u56rX+Iy8PdH2dJY0GVUihRrR1foXeYeolQEZd1txhCx9ZHWpS
 3xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9R3f+tBaKWH0fO58cuLf8hfyC5v10OAnFBeJEdo2ghQ=;
 b=pqi373Z6sKRhHOND4rSMQ4IvE8Nj/7YuQFHliYq9RqHu2Urgrj8IPoTWJryw3MJ2Kp
 /RbXCbVqpgTL0grHM/nyl/hTCesBsdkQ380mn+UvoXl3GrxveNmhR9sZXhoq/8/RxiHw
 CjjsSaNHqjh6xF8fAJF94cySVyN3x0x86Ivr3DqjAxV79u8BKq14wnuwMvHHtwoXwnHV
 Es1iWwrkShjCILSfRRC6oWaUOJUpLQZJVCRNtLweU8piCc0hnGya6RamAnoZ42oDTUcx
 Dggg1jBGYnvdwOQmx80nQjofEj7/4ZEO1CLJBW//pp4rKiTFBi+6Tpu7/icBApNJdHfu
 Wqjw==
X-Gm-Message-State: AOAM532YFZ5JZjAORmSI3m+Er/kpdBDX26WTHBpNMxYBaetwlg6825sH
 TI1cvW7CPNJo68Fk/4XQ9d8=
X-Google-Smtp-Source: ABdhPJxJ35eJvUhSAcHylNTFoLVFIlGFbKUNz2CUi/2VuSsIYW9FE/0WXaScxDI4AjHU7dmZlBEZJA==
X-Received: by 2002:a17:90a:6c82:: with SMTP id
 y2mr2929579pjj.142.1618479613629; 
 Thu, 15 Apr 2021 02:40:13 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id c4sm834754pfb.94.2021.04.15.02.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:40:12 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Alex Ryabchenko <d3adme4t@gmail.com>
Subject: [PATCH net-next] net: ethernet: mediatek: fix typo in offload code
Date: Thu, 15 Apr 2021 17:40:05 +0800
Message-Id: <20210415094005.2673-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_024014_767712_A21B018F 
X-CRM114-Status: GOOD (  11.90  )
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

.key_offset was assigned to .head_offset instead. Fix the typo.

Fixes: 502e84e2382d ("net: ethernet: mtk_eth_soc: add flow offloading support")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 4975106fbc42..f47f319f3ae0 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -43,7 +43,7 @@ struct mtk_flow_entry {
 
 static const struct rhashtable_params mtk_flow_ht_params = {
 	.head_offset = offsetof(struct mtk_flow_entry, node),
-	.head_offset = offsetof(struct mtk_flow_entry, cookie),
+	.key_offset = offsetof(struct mtk_flow_entry, cookie),
 	.key_len = sizeof(unsigned long),
 	.automatic_shrinking = true,
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
