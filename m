Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61788C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 11:33:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C63A121527
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 11:33:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D26oFZze";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Vvl48Upv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C63A121527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9KMUiQ5BrTJ/qlPgLZZJXLp8S1Fv6//s4KzsbN41DOA=; b=D26oFZzenKKCM7hHHdKTvHSpZ
	rqqhHMftDEU2vtIHCFOMBfC45RE3OsI/lLxPilBynCvRguZS/NJt+cLPSD4tZPZe45i7bzLYDAeqi
	92cDipEPkSTMncZN1T0hZnQaTULubAiNSie6d1d8NmDzdIvbD5X2sGzRyzenDkfz72BUYnhxc0Vu+
	oD9my+QY+qytFRztBLh34Z47OuhPEl0zS4pHBeICdjcqQUzEapBxSr1zp+wLzvjtdI1UF4CLI25AZ
	ag4PXGodiBMebJ/cRa89K2PEME7Hxsgk82G91wWqJ5qoh5CdSTQUBTicRb0taQJsALMpuTIUv1iVM
	YA9m2pLlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQUAy-0003VY-QP; Thu, 08 Oct 2020 11:33:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQUAv-0003SJ-Pw
 for linux-mediatek@lists.infradead.org; Thu, 08 Oct 2020 11:33:34 +0000
X-UUID: f90ca467a6ed4f19bb90d9d5c42da04d-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=D0UZOTk44VFqT44JLOZadB5K96q63am3T/vBtiOOUJw=; 
 b=Vvl48UpvecTtWeBQO5dh/jpXgQXOyT+gNrxLOheKCKeXTUwl/D4JJlmbRY2cms+rDN63k9NRlora2OymCbZiQp1VUHzld3ovqr3ZZwVRS08tJvvq/1j7jsNQpIQo7uNH0OF0oV+6npwq5PAsJYVkaJwVP640UGzY8ZhOXSIbz6w=;
X-UUID: f90ca467a6ed4f19bb90d9d5c42da04d-20201008
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 670796616; Thu, 08 Oct 2020 03:33:29 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 04:33:27 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 19:33:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 8 Oct 2020 19:33:13 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 02/10] mt76: testmode: add snr attribute in rx statistics
Date: Thu, 8 Oct 2020 19:28:56 +0800
Message-ID: <20201008112904.10620-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201008112904.10620-1-shayne.chen@mediatek.com>
References: <20201008112904.10620-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_073333_986535_2547414E 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support to display snr value when dumping rx statistics.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/testmode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index 02c9495..4015f1d 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -101,6 +101,7 @@ enum mt76_testmode_stats_attr {
  * @MT76_TM_RX_ATTR_RCPI: received channel power indicator (array, u8)
  * @MT76_TM_RX_ATTR_IB_RSSI: internal inband RSSI (array, s8)
  * @MT76_TM_RX_ATTR_WB_RSSI: internal wideband RSSI (array, s8)
+ * @MT76_TM_RX_ATTR_SNR: signal-to-noise ratio (s32)
  */
 enum mt76_testmode_rx_attr {
 	MT76_TM_RX_ATTR_UNSPEC,
@@ -109,6 +110,7 @@ enum mt76_testmode_rx_attr {
 	MT76_TM_RX_ATTR_RCPI,
 	MT76_TM_RX_ATTR_IB_RSSI,
 	MT76_TM_RX_ATTR_WB_RSSI,
+	MT76_TM_RX_ATTR_SNR,
 
 	/* keep last */
 	NUM_MT76_TM_RX_ATTRS,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
