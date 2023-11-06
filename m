Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB66C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h6TLWB9cdUKq7s1SXHoFgVVhZtXcumU4Vs0W88ItZxg=; b=bX6KBbmk7jjsrCEyQ2vxpmTLEI
	egItrYyxG5SeSrKIFVALSBGlQfxbEtVFBkNDWIOVhy49zRRX/yKsBmMt4h8EA2qFABO9DJB+QRbpV
	doetBa1T/Pko3/e/cThvIeFPTrFPCZ5o4ucXWRiWRiKpZCKKWT/nYviPY1iDNSTQJRzWIRpzZthUW
	O8RyAlfRCEPJkULTo5qKoBo1rPEuAUFAD3SDj8Eu9rV8ir0iAu8fxEV61pWhTIkMFMW/MC6GFqN2h
	iqWTpGm0A/le2j0JWHLtczj4SR08JL40Qw7L8nSNgxBQOP8mUDyBQgcQH1ONP/eBiXHtnZ/4sP34o
	5f3NLFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r00uM-00Gu6Z-2u;
	Mon, 06 Nov 2023 14:48:54 +0000
Received: from m15.mail.163.com ([45.254.50.220])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r00uJ-00Gu1f-1Z;
	Mon, 06 Nov 2023 14:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=h6TLW
	B9cdUKq7s1SXHoFgVVhZtXcumU4Vs0W88ItZxg=; b=ZPA7OufnOu36o5kXXHolF
	yHmqXp6ZOcgHEsclhhnuF4IXQ9/p5EpzgU603j7f+uYDb89cUabY7AFYi+rS5UWC
	asp5dZ/d38Q5NhDcz0+OO/J1GO/sdZysYrs3YaD4UCJzWFtHQpM/Gb/r6JX+UZ2A
	3SPNGLoWv8CwvY4yJwV9SM=
Received: from leanderwang-LC4.localdomain (unknown [111.206.145.21])
	by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id _____wAXH5Gu_Ehl9FmbBw--.1952S2;
	Mon, 06 Nov 2023 22:48:14 +0800 (CST)
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
	amergnat@baylibre.com,
	wenst@chromium.org,
	stable@vger.kernel.org,
	Zheng Wang <zyytlz.wz@163.com>
Subject: [RESEND PATCH v2 0/3] Fix use-after-free bug in mtk_jpeg_dec_device_run and fix schedule error in mtk_jpegdec_worker
Date: Mon,  6 Nov 2023 22:48:08 +0800
Message-Id: <20231106144811.868127-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXH5Gu_Ehl9FmbBw--.1952S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw45ury8KFyktr4DCry7GFg_yoWktrX_WF
	9Y9w1kuw18G3s8JF4ayFy5ZrW8KF9FgF45GFZ8KFs5JFy5XFZIqF1vy393uan3Wa1avF43
	Gr4FqF45Xw1j9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_rWrJUUUUU==
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbBmwggU1etjJUS8wAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_064852_147240_62B4C157 
X-CRM114-Status: UNSURE (   8.40  )
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
This patch fixes the security bug in chrome-os.
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


