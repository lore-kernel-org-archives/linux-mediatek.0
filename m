Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25CBE75436
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/kWDIlxFNyUk5NMsbnFpDAvpdaqAjU87hGMJL2rUgA=; b=c0xC5+aXhjPG7Nm9pYwpvrucU3
	OYB2vVUadu+DiifBJ+Z222cuq+bisoYmESZ4AXra49WeuBO4DU1SbDCiLygkiZIaqOFHNUAn4c21t
	5rQ50Qed/cIxoVUxn8jxg9ntAENtDzjR1RIw1QZ70tgL7EVi2FuVRPabfcbqa7dRdkYm1Sd3IxDQr
	isAEyuf1jAkowC302AG3UTfKpKa3aBIfgNnoydHS+lXl1Hy/IJGbl7pEgnIf1RGxrNP95l+/XdJgw
	Tt/O3dosur6t15PNaU0rTf3+RAJHDxRjJOQyjdWQ3CKTaYIxQ9mnRcRt6PuXUbSEacw9W8BtJ1Mr7
	LOwwzJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaTm-00E6Wq-0B;
	Tue, 03 Oct 2023 08:10:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRV-00E3cZ-2Q;
	Tue, 03 Oct 2023 08:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e/kWDIlxFNyUk5NMsbnFpDAvpdaqAjU87hGMJL2rUgA=; b=gKjIGR8SbqdY4dRWYoYqf0W+bM
	sCE0RKWy4dSgqDupZgFnyzwZ2t5R+eKM4hQSWOfEWD3W0UfkI5TnD17OH5chtR6cmUQTUl3CcmGg6
	yCzVavaNmsTO9SrSjB7y2zNM+G24IxzTyGH8CdYZHVFxYR8k4ZTvIIKG8E4rmsCxu7hFrbl5Dh099
	bCZUbupjPQi9UNyQgm5RAyUazaFHzOoYi17T6jUtzrjMXO8AzxQ+ZP+d3E1Eg4x16PSSJgqFuYiOl
	TOBTeN1udzcQzkOQNKTLbLQf+FULLLKciLjmMm7/HFl6YqR4HALRhjwNR1g/JeoCbH0tOA9tsda6N
	FmANPKRw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRN-009jwL-0i;
	Tue, 03 Oct 2023 08:07:44 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5624F6607385;
	Tue,  3 Oct 2023 09:07:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320456;
	bh=M07izUxouDHh4XgYCeqDbFmPp7eQPVY+TVAj4HO/ALk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MYmVTXQcZs8j1QIq/6gSHlTBIB25QQFV7oICT19Jp0gV78wSJ079xwodLyuvFl7jZ
	 PA3sexZQQI3t6c2lx1E9JkNz2X/CnBZLJPMGSdCfiJO4CAm2sfQ588ZOP2Fnz6ISVF
	 9M2LjUIxtW7jfFEzXMyTqekkbcW1aoachxzn5JwQjGY3bIuIceSWWNcgAWf3RM0AIh
	 j7/hDV3rrwXzHs7PW+KOKjrnixtvg+CaKYGiRU//qyYtluoaFtBKkRXTsxWsm689b5
	 jbJdh1Oxv31RvPN1tqHERO6Hc6qtNoH9bp4KewL+DBqC2SeED7x4zNEM0Cc+jLzuWk
	 Jie09zIdBk9BA==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v10 45/54] touchscreen: sur40: Stop direct calls to queue num_buffers field
Date: Tue,  3 Oct 2023 10:06:54 +0200
Message-Id: <20231003080704.43911-46-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090738_906795_D4359576 
X-CRM114-Status: GOOD (  11.00  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/input/touchscreen/sur40.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 8ddb3f7d307a..e7d2a52169a0 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -847,9 +847,10 @@ static int sur40_queue_setup(struct vb2_queue *q,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct sur40_state *sur40 = vb2_get_drv_priv(q);
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
 
-	if (q->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - q->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < sur40->pix_fmt.sizeimage ? -EINVAL : 0;
-- 
2.39.2


