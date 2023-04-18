Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6DCC77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 21:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JaCzHqUqjCq6B1gERTBfnXC5SsiBwvsRDlsSMbIHYf4=; b=qqp/U8NDLBGUYwfGC/XaGIpcRI
	ZK4WxOdkRGmsaqEsOlsQFH/0NjM6gXnHuA+pnMfxQ5e96BfSZb3jP8sVB4Ywlsy02kvdCDEW5BRVN
	hD0d8k1Ru7PYwRapc8L5y/iIkKy82x+MQz5f7E+oSrBFwyuQs54Pdrli9FIbSaaIn72JlQoXXPyhk
	dH+BhL1kku/ay7SqmqZpC9Vjnkgnzl5nOz0h62LAiz1oE9oTg97XS8V6KXdxYTjOE4jXdUXG4mBfm
	tstkbAtmE7o/AdL5oCD3Ol2HySpO1MCBiJkc+y27gZoGo0WHl5GK40lpvbFs1ic0e3xToF66H4PRl
	2mMorYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1potEA-003Rct-1O;
	Tue, 18 Apr 2023 21:51:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1potE7-003RbO-0x;
	Tue, 18 Apr 2023 21:51:04 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8599B6603206;
	Tue, 18 Apr 2023 22:50:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681854660;
	bh=RGjq8g5zSwAVgKk0TGPC1T322t6+hUZkLQBY3DZCsjA=;
	h=From:To:Cc:Subject:Date:From;
	b=Br0CFSM/bNNEoa2cmi08w2PcL224kZEvs14SsLrjZDiVhdEyj0BqUKp3AfK19sIlY
	 BUae7lT0Kx8nvK/46VxRjtetrMQA1FsfQFqk2Y7qIjFuDkYMMAY4BcMfbMp+NaJRip
	 jSxSYACVjbo1zKHQBPAMksA51SPcEfdnzMoUUwDKGtXbjQP/zY0DE/guGbz5xjRytL
	 gkFZ8vJ9XWXI2bRtZQ30UySsit0/moqKCeUF1FC8K0WyLVO+1+vqJ1GVvTOWAlopFu
	 mrPowIxJJapDbkbovtst0QIhQ9DgmRRmR9IU0d66a+aZAo1AbC0E18fhAOLB+lePyV
	 LirMr8K+BJeEg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Revert "media: mediatek: vcodec: Fix bitstream crop information error"
Date: Tue, 18 Apr 2023 17:50:52 -0400
Message-Id: <20230418215052.2371755-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_145103_484375_5202C2C8 
X-CRM114-Status: GOOD (  14.09  )
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

This reverts commit cd61f3c6794bea2b717fe6083ca2ad189db75418. That
commit's purpose was to prevent the padding from being decoded when
userspace didn't set a selection, relying on the default one.

However, as described in the Step 6 of the Initialization procedure for
the Memory-to-Memory Stateful Video Encoder Interface [1]:

"Set the visible resolution for the stream metadata via
VIDIOC_S_SELECTION() on the OUTPUT queue if it is desired to be
different than the full OUTPUT resolution."

And from the Note:

"To avoid encoding the padding, the client needs to explicitly configure
this selection target"

Hence the behavior in the original commit doesn't follow the interface
and needs to be reverted.

This fixes the following v4l2-compliance failure observed on
mt8192-asurada-spherion:

		fail: v4l2-test-formats.cpp(924): sel.r.width != fmt.g_width()
	test VIDIOC_S_FMT: FAIL

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#initialization

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
Hi,

With this patch applied, there's only one failure left on
mt8192-asurada-spherion:

                fail: v4l2-test-controls.cpp(1167): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

But from the documentation I see that the V4L2_EVENT_EOS for stateful
encoder is deprecated behavior, so should the v4l2-compliance test be
the one changed to not require this?

We're enabling running v4l2-compliance with this driver in KernelCI [2],
so after we fix these two remaining issues it should be easy to notice
if any failures are introduced.

Thanks,
Nícolas

[2] https://github.com/kernelci/kernelci-core/pull/1889

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index db65e77bd373..9ff439a50f53 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -505,13 +505,13 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		f->fmt.pix.pixelformat = fmt->fourcc;
 	}
 
-	q_data->visible_width = f->fmt.pix_mp.width;
-	q_data->visible_height = f->fmt.pix_mp.height;
-	q_data->fmt = fmt;
-	ret = vidioc_try_fmt_out(ctx, f, q_data->fmt);
+	ret = vidioc_try_fmt_out(ctx, f, fmt);
 	if (ret)
 		return ret;
 
+	q_data->fmt = fmt;
+	q_data->visible_width = f->fmt.pix_mp.width;
+	q_data->visible_height = f->fmt.pix_mp.height;
 	q_data->coded_width = f->fmt.pix_mp.width;
 	q_data->coded_height = f->fmt.pix_mp.height;
 
-- 
2.40.0


