Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B69DEB104F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=; b=r3jOLrtcNCoNsvpzUPvVIBvl+s
	kyhirX2n+Y7cX+FD24qb8bxVY4ZkjIyXBytDaTMYrM22EOvpZoohx7BPA1xabtiVd9YobQu1PsxRF
	VaYPl5OFY9hq9lkCjIabBqLcAiYNcNP2NdGMNqJ8J0nQVUUZe8Hs+eommQg30Ww3FTTauAW6BOoyj
	R1RPbZy11IA1U0gDXDQikmkdEuxSEws3oDj6b9ciEYcuBlwdx3RvzDG/nKa+dGNwDVrKrOsR55qqb
	USMUsWeU7iMRdVv0f5BhuKXs1Ckoayzcn1czUBi6fP+HvZ5MPZd+URHPT5zRThRPgA51diVTzThrT
	VgqStsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAz-00000009HNA-2iBX;
	Tue, 10 Mar 2026 11:23:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAu-00000009HHZ-37d6
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 11:22:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A97foV3754619
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 11:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=; b=JXrm2uLQKi7kTLgq
	M7V7Qg6nGlbCoe0gBMQXEx0E76BQcDjn9GoWrYegfbm1H3BfyRxczwgHHnF/D6X6
	xos8XT9TiW6puiE0266007cOQwQIEgzlYToeQcuRE+N1xaWzaG47wFdjrKl9VLqd
	/GRCCMTiXlVj90sMlIXXUMXTW45vp5glpqdgQpRjm6b4O8eT3kA2b76zr2BZfhiU
	jM9QrP89Vzm5HvyePCqwwzgoXkt2aq7ldbf/hRWo7HTpdpzQ0eMbeiLsESVLLU0W
	nYA9iCt5RwjXAVy05ov32SpzNz8J0dTces544DVoZyFfKrPIErRD+QV58eOeGTYJ
	yxGDOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477jx6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 11:22:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso2119607185a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141775; x=1773746575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=;
        b=iKF3nm6rIQWJzHz6vAiZICkB5TUgKP5n0uscSk2w1dQL9t5hA+fiLvThaaGBAL08H0
         uhsFMj8Fxn8xSdXrWpSXYJ6hZ5aoJoTl4sWid8bVcJ3NL55wZNI83AITipyocFnKZjVK
         sc2vLqxXw5GHkL2hxPV02+jM8/XSuye0hFTWPhnoASm5Evy5VKxuCw2ahXJcfb3zNXQG
         t+ZN2x9wSbuRujylKQuoUoWxqzkYEDRpRGU6fFlRAx/mssM7DQ3sbTAJ1555Iw/DmG8R
         jPrtnV0bI6yj7QzTMYbHaiPOOMuFfYAApxbWqZ7L4VW6vix+FNm0SYws+lEMmRYD0YTl
         D0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141775; x=1773746575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=;
        b=RgRoRgaov3cNJvQ+k+rK4COCiMggn7a1XBPs+lKQylbMOdeA8Thf2Z66Lj7DN6XEb8
         y9GMnNVZ97N42G++qG5hgvGr6ppUbNYl09ula/wtn2EtlO9X4HCefP1y5QvY3Dr8ha6D
         EwlFruFMlWKqalsxb6y39zjQn5yu1vAhqESxybrtyDyoKTgi76PP3Wx7N6gO2kFHsHZ+
         tU5bpVgWM6FIWNqmN1sVqVWLR5K6R8c0euewm/tQ1jPEmYovyAOV9lhRbhZhlJTjXsZX
         plPybdqbL3gSWu4Lm1ck1dO95cGKmyokb8HUvmHmfmE30lSyOBkkEZpiRUleQdupLJO8
         qk0A==
X-Forwarded-Encrypted: i=1; AJvYcCX6M+PE/eFRG3J6dtKgoifDhXq/Nio8yuGEj4HpT6MPen1KB0Od3vxig8h/nZ/5QYpHEdb4YEUqFPixAb526Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeVaJX6xIKPk+vwZxFrUV5IXrrBmaQcraj9AUCg27VqsFZ4z7V
	jT+jD30e/qhM4cBEOlcqwMh7zakouQpEOKyNRHMm8iRTskfv6yj4X13cS9LoD5oJj7+Zzl3W/9a
	TM+osu3vhQGi4V1o93hKw6X2/nBGIsuzF2mwSdYO4ILh9MylyBlNDAzDovQT/8yqDL95ptiHrFC
	k=
X-Gm-Gg: ATEYQzxXwbpx3BN+PUwshzg9t4gX+GWvsm0+PypIjNUZJdKubfd9nfanSwA1HGwv6Wg
	HfrZbjVEtFTulMxSbySnpszVer3RUg0qsoVLRDBBGv5y1hcpGpxqK7wXUdmaKltiRxJq+oRnBmI
	4m8rI9doEpKuIJIW9iOm/X9x/BXsRgcDKoZ6lCIbB4gsoL5IxF/Lh5XJZfrv69MXwVTTkavSs4L
	9BLEURv9gW8sPhK8KPbeRd775jJJk2Rjumr9WOgrM0y6FSgq28EFT1OFSBmJmzUQkZmQp1y6vdj
	jNWm2cDVzmmIFxivOV+iHTzgRQqJN0IH9vKfB3GGRzm0tPq0SEAzos4xwH5LXVDiN1XWMN28XK6
	Yp3uVptG3ZmNqTDp7Y+o7N4vT/Px77kzz07vA9AKbeUQT
X-Received: by 2002:a05:620a:1a0a:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cd97a7a6b7mr115245585a.6.1773141775133;
        Tue, 10 Mar 2026 04:22:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cd97a7a6b7mr115243385a.6.1773141774703;
        Tue, 10 Mar 2026 04:22:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:38 +0100
Subject: [PATCH v2 4/5] ASoC: qcom:: Constify GPR packet being send over
 GPR interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-4-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
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
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5803;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ObSXKiR97buxky/PvKOJ1j+VJH8Bidr34n3hBEMA+cI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/8BBvkL7GdnzghQsZVsVzlQ6xuKDR8hY+hPc
 IpGCSsqCf6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa//AQAKCRDBN2bmhouD
 1x0tD/9jKwfDmntMF5yMlc1fEIOn5KFtHA3kOJbdg8NmqavLKwylVyFbeRfeIELfVTuJTZPiP2J
 ntjYCKKtRvS6juhf1SZsWvs0nGc6J1cQ2Z7htGENVpN/h6pr2g9MYj6jOL7rsWyOIlHxGHcBjiN
 I3QNpG4bZFEGc7nU2MzcusCMtM/T+qiYut14SX9K8tZII/QnJ+VofsnR9zT08J0Y6+jvCrFv4LZ
 zXWvC+NnQgfqmOWRaSsG/nFNY5E2tQP7CJf/ZKxwHYZkqTl85W3yBqFsubK57XGQo56jARyyb+C
 1aIHQE3xwTKWpHjtaAnNWFJ0o31UaSBStTRywTRe4UGcKRhqI3HMTXpcK2ODrMO/M1koglao1Be
 EdaZHY84dxuG9b730qn9ZoP/AO/oVFz9quLdSNTq+qR2/n/8ah1dhBOjtQOy+2PhdFowFFxwqlt
 nZgDqMpCjsTqq9AFXe4pUGYrl/pEfqQZEnmx1/8V0azDfVELg697mUAJ3lgjE9yL4wozOBW9jii
 M7E2FpQFh3XsFTajda66ebiHfXhGouXlwFfVKadNOlRenl0XLLb7HOf5DmM88Q8vCzbtU00ZeDv
 wEt+JIrBeEi7p127S6TMq/2mMebHu+00vydMR5HprYQk8jHuivG2cOrKMXgO/FkhTAP9rNqTmQr
 QgwaVSTGAqkjazA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfXx8fgvDwAZnQJ
 sBdJT/FFoynd1RfeZDZ2l9J2tbMGj9eEgpRdz88w5W8dh/x4ZhBV1DGDsXEhM7vslPcPzD8ygeX
 2/hG+E34Dii/D2IyXbgkWnbORg2/yF7TpPa6epfTYBubiWVOZ82ZLSXHm7gya+3+htf7b/Gb/lM
 iwed0H1zQFIOuSZ28W2Y+7oylTXYXN6+cvQkO5kB73vOWurscQmewKL7eqDXIyQX7j5QzqWlTpv
 cC+o8vt/u8mGBM+GxaICMlgkm95zc3YiMCyKa49pOBwM9NxzxujxYXeQYShMNBl4/vZRh1M9Cy3
 HGn3N7ReNqCQOYRDqopSLvo+11LzIIf7R4Sf3biyPCN4ERbl2DP6vYrwDd06n6W8H5ithA7gPwG
 w2q69mF25ITWWoNbdKRWuq0Sw+CSgX+l7NMhTkuXd1ottwEK9KotJnHAGMMpuUBKkm8/lAZm2Go
 xeDV5GO9fPxVQHOJcfQ==
X-Proofpoint-GUID: bIlak9uQT98WTZSlq_hpJwLUAOvrFOkt
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69afff0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qTtUXMQ633XYL2vtSbcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bIlak9uQT98WTZSlq_hpJwLUAOvrFOkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_042256_914436_47C7AF01 
X-CRM114-Status: GOOD (  19.27  )
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

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
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
index 78e72379a6e0..ea7f83916d8d 100644
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
index 6e1b1202e818..58fa1df96347 100644
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
index 241c3b4479c6..c84e098230c6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -579,10 +579,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
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
@@ -622,7 +622,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 89f172aab8c0..6262b9251440 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -844,8 +844,8 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
 				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 44841fde3856..3527ad1acbca 100644
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
2.51.0


