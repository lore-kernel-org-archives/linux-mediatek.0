Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699B2C48285
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/AWJa3ygkQ0q+CkY7uyIsI0AWxkylCF/UmJXKu8eyf0=; b=03aP4pzOmvrxTyiIKEUGgKmK2O
	jE6d1S1WvSs6SZyQRws+m/rNcoYgy/2XK+iuWbfYaEUb9HdbrO/0bCmn4V4L3F3Oy9/+bAFSa7J/S
	es3ZtymlA1GIwieSyGN7NapBLyKZJKvdEiWTz4ynRyecV5s0q7EOwCogBBuEeLbWGoGYYYlWzFSY5
	SgqbH3PE1ffTnutdKjLy2KLNNuiGOfc/fVEwMplrnOLh0XEp5BQZbxFBvYTPdH991VpEjKsPwfenp
	Buhn2MgPlvGUYxtIao8Ky5eDZ6dsPufq81alYV1cKNT+nAvVxTZd3Zi5qNy+OsDKcBur+JJZ457M9
	36TmMe1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT06U-000000007cp-2vxL;
	Thu, 25 Jan 2024 13:49:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT06Q-000000007XK-2Vbs;
	Thu, 25 Jan 2024 13:49:12 +0000
X-UUID: 80ff43eebb8811eea0bf134e88e6c2dc-20240125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/AWJa3ygkQ0q+CkY7uyIsI0AWxkylCF/UmJXKu8eyf0=;
	b=VUWJQLE7Rjv3Qi7k0RwV7YiX4f2uKlFE/wtAhhRrOaoNfLMxN/sRdQ0CH134Nx5HuDIEeyNZB+OXIWtO5UTEqRWrn8W34prvoAROJprXzmgMeIw1fCNwAjuRZEVCB9KIHZ0rSMtDE2UwERodjKF3Nks1VYWBuezZZaEZKlfwrZM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:982132ce-3736-402c-ad5e-b846b50c81e8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6e16cf4,CLOUDID:ccb925fe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 80ff43eebb8811eea0bf134e88e6c2dc-20240125
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <nini.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1862738644; Thu, 25 Jan 2024 06:49:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 Jan 2024 21:29:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 Jan 2024 21:29:00 +0800
From: <nini.song@mediatek.com>
To: <nini.song@mediatek.com>
CC: <ci.wu@mediatek.com>, <mchehab@kernel.org>, <nicolas@fjasle.eu>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Jani
 Nikula" <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: cec: core: remove length check of Timer Status
Date: Thu, 25 Jan 2024 21:28:45 +0800
Message-ID: <20240125132850.10430-1-nini.song@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.077400-8.000000
X-TMASE-MatchedRID: J/H5Ci0f1rmmWOD8X0TFhBN+uzH2jcPDUXlp1FHYSPUG2HMvWEJeni2f
	RWXvh9E9TKdCZaWtTIRXTV9N8R+l8aSbvL5QzJ6IEhGH3CRdKUVAxXcQsCnxBd9RlPzeVuQQnbt
	Joik/uhtPwTClfwWa2Xug5fIqIMi34X8HWMSNX7rhG1IOMb7PsA/i8FY2vTOBmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ19+9ZqEp9FTjW3puOnxUj54jKqFb5kA20IZC5yr1vP62yI+zZf2L25y7ky
	LWYE0faEsYRGRuZx3n2YxmhsvKIu/0krNbgAQ9znU2qXaDp0DUXRoPmWO3jekxwdkPqCq7vDEyN
	+J8hd+jCS9WgDXVPCp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.077400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 136E736A2A19E8DE1F1CB962C7FEC4B6141D1A14242E7005AEC56E5E062997692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_054910_675007_A2620BF8 
X-CRM114-Status: GOOD (  11.97  )
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

From: "nini.song" <nini.song@mediatek.com>

The valid_la is used to check the length requirements,
including special cases of Timer Status. If the length is
shorter than 5, that means no Duration Available is returned,
the message will be forced to be invalid.

However, the description of Duration Available in the spec
is that this parameter may be returned when these cases, or
that it can be optionally return when these cases. The key
words in the spec description are flexible choices.

Remove the special length check of Timer Status to fit the
spec which is not compulsory about that.

Signed-off-by: Nini Song <nini.song@mediatek.com>
---
 drivers/media/cec/core/cec-adap.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 5741adf09a2e..559a172ebc6c 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1151,20 +1151,6 @@ void cec_received_msg_ts(struct cec_adapter *adap,
 	if (valid_la && min_len) {
 		/* These messages have special length requirements */
 		switch (cmd) {
-		case CEC_MSG_TIMER_STATUS:
-			if (msg->msg[2] & 0x10) {
-				switch (msg->msg[2] & 0xf) {
-				case CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE:
-				case CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE:
-					if (msg->len < 5)
-						valid_la = false;
-					break;
-				}
-			} else if ((msg->msg[2] & 0xf) == CEC_OP_PROG_ERROR_DUPLICATE) {
-				if (msg->len < 5)
-					valid_la = false;
-			}
-			break;
 		case CEC_MSG_RECORD_ON:
 			switch (msg->msg[2]) {
 			case CEC_OP_RECORD_SRC_OWN:
-- 
2.18.0


