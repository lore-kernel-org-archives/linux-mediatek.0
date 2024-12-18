Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE809E77187
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2024 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oSmadU8r0m/jAstE7lBKy2o54FyM5MvoTj7czqiYO4Y=; b=uiqa+efdg1sdwG1o3IVu84y/nP
	b1QoqK8zti6dr4vcFup2rWNuVLDKjjtabYR54895ihcY4rZxRUG7Vl8Hxy/R3IS8gqsrSZb/7Efk/
	uJNj9wJHeln45sBHFa9kj25sk6J5RSY1dC4iPwHBxf+aH+CtZ0GtQAVl+hg5v+5rRToNQlRyYyT5J
	Hrrmf6I7hbBfMAr1n+H06KLEEzFsRSWtk5qiafFz7BxLuT0RzykrCZDRWhTubF102rJ7d2NezjtpS
	Yvz6Py/JpSXuXi2CrFReQ1SkE33dZihEhySJkx2AR1U8ka1PGbPKcZM4LbfUdJ4pZF3KXVhCxB1jr
	EFaW98Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrEq-0000000GFWx-10Wh;
	Wed, 18 Dec 2024 10:25:08 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNq3x-0000000G1fr-1ZK9;
	Wed, 18 Dec 2024 09:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1734512974;
	bh=oSmadU8r0m/jAstE7lBKy2o54FyM5MvoTj7czqiYO4Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BQ4v/j/uUMScDCAzrIEmC+8R+DfMkcHVHNwkJCPULPijoB2qO4PLHMmHMAHl6mnLn
	 by8LwSerGGRp658O36mVTSR3OBPDlSANJD1nASyh6uFcNWKyy0781ziXrqX4KW1TH2
	 a1DZE12H3O2sWI2T3GbLwTzdyMevzUtWXEG8JKx4=
X-QQ-mid: bizesmtpip4t1734512924ta12gj3
X-QQ-Originating-IP: dKoav+z8nrulxgB/v6xyTXVff+GrvYyc2HS0hpJYez8=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Dec 2024 17:08:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8655085733377736607
From: WangYuli <wangyuli@uniontech.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	davem@davemloft.net,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	alexander.deucher@amd.com,
	gregkh@linuxfoundation.org,
	rodrigo.vivi@intel.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	raoxu@uniontech.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	cug_yangyuancong@hotmail.com,
	lorenzo.bianconi@redhat.com,
	kvalo@codeaurora.org,
	sidhayn@gmail.com,
	lorenzo.bianconi83@gmail.com,
	sgruszka@redhat.com,
	keescook@chromium.org,
	markus.theil@tu-ilmenau.de,
	gustavoars@kernel.org,
	stf_xl@wp.pl,
	romain.perier@gmail.com,
	apais@linux.microsoft.com,
	mrkiko.rs@gmail.com,
	oliver@neukum.org,
	woojung.huh@microchip.com,
	helmut.schaa@googlemail.com,
	mailhol.vincent@wanadoo.fr,
	dokyungs@yonsei.ac.kr,
	deren.wu@mediatek.com,
	daniel@makrotopia.org,
	sujuan.chen@mediatek.com,
	mikhail.v.gavrilov@gmail.com,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	leitao@debian.org,
	dsahern@kernel.org,
	weiwan@google.com,
	netdev@vger.kernel.org,
	horms@kernel.org,
	andrew@lunn.ch,
	leit@fb.com,
	wang.zhao@mediatek.com,
	chui-hao.chiu@mediatek.com,
	lynxis@fe80.eu,
	mingyen.hsieh@mediatek.com,
	yn.chen@mediatek.com,
	quan.zhou@mediatek.com,
	dzm91@hust.edu.cn,
	gch981213@gmail.com,
	git@qrsnap.io,
	jiefeng_li@hust.edu.cn,
	nelson.yu@mediatek.com,
	rong.yan@mediatek.com,
	Bo.Jiao@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND. PATCH] mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
Date: Wed, 18 Dec 2024 17:08:33 +0800
Message-ID: <1E6ABDEA91ADAB1A+20241218090833.140045-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M0tShcw66QH6DRHIxOxP0JcYy3ZDIBWatWJTH4C7JqCvNr5xHO13HQuW
	sseRrf3bv4LtcETNSrMXVgczj2m+cNqVmnb963SJLo0kYm29ozFnWaF6A73SsXZo8bGEmy6
	IhrlToScxBDq5mEbWxaJE1AiPcQJCwIyBJ8+DqT9xk+E4m6crPesREI2QVh+UzrDLF1cZGP
	NVMsYklkSnndTl+nVk1Wnm6OJBmyGlBOnUowjH8hNUwNtPtm+zh9C5u3On9zKIvkBkOPtKJ
	zKIhCpCYW0PDe5v+1VESJGib//eRTtXGwO8RwmhZhjIqCKccpUQO5clwf580UycMd3D8dWc
	jIodeKzKCssAYsPIPEymWLUxrSSgbJ3PPcSKPv2WMr8Q3irqeCFAKfgnL1xB/ZBqn5isfc6
	G/B13DcSZUd5GJPLhIOJGSXllzsW7InMyLVjy6HMXavhLw2e28KGlhqn4l1I7FHVKFbbZV4
	HVhUsz2a65MwISdp7yrIvUVirVwL2LJhzUpIM1gRNJQFa1bBao/8z7SrEzsvefjnCULva3Y
	3ZBI4Z3+zertr7eZvQDPlRvrEToaQ210VSqa6XsidZ8E0iKI11a6y0Yaxbn13Hx609v7DRI
	peSN0gRwfgkXahJfluM2OG/1rMkC9cTYTeiwX0i0AhcHC1D/s/mWdTueXqlZRmMZH7ZAsju
	NmmX/cO9XaAtk03WauI3aCshgMJQlPk7gUa7ICxO46WWgjRkXiwBBjnS+lZesyFUiILjV8v
	viBHkPmxcEODpo8n11A35e+iiQI8uVqY8ENKHS2PrnlVcrwvdlea0HbEev/vRUfG34jKtr4
	L85mTsC/WnCkxkdLJ/tsEO90IUQOWoNz6SxBTJlKVI6WG5hzHSLINScaQ/0zBSMhhCFw9bE
	rpD7eqfZYzIvrYCYbxTloTZlDFC+1TgldijZeILsWigaT6DUG3WX4x5871WNtw+j4A5VXs1
	J5gyvJ9z2j+E5EzIGNKUgTmvzL4yXgl7R1Mk1I0CPc378Fw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_010950_147364_5554EA9E 
X-CRM114-Status: UNSURE (   8.92  )
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

When initializing the network card, unplugging the device will
trigger an -EPROTO error, resulting in a flood of error messages
being printed frantically.

Co-developed-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 58ff06823389..f9e67b8c3b3c 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -33,9 +33,9 @@ int __mt76u_vendor_request(struct mt76_dev *dev, u8 req, u8 req_type,
 
 		ret = usb_control_msg(udev, pipe, req, req_type, val,
 				      offset, buf, len, MT_VEND_REQ_TOUT_MS);
-		if (ret == -ENODEV)
+		if (ret == -ENODEV || ret == -EPROTO)
 			set_bit(MT76_REMOVED, &dev->phy.state);
-		if (ret >= 0 || ret == -ENODEV)
+		if (ret >= 0 || ret == -ENODEV || ret == -EPROTO)
 			return ret;
 		usleep_range(5000, 10000);
 	}
-- 
2.45.2


