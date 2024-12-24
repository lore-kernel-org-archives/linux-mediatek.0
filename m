Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D80FE77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlFS13odVb55GccO5hmoQYgmewqIs0Q10x0eG5VUCq8=; b=h9liCHQncwnFFuWI2iso+gapDz
	0T5d09CG5CNwY+Uo8nfyZOoJO61sRrgAVY1CQ0XJd23l5DGDbHJ5NaIgy/ivJFIHIEDaQb2yCvSjW
	6LvOOTkWM9XSpweRLGXzJiE1ai0X6eojqBu8OmbOVogfgZrs0Yf/2iaoQOHceIDFZe9ljSot4fjHa
	dZxx6Ne3FCz6fuKkcVi8xTjEHjZrNisqOYujW+cefQzBZe9kwZGMyJubaS9FM5iE+APZXUnm65+5N
	RHQPWJdL2CTTNqkedxxqVJC9m3YXTFWx6lFL0XyOhTmx7eXw74tPsMi84kspNkEYSFh1dkavT0A6U
	w2MSXSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0g1-0000000BXWe-2EyX;
	Tue, 24 Dec 2024 08:54:05 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0fu-0000000BXRf-2iNM;
	Tue, 24 Dec 2024 08:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1735030423;
	bh=hlFS13odVb55GccO5hmoQYgmewqIs0Q10x0eG5VUCq8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=k6d2X/hdTdTocZzau6nD9TI9fF6cO9btESnKDPkbjtaJ4jRMem/N3f+BlJDzs9bFS
	 bBsxHwBacxjFUOKlYxK3A8heBpy4wf1dXEQC3Oe/8CrNassAHPaYGZWcS1FQUTs7v0
	 4UpUy+jStKsUNhEKj5I36SvHZUsouEI4zOj4p674=
X-QQ-mid: bizesmtpip3t1735030374tjbdwos
X-QQ-Originating-IP: +Rx9ITqM/H7d062Vb3FxXVe37HRvYxsU2EFSjD4Gbak=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Dec 2024 16:52:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11559618080003878219
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
Subject: [PATCH] wifi: mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
Date: Tue, 24 Dec 2024 16:52:44 +0800
Message-ID: <BA065B146422EE5B+20241224085244.629015-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NMguc1TmhkUh3PCes9G2PpJteC6Exx2Q3HrNXr06xUmGb+BXnEf2VlaE
	Dnpt2EgtfoGzzCfS/PoX1a8i+cqKnNvLc9vi1boa9QS1032/w9MRt1w5L/z+EjqwiOC5TBw
	ohL8PhMyLXP6oqYUvc6n9mFDg5MNO2vSjsCrxLW48WiIKBSmeq+WUI1/qFDrGCkWWNrRu+W
	pIVIQOEjXLrEiPN1zORGyxRiWCfykwYmFc38bfipTfDnFM/GbYBbrLSpRApRfSm9KbZsQJL
	xqGpE5QEhU/9DLByUahXbEIbRhGHZbfwwfN8oduAPdcYwD630CAiqMDCRnnpLPCDaPgG5ud
	kRoqgpYuzSQXkJkBlYGGfRTqr7htb30UErbrmBmFY85DdTHzR/HY+O428AemeuBWtF7SNtc
	ZIDk2FYUH9W+z+ehircpSyrCAvpkWwqptWFCTbEd9UHwGohpnuB3h9TPvaXhiku/5MFAXge
	3hDERKTVda96tCT+G3aaJM74geCFEabyyLmWh+irECpFKEqJTNZ5htBL51AlI+k0zm/caLG
	CJ/nqcpoKz7T8CmTWN/w3ZXZxu9DcZfK+FA+3juNptxfUf+OhDXLxwDNeFvzFPq8u06Be1O
	mE+fXRC3O8//I8aMNZrKUbPwo/1Q2X1Ei32R7Oq+qmLlwX9ngV5ORw8oEiVxjxX6huHBcyH
	kCB3vWdVEyhlEDdI+pD6C0XxjBm2zJQ1jCh8K3SZ5KitKJt5KVmO4ctTtY6w7dAJT231mA9
	Rk+/x5wcMVOzpWzOSrrISgE9Ui00F1LDMEP37CC66KhFgo+iAVqe6hmzMickMBPZ32eEdoO
	GQXgtUl0fm5bbBmC0ddIDgmXlzDVaNyu30Kej9RfEQXP7BfmCsPGQCrT7FGx2KgQ07F1EFe
	s6fEma0+4PgxX/i/EcheWacroOObJ5aoPhcX49GBgD8LvV/IP8TVrrM6qpdFuGmPID4OL5m
	XpZ35BKKzJGMQkHZtTRmzmhK9XX6LfkFrR3ry2dR7DfFR8JNeCv9CFBbxKRiKK8EmTck=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_005359_556072_1B01F9AE 
X-CRM114-Status: GOOD (  13.30  )
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

The exception is printed as follows：

         mt76x2u 2-2.4:1.0: vendor request req:47 off:9018 failed:-71
         mt76x2u 2-2.4:1.0: vendor request req:47 off:9018 failed:-71
         ...

It will continue to print more than 2000 times for about 5 minutes,
causing the usb device to be unable to be disconnected. During this
period, the usb port cannot recognize the new device because the old
device has not disconnected.

There may be other operating methods that cause -EPROTO, but -EPROTO is
a low-level hardware error. It is unwise to repeat vendor requests
expecting to read correct data. It is a better choice to treat -EPROTO
and -ENODEV the same way。

Similar to commit 9b0f100c1970 ("mt76: usb: process URBs with status
EPROTO properly") do no schedule rx_worker for urb marked with status
set  -EPROTO. I also reproduced this situation when plugging and
unplugging the device, and this patch is effective.

Just do not vendor request again for urb marked with status set -EPROTO.

Link: https://lore.kernel.org/all/531681bd-30f5-4a70-a156-bf8754b8e072@intel.com/
Fixes: b40b15e1521f ("mt76: add usb support to mt76 layer")
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


