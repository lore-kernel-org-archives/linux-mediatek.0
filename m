Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE579D116F6
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Nov 2025 12:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=; b=Wn66yO3unDHS+ecDfFtXiGTsmr
	cVns+p+Gvgq3dbojd/zcAm05jwk/Zt3Iws9+JbCfLzkrIFs4VdMaZ2j39GCsWThKSZPvI6tClwleD
	CCEPzkCaYz9qcOHgBDFf80XiNmPRtCRqzefnd1n2bhz2BfjPj+SaSaUoJ17yz4er6i/TweSKPkg7w
	4RIHtU7UkRZ3Mk+56SgV51Eo3dDeSaaaDVoj4n9c/GC+GkE8Y/Yz9VVakPRowp4wZZe7Iy++K9ud/
	lFG7rBCtqn0QW/KCXS27EsvMTsUbjq4mFOlnWCu1kZtRmZ8XoIhBvne4T6zlnt1Ka3IU6ID9POm/j
	99SU9KLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgf9-00000002Hx9-2wQy;
	Sun, 30 Nov 2025 12:36:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgf6-00000002Hv9-3pOO
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Nov 2025 12:36:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUBg4EA717888
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=; b=TpxT7ZCnor5T2yg3
	AKgmBbRB5Pt+U1lPauoLJS0xDRXqqO93uwhjmP1g6U+ru+mDj19cHM5kXCpC8xkb
	/DN69xmHIx9y04/TtZbcu1pxjRkSuucpZ9iiwmkGW1hHgIi0UInB/FM5GCtajS8l
	TanJTGLjX57AHO7tDv6nG7LBnQEh+QEQbTR1m39m8bY3G9NaHZFEgiuBVZQrnhTO
	XwmXHfV8aZ6TyHXrKZxwkYVQb/aXqogQMz1Jv/TEApwBm3Ix/XcKOAc5eSMNmOI3
	leAWHVHZ1o6DZK8hoTcfOOKkZqFLsquuCNVbm1E3hTiPQ0e+MFomBCu2X+R4SAbh
	/NR0sw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt0j22ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b30b6abb7bso627117185a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 04:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506178; x=1765110978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=;
        b=LAcutG65fPzz0Afcw/zs83tg8tbttGKOkmRBFQvN2nmSv1t3VHE5qGhFggz48hvien
         QGSkL+RYqtf+UxKLZQTj+WwMazBmz7lm6HazZ6WxqK9JJYRTghlXOPxK5Z+ljAEkVmfI
         eN6x+270ULSc9vY+YL27YdOzGdGhK41knOJUI+SHMlEMmfXFrWf8BCfN7PzyYxT25X1i
         s4kdT08NLDpNJ8g0aCd1GAgT6X4Tduc9YjNjiHKb2IMCWfEp6YsfxeraWBdZSUbYYuXP
         IoPaqpC29OG+GdHZ/RNm5jNrWOFerICOgqC2lyzBB1Nbhsca7RF2MHnnVAHQth2gyZmX
         t5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506178; x=1765110978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=;
        b=d2x/iLmz0bHgMoibqer/63sck32r9ot/wpod/d2aA9hfo/B5ELy0Uelp1K/lgiRDuz
         rK0ZQ487hwCAKwAa39wGIr08uJ/hGRbIMefGMW5zkmx0nc5SF7NQnyTuDbrrOZr5145l
         Mrch/Fx8Po0HbrpokzKRQOtn5JGlNTtbw2oDQ9PpSl5EOwiYwAkcB3A4hLOcTFSUWPHF
         JKQnsN+w7mx8nHQ9XNy2/IwfFCJUgYYIMQ1iIa+7zcZ9sNNlHH+vTPaKerSgJ7IbLeUc
         eGg03HzcRhRtQiEXLHXc8kMt2cTSFNkxNWaOmEXUPRBdmRFSMmMm8K/y496sY1sx8i3K
         TP8g==
X-Forwarded-Encrypted: i=1; AJvYcCWXXJW/8noFINqDiq9gqs0QHQ/tAzI0KPsuN39ZN5YFXNBuDBMw2Nmemg1BKpAqNJjsSPmFyeZLfz/RWUhFCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGYsanSPHADEm/Kw3pqP0JonrYFxJ/WuZ1SxpYHLVYpy/C2IJC
	L7aT+AP+qJ0QoewhWAG49qVCuAiRm8QZ8a/OkkryznRW/5TNVX07FQD7yA4jBzvfO5lFVTo1tiS
	cvHt5jg+QKsmjSv2ZZqbDuDHnKYilWSRyhOWMtR5GZ7phE6xSZ4bMlMAdki8rvfdlZTiKzHL7W0
	Q=
X-Gm-Gg: ASbGncswi9CUtudJxaycmsRd1dzHxm9I0mjqPYeGri7YZuYSYd1/lLcexxIHO/34eav
	ts3DYVLYnCvfcCyYLVSmmXlT/q4cO6q3DgU482bvJMbuwqHEkA2wBkqN+/3/m97Vb0ZE4yrfeNh
	20BacnR3UuIsmAoJ7mp+T9F9Sk25zh+fdZz6Hb72NnwAYhypYn9Zk5802lgtwv9RBeJF4FMkPRX
	+XvTs62Z7oMcWYCNwQuYywTeAQrqNvY0EoI1yP7OLk+eiLx9NGeMSxgAx9uHw5aVQbfc276G41G
	61nhT0xYs0vGknm0tpbVZna9J6IyTf7Oiz+A+8mQeZANmuxekoe1ZYXxISitO/DCan5rqbAEoSU
	5EdzKTNvRkHTXTRAyF3ry4pDsbFk/QwtZ1g==
X-Received: by 2002:a05:620a:4509:b0:892:eeb9:4def with SMTP id af79cd13be357-8b33d4cf9d0mr4721867185a.49.1764506178434;
        Sun, 30 Nov 2025 04:36:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwd83+g8q92x1y4CWxFdCnR6Wp/D+6ypCjsLsXp/d0HHxg4TfXOyYZHiS3ejZPS6LsXDPMgw==
X-Received: by 2002:a05:620a:4509:b0:892:eeb9:4def with SMTP id af79cd13be357-8b33d4cf9d0mr4721863385a.49.1764506177949;
        Sun, 30 Nov 2025 04:36:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:08 +0100
Subject: [PATCH 1/4] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-1-cb11c7e0a024@oss.qualcomm.com>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pq/+nMdyC+q1ogI0/TIhIirNxNxs+pUe22DWF7lVnBo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo77EwKqXOJTM+99Uw/WZdDbkh4LZ6TE7MGd
 58HKTs3HPSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OwAKCRDBN2bmhouD
 19GjD/4yqvoVdSiFtXLgPtSNjWBghlWA484iGQ/nvK11zYtmLSt73fjHu+ppUkACDE3Gzj+MQW3
 GDtp6bRzB1dZ3QT8+hLu/z1ccX0SfUdcsfvl8p/37dFdHApMe6rolFyGrlIn2G8TYijT3nYGyB0
 izR8XwMJza/i4Fmr7yUyAAbVxOeHbHI3TF5CozIZns+a8GS7giqH2FmroISq6Lq16y0TDHRwJqU
 A7ZLWYFUb2KyJTNwdjFO0sfjVkjqx8e/PKvM6Bzs8E3btdilFt/KcUIM6FXwFsUSUDpuuiRQPqt
 Qj5mdGUxGAffYx5dow27iCxx6uemvTGdgakcUyiQCaQuCytEbDlh8Ocm9SRF8XuTaldc8Wtagkh
 qNyDq8rMPwMzoHaW/BS0a54JrP8GZfP+40GvH+Z58mM7JNH6UoevmOFeyzT/u6PQ4QAA/4sskOK
 gapow81/rauguxhutkRhwgqWvj3E7v9wSscxUC06Tk4DILYqPcd4gzxySFbYZrqEgx7xXie2fDj
 r9mOc69XtfZRc9kYxDe15n5d6KEqv/5+uAg4SOlFfKoJjPjNu3LRCs1QldniZqnGgp33WEh3kbU
 gRIEMvf47RDpaZ/ky3EnM/viU+sU8FftAtiEPtskYBtbQqyRQD3BLdg0yLoExpWQ4Qro+t2IVvW
 Ps0SCz8LoJid2Gg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 0mntU00YT_o8kRHZlMr1cVYluX_EK7Zd
X-Authority-Analysis: v=2.4 cv=WpYm8Nfv c=1 sm=1 tr=0 ts=692c3a43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bWW22GgIgZmb96Hp9REA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0mntU00YT_o8kRHZlMr1cVYluX_EK7Zd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfX6oaZMScjcofR
 2kTIPKhDQVS/6AIvLZH/8nIA0fhWD60hkduk1UGk6QIdd6j+wuL3Yly/5qp6DKGhfsrzr8mtV0P
 Qow5oMX4nuAkWkYkkJPe/q7LEwqK6cLaQiY6c7b2bvebuF3dECXGuoHw+Sk5q4FvkrOutiaF3/k
 EO6PtsI9vt7gAQHZgMkSnVxaS8h1GkS0TjKabh1zyU3NlvIYAiPl2gk5HYRz601ygc/GeoG0vTp
 7c1gqyvheJDpop/mWHdS5LAN/7bUHDWJ4pi1lbpcRwlmUMVB2gkrA6Kp75yZ6KK4ElauRZqyqkj
 pD3wEoykMBdzWV1/pDLvCgR+ViU2Aw4QD/B97QhAQGhadyNKIxl8RZOqJtveuJwA7gjvuQLzqvK
 jbq86cA09ZwnMSj/Mf0cDNWlVWF+aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_043620_970329_D7957964 
X-CRM114-Status: GOOD (  14.56  )
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

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index c068227e251e..bc1ee82cff36 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  *
  * Return: 0 if sending data successfully, -error on error.
  **/
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 344ff41c22c7..4070537d6542 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -58,7 +58,7 @@ int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
 void scp_ipi_unregister(struct mtk_scp *scp, u32 id);
 
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait);
 
 unsigned int scp_get_vdec_hw_capa(struct mtk_scp *scp);

-- 
2.48.1


