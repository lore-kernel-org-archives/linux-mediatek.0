Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F92C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 02:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCqP2l+Kqdf5yUqoHyrwDaNfrpAvvcfVlREwKoCaOqs=; b=XDqwmKpWIfgbCrWYCACmxPzwoz
	KCpWTjAc0L4b7dRTAxsIpp7Ys3jOU4gcogDpGmXDFpr0J6gIXPmLS9qwmb3J3zb9tcauZ9Dk0/j28
	ryaYqz7aEYXZMDYGgD01/RkPtdzTl2RowRyv2GvPbO2zRgQHyrlZFtar6P2T306WGZiopiLbrEveI
	z2ZNId6s86ieiT70gpSH9G1Fe61+4YHmuuiVTvG2JX/D5UnFX1JEVSFLQVvOAEfo7w+hKjJKHoCkv
	q/v1dPEs4da5K9WqhXr7h/CNwgrA0zc58hQuH3+c8RWG89cyv/pRsWlZxShEgUbPbkxsoqxIZG8f4
	JwqSh9CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q20TG-00FEK1-2w;
	Thu, 25 May 2023 02:12:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q20Sx-00FEAJ-1x;
	Thu, 25 May 2023 02:12:36 +0000
X-UUID: 9af8f1b2faa111ed83ed1395ce914268-20230524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eCqP2l+Kqdf5yUqoHyrwDaNfrpAvvcfVlREwKoCaOqs=;
	b=Qukh1Icz8GtFgzsd5Nfoj8eBlaUkVCe6WR4mBlWd0uehu8iI0QJAyfiJiaTW7Ut7uRZgm49yzJbR9fYenQtOBmien/a79T008xbZDE7TPRDrIGSRPIUUztbzVw2lGU5ZULYbthDZBplPnYJhlG7WhCDoLv9i82EAC/NFiunBgUM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:813384ff-badd-41dd-bc27-fd27505e9b1d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.25,REQID:813384ff-badd-41dd-bc27-fd27505e9b1d,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:d5b0ae3,CLOUDID:a933ec6c-2f20-4998-991c-3b78627e4938,B
	ulkID:230525101232CBEBVDHU,BulkQuantity:1,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 9af8f1b2faa111ed83ed1395ce914268-20230524
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 471274183; Wed, 24 May 2023 19:12:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 May 2023 10:12:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 10:12:28 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5,8/8] media: mediatek: vcodec: Add dbgfs help function
Date: Thu, 25 May 2023 10:12:19 +0800
Message-ID: <20230525021219.23638-9-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525021219.23638-1-yunfei.dong@mediatek.com>
References: <20230525021219.23638-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_191235_653998_1EC1A0AC 
X-CRM114-Status: GOOD (  12.33  )
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

Getting dbgfs help information with command "echo -help > vdec".

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
index 237d0dc8a1fc..2372fc449b45 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
@@ -52,6 +52,23 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_ctx *ctx, char *buf
 	*used += curr_len;
 }
 
+static void mtk_vdec_dbgfs_get_help(char *buf, int *used, int total)
+{
+	int curr_len;
+
+	curr_len = snprintf(buf + *used, total - *used,
+			    "help: (1: echo -'info' > vdec 2: cat vdec)\n");
+	*used += curr_len;
+
+	curr_len = snprintf(buf + *used, total - *used,
+			    "\t-picinfo: get resolution\n");
+	*used += curr_len;
+
+	curr_len = snprintf(buf + *used, total - *used,
+			    "\t-format: get output & capture queue format\n");
+	*used += curr_len;
+}
+
 static ssize_t mtk_vdec_dbgfs_write(struct file *filp, const char __user *ubuf,
 				    size_t count, loff_t *ppos)
 {
@@ -84,6 +101,11 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 	if (!buf)
 		return -ENOMEM;
 
+	if (strstr(dbgfs->dbgfs_buf, "-help")) {
+		mtk_vdec_dbgfs_get_help(buf, &used_len, total_len);
+		goto read_buffer;
+	}
+
 	if (strstr(dbgfs->dbgfs_buf, "-picinfo"))
 		dbgfs_index[MTK_VDEC_DBGFS_PICINFO] = true;
 
@@ -110,7 +132,7 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 			mtk_vdec_dbgfs_get_format_type(ctx, buf, &used_len, total_len);
 	}
 	mutex_unlock(&dbgfs->dbgfs_lock);
-
+read_buffer:
 	ret = simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
 	kfree(buf);
 	return ret;
-- 
2.25.1


