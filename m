Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42542C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 07:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6VOElouc2GMG6bSXp2UcAdff2CtTi6AX9Q0p7itVxKA=; b=QczqnPRvpQ/MgqzNasBUwF7j9m
	du1iRF5jz7Y4+OCN83AukPkdlqtEE7k9D7K0T5Lba0PN0Cw6ImWfwhaByWg1zSWDn0YMr8OQphXEH
	rRTe3VUdpHfep959Ugd2sDMtOoH0LhOLvSO6DPcM8cp9esbfVFGLnQr18g4IBihB25FLaaYsE2a0h
	5CmWudBrNt3rWbo/o/iyVeMDQWoSFpaDb0ZUrVP00Aab2IE9vnQlgTa1WyoHKpdQYF/5WA3zEVkk6
	XRGKbPm44Bsp5+u75ZKr6oG4sst+2TxICZjudhFekGfQC3SDQGpLTmxW779IPUDewyx0ZPY3zk9du
	cC9C70hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj0W-004fww-1E;
	Tue, 31 Oct 2023 07:17:48 +0000
Received: from m12.mail.163.com ([220.181.12.215])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj0H-004fr4-2n;
	Tue, 31 Oct 2023 07:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=6VOEl
	ouc2GMG6bSXp2UcAdff2CtTi6AX9Q0p7itVxKA=; b=hNxmtqR1fN7BA3q1g2ICx
	VRxNm0SfZHNYL8L8HAhhbgtHVZzrPE1itUvu7NgCwp0KV49XJXkpVznmWmoByFuM
	ZYiUfcvatLYHhxg7N8z/1ySEFYA3dV9lQPRlnpf4eOujyUP0z17QjALMBAKvGuE9
	+Wfd3c+X9AnW5EUCrnsBaU=
Received: from leanderwang-LC4.localdomain (unknown [111.206.145.21])
	by zwqz-smtp-mta-g3-3 (Coremail) with SMTP id _____wBn3ojfqUBlwMj4AQ--.51864S2;
	Tue, 31 Oct 2023 15:16:48 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: dmitry.osipenko@collabora.com
Cc: Kyrie.Wu@mediatek.com,
	bin.liu@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Irui.Wang@mediatek.com,
	security@kernel.org,
	hackerzheng666@gmail.com,
	1395428693sheep@gmail.com,
	alex000young@gmail.com,
	amergnat@baylibre.com,
	wenst@chromium.org,
	Zheng Wang <zyytlz.wz@163.com>
Subject: [PATCH v2 0/3] Fix use-after-free bug in mtk_jpeg_dec_device_run
Date: Tue, 31 Oct 2023 15:16:41 +0800
Message-Id: <20231031071644.20086-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBn3ojfqUBlwMj4AQ--.51864S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4xJry8Zw1DWryDtw4DCFg_yoWkArX_WF
	9Y9wn7uw18G3srJF4ayFy5ZrW8GFy7KF45GFZ8KFs5JFy5XFZIqF1vyrZ3uan3Wa12vF43
	Gr4FqF4UXw1j9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_1v3UUUUUU==
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbBdgAaU2DkptftmgAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_001734_658215_21E71424 
X-CRM114-Status: UNSURE (   7.98  )
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

Hello,

This v2 series fixes the use-after-free bug in mtk_jpeg_dec_device_run.
It inclues reverting the incomplete fix before and make the right fix.
Also,it fixes the error of timeout-worker-schedule in multiple-core
devices.

1. Remove cancel worker in mtk_jpeg_remove for the worker is only
registered in single-core device but we try to cacnel it in both
single-core and multiple-core devices.

2. Fix use-after-free bug by delay the schedule_delayed_work only if
mtk_jpeg_set_dec_dst runs successfully.

3. Delay the schedule_delayed_work in mtk_jpegdec_worker as it has same
code logic in mtk_jpeg_dec_device_run.

version 2 changes

-put the patches into on series suggested by Dmitry

Zheng Wang (3):
  media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to avoid the
    crash of multi-core JPEG devices
  media: mtk-jpeg: Fix use after free bug due to error path handling
    in mtk_jpeg_dec_device_run
  media: mtk-jpeg: Fix timeout schedule error in mtk_jpegdec_worker.

 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c    | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
2.25.1


