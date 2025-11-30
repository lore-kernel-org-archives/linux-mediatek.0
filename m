Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3D0D116F7
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Nov 2025 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=; b=x+YdydRVnW+3VYQSx3L+IKkKQr
	sF1CL+QQfGjNlWNix1V2t2EmTWHW6ehAHfaUo2MCtGOSA9z/rfKDM1oS3eioEH35gixt1TFlQE48p
	fcBmdiVttUQZKcvs2iz5urvJHChnSLybc01El2tW3vBPq4CzSgKIkbXMsCKRyeb/x09jgsjjokJuy
	NoLa7y2mXxH/FWAcqre+cmJA8T9LvrAhwRggx++Rr+bVnoJnvE+S+k5lndw2eZGzFR/MRxWrzPPh8
	aesydVyY+VIHi0E3v0yfdIrsfvkwSD3HotmJ2SlleixBU/QYEPmQoLctHOhrtiLeF4x7KtOY3mRnf
	s7qPxNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfI-00000002I3b-2kDo;
	Sun, 30 Nov 2025 12:36:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfB-00000002Hy4-297Y
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Nov 2025 12:36:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU5i6fg019488
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=; b=Psd4w64sy2iM4eCI
	tk6IzNgPxsp0zPjf4ZUTwUfnNWHLeTFuxhK/+qfpmUXarSJ0MAAD5AVhXfqVT9b2
	U+AHwxeEm329DrK4GI1jkIr7MUdaOCiSxbFYuiPwhHDWL1E0oIN9NPlX5WfeQmP5
	lLR5gkp+KywEXuZn50miAxq/ZyBUKfGfhqYKF3lit8j2+lgPQ09ZwrxjcRpOhtzh
	eO/BR5F+hohY1QCKJNFGxWTHKm6SO3L6FDILpOhznRYL7ReI+nN5i4Ym2353BPmW
	Jc+4UjIYbMQG6Qd4C1iQwF3YYebL/h82eJGvfBl1Jq33S4WDx/AqIEJ3wNFFcQ21
	+ckBdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt0j22ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so775734985a.2
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 04:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506184; x=1765110984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=;
        b=RkHxLnKjGteBWhCGCSJww+ZaqYu7D5CVOKlrAWTC97FlZhvH6YsgilYzMsgU5AycTo
         V2VrdUUPiuO0Sm/qk5NMUzlWhSzyint2Xck5j3e2yYrWu4AgzqUIoOuLv+H3JjhXiBSH
         +V9CDotJZD1q8GhIoWVrP3PlYPgXApuwmslId4Xdw3oJv/0Gsz+AEiRkqbTxuxuvxKaI
         7HMPiUi1gdNS8kAjmvvqOKoiAaswuLNrlXf6rhCfdK393HLHFw5qPR/m7md02fyhdZq7
         XxE9mrsg6Yl6ntUeeJqvLtG4+vknHPKMKA8QRkjxCmbCRgO7+IMfj5sjaolbRpFrez+y
         IUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506184; x=1765110984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=;
        b=wk4rkicoPIjGrVrEKM/DliaYHVm94K+8g5Cz/2vC0PlJEUj8fzb8rWCEXEjJC/tP3w
         dkM3Al3e1ML3lWyhAKUQU8jHOlv1WuuKtMzN6dSgjkxMDxXIfqvxR3PuA62mvBHWdqAQ
         2+4REw0+dBOMTGROpj3iBc2pGHa687I4BzGcdDjc8JbwmYTe4vmKUp3IzEe5Cc+ytWKH
         8tGtNX+E7Z1cg7GvhrPzzjm3Q2pQtl2npo2aS0xoMDliFPRdtZxWyMBrgvUpR4sEZ5hJ
         blzfIK1lBbxcP/rDoHSP5URNfqb9/m0vDkm5+h8epCp25QpV47Rph0AfdlNpDPG0JEPv
         hFpg==
X-Forwarded-Encrypted: i=1; AJvYcCVorrPIp5sxP5v9CaaLuldHoOqNEHvax/B7aknoZiFARCm2jmhHAx+m6mOOEOefWwEAUsuJkyqsxhS/gIVxOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIaBKgAcVOqxFno5I2I3nz+egksHTwPPFCyirVntvZ7KEIz/bn
	kNunCXMWpYg4mFrnNgq34OU5l8p5ki28DQo0jVM+nDKiqP3Y05MOinoPDPfyEjjUxreSGOxT+mu
	hPcxPDE+3BvVE2y1yN/xaoy2E+dzfAVhZsEyzi0mUrIqpPXOkzW8zuD1l40IOog2hG/B3P0KyWc
	o=
X-Gm-Gg: ASbGncvbfL5MBI1ODrOYXcfQieGfrtmiFEnTilzHV5C5m+upNGmZeRutsgss9iOrtiF
	BAiANk0bnxlBEl6wxjOb6/sGDS1Zxr3H6MwD4QQ0hYSeVz0t4+Ot0NsjtXI9V0omDFFWQOB1uLX
	ZiIFLeTS89cpYGGE6dvFjj5aSM79rrGVUGJjITcIDPDoh5nAh8lMDfDt8nioUsZZszHm9b41Z1q
	/5EYqwX2zt5VDgiqCD2nKUyigdUVHKUP53AQdYudXAjVIOFiWaG/TBWy7qQ6CHt2VYTcMoaPxbr
	peTJ/eujKu06kzLFsQRt3tvALzkRik5mSgQfXVQU7iaUNoG94Brwsse/VsB4H7KYlfzSvNxHX0G
	UzP8j9fAlttlw5BZkrbsOZzd2dAaJWNtmWA==
X-Received: by 2002:a05:620a:4113:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b4ebdb059fmr3114733385a.41.1764506183743;
        Sun, 30 Nov 2025 04:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGva41J52XjZOZU7QbLozxUApp8fRFBP8lWVjOor8lQjogi2oWu9rXWmJiA9F+qyVfN4igasQ==
X-Received: by 2002:a05:620a:4113:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b4ebdb059fmr3114729585a.41.1764506183284;
        Sun, 30 Nov 2025 04:36:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:11 +0100
Subject: [PATCH 4/4] ASoC: qcom:: Constify GPR packet being send over GPR
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-4-cb11c7e0a024@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5742;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9gu7wWK680Y+R77IwqaMtBNCQ9pWc92nao0jPv5FZKU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo9F3Cb8NTt5YnUJG7vYG29zfGYJNTxXFDJt
 8YjFrKuC3WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6PQAKCRDBN2bmhouD
 10uYD/wL7QRRrhU/H4mmKeOeLk03AFvbCsXoTZfBu3jKO/5Vj4w036GolvoqdUaOp4X6KW4Og9+
 pUtWYb2x2vIX0vXbEqd84RxA6riHyU8uHPxSNqZOefGwtyPcRPL46wGIWL46UFYocJLELTOsD/p
 0eHJ5I10yZhUIA7MzVpPOf8kd2kSWj9UMcIpuhRQvAoMWrWHheaqOQT+ROjlcaaU/1i2rbevMGV
 pcxdKpD7yMwSamCiS5u/cfw9vXZd3DhL7IwoXkwIf6T4J0S6UIKu3vrci5LUgk/bBaAWZqOLySY
 b19+66fFjdfJKD834yt4O/2/9bEYnRm00QUmDslv7+8IB0aOgZB82Ii9JxkNr+AHS4VCUN+ldGp
 VmsGUvWXS8Uu82zG90DZCMUItjg++EcafrVa7lhtCm5tRt5L9eUR61FiEfWRU+ol1u0ueqFgEhw
 psCiNk18Q1s254rhBR7woTjjGBiNih5HVh9yE/zDEAf6IKpu7be0bzO2kPZtVLtyHvKEB+Vdmt3
 LhStPsZf8m0efgknijdb0PwjTbF9Uog2BTkdWwVDY5f2PnM7AEsy39+JKoX/+KKnTrTsleVGpyY
 /zbSdC34+6MGgi//8h91XQ4i2iAP6LivYk9Zz0KQFbx4tBJ1qxQQ4wiCRrRL3/PZ+i1AwxFaqKV
 MRyrzjWyfv2hnZw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: mWY0Flgln1aJMTeU5_u5YyzMwiY0kqNb
X-Authority-Analysis: v=2.4 cv=WpYm8Nfv c=1 sm=1 tr=0 ts=692c3a48 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EI0PQj488oBMEGdooaEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: mWY0Flgln1aJMTeU5_u5YyzMwiY0kqNb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfXwtZJ0peSgARI
 lf1lgO39WcuSGDtBO62XQ2YbQDJ+8Zqse0eM53L7XXEBgrKfOkEPxirRqa16XlspV0KseUjRgUb
 KgQ1nM7vPKEy7fv7yZbz9x/J7t3gLOtB1lgZLsYKcD6xMYpUY2Gem5CU8x3Klr3ltGRmLy0RlbL
 GnAd0ANbNVar18h/h9bi9EiYLPQfrZIHH7W9UJ7hq3BteA0FWNQe2BS7IuCQwztI2Sw89pG24B7
 iXV2gG0563I0gMmCl06TB0aezrs/KZc6E8XO+RBwDqjYFs+NQd8RRR8vPefsYk1esXQtQBUGtFB
 +LT2yx0K8tAG+Gy1rz6KfBet6mm6WC0NCKuUTw5ekCUyJ4s+UL4CaeP/WO/72SUbyHSlivGwcqF
 woypjuMmTHjoGBF2mJ2/R9xKXPBsGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_043625_568483_41DD9258 
X-CRM114-Status: GOOD (  18.66  )
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

gpr_send_pkt() and pkt_router_send_svc_pkt() only send the GPR packet
they receive, without any need to actually modify it, so mark the
pointer to GPR packet as pointer to const for code safety and code
self-documentation.  Several usersof this interface can follow up and
also operate on pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patches.
---
 drivers/soc/qcom/apr.c            | 8 ++++----
 include/linux/soc/qcom/apr.h      | 4 ++--
 sound/soc/qcom/qdsp6/audioreach.c | 6 +++---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 sound/soc/qcom/qdsp6/q6apm.c      | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h      | 2 +-
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index a956c407ce03..b2e1d9a351de 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -123,10 +123,10 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpr_alloc_port);
 
-static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *pkt)
+static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
 {
 	struct packet_router *pr = svc->pr;
-	struct gpr_hdr *hdr;
+	const struct gpr_hdr *hdr;
 	unsigned long flags;
 	int ret;
 
@@ -139,13 +139,13 @@ static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *p
 	return ret ? ret : hdr->pkt_size;
 }
 
-int gpr_send_pkt(struct apr_device *gdev, struct gpr_pkt *pkt)
+int gpr_send_pkt(struct apr_device *gdev, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(&gdev->svc, pkt);
 }
 EXPORT_SYMBOL_GPL(gpr_send_pkt);
 
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt)
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(port, pkt);
 }
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index a532d1e4b1f4..3a02bca34b3a 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -191,7 +191,7 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt);
 gpr_port_t *gpr_alloc_port(gpr_device_t *gdev, struct device *dev,
 				gpr_port_cb cb, void *priv);
 void gpr_free_port(gpr_port_t *port);
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt);
-int gpr_send_pkt(gpr_device_t *gdev, struct gpr_pkt *pkt);
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt);
+int gpr_send_pkt(gpr_device_t *gdev, const struct gpr_pkt *pkt);
 
 #endif /* __QCOM_APR_H_ */
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index ded49124581b..297592b77925 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -552,10 +552,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
 			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 
-	struct gpr_hdr *hdr = &pkt->hdr;
+	const struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
 	mutex_lock(cmd_lock);
@@ -595,7 +595,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index d1b60b36468a..995a7283c805 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -805,8 +805,8 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
 				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 94cc6376a367..d3943d07cb99 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -29,7 +29,8 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+			uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..a39f6046f886 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -138,7 +138,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph,
 int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
 			       unsigned int dir);
 /* Helpers */
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
 
 /* Callback for graph specific */

-- 
2.48.1


