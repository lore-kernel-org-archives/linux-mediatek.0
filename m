Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BD8C54E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CuI0Z/csrhVEtus/UjC+4p8edQ1KfuBqZk1DeljPvkQ=; b=aIa51VJ90Lw4vW
	YyX8RjIhM7Tkc0S2Q0oaGNMnLfTl0m80bgC2opXKuJVyOe8ntYVWfC68B7EyIzln/6bQWLjt6sHIn
	zyTG07ulYFzN5ewTxSwlAlWvYKAFbQDj4Wy713cVvnhDHEQK+vXdSohoddn/yaQ9+M0fj51kXqFHg
	ufsKCx59/MDLvYXyqSHnR82GcCB46j5nu1ngsBtGUCRNAYPQHxc71d1c3y6GWs7MQ/AOWO1+OHmQQ
	p8ZT7vCAjNiAIlbjAKFm7zVFC0SqghAdQwgutMSg1duqDNRm73hj+4uU5ceOzzfDTej3deK9IuqrQ
	TPWZIDQZlduu60sJx8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjymH-00000005Cjq-2MPm;
	Tue, 12 Mar 2024 09:50:33 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjymB-00000005Cf1-3esc;
	Tue, 12 Mar 2024 09:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710237024;
	bh=Wz+MQcHYlshyiHHZBfjQ1ecKs45madnSOe9Ok8w+hVc=;
	h=From:Subject:Date:To:Cc:From;
	b=ELc9u5bPy7qgIRdKwOD3m2vyGFlB27/9suVT8ObmeEha8xwkgYSOnEEinUcFgU+lc
	 SUSxpBEsVhbCdXm9cbtt6HeL6LnCdEAaJF2rlu623PMG7M0l6a9tnWtr+dFWiEFyUT
	 E9WCPS5ldszTiKciKmYEUhky3qyfANwLq+eS6NdJAwkCKOF3bcuHfCHCv9arkOH71p
	 e80cEw+Ow45z8+TGziwh2fGclQP3qVBCBFTE4iRP8glD9ELVoWnEPDjjTU/zOJgoJH
	 U4aF/KP4y8aK0+T3yU7am8nfc6QDcjBCHWiEg5uJCgza9ebv0czltkJ/E9F15UeUUF
	 8xcwRBdWuIIwQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2A71E37813E5;
	Tue, 12 Mar 2024 09:50:24 +0000 (UTC)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH v2 0/3] Mediatek VCODEC documentation improvements
Date: Tue, 12 Mar 2024 10:50:19 +0100
Message-Id: <20240309-mediatek-typos-v2-0-7eaacd8e5401@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFsl8GUC/3WOywrCMBBFf6VkbTR9+Kgr/0OKTKZTO/SRkglFk
 f67acGly3PgcO9HCXkmUdfkozzNLOzGCNkuUdjC+CTNdWSVmawwuSn1QDVDoE6H9+RE4+VYn+0p
 RyhTFSMLQtp6GLFdM6EoAsPYeMaODr/6gU4GCoyyRpOnhl/bi3sVuWUJzr+3U3O62r/7c6qNbqA
 AsscyNye8oet7sM7DHt2gqmVZvr0Zve/lAAAA
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710237023; l=2589;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=Wz+MQcHYlshyiHHZBfjQ1ecKs45madnSOe9Ok8w+hVc=;
 b=7/vLW6rmqh9cBdFYba/6bidloxmb4v4TJ/gY8YNCjyOgew026yA2YaB38Z8h9AeEqJeJPIMP1bYA
 hm8feIbxArN3Si+TDH89Emi1m8ikvW/lnEak4lJQsV8aLnbJuvlE
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_025028_234747_765918E5 
X-CRM114-Status: GOOD (  10.80  )
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

The documentation within the codebase contains multiple issues regarding the
use of the english language, during my recent work on the driver I discovered
some of them and fixed them on the go. The list is by far not comprehensive but
as much as I am willing to do on the run.

To: Tiffany Lin <tiffany.lin@mediatek.com>
To: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: kernel@collabora.com
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

---
Changes in v2:
- Fix two changes (a newly introduced typo, badly formatted function description)
- Sort changes according to suggestion from the reviewer
- Apply reviewed-by tags
- Link to v1: https://lore.kernel.org/r/20240309-mediatek-typos-v1-0-fa4aeb59306c@collabora.com

---
Sebastian Fricke (3):
      media: mediatek: vcodec: Fix multiple typos
      media: mediatek: vcodec: Improve wording & fix grammatic issues
      media: mediatek: vcodec: Replace false function description

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c         |  2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  4 ++--
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c        | 20 ++++++++++----------
 .../mediatek/vcodec/decoder/vdec/vdec_h264_if.c      | 12 ++++++------
 .../vcodec/decoder/vdec/vdec_h264_req_common.h       | 15 +++++++++------
 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c  | 14 +++++++-------
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c     |  6 +++---
 .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c     |  4 ++--
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_if.c       |  4 ++--
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c   |  2 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c       |  4 ++--
 .../mediatek/vcodec/decoder/vdec_msg_queue.h         |  4 ++--
 .../platform/mediatek/vcodec/decoder/vdec_vpu_if.h   |  4 ++--
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c         |  2 +-
 .../platform/mediatek/vcodec/encoder/venc_drv_if.h   |  2 +-
 15 files changed, 51 insertions(+), 48 deletions(-)
---
base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
change-id: 20240309-mediatek-typos-c85d7b63ca91

Best regards,
-- 
Sebastian Fricke <sebastian.fricke@collabora.com>

