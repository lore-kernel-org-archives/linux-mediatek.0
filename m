Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC2DC433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:01:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A5A021D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V7KcWS9F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gc6rSXI6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A5A021D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N2Ubjw903GMSXv8y2T9RbWJORY4lhTHUnOYS2WWjA4Q=; b=V7KcWS9FbhcWHARztq75Osn4X2
	oRVsb6W4/QlWbdJXAshAl1jfjcGmMhiZPqx7AqjzD3Y9xvY0RDTNMXR8UFNT1YJr0gVFIWvBYCWa7
	Sjtfak1T8KqJW1wbKDWBCE/QSgxsE3LyzngwMoiJZn86wNPw4bgYuj0XJRRB0lGKBS3wjIYjBJfWX
	PN63SCNvBljTlRkYv4l3dOImJLgea1ZBQiMvgfPGXda4/EGsXAbu56F36QAuVdszMp8xXjLYphr5u
	EURbgljTLcN0LDtQO08kiy0gVLlZVQfj51K9VHMj2RrskC5I4MNvpH/3jsI/IotEgX3oUgpvUiAze
	BToEYE/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvGo2-00008e-HZ; Tue, 14 Jul 2020 09:00:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvGnr-0008Ul-T5; Tue, 14 Jul 2020 09:00:46 +0000
X-UUID: dbf6120eacbb4d5784853e4910f64b3e-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hWYRkBLOw9WgpamN6/BmC8H435AWfMGjRIjXkdRf/SQ=; 
 b=gc6rSXI66S0bUopQGNplXNlGBv64pbaMQ+6bzWYjNSILhr4XBF1OwQuQgZorhoWl8cDZp9o4EH9Vo60wfRzwBob4rcG97aaEusatgqE7CyKTvuOtEOoEOKCuZgSWFP7Z0/8xAgT2M2MsM+Yymb3RSw7KSRWN2JkLPiNB63M2Ovs=;
X-UUID: dbf6120eacbb4d5784853e4910f64b3e-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 395694086; Tue, 14 Jul 2020 01:00:40 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 01:50:35 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 16:50:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 16:50:30 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/9] usb: gadget: bdc: fix code check warning or error caused
 by spacing
Date: Tue, 14 Jul 2020 16:48:46 +0800
Message-ID: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5CF25D77951D526478A6ABB59154AC69AF00CFEA6B1B5ABB72EFB8E4B94433D72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_050044_199540_07ED911F 
X-CRM114-Status: GOOD (  16.71  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

fix up check warning caused by no spaces around operators,
or multiple blank lines;
fix up check error caused by space prohibited before ','

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/gadget/udc/bdc/bdc.h      | 12 ++++++------
 drivers/usb/gadget/udc/bdc/bdc_cmd.c  | 15 +++++++--------
 drivers/usb/gadget/udc/bdc/bdc_cmd.h  |  2 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c |  4 ++--
 drivers/usb/gadget/udc/bdc/bdc_ep.c   | 31 ++++++++++++++-----------------
 drivers/usb/gadget/udc/bdc/bdc_udc.c  |  5 ++---
 6 files changed, 32 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 6e1e881..f56ee76 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -112,7 +112,7 @@
 #define BDC_CMD_EPC	0x2
 #define BDC_CMD_DVC	0x1
 #define BDC_CMD_CWS		(0x1 << 5)
-#define BDC_CMD_CST(p)		(((p) & (0xf << 6))>>6)
+#define BDC_CMD_CST(p)		(((p) & (0xf << 6)) >> 6)
 #define BDC_CMD_EPN(p)		((p & 0x1f) << 10)
 #define BDC_SUB_CMD_ADD		(0x1 << 17)
 #define BDC_SUB_CMD_FWK		(0x4 << 17)
@@ -150,13 +150,13 @@
 #define BDC_VBS		(1 << 25)
 #define BDC_PRS		(1 << 24)
 #define BDC_PCS		(1 << 23)
-#define BDC_PSP(p)	(((p) & (0x7 << 20))>>20)
+#define BDC_PSP(p)	(((p) & (0x7 << 20)) >> 20)
 #define BDC_SCN		(1 << 8)
 #define BDC_SDC		(1 << 7)
 #define BDC_SWS		(1 << 4)
 
-#define BDC_USPSC_RW	(BDC_SCN|BDC_SDC|BDC_SWS|0xf)
-#define BDC_PSP(p)	(((p) & (0x7 << 20))>>20)
+#define BDC_USPSC_RW	(BDC_SCN | BDC_SDC | BDC_SWS | 0xf)
+#define BDC_PSP(p)	(((p) & (0x7 << 20)) >> 20)
 
 #define BDC_SPEED_FS	0x1
 #define BDC_SPEED_LS	0x2
@@ -184,7 +184,7 @@
 #define BDC_COP_RUN	(2 << 29)
 #define BDC_COP_STP	(4 << 29)
 
-#define BDC_COP_MASK (BDC_COP_RST|BDC_COP_RUN|BDC_COP_STP)
+#define BDC_COP_MASK (BDC_COP_RST | BDC_COP_RUN | BDC_COP_STP)
 
 #define BDC_COS		(1 << 28)
 #define BDC_CSTS(p)	(((p) & (0x7 << 20)) >> 20)
@@ -218,7 +218,7 @@
 #define BDC_SRR_DPI(p) (((p) & (0xff << 16)) >> 16)
 #define BDC_SRR_DPI_MASK	0x00ff0000
 
-#define MARK_CHAIN_BD	(BD_CHAIN|BD_EOT|BD_SOT)
+#define MARK_CHAIN_BD	(BD_CHAIN | BD_EOT | BD_SOT)
 
 /* Control transfer BD specific fields */
 #define BD_DIR_IN		(1 << 25)
diff --git a/drivers/usb/gadget/udc/bdc/bdc_cmd.c b/drivers/usb/gadget/udc/bdc/bdc_cmd.c
index 44c2a5e..fba0c68 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_cmd.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_cmd.c
@@ -109,7 +109,7 @@ int bdc_dconfig_ep(struct bdc *bdc, struct bdc_ep *ep)
 {
 	u32 cmd_sc;
 
-	cmd_sc = BDC_SUB_CMD_DRP_EP|BDC_CMD_EPN(ep->ep_num)|BDC_CMD_EPC;
+	cmd_sc = BDC_SUB_CMD_DRP_EP | BDC_CMD_EPN(ep->ep_num) | BDC_CMD_EPC;
 	dev_dbg(bdc->dev, "%s ep->ep_num =%d cmd_sc=%x\n", __func__,
 							ep->ep_num, cmd_sc);
 
@@ -163,8 +163,7 @@ int bdc_config_ep(struct bdc *bdc, struct bdc_ep *ep)
 					usb_endpoint_xfer_isoc(desc)) {
 			param2 |= si;
 			if (usb_endpoint_xfer_isoc(desc) && comp_desc)
-					mul = comp_desc->bmAttributes;
-
+				mul = comp_desc->bmAttributes;
 		}
 		param2 |= mul << EPM_SHIFT;
 		if (comp_desc)
@@ -203,7 +202,7 @@ int bdc_config_ep(struct bdc *bdc, struct bdc_ep *ep)
 		return -EINVAL;
 	}
 
-	cmd_sc |= BDC_CMD_EPC|BDC_CMD_EPN(ep->ep_num)|BDC_SUB_CMD_ADD_EP;
+	cmd_sc |= BDC_CMD_EPC | BDC_CMD_EPN(ep->ep_num) | BDC_SUB_CMD_ADD_EP;
 
 	dev_dbg(bdc->dev, "cmd_sc=%x param2=%08x\n", cmd_sc, param2);
 	ret = bdc_submit_cmd(bdc, cmd_sc, param0, param1, param2);
@@ -232,7 +231,7 @@ int bdc_ep_bla(struct bdc *bdc, struct bdc_ep *ep, dma_addr_t dma_addr)
 	cpu_to_le32s(&param0);
 	cpu_to_le32s(&param1);
 
-	cmd_sc |= BDC_CMD_EPN(ep->ep_num)|BDC_CMD_BLA;
+	cmd_sc |= BDC_CMD_EPN(ep->ep_num) | BDC_CMD_BLA;
 	dev_dbg(bdc->dev, "cmd_sc=%x\n", cmd_sc);
 
 	return bdc_submit_cmd(bdc, cmd_sc, param0, param1, 0);
@@ -245,7 +244,7 @@ int bdc_address_device(struct bdc *bdc, u32 add)
 	u32 param2;
 
 	dev_dbg(bdc->dev, "%s: add=%d\n", __func__, add);
-	cmd_sc |=  BDC_SUB_CMD_ADD|BDC_CMD_DVC;
+	cmd_sc |=  BDC_SUB_CMD_ADD | BDC_CMD_DVC;
 	param2 = add & 0x7f;
 
 	return bdc_submit_cmd(bdc, cmd_sc, 0, 0, param2);
@@ -263,7 +262,7 @@ int bdc_function_wake_fh(struct bdc *bdc, u8 intf)
 	param0 |= TRA_PACKET;
 	param0 |= (bdc->dev_addr << 25);
 	param1 |= DEV_NOTF_TYPE;
-	param1 |= (FWK_SUBTYPE<<4);
+	param1 |= (FWK_SUBTYPE << 4);
 	dev_dbg(bdc->dev, "param0=%08x param1=%08x\n", param0, param1);
 
 	return bdc_submit_cmd(bdc, cmd_sc, param0, param1, 0);
@@ -277,7 +276,7 @@ int bdc_function_wake(struct bdc *bdc, u8 intf)
 
 	dev_dbg(bdc->dev, "%s intf=%d", __func__, intf);
 	param2 |= intf;
-	cmd_sc |= BDC_SUB_CMD_FWK|BDC_CMD_DNC;
+	cmd_sc |= BDC_SUB_CMD_FWK | BDC_CMD_DNC;
 
 	return bdc_submit_cmd(bdc, cmd_sc, 0, 0, param2);
 }
diff --git a/drivers/usb/gadget/udc/bdc/bdc_cmd.h b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
index 29cc988..c24e6fc 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_cmd.h
+++ b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
@@ -16,7 +16,7 @@
 int bdc_stop_ep(struct bdc *, int);
 int bdc_ep_set_stall(struct bdc *, int);
 int bdc_ep_clear_stall(struct bdc *, int);
-int bdc_ep_set_halt(struct bdc_ep *, u32 , int);
+int bdc_ep_set_halt(struct bdc_ep *, u32, int);
 int bdc_ep_bla(struct bdc *, struct bdc_ep *, dma_addr_t);
 int bdc_function_wake(struct bdc*, u8);
 int bdc_function_wake_fh(struct bdc*, u8);
diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index d567e20..cbdc127 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -59,7 +59,7 @@ int bdc_stop(struct bdc *bdc)
 		return 0;
 	}
 	temp &= ~BDC_COP_MASK;
-	temp |= BDC_COS|BDC_COP_STP;
+	temp |= BDC_COS | BDC_COP_STP;
 	bdc_writel(bdc->regs, BDC_BDCSC, temp);
 
 	ret = poll_oip(bdc, BDC_COP_TIMEOUT);
@@ -83,7 +83,7 @@ int bdc_reset(struct bdc *bdc)
 
 	temp = bdc_readl(bdc->regs, BDC_BDCSC);
 	temp &= ~BDC_COP_MASK;
-	temp |= BDC_COS|BDC_COP_RST;
+	temp |= BDC_COS | BDC_COP_RST;
 	bdc_writel(bdc->regs, BDC_BDCSC, temp);
 	ret = poll_oip(bdc, BDC_COP_TIMEOUT);
 	if (ret)
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index ba250cf..c573e9e 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -104,16 +104,16 @@ static inline void chain_table(struct bd_table *prev_table,
 					u32 bd_p_tab)
 {
 	/* Chain the prev table to next table */
-	prev_table->start_bd[bd_p_tab-1].offset[0] =
+	prev_table->start_bd[bd_p_tab - 1].offset[0] =
 				cpu_to_le32(lower_32_bits(next_table->dma));
 
-	prev_table->start_bd[bd_p_tab-1].offset[1] =
+	prev_table->start_bd[bd_p_tab - 1].offset[1] =
 				cpu_to_le32(upper_32_bits(next_table->dma));
 
-	prev_table->start_bd[bd_p_tab-1].offset[2] =
+	prev_table->start_bd[bd_p_tab - 1].offset[2] =
 				0x0;
 
-	prev_table->start_bd[bd_p_tab-1].offset[3] =
+	prev_table->start_bd[bd_p_tab - 1].offset[3] =
 				cpu_to_le32(MARK_CHAIN_BD);
 }
 
@@ -275,7 +275,7 @@ static inline int find_end_bdi(struct bdc_ep *ep, int next_hwd_bdi)
 	end_bdi = next_hwd_bdi - 1;
 	if (end_bdi < 0)
 		end_bdi = ep->bd_list.max_bdi - 1;
-	 else if ((end_bdi % (ep->bd_list.num_bds_table-1)) == 0)
+	else if ((end_bdi % (ep->bd_list.num_bds_table - 1)) == 0)
 		end_bdi--;
 
 	return end_bdi;
@@ -442,7 +442,7 @@ static int setup_bd_list_xfr(struct bdc *bdc, struct bdc_req *req, int num_bds)
 	req_len = req->usb_req.length;
 	maxp = usb_endpoint_maxp(ep->desc);
 	tfs = roundup(req->usb_req.length, maxp);
-	tfs = tfs/maxp;
+	tfs = tfs / maxp;
 	dev_vdbg(bdc->dev, "%s ep:%s num_bds:%d tfs:%d r_len:%d bd:%p\n",
 				__func__, ep->name, num_bds, tfs, req_len, bd);
 
@@ -450,7 +450,7 @@ static int setup_bd_list_xfr(struct bdc *bdc, struct bdc_req *req, int num_bds)
 		dword2 = dword3 = 0;
 		/* First bd */
 		if (!bdnum) {
-			dword3 |= BD_SOT|BD_SBF|(tfs<<BD_TFS_SHIFT);
+			dword3 |= BD_SOT | BD_SBF | (tfs << BD_TFS_SHIFT);
 			dword2 |= BD_LTF;
 			/* format of first bd for ep0 is different than other */
 			if (ep->ep_num == 1) {
@@ -682,7 +682,6 @@ static int ep0_queue(struct bdc_ep *ep, struct bdc_req *req)
 		 */
 		if (req->usb_req.length == 0)
 			return 0;
-
 	}
 	ret = usb_gadget_map_request(&bdc->gadget, &req->usb_req, ep->dir);
 	if (ret) {
@@ -793,7 +792,7 @@ static int ep_dequeue(struct bdc_ep *ep, struct bdc_req *req)
 			start_pending = true;
 			end_pending = true;
 		} else if (end_bdi >= curr_hw_dqpi || end_bdi <= eqp_bdi) {
-				end_pending = true;
+			end_pending = true;
 		}
 	} else {
 		if (start_bdi >= curr_hw_dqpi) {
@@ -820,7 +819,7 @@ static int ep_dequeue(struct bdc_ep *ep, struct bdc_req *req)
 	tbi = bdi_to_tbi(ep, req->bd_xfr.next_hwd_bdi);
 	table = ep->bd_list.bd_table_array[tbi];
 	next_bd_dma =  table->dma +
-			sizeof(struct bdc_bd)*(req->bd_xfr.next_hwd_bdi -
+			sizeof(struct bdc_bd) * (req->bd_xfr.next_hwd_bdi -
 					tbi * ep->bd_list.num_bds_table);
 
 	first_req = list_first_entry(&ep->queue, struct bdc_req,
@@ -1009,14 +1008,14 @@ static void handle_xsr_succ_status(struct bdc *bdc, struct bdc_ep *ep,
 						bdi_to_tbi(ep, short_bdi)))
 					max_len_bds--;
 			} else {
-				chain_bds = max_len_bds/bd_list->num_bds_table;
+				chain_bds = max_len_bds / bd_list->num_bds_table;
 				max_len_bds -= chain_bds;
 			}
 		} else {
 			/* there is a wrap in the ring within a xfr */
-			chain_bds = (bd_list->max_bdi - start_bdi)/
+			chain_bds = (bd_list->max_bdi - start_bdi) /
 							bd_list->num_bds_table;
-			chain_bds += short_bdi/bd_list->num_bds_table;
+			chain_bds += short_bdi / bd_list->num_bds_table;
 			max_len_bds = bd_list->max_bdi - start_bdi;
 			max_len_bds += short_bdi;
 			max_len_bds -= chain_bds;
@@ -1076,7 +1075,6 @@ void bdc_xsf_ep0_setup_recv(struct bdc *bdc, struct bdc_sr *sreport)
 	else
 		bdc->ep0_state = WAIT_FOR_DATA_START;
 
-
 	dev_dbg(bdc->dev,
 		"%s exit ep0_state:%s\n",
 		__func__, ep0_state_string[bdc->ep0_state]);
@@ -1344,7 +1342,7 @@ static int ep0_handle_status(struct bdc *bdc,
 		epnum = wIndex & USB_ENDPOINT_NUMBER_MASK;
 		if (epnum) {
 			if ((wIndex & USB_ENDPOINT_DIR_MASK) == USB_DIR_IN)
-				epnum = epnum*2 + 1;
+				epnum = epnum * 2 + 1;
 			else
 				epnum *= 2;
 		} else {
@@ -1634,7 +1632,6 @@ static void ep0_xsf_complete(struct bdc *bdc, struct bdc_sr *sreport)
 		dev_err(bdc->dev,
 			"Unknown ep0_state:%s\n",
 			ep0_state_string[bdc->ep0_state]);
-
 	}
 }
 
@@ -1645,7 +1642,7 @@ void bdc_sr_xsf(struct bdc *bdc, struct bdc_sr *sreport)
 	u32 sr_status;
 	u8 ep_num;
 
-	ep_num = (le32_to_cpu(sreport->offset[3])>>4) & 0x1f;
+	ep_num = (le32_to_cpu(sreport->offset[3]) >> 4) & 0x1f;
 	ep = bdc->bdc_ep_array[ep_num];
 	if (!ep || !(ep->flags & BDC_EP_ENABLED)) {
 		dev_err(bdc->dev, "xsf for ep not enabled\n");
diff --git a/drivers/usb/gadget/udc/bdc/bdc_udc.c b/drivers/usb/gadget/udc/bdc/bdc_udc.c
index 248426a..15652c5 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_udc.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_udc.c
@@ -342,7 +342,7 @@ static irqreturn_t bdc_udc_interrupt(int irq, void *_bdc)
 	/* update the hw dequeue pointer */
 	srr_int = bdc_readl(bdc->regs, BDC_SRRINT(0));
 	srr_int &= ~BDC_SRR_DPI_MASK;
-	srr_int &= ~(BDC_SRR_RWS|BDC_SRR_RST|BDC_SRR_ISR);
+	srr_int &= ~(BDC_SRR_RWS | BDC_SRR_RST | BDC_SRR_ISR);
 	srr_int |= ((bdc->srr.dqp_index) << 16);
 	srr_int |= BDC_SRR_IP;
 	bdc_writel(bdc->regs, BDC_SRRINT(0), srr_int);
@@ -527,10 +527,9 @@ int bdc_udc_init(struct bdc *bdc)
 
 	bdc->gadget.sg_supported = false;
 
-
 	bdc->gadget.name = BRCM_BDC_NAME;
 	ret = devm_request_irq(bdc->dev, bdc->irq, bdc_udc_interrupt,
-				IRQF_SHARED , BRCM_BDC_NAME, bdc);
+				IRQF_SHARED, BRCM_BDC_NAME, bdc);
 	if (ret) {
 		dev_err(bdc->dev,
 			"failed to request irq #%d %d\n",
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
