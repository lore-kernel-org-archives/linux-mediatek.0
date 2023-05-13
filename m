Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D255EC77B7F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 May 2023 06:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kM0Ql9taHiCzP6YsMPqx7Ss2axDr2kjWL9Nt4XrB57o=; b=VMyGvcjxjFfhTO5NK59pjs85cw
	HrJlto2phPg1kLRGlQlbfWpZ+BAz+dYPDjK3NkuNig5DYOd3z9m9rmGgUb3rAaWNlHZrDPeizeQaV
	YUUTtQPWB7ee3hGV40mgTD5Gg6gXuGx+Kh9BdSHCwOfs08j7Viwz1fjMtqhDoe3Nq/Q6QGSP1yEF4
	cQGWLtSLbsbDRN6AmNB8rVozEseQPE87H+ELcMkub+YsyUAhgcjrwsRtjZmgw3it6Fm1aYyTbiD7s
	1GZF5krzfTLzBw0t8YIjng4OXmzIRolfiHkkJ2UhUjEPeGfWx0u4f+wNqBNWywrysVdc8W0vSK7sv
	O2YJHXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxj64-00DtZ7-2w;
	Sat, 13 May 2023 06:51:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxj60-00DtX2-2O
	for linux-mediatek@lists.infradead.org;
	Sat, 13 May 2023 06:51:14 +0000
X-UUID: 838939d8f15a11ed83ed1395ce914268-20230512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kM0Ql9taHiCzP6YsMPqx7Ss2axDr2kjWL9Nt4XrB57o=;
	b=Le1q3kNCfsk5H2CfaqEIvU6TGfPy9dkgxl+PilCBIGIDlviLoldw0C+LwRXFFcKA17SxetjU4mF24m3xWrFXj+yK5XEwpjPi3WrIxZ7uVDf3aPLIYJ9b0cViN+cL0Ho4YNust7Zx3JcAc++ZTxg1EBUZM44QZ8dTSREn/Gk2nlo=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:d0899b8f-e702-4df3-9c1e-2dab3f324848,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:1,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:101
X-CID-INFO: VERSION:1.1.24,REQID:d0899b8f-e702-4df3-9c1e-2dab3f324848,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:1,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:101
X-CID-META: VersionHash:178d4d4,CLOUDID:591d093b-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:2305131451001WC1B5MD,BulkQuantity:0,Recheck:0,SF:29|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 838939d8f15a11ed83ed1395ce914268-20230512
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1810507837; Fri, 12 May 2023 23:50:57 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 13 May 2023 14:50:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 13 May 2023 14:50:55 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: linux-mmc <linux-mmc@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mmc: vub300: fix invalid response handling
Date: Sat, 13 May 2023 14:50:26 +0800
Message-ID: <afec7a5a3df06310ddadff70bbf6195ffc481f59.1683959964.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_235112_891374_6279D297 
X-CRM114-Status: GOOD (  10.97  )
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

We may get an empty response with zero length at the beginging of
the driver start and get following UBSAN error. Since there is no
content(SDRT_NONE) for the response, let's just skip it.

Test pass : SDIO wifi throughput test with this patch

[  126.980684] UBSAN: array-index-out-of-bounds in drivers/mmc/host/vub300.c:1719:12
[  126.980709] index -1 is out of range for type 'u32 [4]'
[  126.980729] CPU: 4 PID: 9 Comm: kworker/u16:0 Tainted: G            E      6.3.0-rc4-mtk-local-202304272142 #1
[  126.980754] Hardware name: Intel(R) Client Systems NUC8i7BEH/NUC8BEB, BIOS BECFL357.86A.0081.2020.0504.1834 05/04/2020
[  126.980770] Workqueue: kvub300c vub300_cmndwork_thread [vub300]
[  126.980833] Call Trace:
[  126.980845]  <TASK>
[  126.980860]  dump_stack_lvl+0x48/0x70
[  126.980895]  dump_stack+0x10/0x20
[  126.980916]  ubsan_epilogue+0x9/0x40
[  126.980944]  __ubsan_handle_out_of_bounds+0x70/0x90
[  126.980979]  vub300_cmndwork_thread+0x58e7/0x5e10 [vub300]
[  126.981018]  ? _raw_spin_unlock+0x18/0x40
[  126.981042]  ? finish_task_switch+0x175/0x6f0
[  126.981070]  ? __switch_to+0x42e/0xda0
[  126.981089]  ? __switch_to_asm+0x3a/0x80
[  126.981129]  ? __pfx_vub300_cmndwork_thread+0x10/0x10 [vub300]
[  126.981174]  ? __kasan_check_read+0x11/0x20
[  126.981204]  process_one_work+0x7ee/0x13d0
[  126.981246]  worker_thread+0x53c/0x1240
[  126.981291]  kthread+0x2b8/0x370
[  126.981312]  ? __pfx_worker_thread+0x10/0x10
[  126.981336]  ? __pfx_kthread+0x10/0x10
[  126.981359]  ret_from_fork+0x29/0x50
[  126.981400]  </TASK>

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/mmc/host/vub300.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index e4c4bfac3763..9ec593d52f0f 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -1713,6 +1713,9 @@ static void construct_request_response(struct vub300_mmc_host *vub300,
 	int bytes = 3 & less_cmd;
 	int words = less_cmd >> 2;
 	u8 *r = vub300->resp.response.command_response;
+
+	if (!resp_len)
+		return;
 	if (bytes == 3) {
 		cmd->resp[words] = (r[1 + (words << 2)] << 24)
 			| (r[2 + (words << 2)] << 16)
-- 
2.18.0


