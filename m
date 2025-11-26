Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF970D1118E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 17:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=; b=rxsEK38MmPN5kGiqUqBBP3NZuN
	87boHGuYV0t3OEQJmq4zUb9HA3J3dN2RvrOkdcbpUmohKWrt2xl1fDJek+10O6UPZlb2/byZWVdb0
	dJ5sNWot7+LyrEOVJFOkimOMjs5x74QHCw05FH0A8fUOl6FU3aHqAw5y9NGEtXxjrH2XLsk4qf2y7
	HMWS+5Lc8sDwjW+7cRbiycmy2UDpRDCWxABM8Edecu02CFILsJFkVBQCYBe/LFPJ8hOUrJNJPGyiZ
	oY8D9lQVcBUvakGIOdVyj4rAGcnczI+3bYsIm6d/cOgJH41q2xGY/CdKvqMpY4ubf2M+9oh7iA4c2
	yja+fpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVn-0000000FREo-3aTd;
	Wed, 26 Nov 2025 17:41:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVB-0000000FQpe-3eY4
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 17:40:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8dbF63666318
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=; b=ayZHyRX6tMYKRV2L
	MG7IZwBvoGRwaxWvEabJ5AGpU46K+fHm5YslQIWa5RbaxFe6QUZvAj64cOOw3Nbd
	5OMasmfDeWc1rr6ASY9I7C++uiFMuw+iACWPuWKSOW3YmPM5H0fRis5Xt/9ia2BL
	BNOnYxs11roBt5SvwjXfT7VACs8Vv46mYV8XFW45Axq3OW7QwvpSCzflm8+fnWDs
	IgfJoobJb/gQhLbaPXPxWNxXyAfV9GbfuM8tPj/Z4L9z3UDISGT8v8DafOfjIDTe
	8dlj4BqvC5XCYEn6HFjcf6xUVoE0Z/FJffPZvkanSzxH+Q+VT4RHBfgKfYfo1kv+
	RCwkLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemu0uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b244ef3ed4so445685a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178824; x=1764783624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=fCOzdgfO0j2+nfUXstxlHkFnaZPEVDetlPbx2VnXVPwCC1rVEYaQyH4Q49FdnrjhhM
         e0eEtyID+opLhkMFLV3+urNzLzpxC4MoakUYE0og1tyQxFy7FmQsmfBnCjQ9JoQFPlUg
         fRCwfEBYtZ04zQPPE5J0D/yfJF3owYyedK3mQFtQBR1xFXJkfKHBF4IBrLUOGVjL08Uc
         2LVHBDvP7TgOph4rgZ0O21ffMwBfZnBTLFToJf/mNyeRqSa5i5NyxQUcE8dj7v+V6Wnt
         acz6A8LL5IR7lLipCYRC5kLK7XBOLYaZOaQViaHLXFkEiXomZdqkqWMOA6meEPoY8kqv
         Kv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178824; x=1764783624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=ZLl/iE4/KJ3o7PpOJunMb4Da2fI66qbmGVYjBpzES3f4nr0E8Bb9IVxqLbCwx7n7ys
         IKOro56fcLkTZtfz2YtPa/4y2yrNxuh9HdBa85gTuf8muCKvjAEBiW4aD8QDj3GXXuUw
         4sCsSYIuMxfDLVdizMDG/05OlPYpMGBGwc62c0foddrKMwm/g2KQ5HC4MUaNewG13gRv
         yhusqgFngT4z6BU8vu0PKanj95N1nzO9xgWCWItcJy5G4fI3P6CXk/OUEdl8HVJBv7Sg
         bxmwqcwCi2QYKXvWLtKgCSdRu5JlbAnJXk6vkmJ7wwJZTvn8nKJrwfRl2fzreiTp9HZU
         J0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEZZEu9td79XlvdT4pdSAivviifyGJy4n4fnX2lpO83q34cNB3rUdt2nGEm1jWaYfKJ+iaDW/f4uan3wxzbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDNEUJkPidRKO5xF3jWM1L+pJcUB1FjwzlNBYOqlGUSaTq7vNs
	C5XV/R/Rcw1NUQt3BRVtBccrRjMLeS9f51US1+C/xnlnOTArEM3efvInxcr56oTLd8nfPoMOsOr
	AVHIMW+XXF7XgdxKixOll4LxInzo7dmxE5KHs/VVdJQUECXFD7O9nFSr3VIEdyREPJVKDmfJcAQ
	4=
X-Gm-Gg: ASbGncvTd2oniKubqo5N3AJ6Q61Y+M3TOS+aYPvpM8+D/NiqSrhIPZj9N4K+mUXKbHi
	ocJPc9DK8JtleWyf6w7EUlGBtqkQijKDXgYMkW+yIXDl9ZAzL3xPtwKDCahxVGuamCyzHIQ9uNd
	ZwAuL07x88ZmdzvMYANhDPx4SgWFxTj4lA5LETGEUL2i2cMBpkMqXzlakCfOLCU+wpRmAqHbW2R
	opv5mKi7ys70jjjdiqcboenUuqyUIAHketMUkywBDeZ/N6mPKUvP+SWxYLO4U9mquZ3ZNRX7ccg
	tNugU92QQW66/Gbz/21f6LlBOfxZo6rVfjW9ECj3+fnjz74IBdvIuHsncd3HYjqs2Ql5AZbtLzl
	8CHYuZDQ0QaX0Yf5A5NS3Wpuqxr5HuesvfQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b33d210524mr2592964885a.38.1764178824432;
        Wed, 26 Nov 2025 09:40:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7nhci4TP1tVjsETA0tlWunV2qp6pDTsMykO36IvhVB1WF8317r9qgovKqAlWtXjv5oMmPIQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b33d210524mr2592961085a.38.1764178824000;
        Wed, 26 Nov 2025 09:40:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:07 +0100
Subject: [PATCH v2 3/8] regulator: bd71828: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-3-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUpWNqruSQhmXQP3XRdoDV1aijYo/dZHk2b5HlvKVaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt8B2DOoorWpIacFqRiKYdaRVgdvJIOyX1+J
 Z/akURM0yqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fAAKCRDBN2bmhouD
 160KD/4lnr6Qkpo/E3Y0Sgwj2Ollr93XBJuEN1ps3HH9wxcoQQnblBcZSKsFGRx7C1S9/eJ8A2i
 13m0RTmbbs0eFI9KMsaVQsvkvXwSoLCj1Gq9nHlrGqFeJN2FA/h134L+cKM+3iuzBG8G7PKoYwz
 3kfvYhIufwkCNbAR/yVzOW/K1rXiodaoCP9x81wb/5r4ifZWh0AQWTaB+5HCN7aYmEEpMOUqP6n
 PWd6U7hyaXNkiAFalQl+2GZzTVXjM8WZoIBRfMyvPNX4DK/ccf4BMmAL6GtBvxLFHkykmvE9YWV
 WmOPiddYFrVS8bqOZjHJ77yaNKPjgF7EGjqDUBfh5O78iGvB6gTiwddpvIYvFtxxBDdS6E5iB9D
 muz2wyodr8EfwWYArDy/U65P6DqOuaKjiuwKiiv9gfkKzvxHQO7sCmw/v7v97C1TLMzQ/0xSFef
 68rPX3sHmknklQ7lGJW2obGQK3IQSBZ+GCBNcX2iC+3UOlJXrUxQqEuKd9vGAC/qbTeBwXH4ecm
 3Bz+FxIqthvmhCBN71jhDdFKspfOHCYhZqiH5FIKPWn7XrsRaRNA3np8IpAHFaDDtP8n3d6NwLs
 XQJhF5LotKfRzuMhFVTWaFUMh4t2iGJuGo60n8Q8hVc2ilpTp8/OzvLEd1hEDbu+ho2PUy6mYYq
 6QhNbv9iLln2yOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 49tXmSCo-N3Tre2cPhmTYe_MweVn1R7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfXySg9wQQAMW6D
 6I5C557tni5YvlMGt87XuYwAFW2w4Bbm18KW70CUlrWs/cXDF7J1/TEzmOTW6zponRmPu7Xbm/K
 ARiHDf7/tDOSBbvTHJeoNBdcyD9FyNXiibI45tOiw+t3y4iscw9+1C5XuFBB5xkrGuuEI1KGuv+
 5ghflcEfIJaOx9Hn5BBsstB43uQlM8fFloBoTlfO2AybreSHHcXB8lsu2bLz9Cec3c47ppWhEIw
 E8/w2aw687eicZk9tcuPzqtHMgbnLln+WvcJnOpuF8ZuHoNhVPzcJgN/JGjd9JQW4h6Gc7XNuTL
 nWtzAl3DrQbG//eaFjL2cO7IfhWC2RWrxMPev0pkrMQ9VdST2jHTUEDlgt1KAsrV3suQGGUnfnb
 k8iLw0BCH6Uhj8REHCeggZqBV8uEVQ==
X-Proofpoint-GUID: 49tXmSCo-N3Tre2cPhmTYe_MweVn1R7J
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=69273b89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_094025_906514_E80E2316 
X-CRM114-Status: GOOD (  15.50  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd71828-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index dd871ffe979c..87de87793fa1 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -95,9 +95,9 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 				  const struct regulator_desc *desc,
 				  struct regulator_config *cfg)
 {
-	struct bd71828_regulator_data *data;
+	const struct bd71828_regulator_data *data;
 
-	data = container_of(desc, struct bd71828_regulator_data, desc);
+	data = container_of_const(desc, struct bd71828_regulator_data, desc);
 
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }

-- 
2.48.1


