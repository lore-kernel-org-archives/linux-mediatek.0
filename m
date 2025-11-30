Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C32D116F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Nov 2025 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dARi/iKdT6YHQNj2xjIFbOozMfb2GveeEYQmMb8Fa4k=; b=mqdlFYgIjLqpR86fpRm+K1Rj3+
	oNKA0WLJTs6kMOHw0+qCP1XD0BfFMsb9rWtt9EZeQJg8nB/aggwjfiKsPrHPv4a3QchMXtSeZRpXx
	KXEzQRqJdx1nbHpVVC8dwYqkQV8F+z2hpn3nvb/IpL7XgLGYnxOMw/8VBVk+d1v4IHRPmVFWkBd5W
	x5wnOdnyQSpMd6AnP8os4g+X9vmWtYmymqyu/WMWYZgB8fU8T6z+bk5u2azEskEmrV/tBhpO4tYkW
	cbgX6V/Ez4Ew1q11weIdPkBbu2Z+9MVBhUZilaEIEJfsNY9qX0gwtRerQT88eW3V/YvNjEk4PZJRj
	HpYnim9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfH-00000002I2H-2vkK;
	Sun, 30 Nov 2025 12:36:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgf9-00000002HxA-3AE1
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Nov 2025 12:36:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU8QjFe336550
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dARi/iKdT6YHQNj2xjIFbOozMfb2GveeEYQmMb8Fa4k=; b=oJ+n+iKsmBVUZGJ/
	CXjTgMsh1G4BlD+ywIVzUrt/gfNQYVj/tdr3kvkch158U2ApUXVDgczPT4kcxPd4
	kHqkxKhFHqdc0HlCPlz6QGuXiAMWd9g1yd1gEWWk/b9w3sh8kitc/J418Ga5gW05
	5aw1rW9FCIdg2GpMZTXdkHAPAu3q8KdCrOUOAtfX8oi+lt/t3oSK75RQwNcnNWmi
	0WMbAcNbSWsULGhNKuFnlY9qUdmDos96osmu6FrabLU4nqjUWOozn1iGDaPm5ULg
	HwX3+KkzCf0X+J6O3M7B3hRJjHEis9H9hpZ09RqFq6GbtlEdwMDYDuTur0MZNTAR
	BklT4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt0j22rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b29b4864b7so786387785a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506182; x=1765110982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dARi/iKdT6YHQNj2xjIFbOozMfb2GveeEYQmMb8Fa4k=;
        b=Wol9VqoXL2UBNEBKazs0UeOKVzflGKlAxVL+CUfEvKPltiUJoeqe881WiczZGlu98N
         ugTrbUt8k7VH5ZijlbtEqRT6vLgXxNbunDQdfsJ+d7RGG1xzY6tGmMm7p1k/dnzLr9xC
         fXutJecyoSUKrC5+c1QwRghcan8UKghKNFysSgM2tioOI9/iHZa1pwGjx7gX/D5N2CG7
         hsM0ga5FN4ntEx0haBY5DkrCLojhgiX9Etc7SMZ0h4+NV3gcxnvrUVZU4k+o3DsDnBGj
         4BAvkgWNj0SvhZOPih6BWMBUfubQ36eqzsiERfE+2S4npJB9F6pXsY6XjBvUyZ+S++5R
         RfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506182; x=1765110982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dARi/iKdT6YHQNj2xjIFbOozMfb2GveeEYQmMb8Fa4k=;
        b=MPtCEX2DJ28fA+Zm7mJjx4c0iYBwMv9L/TyATwoDqNSElFFCaxCcIMhdciur7+oSTh
         sPq3mXCQXEfMTjlIhVt3dHpDJRzaU2+FttmYwdMe7u1R1bPtPt9926dyJfNRedwnARt6
         lHc3fHceZure9qntmRs0q687Uf0RQypP+q809mLsYj5HqRz/lmto2siqhdE64X7GeNeb
         lI2EJpFGDzPb/jM2yV/4nga++JQtz5MjnQB6NE0u31F5ZGyRqFJLRBzyNtObEgMf+CXx
         gz1+H80X8c61otz4uQsUMfVAbW+OGvsl10C9nGPaBgsx2w030HXmEkOJFlZSW+raC8Q/
         qV7A==
X-Forwarded-Encrypted: i=1; AJvYcCVDvCD7giCoKAY5B3h4+kNHKCWQWJ1RZIybNs2pqkNChiZhNLXno2PLpJuUenlVT9YxBg6nhvqG3rx+D+AGSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEYVdLQwkgsAYLcD/v2qQKa+dRdgbXl87/+BcRToVpQfLPB3iF
	deQSw+FFMweRv2lqiwt+0CF13ZwqOqrzGgMZf2lqiS9AiP2vtDnvYc598FbtB8EKsXfwq+ORwE2
	HF3PNtisQt4KhG0/Aj8dlLeW+VXfsRPqt0zWUryKA6lRf3cUbbuhczlH7dnDk1bMJFrEU7SGnf3
	g=
X-Gm-Gg: ASbGncuOpV9AAWWXLmF2IJzp2ewQg9pB2YArf+2MdSyrzUcTgBNFKDWJPwp4nJBpqCE
	OG5QeRDpG5TGsqC6htY2cMJ2pY8B6QiXKE7qvhciXNgFY6u9MaAbwDumLEFVqrqq5GabMkEcVGA
	hePEtzDnnuM/KwxI+kU++ml0/wT0KDLXXuAZeiltwe2RfeubtUWRes2y/DdMMhVyGkMi6X/3Vot
	8GO/GWVZ31snhxDqy6siPvnvqczoRFTR8PHJL36YY+vZY68Xi8+T5fOZkg1dh4KHSrMRt8zAlXb
	GMukO5vAuUg4V33hk2ecnr+/3sf5RvIPm4/NFkIDXXMFBoGQTwf0/j1Nx5vCVGMiFUQthKP2yTU
	USE6luY89ozqlJanoylXMDEAwWzntK1e1mQ==
X-Received: by 2002:a05:620a:45a3:b0:8a9:b1bb:fcb1 with SMTP id af79cd13be357-8b4ebd54520mr2850376585a.15.1764506182050;
        Sun, 30 Nov 2025 04:36:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEgZrd7ydwt7marmpb1vwhLSYebkPk/ReUbPpzq6DcU/1phgO3nPD29R+bvHO+ffA7kL4GXA==
X-Received: by 2002:a05:620a:45a3:b0:8a9:b1bb:fcb1 with SMTP id af79cd13be357-8b4ebd54520mr2850371785a.15.1764506181462;
        Sun, 30 Nov 2025 04:36:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:10 +0100
Subject: [PATCH 3/4] rpmsg: Constify buffer passed to send API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-3-cb11c7e0a024@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13550;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iTRd+rIeM0i/pGucaXFPZ9D6qmjfk35erqlIaeNAJhM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo8N/dNhNeRqEnlC/v3jVdSTzvhCqXPENCaD
 Us6fAJ2xoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6PAAKCRDBN2bmhouD
 11ZREACBOq1dY/GNaTLrAA6ziQ59OT938SUPowxfvxNxZPPOS+rbuOswQZxkPHF1t8R+HMt3WkT
 +fihX5v7rbFzhKUkWtOqVWYY8UHoIUAdx2/MGhcEqwIQn4PCeT43Od+58rUPCp6eLT27r/MNs0b
 +0pGZdsCPsZ5xL1f4TpQTuUQx0le+azaUpnLvtzEdohuudxoeT6Bnbx6dzaFqIUfbYdMb1m1UPM
 5YEbzBXgnZGPBT0uywIOb65O5AQcXPcJiEgOq1TkrmPDoU4gDnaVdQ3nr3THh/AQC7W2JoZm/5V
 WqeHpeLgMWOpZbhYZR4GHDHg87kPmpzDagDwrSaiggButugls5iHKSqE9I2c3YpDINjh0Vt2dVn
 KT9vu56ovP4oIptRFT2LZEYcUa7I5gWhYnIgk/KnjnDxC9o8caA+5N9Lel5SqrNckoxB5PJvjj8
 dauNBbNguJ7ZnsGvKSyTYaA0XswWCeQMUJXLuI7/RfaO57n8guKey38itk14dj1e/CnEbXpGotB
 DyUxk4qCAjivqPt+/OvPaLqeTYY1Nbmoc8xP1juSDnuO+tQCUwn7IlwKbueRZCCoYeD+bs0FqqX
 QlP00cpzev5ABCUXeX69X9W9ZgUSrFzlti83zMUlBkFkNIhTWumqlwU502e/6pqtQLXOL3Lm+Aj
 iuE1Ulj8f2t94IQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 8kZaVSNkY5dntmXmHHQJt1WfouM-OYI5
X-Authority-Analysis: v=2.4 cv=WpYm8Nfv c=1 sm=1 tr=0 ts=692c3a47 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jKNRGAx6QiKp0B1Iy_QA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 8kZaVSNkY5dntmXmHHQJt1WfouM-OYI5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfX3X/voJT/TR6x
 CXz913E5IEZF+OgaJUK2ZyCHqGU9BnH9JENPnOaJFo42ZOK4T6rAE3DPELPdLtBCIm7Mh6vbGx4
 y3RN82qY9MVoccD8rLak2CS3s3VAEhDlnWMZrijWRrhRTa/w3T72+sxVfKnTZCl4fXdoDgWamdA
 gEcGw2fET2GL5LzRQAZ3Qgnb3fCvKZX9mI/X4sqIkgqTTmdgnV0X2485dt3oPCLS8Cu7j9MHhux
 QO5iVyqFO4h+wtt41ZkPRbQDVEw8+BxaGQ+mb7GKO6il50puW1QQ40r/vLm7WItD9n7sNVCh8ug
 pQCn1B7GaKbKbNf14EuhQvud7KTsrY5Lr2EP5emD+CeARkHhn7hqHokRgwUKPgRzGujhRE507Po
 wQPXGdYqwd2eRSlse3N5kv0BRLo8rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_043623_926285_C1E6C151 
X-CRM114-Status: GOOD (  17.65  )
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

The rpmsg_send(), rpmsg_sendto() and other variants of sending
interfaces should only send the passed data, without modifying its
contents, so mark pointer 'data' as pointer to const.  All users of this
interface already follow this approach, so only the function
declarations have to be updated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patch necessary for the further patches, please keep with the rest.
send const
---
 drivers/rpmsg/mtk_rpmsg.c         |  4 ++--
 drivers/rpmsg/qcom_glink_native.c | 13 ++++++++-----
 drivers/rpmsg/qcom_smd.c          | 10 ++++++----
 drivers/rpmsg/rpmsg_core.c        |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h    |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c  | 24 +++++++++++++-----------
 include/linux/rpmsg.h             | 17 +++++++++--------
 7 files changed, 46 insertions(+), 38 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index d1213c33da20..4398f0bec155 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -135,7 +135,7 @@ static void mtk_rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 	kref_put(&ept->refcount, __mtk_ept_release);
 }
 
-static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev =
 		to_mtk_rpmsg_endpoint(ept)->mtk_subdev;
@@ -144,7 +144,7 @@ static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 					  len, 0);
 }
 
-static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev =
 		to_mtk_rpmsg_endpoint(ept)->mtk_subdev;
diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 820a6ca5b1d7..db696e1c8ca3 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1461,7 +1461,7 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 }
 
 static int __qcom_glink_send(struct glink_channel *channel,
-			     void *data, int len, bool wait)
+			     const void *data, int len, bool wait)
 {
 	struct qcom_glink *glink = channel->glink;
 	struct glink_core_rx_intent *intent = NULL;
@@ -1540,28 +1540,31 @@ static int __qcom_glink_send(struct glink_channel *channel,
 	return 0;
 }
 
-static int qcom_glink_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_glink_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, true);
 }
 
-static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_glink_trysend(struct rpmsg_endpoint *ept, const void *data,
+			      int len)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, false);
 }
 
-static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_glink_sendto(struct rpmsg_endpoint *ept, const void *data,
+			     int len, u32 dst)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, true);
 }
 
-static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, const void *data,
+				int len, u32 dst)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 42594f5ee438..1c6ae8c22100 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -960,28 +960,30 @@ static void qcom_smd_destroy_ept(struct rpmsg_endpoint *ept)
 	kref_put(&ept->refcount, __ept_release);
 }
 
-static int qcom_smd_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_smd_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, true);
 }
 
-static int qcom_smd_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_smd_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, false);
 }
 
-static int qcom_smd_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_smd_sendto(struct rpmsg_endpoint *ept, const void *data, int len,
+			   u32 dst)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, true);
 }
 
-static int qcom_smd_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_smd_trysendto(struct rpmsg_endpoint *ept, const void *data,
+			      int len, u32 dst)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 5d661681a9b6..cac8e5227579 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -153,7 +153,7 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -182,7 +182,7 @@ EXPORT_SYMBOL(rpmsg_send);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(rpmsg_sendto);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -238,7 +238,7 @@ EXPORT_SYMBOL(rpmsg_trysend);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 397e4926bd02..a8b7065fd165 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -63,11 +63,11 @@ struct rpmsg_device_ops {
 struct rpmsg_endpoint_ops {
 	void (*destroy_ept)(struct rpmsg_endpoint *ept);
 
-	int (*send)(struct rpmsg_endpoint *ept, void *data, int len);
-	int (*sendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+	int (*send)(struct rpmsg_endpoint *ept, const void *data, int len);
+	int (*sendto)(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
-	int (*trysend)(struct rpmsg_endpoint *ept, void *data, int len);
-	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+	int (*trysend)(struct rpmsg_endpoint *ept, const void *data, int len);
+	int (*trysendto)(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
 			     poll_table *wait);
 	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool pause, u32 dst);
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 484890b4a6a7..6559de61da6d 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -138,11 +138,12 @@ struct virtio_rpmsg_channel {
 #define RPMSG_RESERVED_ADDRESSES	(1024)
 
 static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
-static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
-static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
-			       u32 dst);
-static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
-static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
+static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
+			       int len, u32 dst);
+static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len);
+static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst);
 static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
 static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
@@ -546,7 +547,7 @@ static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
  */
 static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 				     u32 src, u32 dst,
-				     void *data, int len, bool wait)
+				     const void *data, int len, bool wait)
 {
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 	struct virtproc_info *vrp = vch->vrp;
@@ -642,7 +643,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	return err;
 }
 
-static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr, dst = rpdev->dst;
@@ -650,8 +651,8 @@ static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
 }
 
-static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
-			       u32 dst)
+static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
+			       int len, u32 dst)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr;
@@ -659,7 +660,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
 }
 
-static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr, dst = rpdev->dst;
@@ -667,7 +669,7 @@ static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
 }
 
-static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index fb7ab9165645..83266ce14642 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -182,11 +182,11 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
 					rpmsg_rx_cb_t cb, void *priv,
 					struct rpmsg_channel_info chinfo);
 
-int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
+int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
-int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len);
+int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
@@ -249,7 +249,7 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
 	return NULL;
 }
 
-static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static inline int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
@@ -257,7 +257,7 @@ static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 	return -ENXIO;
 }
 
-static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
+static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len,
 			       u32 dst)
 {
 	/* This shouldn't be possible */
@@ -267,7 +267,8 @@ static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 
 }
 
-static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
@@ -275,7 +276,7 @@ static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return -ENXIO;
 }
 
-static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst)
 {
 	/* This shouldn't be possible */

-- 
2.48.1


