Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B751BC2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u9tROGslymKxtNVU+9GyZdD8twmkqpbfDW7yWUEQuu4=; b=PUiWkbRo5pnDZF1hBdlWGWHtMg
	PGUBmYBVulw8NGM5Iw2oAlgK3uiVn76pQXvEhQYnBaKssUQDwEyd9v3k+YSrNQmsTMIB2wl3hBvzp
	lNkGubdiwTB7hxPLnJaYWwGhB6YmQ7y6lIVWFJFhCgqks8Jjm0ZAqNhpzNuiVZL+h/OOvWzTQrXLN
	ztIaRawJSzHfmtP2Kd9d2FCU8b5IJXGqHCGoBbJ14nzbCsEv8q+eubRe78UYb6NMQf2Uk96kI6LVB
	mIW09Ut8h8CM5yY5SDMxd1qelOHNXOqlzTmHG8uDsF8wtvMmlojtGMh7cFi4HJaYiiP7j9G/gGKny
	btIe27Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmGp-0000000HQyA-1A0U;
	Mon, 24 Jun 2024 16:10:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmGh-0000000HQuZ-0Tuo;
	Mon, 24 Jun 2024 16:10:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O8YwJa023758;
	Mon, 24 Jun 2024 16:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u9tROGslymKxtNVU+9GyZd
	D8twmkqpbfDW7yWUEQuu4=; b=lFgXYdowhcY0+1kJL4jAXIh7GfAErMfFoE1GkX
	XnnDnpSWOE86m63Wxjxs+pYrxFX4VtmEqpD8tZzT4PMzw250fTACiOaR5U+XoipY
	PFw2CyHbCOLnCI9hh5aooLIp4QDoQKbHNtsputXH4xw/fdePrawDGk1LEqwdizrq
	PR6FxXcylGDZbFmO4SHOuAlB60d6gVPwv16NWOrE72uvO2hcGvJT9XO2NOIkPT06
	K7Czi6clvccLFkDhUo4mHwijvzrzy209pNp1h+Bv2t/7t7DC80HKpPw6+ldEVef1
	+90N1h60g4KSsUtSZWdMII45m5/0WHkSi3OR2MfNwR9Wb8Rw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqshm3cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 16:10:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45OGA6K6011895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 16:10:06 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 09:10:05 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 24 Jun 2024 09:09:48 -0700
Subject: [PATCH v2] mailbox: mtk-cmdq: add missing MODULE_DESCRIPTION()
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240624-md-drivers-mailbox-v2-1-e5a428d52224@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEuaeWYC/32OQQ6DIBREr2JYl0bQkrar3qNxAZ9P/YlCC0psj
 HcveoAuXzJvZlaWMBImdq9WFjFTouALyFPFoNf+hZxsYSZr2daqvvLRchspY0x81DSYsPAGbCO
 cddAaxYr4juhoOUqfXWGjE3ITtYd+rxrIz0uR04Rxj/eUphC/x4UsdunvWhZccAV4scrdZKvt4
 zMTkIczhJF127b9ACDjWXrVAAAA
To: Jassi Brar <jassisinghbrar@gmail.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>,
        "Jeff Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zViXkquq1yXb_H-FG68IXmzoHqE1WmqC
X-Proofpoint-GUID: zViXkquq1yXb_H-FG68IXmzoHqE1WmqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_13,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406240129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_091011_658088_84721036 
X-CRM114-Status: UNSURE (   9.51  )
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

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Changes in v2:
- Updated description per AngeloGioacchino Del Regno and propaged the
  Reviewed-by tag
- Link to v1: https://lore.kernel.org/r/20240608-md-drivers-mailbox-v1-1-6ce5d6f924ad@quicinc.com
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4aa394e91109..71eb78c3d6ce 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -790,4 +790,5 @@ static void __exit cmdq_drv_exit(void)
 subsys_initcall(cmdq_drv_init);
 module_exit(cmdq_drv_exit);
 
+MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) Mailbox driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240608-md-drivers-mailbox-3cd31fdfc4b6


