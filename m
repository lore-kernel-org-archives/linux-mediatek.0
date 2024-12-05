Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C650E7716F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 00:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5dZErqHWkqkbiTZ/fetJ0ewz9CCUgVEnKPjhnCoIqc=; b=tSDuN8RVdY88bK5tnyIt7fWn6i
	+uGvBI9cF+iq9FRsWBoMAo7qgArniFZJDx4aeBCKUH8lSW67IC35x7cKjvEaPdh3RO986GHIOIFS/
	NUEP7hJkHk3pMJKh52UF5I3vPs8INVvMHsSHxoA/xsXa+t5QEPBzXg7PO0PBAB4wxsgDRYam5e7Zl
	sDBK/q3tc+Rs3QleKS8VLHTKLjoEA/FW8AvIQeL8gpgTVZNyarH2RZQtx40e8iReEU1EDwPkJVsL6
	RTHfUGlTKuydH1wD+lUHIakhSsR2Z3i1kz/eAcZimj2if71t8LqyD8yDH0j/wFkLUk+NCw9gq/hVl
	SJiHweOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzSr-0000000EINu-1e7S;
	Thu, 05 Dec 2024 00:11:29 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzSp-0000000EIMt-2GJL
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 00:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733357487;
	bh=J5dZErqHWkqkbiTZ/fetJ0ewz9CCUgVEnKPjhnCoIqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=01AUCv/VOnVd/OpcOMyJLqg2MZhYvalNTdwO/nf0pjuIuCQLpj8bCXqabLO3SaN+J
	 yRezCqItFjRcLdX9nJzu237LUed2yPzXsY+/z3Bo6gNkEVB3W9yoc1HZqA3v4M54o8
	 PRNj5gwMNxcG7FCAC5KNWEJKPRNYxtOFboIqr6bCedwbXPzKHekydcsZuvRPOMznRd
	 bFFFvSMydgDu0u1w00EXuuVE+7kMVLHj6AnKylpWz4tfAQPDPCflMQ38GJhMahs1MD
	 HX2HC+mvs7/FDeobHf6rtbJlEmAE69sIodmpbQcX7E7pvuwFiV4HVeCK5x5e/tZzaI
	 wyKIbjoLM/rdA==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 8B0E680030E;
	Thu,  5 Dec 2024 00:11:16 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Thu, 05 Dec 2024 08:10:11 +0800
Subject: [PATCH v3 02/11] slimbus: core: Constify slim_eaddr_equal()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-const_dfc_done-v3-2-1611f1486b5a@quicinc.com>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
In-Reply-To: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
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
 open-iscsi@googlegroups.com, linux-usb@vger.kernel.org, 
 linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: A5avaC9zWkEyGxiUZV1XaLznKCTQ9MaZ
X-Proofpoint-GUID: A5avaC9zWkEyGxiUZV1XaLznKCTQ9MaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 mlxlogscore=738 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412040186
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_161127_593964_DDA29355 
X-CRM114-Status: UNSURE (   8.81  )
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

Constify it by simply changing its parameter type to
'const struct slim_eaddr *'.

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


