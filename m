Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E67C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500DF61BE3
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 500DF61BE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQi3wF5dbyF3+3ufvPm4PY2kUR61108wLDNIHy6Ci9M=; b=x6HBVNwGhf/ea4
	izKel0i2eExXReQzem+ZdtcGasgv7+OqheCE1QWFRrVi/h0r4DFtZMR/xBnxpYCZ6ljxkTA4kSo6C
	qWr+BkxROnOi4LZQmRZZeJoYk74XvNMIqRiXE9hi4ZCP4I5h1SzwUJuM9MSQtBn9LgosmhMnGIJ1D
	L5jFphPOu6RKlyom7Xl7dCGPvAVkjDmCxvIWbYKsQyH72dkMClbhtDpfqntnCQ+gQumOh0TnynT5f
	oqw82Gnuyr4M4BJDrcjixsCTR+0Q/Hx1SVI2UN3VBSOTXdn5lRWaR/Bn3U36NhBAeqYGHHVXtZJO6
	4iGWaWOKdY2FQSapJ4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnKeO-004mi8-Cm; Wed, 17 Nov 2021 13:06:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnKeK-004mfT-JU
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 13:06:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 8DFAD1F45D02
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637154411; bh=wZ+ibyByRP8u5Nw9zLsABoLUSn6ypgyqQXE3oYQlGbw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AK3GvCft6MfgelkZPcKOyO8dqcA+EyLc8C9eVChsGlAJHIiwtdfhj96cRRHukFfpP
 0syn5EJqfwK6OK7e4//ZIcGSpjtO5u/ruV1mOCHPGh3g3b0MTD2XbcK35sVYCqxaut
 wdbjW55YKbBewS5ZpHFAKtbpvcNiuDvC2Opzmc95jyHvUVrzHpDy8HGHzRch+X3LuL
 8tJC2WMFZaU8C76vJb0OTsHO5vNtQaUgWv+MId2bahJnK0q7NxMyBZwaMJe3Y2KMMH
 XhBhVL+SORnCkqTtkYMw1lG2kyEh3XvXhpEXqYogfOTTen2weSYBNj2ZJvs+JGgl1/
 L0H0jKHEvs91g==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 acourbot@chromium.org, andrew-ct.chen@mediatek.com, courbot@chromium.org,
 dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
 hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, tfiga@chromium.org, tiffany.lin@mediatek.com
Subject: [PATCH v2 2/7] media: mtk-vcodec: call v4l2_m2m_ctx_release first
 when file is released
Date: Wed, 17 Nov 2021 15:06:30 +0200
Message-Id: <20211117130635.11633-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_050652_923554_D2CEE91E 
X-CRM114-Status: GOOD (  10.96  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The func v4l2_m2m_ctx_release waits for currently running jobs
to finish and then stop streaming both queues and frees the buffers.
All this should be done before the call to mtk_vcodec_enc_release
which frees the encoder handler. This fixes null-pointer dereference bug:

[gst-master] root@debian:~/gst-build# [  638.019193] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001a0
[  638.028076] Mem abort info:
[  638.030932]   ESR = 0x96000004
[  638.033978]   EC = 0x25: DABT (current EL), IL = 32 bits
[  638.039293]   SET = 0, FnV = 0
[  638.042338]   EA = 0, S1PTW = 0
[  638.045474]   FSC = 0x04: level 0 translation fault
[  638.050349] Data abort info:
[  638.053224]   ISV = 0, ISS = 0x00000004
[  638.057055]   CM = 0, WnR = 0
[  638.060018] user pgtable: 4k pages, 48-bit VAs, pgdp=000000012b6db000
[  638.066485] [00000000000001a0] pgd=0000000000000000, p4d=0000000000000000
[  638.073277] Internal error: Oops: 96000004 [#1] SMP
[  638.078145] Modules linked in: rfkill mtk_vcodec_dec mtk_vcodec_enc uvcvideo mtk_mdp mtk_vcodec_common videobuf2_dma_contig v4l2_h264 cdc_ether v4l2_mem2mem videobuf2_vmalloc usbnet videobuf2_memops videobuf2_v4l2 r8152 videobuf2_common videodev cros_ec_sensors cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf elan_i2c elants_i2c sbs_battery mc cros_usbpd_charger cros_ec_chardev cros_usbpd_logger crct10dif_ce mtk_vpu fuse ip_tables x_tables ipv6
[  638.118583] CPU: 0 PID: 212 Comm: kworker/u8:5 Not tainted 5.15.0-06427-g58a1d4dcfc74-dirty #109
[  638.127357] Hardware name: Google Elm (DT)
[  638.131444] Workqueue: mtk-vcodec-enc mtk_venc_worker [mtk_vcodec_enc]
[  638.137974] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  638.144925] pc : vp8_enc_encode+0x34/0x2b0 [mtk_vcodec_enc]
[  638.150493] lr : venc_if_encode+0xac/0x1b0 [mtk_vcodec_enc]
[  638.156060] sp : ffff8000124d3c40
[  638.159364] x29: ffff8000124d3c40 x28: 0000000000000000 x27: 0000000000000000
[  638.166493] x26: 0000000000000000 x25: ffff0000e7f252d0 x24: ffff8000124d3d58
[  638.173621] x23: ffff8000124d3d58 x22: ffff8000124d3d60 x21: 0000000000000001
[  638.180750] x20: ffff80001137e000 x19: 0000000000000000 x18: 0000000000000001
[  638.187878] x17: 000000040044ffff x16: 00400032b5503510 x15: 0000000000000000
[  638.195006] x14: ffff8000118536c0 x13: ffff8000ee1da000 x12: 0000000030d4d91d
[  638.202134] x11: 0000000000000000 x10: 0000000000000980 x9 : ffff8000124d3b20
[  638.209262] x8 : ffff0000c18d4ea0 x7 : ffff0000c18d44c0 x6 : ffff0000c18d44c0
[  638.216391] x5 : ffff80000904a3b0 x4 : ffff8000124d3d58 x3 : ffff8000124d3d60
[  638.223519] x2 : ffff8000124d3d78 x1 : 0000000000000001 x0 : ffff80001137efb8
[  638.230648] Call trace:
[  638.233084]  vp8_enc_encode+0x34/0x2b0 [mtk_vcodec_enc]
[  638.238304]  venc_if_encode+0xac/0x1b0 [mtk_vcodec_enc]
[  638.243525]  mtk_venc_worker+0x110/0x250 [mtk_vcodec_enc]
[  638.248918]  process_one_work+0x1f8/0x498
[  638.252923]  worker_thread+0x140/0x538
[  638.256664]  kthread+0x148/0x158
[  638.259884]  ret_from_fork+0x10/0x20
[  638.263455] Code: f90023f9 2a0103f5 aa0303f6 aa0403f8 (f940d277)
[  638.269538] ---[ end trace e374fc10f8e181f5 ]---

Fixes: 4e855a6efa547 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index eed67394cf46..f898226fc53e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -214,11 +214,11 @@ static int fops_vcodec_release(struct file *file)
 	mtk_v4l2_debug(1, "[%d] encoder", ctx->id);
 	mutex_lock(&dev->dev_mutex);
 
+	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	mtk_vcodec_enc_release(ctx);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
-	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 
 	list_del_init(&ctx->list);
 	kfree(ctx);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
