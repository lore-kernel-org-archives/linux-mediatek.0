Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8CBC197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y1Rm5jlVn5t0id/m/TPD/9lVjA4G13LLAk8j5q37gsw=; b=O0UGQs+7BYmfQ4ma+ll1qMK/0B
	KearNeSXaERhqiPPXYajZwd1x63ABq/xi7Nswy+RTOpEQ1aZMUylRO8MYMgsR+UlgFB8sqJHt3nA1
	zrRCNpf9vLsTTBLiRFuG95RoShUkV7bK4TX/NCVg9voSGQiAXv21PkF4qE+D/bJCadQgJ6fSOM1Lv
	trKMtgjI8iVHEztpbRSK1jWEFENs6M9XjxEG3srHpQhIG8rS/CkpLvdCAwXVdYQuUb52IGSSHbTpN
	/jThDmWjY+Rp8Oy2kuWtLIapi1jdrptcTcLR9xdgvFZtEOtQK09iA1/2XhpC7hi6rpiRmYQRX6mX0
	jWouYQMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3cOI-003alL-2j;
	Thu, 16 Nov 2023 13:26:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3cOC-003akb-33;
	Thu, 16 Nov 2023 13:26:41 +0000
X-UUID: bf95d8ac848311ee9b7791016c24628a-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=y1Rm5jlVn5t0id/m/TPD/9lVjA4G13LLAk8j5q37gsw=;
	b=qwo0KZcqGzBreHoIaewzH3LX/RwJRuN7riv7yL2UvJlJGkEVTqgywAjt1GT2lySvGo+wb9VRVAJDA2MH0HeUFdpPm9FT0Sj+Q6hDe0wgdGsZWvhULoWAc/VgicTRrdOuYULJjC7KIDoknWs/hSOv/+vXAIBLL2eyB1h0NYnjrAQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:d4424e0f-725f-4643-b38c-8ae502abf4db,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:768c2360-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: bf95d8ac848311ee9b7791016c24628a-20231116
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1433664872; Thu, 16 Nov 2023 06:26:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 21:26:25 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 Nov 2023 21:26:24 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <yongdong.zhang@mediatek.com>, mtk24676 <C.Cheng@mediatek.com>, "bo . ye"
	<bo.ye@mediatek.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] cpuidle: idle exit_latency overflow
Date: Thu, 16 Nov 2023 21:26:19 +0800
Message-ID: <20231116132619.69500-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.336600-8.000000
X-TMASE-MatchedRID: q6Mcoqip180V3w3L8QuNEG3NvezwBrVmgRykyfrH1xlaW2Ktn+I8/hjt
	AEYMnZ1a+a6+c8HVVTTkY5jnILkv8QfOsX0b+fZzA9lly13c/gF9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO2mZ396Gt5HhbRDDFNIh3eVt7VBaHOUXTmiHbKhgq+wjecLkJ18YygSpmkWtXcgBB8O5f
	DUOrhTJDcG0AuzN2tmcPptgJdP32/rxtqtWRjZinZrUbEZipAEiWT09mQz7szw9kH8zAy44aOuV
	Lnx3A74
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.336600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4E0647C9374209A165167659E1BEC95B48EA7C03306E9BBFA04062C7CE3E4B892000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_052636_989776_4A9A270A 
X-CRM114-Status: GOOD (  10.38  )
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

From: mtk24676 <C.Cheng@mediatek.com>

In detail:
In kernel-6.1, in the __cpuidle_driver_init function in
driver/cpuidle/driver.c, there is a line of code that causes
an overflow. The line is s->exit_latency_ns = s->exit_latency
* NSEC_PER_USEC. The overflow occurs because the product of an
int type and a constant exceeds the range of the int type.

In C language, when you perform a multiplication operation, if
both operands are of int type, the multiplication operation is
performed on the int type, and then the result is converted to
the target type. This means that if the product of int type
multiplication exceeds the range that int type can represent,
an overflow will occur even if you store the result in a
variable of int64_t type.

Signed-off-by: mtk24676 <C.Cheng@mediatek.com>
Signed-off-by: bo.ye <bo.ye@mediatek.com>
---

diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
index d9cda7f..631ca16 100644
--- a/drivers/cpuidle/driver.c
+++ b/drivers/cpuidle/driver.c
@@ -187,7 +187,7 @@
 			s->target_residency = div_u64(s->target_residency_ns, NSEC_PER_USEC);
 
 		if (s->exit_latency > 0)
-			s->exit_latency_ns = s->exit_latency * NSEC_PER_USEC;
+			s->exit_latency_ns = (u64)s->exit_latency * NSEC_PER_USEC;
 		else if (s->exit_latency_ns < 0)
 			s->exit_latency_ns =  0;
 		else

