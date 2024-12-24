Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC62EE7718D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 13:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tt4InU9ECWo1vlqo+tRwvq1PmN9OePPjJcsttDYPSbo=; b=M78/5x/ot+w5TnrOv4qLqFETxa
	ek9tGmcywH4iyH8dPoverT8rBA/CuCph8vEV9qj/eyRJS7DnMCNdImkOHlqdUGArAW6M3MFej69E2
	tFb38HES9vCCQGIyvQPncbEFOV4+C4ZZi+89vvb/VX6H0yvjr9C2EPoZrWQOVlsW8tzmCskxMj/qa
	vJ9rEBxFlGnYdzNBGSuT93YGDOjzIua/Ew82zoos4tYu0USx+jj6SK1SFSbqhfnM7qOyHLzX9ykt7
	UpsLCdgyLyxzO7C2QYpC08NjfzgOybTkMe3P15yoAQkFz86CmVDEBHoE7T2HGSEs+bMGVIxUR2WKD
	nRfGMCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4d0-0000000C0uu-3Jsq;
	Tue, 24 Dec 2024 13:07:14 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4cz-0000000C0uZ-0QWF
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 13:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735045632;
	bh=Tt4InU9ECWo1vlqo+tRwvq1PmN9OePPjJcsttDYPSbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=eChWTMMIwxl32U1bXSofUk38xYqsUV4ca41i2WqCMpz8c3Z58pohxE72WqJBL02oo
	 115U9ARXbhViFjcsmpq3tBtB0hM7blF2m0zDbnVLy6h155iFbTcLP4Sur6PkdbRq1D
	 xw+/xM2HKq9vfiVFqsEwU5fG09XzrHYwOWU1sWZbEGjftOLg4xe4FVvPmt7GYQ7B7B
	 LlBY2uJ1b69DrxQF4g3HkktilO3RD06ARW6PWuEiyQy0HyFXIUOo7wG8e5MyIV1d7A
	 QYsjUcdteODQt9P+E9fQ/cej0S5Vd7nvkbzdLbJq2Ua0GKFKE4l6ZZB+XeEfT3zC5I
	 w1aGGGgLIAHEA==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 8A2D28001FD;
	Tue, 24 Dec 2024 13:06:56 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 24 Dec 2024 21:05:01 +0800
Subject: [PATCH v5 02/12] slimbus: core: Constify slim_eaddr_equal()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-const_dfc_done-v5-2-6623037414d4@quicinc.com>
References: <20241224-const_dfc_done-v5-0-6623037414d4@quicinc.com>
In-Reply-To: <20241224-const_dfc_done-v5-0-6623037414d4@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-sound@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: qLypl6fkadNdQJijofw2ji5DGrHQTi80
X-Proofpoint-ORIG-GUID: qLypl6fkadNdQJijofw2ji5DGrHQTi80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=801 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412240113
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_050713_163271_C29A2EBA 
X-CRM114-Status: UNSURE (   7.94  )
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

From: Zijun Hu <quic_zijuhu@quicinc.com>

bool slim_eaddr_equal(struct slim_eaddr *a, struct slim_eaddr *b)
does not modify @*a or @*b.

To prepare for constifying API device_find_child() later.

Constify this comparison function by simply changing its
parameter type to 'const struct slim_eaddr *'.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/slimbus/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 65e5515f7555e2eb840fedaf2dc4cc5d76dbc089..b5d5bbb9fdb6614ffd578f5754226b50e394f0df 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -328,7 +328,8 @@ void slim_report_absent(struct slim_device *sbdev)
 }
 EXPORT_SYMBOL_GPL(slim_report_absent);
 
-static bool slim_eaddr_equal(struct slim_eaddr *a, struct slim_eaddr *b)
+static bool slim_eaddr_equal(const struct slim_eaddr *a,
+			     const struct slim_eaddr *b)
 {
 	return (a->manf_id == b->manf_id &&
 		a->prod_code == b->prod_code &&

-- 
2.34.1


