Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97A8CF6498
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Sep 2024 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rGntS9xOFiEeM/CMGDTBCcX5N9b7TzQhEkYEMSmKp44=; b=vQc4w1VEMfGx8uJJtv/6K9h7wd
	yQc/a/tOmWXoXfHPhlIcZ7g10C2cumU4TAhcZMRttu3aixoVbZ5XukLTyIS1Psj2Zog/KfYs6nt1/
	S2xH3OLzx6yLz5HFUvE+6EW0tyyCPhwR2ILCloOw16VLuW5Qc0JXBvPKr7sbcBGpWcyUz2Oj+aT+J
	pzEGWzo16Npl8JgjpKLfE4KeXKtIYYmscsGeDyhKdmaHKAY8VcfONPz7XBXTKwxgKrAF5HYhhWwQZ
	6JnFHFcDHeDV+71iKGL+hJfLUw1cZ7SjztMMdnqTpdHyarsmCySxpY3M4Ge/B5TW3dFmrMoPvomUZ
	hAfdSqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sunaM-0000000EHsf-3VO0;
	Sun, 29 Sep 2024 06:39:14 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sunZ7-0000000EHpG-3Pxr;
	Sun, 29 Sep 2024 06:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1727591825;
	bh=rGntS9xOFiEeM/CMGDTBCcX5N9b7TzQhEkYEMSmKp44=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OCHLfPl8J+BtnCNeWhzCXsRIoFTEyG2N/eL1Vrys1IVbj2GxIz/2WzZcDPDMN2RLM
	 frTtQVlf2yvEnZ8z/xr2IgPAmBIeoErnUmBHHhstha0cas8uLlOQSD+t45Bv4OhUTW
	 n7t9NZey26OT7CvTCYQoDq7viQHTKRp/tDOUhaY4=
X-QQ-mid: bizesmtp86t1727591785to4qeecn
X-QQ-Originating-IP: 4QAUQmEcbPL5ZW/e8HH0uHALE+ArVLh7GTVKQP+BLfI=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 29 Sep 2024 14:36:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7147250867363797320
From: WangYuli <wangyuli@uniontech.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	raoxu@uniontech.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
Date: Sun, 29 Sep 2024 14:36:19 +0800
Message-ID: <B74B0BCDDB8EFA12+20240929063619.925099-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N879q09ZcJuCo8cdZGIGUzYUu3iC4NcEKPkotPAIjnsPuRsk4gvwQKbD
	NXBXWFuzTUXHlKNmwz0r1gv9VaPMEAKNWu+wNFMdG+IAm+WmY9B4JxCvE5fKigLyr1jAyyw
	/8fftgAKec41mvFjRXr+1VNC2BE3MmWaiOnwtncI3Ys6RE9iRCj9/kALm8OnrfGoIWdDGAc
	uEOJdaoiWV2UnWhsvg9mLzvz4jdGiwadRKMFDGomYMCOfrQ6rckBF+l+SnVrn2goDu3Ydd9
	zUzVjXYgK4/DNKdnnAMukdWlSDYOlApM8UoCG4CRlwWABP67WV88BOZ856t9uFuBYevKdlz
	MZvBd8NDfsxUhIz94xd5pkZErRCZf87u/NmHvJRYxnnX7dneIrabF3WcN/k/uIcEUwqy3DZ
	uBD0qt6lHOdVMlfjOp9MU9pVTR40lWzc2bzb9F2oTFxKH5Qaa7sBPgDA04Nzah3sJaSYGis
	SXpKDj7kPXEgH9SwE4cDzyauoklBWmbQ9/9lyQkC3CIHwFUlP2GHpA0IzfXSBvpWoGlGGNG
	Q363Ja7iySx1fDoy61ovsWXnw0GT5v4MnfWNVD5Bwky2haklhafCc4N/ILw3LKzehf+YBUk
	5NblpdA6SCbTk4QELh0bSR3LhaLrQ9aICbV+1QvJ1fGhPUJAzRbu9DNLsbUFoMFQLIPHlK3
	Qiqbs5ObjyE4vSJ/WD79KiKP20/ujRv6fbw/RKvic5VaBUfCiOI6y9VR1FzbFvtiGSrwg/j
	efuraxya79MfoseH4zo2vfcBBwDeAhryqvXB3szBb7Xy2GAfot9MwZykqjoEOnYY2Xz7xou
	BmC3WuuF48tvJVX8KyDC/Vm5RiTeD1xE1B0YZMNgZLbh9cjpAv2ZJhpA+M5top/mfSvqVhl
	cEGtch1nQ3obpKYIj+OsHH+3PjvaA7RRRFnxalowvuNmsXxbCS4FkFSDB1DFLGKYjUjHCpe
	s/QtA4Q/OnTJotHoL3idv2I/shWE8uZkpgHwaMr3Ba0973hX8ZM+TnmukehK4uiAXovC6Vi
	U5Mgsnrvqu+0iS+cfJ
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_233758_960739_316016F1 
X-CRM114-Status: UNSURE (   9.40  )
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


