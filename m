Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895C5CD13D3
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmhpT4qL3TiNhJTJA/kcqIVRxB45Z2PLUQn6pZidorQ=; b=L4QqvyCQ7PESHU+u/zEdNvoS9P
	QWcp0tWsngI/IR7PxiuQs15KD/PzJ1GFLy7SXyBPDDv6TKKPRVAPxWJ/N1PDNOSkAHl8lLm0KX+/1
	6OPMpdW4KS1oR3ISivFqxOGlLpFPPB3yuVnRIcbcmwuvPrXowX203Fg/lK4Az1HhqW9EBx6Y4YO4H
	7liyBn/7g5A7P3T73Nf7nZsfZ6+hsY08cGLT8AowxuzmWiz/N/IEAM/QMVTT3Q0i4QoPX3cOLVJYq
	8RJCqpKVB8x70Kf4CBm7z4PTgvoOJtKP4prQQsyGBozP41lewt7lcUVJv+/ZbWsq7myaUGjcS7i/w
	N8yUnPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIURR-00000005kSD-2wQB;
	Thu, 30 Apr 2026 16:40:45 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIURB-00000005kGU-2YWQ;
	Thu, 30 Apr 2026 16:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nm
	hpT4qL3TiNhJTJA/kcqIVRxB45Z2PLUQn6pZidorQ=; b=W0e3U/bgin+AuHDDL0
	BIQE7AKnX9pGu7MeN0X9SlxSCh4a2+z6e7KWdCDcBevH0JL6NLRJWHi5ZoEMJB/+
	dybTTH+4RPO0CBYg5V1jNxYmicqJSF/KCZf6YlYTr+sAlxa0EyFBnT2Dk7e2AkjC
	rovquYX589WMPKQ5gPBKI9a1E=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S8;
	Fri, 01 May 2026 00:39:32 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	mathias.nyman@intel.com,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 6/6] usb: typec: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:19 +0800
Message-Id: <20260430163919.47372-7-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163919.47372-1-18255117159@163.com>
References: <20260430163919.47372-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnUmm+hfNptZrZCg--.19910S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4fWw1UJw1Uuw43GFg_yoWkXFc_Gr
	18C3Zayr9YvFW5A3W3Ga9akr1kta1jg3WagF1rtF1rAr1DKr18Wr45C3ykJFyjga1F9r95
	CFn5XrykZr1fCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMTmS3UUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxATpjWnzhcToYQAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094030_016841_0A5547B8 
X-CRM114-Status: UNSURE (   8.58  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 0148b8f50412..24c87dfa6b64 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -141,13 +141,10 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 	}
 
 	if (vconn_pres) {
-		if (polarity == TYPEC_POLARITY_CC2) {
-			reg &= ~TCPC_ROLE_CTRL_CC1;
-			reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_OPEN);
-		} else {
-			reg &= ~TCPC_ROLE_CTRL_CC2;
-			reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_OPEN);
-		}
+		if (polarity == TYPEC_POLARITY_CC2)
+			FIELD_MODIFY(TCPC_ROLE_CTRL_CC1, &reg, TCPC_ROLE_CTRL_CC_OPEN);
+		else
+			FIELD_MODIFY(TCPC_ROLE_CTRL_CC2, &reg, TCPC_ROLE_CTRL_CC_OPEN);
 	}
 
 	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
-- 
2.34.1


