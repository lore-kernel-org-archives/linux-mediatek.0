Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ECDFD8763
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=; b=nXbPXD4ZsYPFzui6IMxSA+l1+/
	B4UKQBBktjzLttkrelDctQNhJ2HF27jG7bi8mCoakJq1TYF/lu6ed07ZnL0WnZS+njv4ppNv/DSV2
	3Q8odbqAZ51IEjG7dbF8niysMghANurRgZg7Vc4bQC8TJqURhveelzoPgifjJxMd2LNQ/538e93c+
	nL2AagqULae529+QudGlesfaLNQUmYGHiT2sYsMZ4ximld+B43xCsFJNowviMYqEkdgk8fqDpPp3P
	rcja1Ycf7rvE+W8T7N04GXFdDy8E7tv/dMO90pzId+EQ8cE4x8l9iPvXPZWbhpmqXn5m8lwAlW1uc
	YykfDV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfg-00000006JEZ-4ArM;
	Tue, 17 Mar 2026 12:37:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfd-00000006JAj-2fRN
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Mar 2026 12:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=; b=PppFDmzq5cn6ElzkKv1V9EUC62
	FdD7fiLgifhkwje9S1cVAEJjJVrkQ4wavh1PMtT0p6zyBrzfBZC66hD0itrZV9k7oMEl/pyRzV+2e
	WbvDiz5ALv1mnUMv78eaETnC5DYT5wV4GLw+1sykF0S5DC/x4YBGpjGXM8oJT9VNLDzhWRfn2D/5A
	gFUhESMEpcUM+uh4lyvUWCIUsywqR1VggXRMiG4+vlA0YQ7rY/boRQm3hCbT2W0Z8zQlsohLO3qs7
	815SMx/Ag4j2HEI8sPYVnY5Hkm5jlOd5mZQdN6rcV6Iy6b3kPy96JwluFt4tP1/Jcuu5kSiXypgfi
	bPaWU7sg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfa-00000008yzU-03ZG
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 12:37:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBluL81026609
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 12:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=; b=XmO/sj3t3Y3Lk9eB
	q3EfuwwWyzi7OEkdbG87Wn2GB1KSu5TYuX0k03qktPRxopfm3zmhxao/7ZIMwmn1
	Pdcu/ajsEv8IDALv94CQKFzuwRHHt8Jtd2xG24EBUjbDqQEerzx4U/8MJRn3ws8K
	tHrUQuBWudy5Hi/zV1M1Yn7GMVRQF8/4/LSwzWBOSzbBotYJS/4I1gYKm98x5Hng
	PZBe3lXNqHfIlb5O0sDRmyptu12tm8Z0eSFCJXjoSPyoyg/1weNgksTJ/B27HFTu
	AOPiIFQI1FIYfrg7HatQ5ajf4DeXDNdRjmov/baKi/uAR7CLIbj0djzmkPa0fT08
	qJ9wFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6g57x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 12:37:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd781c0d90so381505485a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751027; x=1774355827; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=;
        b=KVnJgpSCcbA1rDhgD3+gYjGeGrJsMUPMvKruy2kLtxadmgc0q5U9jiVsvtLnlLodPl
         7QFmDqfMk8HHv5OwOVKVUuybZRZjMdW2uVlIs5cNWEO9b/whLmdUEQaIho37h5kLvKG5
         hUjp/8qiC/Ju7lvg76jfDdyXdkgiBByr+jJrc4ZlH0mbpJ5BlYYM1fI4BaxW9VyYrSzr
         POaTq8AvP3RNide5nRR9Qlmlp6G/DumgmwJ43D6N8HoEZKjSLPUyHkaMEz9UoAaKEmU0
         7BTXKo6NpPq5PSC/XgRsjaOdnTDDWmhNLleqv664RD4/oBy+9BGgBVz/3KWinkk3lx56
         dEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751027; x=1774355827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=;
        b=pOfZ3qcf2x07tHztiGRaJH+8g63LfolnfZd+XD97T4sl/+mEreqLW1e2mBCHdYdEq2
         8llP3Ekk3jVP1nwB26kJAlSB6F78xer70TRFGplQO6Xpq+7hHVS8MsA9NIYODqeSxAv+
         wI3VROR7yHbfPl7Qbbh1+/bGl25in0PsukcfV7pmEwPvBpcbkLZWVzq2WfDy+Fsc0Y1A
         NiTdHqUoDmpbMPZXiErAXAc+JSDS0CGsR5QTUvFtSlNjIHK4FSwC1uIRJg1Jy8GNq4im
         c4niz0Zwd2Pexz+aLbvs2QwZwf0NiZYvoUQm/XUbcl6h2ulCRtz464D2W1HljgrYtNT1
         lZkA==
X-Forwarded-Encrypted: i=1; AJvYcCU4ThbCNqi2Bvc8rE2HahjfX+ZUYfRjWX12M3o4cKFlGXyhxsi+rWVCSg+5b3t6CBOjlW5RRFR7LlX3TTi4Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhC0+grrtDN94DKvNtLohYOtcZNUifduxF4h+Yj3sgtPSciWoT
	g12yjjaOW8jUuuhwpnVl+sXav5CWsXc1bVS4iiX09jH029c8TX8C+uqS4mOCCs8lgY2Pdf/I/qs
	iireAupPZILlWfsOPlWPRDD/zAaL11PwCSKRaYmWrbYm0JPCMN6kosREEwTwl/5r8+eSYwe4tpZ
	SRbmddmas=
X-Gm-Gg: ATEYQzyHl3yGTUG2yOXZt/930+DrnLkiigiSIcX03291giFQSxA/0ZATYUumGpa9cQU
	1eLzWu8xJ3T5n/TX+5jerjixEu+wxSGIuK0AisHJFzt0bDlKmCHhSCoASdpEJWkw+Nunu03es+G
	U4pOiUxMlrbG1XaEVone58SlDZxcfZC1eVpxOG6WqzdkPQ6xG3/NCZL+EPOIocyYxK6Xapufh56
	z3K/rJBb9FiIL1vyZWTkwrk/xmzhYxcevOepm5VkYu5Mpr7hX70ipfzNpT3Lg/vY9GXbcrD1mPE
	v2y4F/xggGPXiqGEDRbtcwV+xpf9JMU6wYSYCutPwYOUaxb/VeiHHUJSa8D4AdYzLTGmd35/ASh
	LQQNdt8OveskjQVshmSDCAGeutHQUJmLf05w2MqqH0tNc
X-Received: by 2002:a05:620a:488d:b0:8cd:8fb8:7ddf with SMTP id af79cd13be357-8cde13519c3mr367926585a.16.1773751026944;
        Tue, 17 Mar 2026 05:37:06 -0700 (PDT)
X-Received: by 2002:a05:620a:488d:b0:8cd:8fb8:7ddf with SMTP id af79cd13be357-8cde13519c3mr367920785a.16.1773751026419;
        Tue, 17 Mar 2026 05:37:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:51 +0100
Subject: [PATCH v3 2/5] remoteproc: mtk_scp: Constify buffer passed to
 scp_send_ipi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-2-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nqRqIi+jvufKkw75OxFFSCYXELMLBnMO78Nq940C9n8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUroFKSbIBB5RlA3YpmmRSHYAPZ+GgxIjOsmC
 QsYaMdWGFWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6AAKCRDBN2bmhouD
 12hlD/0YnDGdPlpE0996CUjdK6S6A5CItE03o44wrGUyTdx/aJRs22HNSeJ6/pyD/SmdfXhWvTB
 KLWAKrIHpmKelvllJxz33HEocqtPs5NwMHYWhvgc5mQyTMV1NHG8kLJtaWou8HjOLA2ACwlxUmA
 hBK/v12MZcH86zSZE8fTbI7d6JiJ/CmXZ+TQA1oYo1Hbw/1Vbhjcr1wFxfIlWW2lhyhcLYRpLSm
 eFnjaGHQB8dkSsgkc7TP1jIHbtzhbvG/IQSNct/hnN04YE0UDmSkQhus4GLBs4xq4uHoWcYocIW
 nPZ13IczlU8xGR/z+nyex6QI9+GeMW/luu2wlDj6fdva7aYkKboUXCf5YS8IzINRV/RNUBgVu1x
 Arpt/ozO6wmnbV/EH8tPZA/UqM3ALN3TALJzBcZDfwNgSvJFIVbKEwC7RGZVJ4lr90cql2RJx9h
 Ny6lZtwQh39CyomEJ1rudS6EzgzpOu+fOIYWFTQ6a9vEuySpjI7wMln+UjS1KKCirFKOIYML1Bi
 nwUtYVqJ0USwP/nrzswexqDRQzPQbKwX7n0s7kCaTL9Fs7o/L1nvbTwELOsC9i93GDUjiYHJdmb
 YNp5/JPGO6sst9r/IrxugsSGSqNfovrLb6XXM6hU8wFEtWwvatS44GStvbDGVDIsKACdfSXCPZq
 gQdux+rBFoXhBdw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX8jQ/bkaLrTof
 DU76HV45O1I9Xh63KC6TB+gIYKC8QbaOro5rs7bH+DJY4TbekduQ+S9BpHX+LxITdmvfa6N3uSS
 XSww4kJzpe4pY0yCDGfZGhy7zLUasuOXiVStfE2XaSYYKGaWXqjicDxMMHY2ddaHK/wd7QZ1lNt
 jslg+czr1EDEiv6SDUh+z7JHvV7Mi0C/frLZsNf1z3NUOybWOQKSGjkHMxxboHvfNdNWjPuvyNr
 ZvMDmuEatVNTAPQ/sF03igFnoQ4wgzz8+tnhTTei3nVNxI64AV6lqfiBrBRrfdv95T9Jbm++rCG
 M7uGGoQGTvsmlxWFHc/SCzA2pshr0kOu3Gb6ySnEdvtOCBYoW0bFzVXhP8eq6Qy7Opev01LHmKw
 /SBJKa8NDUnu3A3qc+YOWyfDUuwcphwFjeitvrIQXtECzvnyrPMMfNz1kvQlGSR7OJqNaiWBHeN
 gRhV0Ghqgf4H9Rfbt9w==
X-Proofpoint-GUID: 0UYA4MDk0UY7Vwy5CBwhdSdkdZNEe208
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b94af4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 0UYA4MDk0UY7Vwy5CBwhdSdkdZNEe208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_123710_669951_5A7B51CF 
X-CRM114-Status: GOOD (  16.03  )
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

scp_send_ipi() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp.c    | 2 +-
 include/linux/rpmsg/mtk_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index bb6f6a16d895..85a74c9ec521 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1078,7 +1078,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
 	scp_ipi_unregister(scp, id);
 }
 
-static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+static int scp_send_ipi(struct platform_device *pdev, u32 id, const void *buf,
 			unsigned int len, unsigned int wait)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040..badcbc89917f 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -25,7 +25,7 @@ struct mtk_rpmsg_info {
 			    ipi_handler_t handler, void *priv);
 	void (*unregister_ipi)(struct platform_device *pdev, u32 id);
 	int (*send_ipi)(struct platform_device *pdev, u32 id,
-			void *buf, unsigned int len, unsigned int wait);
+			const void *buf, unsigned int len, unsigned int wait);
 	int ns_ipi_id;
 };
 

-- 
2.51.0


