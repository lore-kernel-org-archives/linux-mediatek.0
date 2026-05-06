Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59484CD343B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fYT+L8xujiw5+/Qen2DspUJWPjgtV6UMGsDVRY0cUw=; b=Ng5pBMYTlvPzIiqadnGaXgfIFZ
	/ykRbSpVs3Fh0rRELIj6oYov5V5W2meW4gdfaQrO64Kx8u1O5yIPxqNKHUFnswv9hi+mk7Di1PXOw
	vux64snjenpdOY6zAzslp7Cef62g43hxYwuhyGvrKOB1a1r3yaG86dMdxbiROYIpKD3UvFcOEixBH
	r5wa9R3UW/fSla6n1E5YxM2fJ7/dWMgCJ3UN6hzRSwO5qzzz9EXHuF9LMynfW1M0sxh9vUTv7HGDD
	YrtLXmakvSiS7a23LWwLuhVvd8MOReju1d25LlixhbAutSRkRZcflRNpdZFsyxDS+C8uR0nSE15Yr
	dt2By1bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7T-00000001JE9-1K4b;
	Wed, 06 May 2026 15:25:03 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7R-00000001J2p-0kWa;
	Wed, 06 May 2026 15:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8f
	YT+L8xujiw5+/Qen2DspUJWPjgtV6UMGsDVRY0cUw=; b=ORxpGjQJCvXUb8Tvix
	QGSzijb+F36amAMRqRzzmnASTnmVEvZHKV9f3uyBrtOUd8BgKDstr1CoimQHhbyt
	BxulBaoF81LkfW9Ggaf12Uj6s7SohMZq43+mdkMyT7FwQ06bSfaqckw+1nX365Fb
	lavDSZktYOnJS761Hljeyu6dk=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCHAqsXXftpv5CgDg--.43926S7;
	Wed, 06 May 2026 23:24:14 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	pali@kernel.org,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 5/8] PCI: dwc: Use common pcie_wait_after_link_train() helper
Date: Wed,  6 May 2026 23:23:43 +0800
Message-Id: <20260506152346.166056-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506152346.166056-1-18255117159@163.com>
References: <20260506152346.166056-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHAqsXXftpv5CgDg--.43926S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1rAFW7WryDZw4xXw4DCFg_yoW8Grykpa
	98JF4FkFy8JF43ua1DC3Z3ury5X3ZxArW7GFZ3Wa4fZa47ArZFqr10q34Sq34xXrsFvr1a
	qr17tF17GwsrAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piI38bUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxB+3W2n7XR85JgAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082501_704024_58ADB977 
X-CRM114-Status: UNSURE (   9.01  )
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

The DWC driver already implements the 100 ms delay required by PCIe
r6.0 sec 6.6.1 by checking pci->max_link_speed and calling msleep(100).

Replace the open-coded msleep() with the new common helper
pcie_wait_after_link_train() to reduce code duplication and improve
maintainability. No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index c11cf61b8319..e5808d4b3867 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -799,13 +799,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
 		return -ETIMEDOUT;
 	}
 
-	/*
-	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
-	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
-	 * after Link training completes before sending a Configuration Request.
-	 */
-	if (pci->max_link_speed > 2)
-		msleep(PCIE_RESET_CONFIG_WAIT_MS);
+	pcie_wait_after_link_train(pci->max_link_speed);
 
 	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
-- 
2.34.1


