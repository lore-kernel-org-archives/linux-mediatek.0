Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72884C54E4A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Mar 2024 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZgaZOMYwv0KBI7VrmvTL4MF9MdxAxT+eAMiWT4VSgLU=; b=2did7TLQE0Kfju
	7bGA/4KbeM5KL/LGksGZHSiCP2yL6rXuo4X+aIQY2kiZwsPMTcJ4RdrvNIoF6cKrolCK/hQ+fddka
	v49l4QPl0vhvQ1bDD11yaufpQh9PcdPDSwzzFWXPEjNupdHfIFHlljjWI0IN3N9xDdsMeoSZU8xEx
	rfXRgXlaBVDXQFgvT30QZblOgD9shH7kIG7IUHMINutrVmJhyRTxaZ1+z97QZkOXgQFpMlzB1mh9T
	JTYzyhKmw9XpiLwIDTly97hIgodvlBzvwj/sC9dEPN5sOAL/huwFS82FHN6AKSvkkF6r52yFT0h+D
	ZD02Qq779cmaW+qOMxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyJn-0000000Db9y-3R6z;
	Sat, 09 Mar 2024 15:08:59 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyJb-0000000Db1l-0vIs;
	Sat, 09 Mar 2024 15:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709996920;
	bh=31PkfWhO9EwrgdCPyiBVs/k/zyNrhWMw7xvb5zwugio=;
	h=From:Subject:Date:To:Cc:From;
	b=mLzs/VVega4YNVv4SENlLM/qRWV2TlJQfuJfBgbqQXk/CjAk/6PXI+tpk2kT9onxv
	 5AkXJ0zWitGaxrV/WLu/RuEDSC8MgoKz3/KUZhnPeU+/D7lBMIJ0p58KrcEYAxeiWZ
	 Pc4q9aUbNgOvGBDfTdBJ8tnG3PxR4zEOzGNgrH2Unu6eCt8HmBu8VqiJPZUnd+o3I4
	 tiS9VxlZ8tTU99HBMlzfUlPAmsITCeGXcM5LNB8MrVkIqSZ0gVR+7Qwz5hVtOlmTNV
	 PkcvvoEcEyvr20P+4dqm/4s8vElq4LGE2DsCN2f8QkAIyIcXisBj3fqO/FPYWH7Oww
	 G2K9BBSAxe2yQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 681503781FE9;
	Sat,  9 Mar 2024 15:08:40 +0000 (UTC)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH 0/3] Mediatek VCODEC documentation improvements
Date: Sat, 09 Mar 2024 16:08:37 +0100
Message-Id: <20240309-mediatek-typos-v1-0-fa4aeb59306c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHV77GUC/zXOWwrCMBCF4a2UeTaYtt7qVkRkMpnaoTQpmSBK6
 d5NBR//Ax+cBZSTsMK1WiDxS1RiKFHvKqABw5ON+NLQ2OZgW9uZib1g5tHkzxzV0OXoz+7UEnY1
 FORQ2biEgYaNKZchC4Y+CY28/+sHRZ04C+mG5sS9vH8vbvd1/QIctFhnlQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709996919; l=2297;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=31PkfWhO9EwrgdCPyiBVs/k/zyNrhWMw7xvb5zwugio=;
 b=OkOVcTTG2YGevUqfNzU1aWJ7+b+fkcOnRUpoGHmsooG/RmUwQJ0j7hRIrlJucOwy/MB2hN2NWwTx
 rIJv/+QEAXDzDj8eROpxp/B3bfFeLCa3nC+ps2Im7qR8nH9uUT8K
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_070847_589133_18F4111F 
X-CRM114-Status: UNSURE (   9.96  )
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
Sebastian Fricke (3):
      media: mediatek: vcodec: Fix multiple typos
      media: mediatek: vcodec: Improve wording & fix grammatic issues
      media: mediatek: vcodec: Replace false function description

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c         |  2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  4 ++--
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c        | 20 ++++++++++----------
 .../mediatek/vcodec/decoder/vdec/vdec_h264_if.c      | 12 ++++++------
 .../vcodec/decoder/vdec/vdec_h264_req_common.h       | 10 ++++++----
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
 15 files changed, 48 insertions(+), 46 deletions(-)
---
base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
change-id: 20240309-mediatek-typos-c85d7b63ca91

Best regards,
-- 
Sebastian Fricke <sebastian.fricke@collabora.com>

