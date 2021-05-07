Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B618C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 03:03:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF96613C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 03:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF96613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nscLuCmcbInMDrKfP+4vporcWhfDmzdJaED6bILV3HI=; b=Yw11F5pmAjbLJFqKugQlqpzQe
	DBFJu9XW+YJq6ABiBfJp5yKNLVxoOI9l0jdZnuOn1lFUtiSfxp5GGV0ijEDODVWpKiGQoNI0LxvfW
	3fVHAb0xhsQPGZ/3Ybr6qNspjPizB/Ll13pqiTpEY3AwQU0HGwVlCZ/lDMLzXb1jHp/3p89hjyNLw
	1LLOtBojkQAUYOE4gHRpMTeN/nreDhazk3b3qQPgoBbxkhNIMXvkrNTo8en183TSVf6wwpgE4fdmv
	Ujmdfi+9elwCdZenwpJwR1RUI3DOyWGkJtfHe1eg0Yko8lPw6NYXeEy7LIkHBIExoghQkMuYuA9hX
	3DMhkVFbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leqm5-005w0S-8C; Fri, 07 May 2021 03:03:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leqm2-005vzs-Rn; Fri, 07 May 2021 03:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=IkwCjg9ngEuEj284NCds/hqbOsTd44oUB9SHU2oh2zg=; b=IQ8CM0+PMLXi5JEruefreT1UQe
 DuYGzT11XnOAeYqLJihyh7H7hTuidkcw1ayga1Qlkt+ETRbFECRy9orbgb1BuW1/PXAHAxb2lWDnJ
 6E/iF3l5srfHbz/4KXQZF5stkJiS9xgpZXo9vrZHg0+sIwa4OoXkAJoymVQRyB6MUpyEt/k8gatPv
 KAtgIxHlY0edIedMDlppHQcoH1Tov00ZxODyT97udyZNQIMsegC7XQdLV9KSykbQbsJB2VnJyCsoL
 M8LFDWVOf8MYRPU1XVm7t41DfwVhSFtHt2zDB+6yeZnF94XdWT851SfbtbytxafPoO+SfFh56kdSY
 dOCmsSzw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leqlz-006XbH-ES; Fri, 07 May 2021 03:03:28 +0000
X-UUID: de4d3332969c4a06b3877ef7ffad8abf-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IkwCjg9ngEuEj284NCds/hqbOsTd44oUB9SHU2oh2zg=; 
 b=GY2/CJFmy5YmMCpyOZrEsAEBkXo8TI382DWicguzLRDQuQQ7yhquBVgw5a48Tuim920bwBGBIJsfkDFTNqSfidIiQPG8MT4pbg72CJtmU8p9PQ0Q6QVfU/i/yumWH079OTq1MQ998710F6jCaKXBYnCoyO59S8PvEX3S2hk6eac=;
X-UUID: de4d3332969c4a06b3877ef7ffad8abf-20210506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <john.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 301714373; Thu, 06 May 2021 20:03:23 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 19:53:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 10:53:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 May 2021 10:53:44 +0800
From: <john.wei@mediatek.com>
To: <john.wei@mediatek.com>, <louis.kuo@mediak.com>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>
Subject: [RFC PATCH V0 1/2] media: v4l2: Add fields to frame descriptors
Date: Fri, 7 May 2021 10:53:36 +0800
Message-ID: <1620356017-26486-2-git-send-email-john.wei@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
References: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_200327_515469_390CBECE 
X-CRM114-Status: GOOD (  10.72  )
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

From: John Wei <john.wei@mediatek.com>

Add enable, hsize, vsize, user_data_desc to frame descriptors

This patch is derived from following patches
https://patchwork.kernel.org/patch/10875875/
https://patchwork.kernel.org/patch/10875869/

Signed-off-by: John Wei <john.wei@mediatek.com>
---
 include/media/v4l2-subdev.h |   25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 30ec011..f603831 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -308,15 +308,38 @@ struct v4l2_subdev_audio_ops {
 	int (*s_stream)(struct v4l2_subdev *sd, int enable);
 };
 
+enum v4l2_mbus_csi2_user_defined_data_desc {
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_NONE,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_Y_HIST,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_AE_HIST,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_FLICKER,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_GYRO,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_PDAF_PIXEL,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_PDAF_DIFF,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_LE,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_ME,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_SE,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_SSE,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_SSSE,
+};
+
 /**
  * struct v4l2_mbus_frame_desc_entry_csi2
  *
  * @channel: CSI-2 virtual channel
  * @data_type: CSI-2 data type ID
+ * @enable: enable this data identifier
+ * @hsize: horizontal size
+ * @vsize: vertical size
+ * @user_data_desc: the description of user defined data
  */
 struct v4l2_mbus_frame_desc_entry_csi2 {
 	u8 channel;
 	u8 data_type;
+	u8 enable;
+	u16 hsize;
+	u16 vsize;
+	enum v4l2_mbus_csi2_user_defined_data_desc user_data_desc;
 };
 
 /**
@@ -354,7 +377,7 @@ struct v4l2_mbus_frame_desc_entry {
 	} bus;
 };
 
-#define V4L2_FRAME_DESC_ENTRY_MAX	4
+#define V4L2_FRAME_DESC_ENTRY_MAX	8
 
 enum v4l2_mbus_frame_desc_type {
 	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
