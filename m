Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5C7C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 04:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=MlF1sZiYBVQ0qZEpubzGClUXF5vF7cVXiXBcKx7fIkA=; b=nGdvB9i2cAQt4cOGESnij10cKt
	s6kWAb2NvDE1uQ2Ck+3qSl75GHeoB+jA2SbKhbnodYrW6/P+KDfVcBTqwqx0eouWkGn493dgK+nox
	tNX8qBFwFBwRFvrV9NcrBNRETRqypBf3yjRiu/4Y93X/bG3cNXtHgIXzMohO4hYTIuPLr1w4FJb/L
	5tousjLVAypUh4T1jSiNFjuM8K/f76jh3jvltIFrioVgvSaP0EFK/DHOM9HM7DHyjthWzPufxrefh
	52+hDv8M8ikSSKn7otLoVXGnW8P/jItX3dVxonHn7VdFkqkzuXNM56ABeq9OzpDgFfZ4dE4E42Ufr
	9riJWiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovtD7-001r7C-CR; Fri, 18 Nov 2022 04:42:41 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovtD3-001r6a-G4
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 04:42:39 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20221118044228epoutp02d8caaa117fb35c0bd65450abfd5f6ca3~olCUYYtGQ2405924059epoutp02i
	for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 04:42:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20221118044228epoutp02d8caaa117fb35c0bd65450abfd5f6ca3~olCUYYtGQ2405924059epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1668746549;
	bh=MlF1sZiYBVQ0qZEpubzGClUXF5vF7cVXiXBcKx7fIkA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QrvDvJ/WkbVHQev9pRGwMH4JG23snzbs9TE889n9tWrLvoMPLAflEg0F5I9kUhRrS
	 VQDiESSI5yg7YkmOb6hT7+31b2tEpD7lhhnIyg47XVU6ixdW6loWOww2QZzqV9nzaE
	 RyTnqy0I6KdfODd6Fzh8cBb+XwsqqDnrrjwyQ6ls=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20221118044228epcas1p22573e3f3a53081fb39e56f7fe08de71d~olCUIYyen1731817318epcas1p21;
	Fri, 18 Nov 2022 04:42:28 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.247]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4ND3zm08vjz4x9Pq; Fri, 18 Nov
	2022 04:42:28 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	79.A3.07146.F2D07736; Fri, 18 Nov 2022 13:42:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20221118044223epcas1p12eab9a6fb08ec382625b3fb43f401e07~olCPZV-NC2823128231epcas1p1Q;
	Fri, 18 Nov 2022 04:42:23 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20221118044223epsmtrp183d4feab942c8753f658dc9b6e661741~olCPYe4mD0345403454epsmtrp1F;
	Fri, 18 Nov 2022 04:42:23 +0000 (GMT)
X-AuditID: b6c32a35-205ff70000021bea-23-63770d2f24f0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	AE.36.14392.F2D07736; Fri, 18 Nov 2022 13:42:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.100.232]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20221118044223epsmtip1c5765ba1b29903bc5dad98061bc543ea~olCPJW4Zq2640026400epsmtip1c;
	Fri, 18 Nov 2022 04:42:23 +0000 (GMT)
From: Chanwoo Lee <cw9316.lee@samsung.com>
To: stanley.chu@mediatek.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, matthias.bgg@gmail.com,
	linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: ChanWoo Lee <cw9316.lee@samsung.com>
Subject: [PATCH] scsi: ufs: ufs-mediatek: Remove unneeded code
Date: Fri, 18 Nov 2022 13:41:36 +0900
Message-Id: <20221118044136.921-1-cw9316.lee@samsung.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdlhTT9eYtzzZYEm7iMWMU22sFotubGOy
	uNx8kdGi+/oONovlx/8xWTS1GFss3XqT0YHdY+esu+weExYdYPTYvKTeo+XkfhaPj09vsXj0
	bVnF6PF5k1wAe1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotP
	gK5bZg7QOUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScArMCveLE3OLSvHS9vNQS
	K0MDAyNToMKE7IyZk/YyF2xirXj88gBbA+Nuli5GTg4JAROJ92+XMIHYQgI7GCVOnM7oYuQC
	sj8xSnzaeIwRIvGNUWLHzGCYhqUtF1gg4nsZJXofWkM0fGGU2DZnBlCCg4NNQEvi9jFvkLiI
	wApGiauHn4E1MAtoSJyc9YQdxBYWsJNYfmEFWD2LgKrEhHY5kDCvgKXEmytHGSF2yUv8ud/D
	DBEXlDg58wnUGHmJ5q2zmUHmSwjcYpf4NXMVO0SDi8TKB29YIWxhiVfHt0DFpSRe9rexQzQ0
	Ax369RIThNPBKLGx9QXUOmOJT58/M4JcxCygKbF+lz5EWFFi5++5jBCb+STefe1hBSmREOCV
	6GgTgihRkZjTdY4NZtfHG4+hbvCQeLd5OTsksGIldj3azDqBUX4Wkn9mIflnFsLiBYzMqxjF
	UguKc9NTiw0LDOFxmpyfu4kRnCC1THcwTnz7Qe8QIxMH4yFGCQ5mJRHe3IulyUK8KYmVValF
	+fFFpTmpxYcYTYEBPJFZSjQ5H5ii80riDU0sDUzMjEwsjC2NzZTEeRtmaCULCaQnlqRmp6YW
	pBbB9DFxcEo1MD0NaXxxMHWaYA5LxTWVj3Oeffq8XevNggZ2zXlNxc+XSQk3VEi9ulXCl7v3
	m0LBxi+/dfZ5da33eM67/MXmeUWrmdc8OLt8urjr3ozwOA7XSI5j148e5b/cM7n48o9r1Q93
	WTOu8RcSrP+RNds0pWb39cNlSepnLzBVPIp95dIipfSu58TS88YX7+Zqf7+oGh+6fvbEqZOC
	3H9Xda8puLRizaxNsdVh8qu/XD+2c839xCnFKd3Lhaf5PepdImQlG5RfVvRbqtBxqsP5sHu5
	d1t1nAWaFm1yCVGpigk7sk/E5H+FUe41f2+D9PqWyZckis9f4uctdRfdqZVR/rmj6LdRtRrH
	vStPMife/FX58rMSS3FGoqEWc1FxIgDXW2OYGQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsWy7bCSnK4+b3myQf86OYsZp9pYLRbd2MZk
	cbn5IqNF9/UdbBbLj/9jsmhqMbZYuvUmowO7x85Zd9k9Jiw6wOixeUm9R8vJ/SweH5/eYvHo
	27KK0ePzJrkA9igum5TUnMyy1CJ9uwSujJmT9jIXbGKtePzyAFsD426WLkZODgkBE4mlLReA
	bC4OIYHdjBJbN7xgg0hISezefx7I5gCyhSUOHy6GqPnEKPGr4xg7SJxNQEvi9jFvkLiIwDpG
	iTPbfjOC9DILaEicnPWEHcQWFrCTWH5hBQtIPYuAqsSEdjmQMK+ApcSbK0cZIVbJS/y538MM
	EReUODnzCQvEGHmJ5q2zmScw8s1CkpqFJLWAkWkVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpe
	cn7uJkZwyGpp7mDcvuqD3iFGJg7GQ4wSHMxKIry5F0uThXhTEiurUovy44tKc1KLDzFKc7Ao
	ifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamByV/ycfVV15tEA99MWx4qy9nQ2ZqfO0sto1DUq
	8GngtG54y98vpK8rKXZmVf08duc7sw2v/k21FXJ8ZGbrrxKetncD539L06uHn+w6t11C7cec
	oLO2AkazLTx22ihs/vlthdws6U/LU8zVG1ki9xeL23/dZHlh6Rc5j2txuh/qrYtLavw6/4vu
	lxfTvSV48ivPWXWRR+w9XLNOfOCfVr21/87eezpLnKecOf5JerHAzrC8eY+kNrAE3wu8sf3N
	8jy/46vcGd7alzRPKn8zpXNrY84TVc/IC06pa3r+zt9z7UIQY+Qaw436uSm/vNqKkoRbZvy6
	mP/L6JuotHPJopUbqmL2mbsE7Dy8aUK+cbgSS3FGoqEWc1FxIgB6dmaHyAIAAA==
X-CMS-MailID: 20221118044223epcas1p12eab9a6fb08ec382625b3fb43f401e07
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221118044223epcas1p12eab9a6fb08ec382625b3fb43f401e07
References: <CGME20221118044223epcas1p12eab9a6fb08ec382625b3fb43f401e07@epcas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_204238_269116_95271DFA 
X-CRM114-Status: GOOD (  13.13  )
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

From: ChanWoo Lee <cw9316.lee@samsung.com>

Remove unnecessary if/goto code.

Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>
---
 drivers/ufs/host/ufs-mediatek.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 7309f3f87eac..7d13878dff47 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -441,8 +441,6 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 		if (ufs_mtk_is_va09_supported(hba)) {
 			ufs_mtk_va09_pwr_ctrl(res, 0);
 			ret = regulator_disable(host->reg_va09);
-			if (ret < 0)
-				goto out;
 		}
 	}
 out:
-- 
2.29.0


