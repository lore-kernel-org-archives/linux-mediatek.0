Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56FEC47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRfjJ9YWROks75IUMtZC2wrUKi1suXGk03fbJUFbyt0=; b=wGM9iuqQahBUz+Pn46nSdATumU
	uBWSBLqiQpktJUJFIecBATpANLTbR6QKFE2IlvKwyYMUyD3BvqqHjggjUODyAeO1JRvCQURuGtxTR
	TXV+ao5hPcna9Qg69fOSzMKe88Y+R2FscDreK+9VYQxPccxThlOwuwRVkIOMkKPPW2E3YmkJwnpp5
	hI9wjHtpkW9H0LTEUtS5wg1lnnGrybyEDHhSXyf+kC3mfjsnHPuHbNHXxivu21usGAHXAq4UJ3Gbf
	xZKETLPXfskjVD5qDJToL8/OwZyv3uj4CBGIlYPVu30ZZSQg+0sjqEuigidlUPxO5PjMt3vkCmXYy
	0S7QxGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULKA-0000000BWs3-0W0o;
	Mon, 29 Jan 2024 06:40:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULK7-0000000BWqO-02et;
	Mon, 29 Jan 2024 06:40:52 +0000
X-UUID: 54bad99cbe7111ee9a263b4415211400-20240128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iRfjJ9YWROks75IUMtZC2wrUKi1suXGk03fbJUFbyt0=;
	b=jhkTa5bBLiYUT3wpEltBxfzcWPuTQQZYVqddzaf9asJdWmMcexNnkzGzCmHJqKWIzWSQxBOVUfhdMicHCknFw6ecI1RAoTomn2is7LHQtJgekjkE1ZtA2Lo6HW2V877F/BsOqusz6vAkJ+Cfu6vXriNcO0HJT9lNCgFAU1VnBUE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:75cf0086-2f45-4f03-be6e-9c7193c9fb8f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6e16cf4,CLOUDID:72ed41fe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 54bad99cbe7111ee9a263b4415211400-20240128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 558757812; Sun, 28 Jan 2024 23:40:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 14:30:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 14:30:38 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,03/22] v4l2: verify restricted dmabufs are used in restricted queue
Date: Mon, 29 Jan 2024 14:30:06 +0800
Message-ID: <20240129063025.29251-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129063025.29251-1-yunfei.dong@mediatek.com>
References: <20240129063025.29251-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.360000-8.000000
X-TMASE-MatchedRID: vT/skvKLwFh/+iNkyaz33x+WEMjoO9WWTJDl9FKHbrn8dcjERAe6XpPD
	bikkMnICYUA4QKGgNJ2/QAgXHCg/RXdWNVeH9NKPSEQN/D/3cG4k9Lf/qe8xx9VU7IWeAUCLMCm
	LSFOvZt1yylwV7Bc73YAy6p60ZV62fJ5/bZ6npdiyO81X3yak88kZdO1mPd6HHujJdWgMIOuuBc
	q5ylGQImmWoby5Y3Os7MRn2aF6FKR+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.360000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DF28679987472B888EA7E9A1D6228B4E0BCD01647BD0B2DD86B95E8C06EC4EB42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_224051_081922_AD588E4D 
X-CRM114-Status: GOOD (  12.13  )
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

From: Jeffrey Kardatzke <jkardatzke@google.com>

Verfies in the dmabuf implementations that if the restricted memory
flag is set for a queue that the dmabuf submitted to the queue is
unmappable.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 ++++++++
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 3d4fd4ef5310..f953570fef27 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -710,6 +710,14 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
 		return -EINVAL;
 	}
 
+	/* Verify the dmabuf is restricted if we are in restricted mode, this is done
+	 * by validating there is no page entry for the dmabuf.
+	 */
+	if (buf->vb->vb2_queue->restricted_mem && sg_page(sgt->sgl)) {
+		pr_err("restricted queue requires restricted dma_buf");
+		return -EINVAL;
+	}
+
 	/* checking if dmabuf is big enough to store contiguous chunk */
 	contig_size = vb2_dc_get_contiguous_size(sgt);
 	if (contig_size < buf->size) {
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 6975a71d740f..f87bd3f40b9b 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -570,6 +570,14 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
 		return -EINVAL;
 	}
 
+	/* Verify the dmabuf is restricted if we are in restricted mode, this is done
+	 * by validating there is no page entry for the dmabuf.
+	 */
+	if (buf->vb->vb2_queue->restricted_mem && !sg_page(sgt->sgl)) {
+		pr_err("restricted queue requires restricted dma_buf");
+		return -EINVAL;
+	}
+
 	buf->dma_sgt = sgt;
 	buf->vaddr = NULL;
 
-- 
2.18.0


