Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B527D30016
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NGsNYJyizCJbNwNUHsGpSxDWG0JTrkN/fC3Sa5bnBWo=; b=4psqLcUXXHIUmoSCpVCV+awb5u
	sj/jKVPExIFhcvYBQyaA30SqssEWoETbeixyOKSgeXiaURyIAEosi7bKIRT/Mv8mXRfJ9Wak4S4dy
	kKoc1ecNdtsfbQC5dcYZLC/JEHhwW33+P4EtxvH73cUpBRK4U0OuTtGfRLdcxF3Gkry1Atbf4jC07
	3PnxgLxBPYvC0ySbR+H2X9JBJPgYqTfnog9GdEfL9LpVxZTH16gXL98YiMENCDNXiXGZ0J/0IRREp
	DvvNTFLj4supYX8HSYGxVqaF7rtygoxbgF1xYNp3KaubVMS8QTAJtQOvWwZcy73gYkVk8FuZkNLdx
	eaO3MfIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1oiS-00000001A7J-1shU;
	Fri, 18 Oct 2024 15:16:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ogr-00000001A05-0FWB;
	Fri, 18 Oct 2024 15:14:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C3135C5DA2;
	Fri, 18 Oct 2024 15:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1663C4CEC3;
	Fri, 18 Oct 2024 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729264496;
	bh=wGv8jPPiROeuMxdNHPFP2YovhdUZEU8BVdG/fDTbVUk=;
	h=From:To:Cc:Subject:Date:From;
	b=r6v2Ui0IRj6XKF+J/obS7ioyIJ41+8RMhQmnTdTxUqxRwAMLyD5vNxrj7PQ2VLzwC
	 xtB1VWF2Z9P/miSklSkUTBewkOX4YuyzipIFzjM7e1jgQ5xdDMHf6VHS3tU+Zoy6/C
	 GhAMdJUVeeoqjupZi6bIpf+asTlNfChkyW2femw6bItSD70XgG5Y4K7FMFoIcZ5bRB
	 /FiKp7QVVnPOpMCmEOfg7CIVL5/1SoMFgxeuPox10E89mW5R+GlQ15d7pB1+xgWsEs
	 jgXZmxjX3Ojm1+yyrhP0XAJI8/HRzajHr1T4nrvzTlx26EUQ32IV4kVtjN3A6Lbwny
	 3S1m4tb2P3YgA==
From: Arnd Bergmann <arnd@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH] media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline
Date: Fri, 18 Oct 2024 15:14:42 +0000
Message-Id: <20241018151448.3694052-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_081457_167079_5642CB75 
X-CRM114-Status: GOOD (  13.11  )
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

From: Arnd Bergmann <arnd@arndb.de>

With KASAN enabled, clang fails to optimize the inline version of
vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
of temporary values spilled to the stack:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]

This seems to affect all versions of clang including the latest (clang-20),
but the degree of stack overhead is different per release.

Marking the function as noinline_for_stack is harmless here and avoids
the problem completely.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I have not come to a conclusion on how exactly clang fails to do this
right, but can provide the .config and/or preprocessed source files
and command line if we think this should be fixed in clang.
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index eea709d93820..47c302745c1d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 	return ret;
 }
 
-static
+/* clang stack usage explodes if this is inlined */
+static noinline_for_stack
 void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
 					struct vdec_vp9_slice_frame_counts *counts,
 					struct v4l2_vp9_frame_symbol_counts *counts_helper)
-- 
2.39.5


