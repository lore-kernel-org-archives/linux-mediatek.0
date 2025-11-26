Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB75DD1118B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=571T91Yns/GXDbCZXJCZJVKpj2F/L6rprUSlimgvTII=; b=wS7XCOEyRzguvV
	qlCdU46kS3siB/pWD/C4xQrBJLgABNjhYsvmfO6/pwfmH5GxQwUaRLjL8CRJIN2BGWy203JrvZpmQ
	JIxyhBHCRpDIaw0AmtlEeF9cxY2/FMdzbluKnvVLQD4mEAIRxyl4609gUacW7lj509CVBwcGkDWa1
	PjWq+x9jcjB8RKrdJUzlnscuF7qJ2NG90GQZ/fsufJOHRfH0F99motwcD7FG8ZTrRyT5I/NZdeKFP
	nfEwBHIw6oAO6g5lmDHtXRmzLg02kN6zUvsrnZ3DHCgigiyOfuPHUba6+Jc7oeYZBuwuqpb1iZ2oO
	Q+7E4ONn7o0W03Aqe+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrH-0000000FLAr-2WGZ;
	Wed, 26 Nov 2025 16:59:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrF-0000000FL9K-2Txc
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 16:59:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB2n6B2122718
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=571T91Yns/GXDbCZXJCZJV
	Kpj2F/L6rprUSlimgvTII=; b=JQ59DLbbe8DsShNH1ip3MYbKcLU4v32m5b+Tcj
	yUflWtfua6Xc2gRsjlWDHuEVGUvVtXe/tyAjpCovQ14MGTu0EHT/nQfD0fOXCg3Z
	pqsfagaS1AUNT5BPGshkecUHfOhdLvL+JnvwIkAeyopmtLgnZu1zv4U8HD0ejPyl
	6fogtqNFkV6omPdOYgPlEp+yxd+LgAzBRfVAgw7Ha/ud8Jqbf+Nj7MZfUUOC4tcM
	tqNnCv3NlymWWc4jtw5QLn/HpTLw3xvieZrssfyOd2x0aqzO4xTuf45zek011HgA
	Fc8ub0XBIGt2urCfQKeFHIrMDNAb7yXDh+dPWDgHxJ0axtPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0b30ygh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b29b4864b7so678104585a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 08:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176347; x=1764781147; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=571T91Yns/GXDbCZXJCZJVKpj2F/L6rprUSlimgvTII=;
        b=kdOSk4E6iu4jDoHbCYctWzqGpXCzGfpZAUHCAhKAEf9c/MalF4PmCFu4ILriTjNwrn
         30iqxgh9i80XwJ7cpqlAbe+iLIiQ8cnwObh0BflNKupyBjZqXs4dkDSn0K/DuByWMAQ+
         /3lyfGUL3yyRC7xIvPD6LGpdesMRmgYsEuJSTetird+zbKOYfcog10VDgkNq7P3U2xaz
         Ycv65Byhl39C6Zv9xNrRlMlOdRg2KEl7FtIwNeY08uGVCvdazYkMEiWFJ8w/e5MmWGjl
         zgCm3Z8bq4YvzQwDQMc5Ok4oPOUyFtw74tUmpsPawyCewUzoy6Z1nUIM/wGh+7C9cVSv
         7HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176347; x=1764781147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=571T91Yns/GXDbCZXJCZJVKpj2F/L6rprUSlimgvTII=;
        b=LiDBVp4xdTM55tlygr/mnWtr/5ItWINO5AHXwti41uWwOgNQJUGjLDsLeO1iON67x1
         Uh3f3IUgSOZH5IXzRA/kgUiWAzpYi1UK1Nytm1XyP9Q/7o+f2q6tx7GkwRFDoMxHEOir
         QtRdW4VqwEJupAjDWIdqtWhmq7qCgNk0IzkYC1yXkqKHiGgUoU474iTV+A451unVKz/6
         5LaC5p+PDe4MjpNtz58txMkCP7AWi63rIySeLML9o5xZ1cs/PO6+5Z+Fs2WpHuOT688/
         B5NRuMhPGY0vTlrUlGQr4mgwMpjbhb/5+oWY98PXUHyLaH+aXKrEzaAJAC1F2WzHlehK
         ndJw==
X-Forwarded-Encrypted: i=1; AJvYcCUwmzfnIfqEKWK41/pPx9OFnCHM6M/2UmjNSBbS3OLn4w0g7oK9HSdxQAVrAxf0q9k9Nr3xE4Q7r15e+wk+/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsWlqQn4Us77916z7gFNUCK8V5eCJXyGgTg+WD9EE9JrfdmXlX
	oVrXeobP0EFAurQXdi5p2UvC+UZgnylJ+6FX9iqC3PPaFM8Es4i7Le4Njyr7Vls2l0932dg9A/g
	gTX6B1xRcvOKC9GcRVWxoaD7O4oMeXQer1T2C8Yig1l/IRgdEjWu7n/FOtifIdqPjF6b8ZGUH4v
	Y=
X-Gm-Gg: ASbGncvZKa1pnAX8nlC/QAS0Pae8l6vRD4+sjGuMoFe+/6pHdZuw3kCqzkQ6D2Tc222
	BIGTtPDgLlxyuQwLzLQ46r+bzn6sCCKM8SiM9tMaqCawCugH0cbIDdw4XR7Y1PSTS1n3/KaoVGi
	xmSMcwny8xY3TElkSn+TO0zt+1Xnf9XypgBMU14f/fWQExRprGmRAsgXtWdmeqIWF8nU9uKV1CX
	zNCq4ppiVi/OIeLBhPAmPPmRKgPiRobf1XU4NmlvYesO31JuK7Wjehhj7kHepkiT9P7Xi7fL2H/
	Xl0r8s7yPhMKvFB/HDGe8iqt3dwqRJ60gXr3UvqSVCSejdTIcsb4Qbaurm6dIT044jvJg9rwlDG
	8U4Q2cQu7aYMuy6zcOHb1OxUjKH2MdoELWw==
X-Received: by 2002:ac8:5d09:0:b0:4ee:4aa5:4bc8 with SMTP id d75a77b69052e-4efbdaf1c19mr88698511cf.64.1764176346995;
        Wed, 26 Nov 2025 08:59:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdnJkun/d/4kQjOv6sC0rDNJSC/2LTobAKsQU8sf1RJyM/1taMifWVGAHyXHLUEUdmsXsp7w==
X-Received: by 2002:ac8:5d09:0:b0:4ee:4aa5:4bc8 with SMTP id d75a77b69052e-4efbdaf1c19mr88698231cf.64.1764176346568;
        Wed, 26 Nov 2025 08:59:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/8] regulator: Use container_of_const() when all types are
 const
Date: Wed, 26 Nov 2025 17:58:43 +0100
Message-Id: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMxJ2kC/x3MwQqDMAwA0F+RnA20oU7xV4aH2kUXkHakVQTx3
 9ft+C7vgswqnGFsLlA+JEuKFbZtILx9XBnlVQ1kqLOWHhhSLF4iK6blh1xQed03X5IiGSZnguv
 mfoBafJQXOf/9c7rvLwEckbZuAAAA
X-Change-ID: 20251126-container-of-const-regulator-20e240c45b78
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dr6WqtS/bpFjdEo0usIvlPJ4wJ8k+8HUl6fldIV9bRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHI22jyA/haKh1/EYHgFbnocnQQfp2sDLq+e
 wMhp+5SlRaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScxyAAKCRDBN2bmhouD
 1/BCD/0ZTxK0ZoSEIluzNPiS81uE0LuTbNC59xZKGGtvs+Le9tHkpLLpvqY77qjtz6BvXtlkgfE
 NUjscMOB9zoGdZgxYnJKv1FCpYCBtUIoqhBtVMlnXWKtL3lUTIvbkbSOCa59Xjr5LuxCrhg1g9j
 QQcbBRxhfmrGF47nJEAtyrQy2HJoArSsTH/F8Pm+t3erHKuHt1v/LT0JMRrnd+8dGpAbJhNtjre
 c7e2yed0mxigh/CQ8kvu5W4cutju0w6YhBaRXC77Vjw5Jcbs7sI4RF+FU5nG811nNjkTAvj2aei
 j2tliG5qS+hMzV1EcBbKh32T6FLVCYpPKorZu0ZUoTCExX+fTNwg48ZB0FzQezk2/id5f5APESZ
 HSXFa0gYEO0TZrCe1n8PVtGGdRMhjeDEa7p0+SbOQbyNEBGeZ33lIwJbSWsgkDws4KnXiM5vH4m
 uYultzCuoniWvuvBy61IQ3NBYuldFLeUpz7EV2BeIJtN3Kl+fQJboWmI48ttu1ZBbSpKhEf8Lha
 k9PbB7XX+DPqYxFsoGhX0GbTjDB+Yt8d6M9oh0yrpOl6Ebq4pYyDAeKDG7H2Ygm4u+RUItFaGhT
 oXWYa28pwCAm8k2ISY+wORLO8pz1DiPappuN++Y4bi3VrmP+ID8POAZL/wHFXkBDF7PK67V32Ab
 oeIYCtbH3Z3PiZw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=E+XAZKdl c=1 sm=1 tr=0 ts=692731db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0c1pNNYTX5jJfcLEs4QA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfXyDVbTser6Mhf
 a+PfO/k01n98Cyocs5Q+nquXsZBY17r/emlm1Xmi+Cz7sGX5D+d6FN9sgyth+uJvQ/yH2fn6gwT
 h9LWS2nCM3iTUc4p2+ek4JqEeAHWG4Yt4g4Vs3dR/8FhnixEfX4fpnc24GNKQHA+MtsyrwdeZzL
 RaEmIitBGlPxhcd9aSjKTXwXepDQvCsaSrBfT8QP/m24k+XD4PBN09B9gzx/nciPFOF0OfXKdIX
 cy9RyYPaNS4fNYby28r4tkuED/CwbyP7wkpz2DefnQUVyu98BSufSsnijmzF52cdWjSibzkABfi
 yMwESCvHFkaScdv525fYk1+eI5ATJVoipGKNBcMM/5KfIWC5Xbg+DrpOcfUBUs2WUrRsbqlChrq
 L8td5bQfZ91GCIfWsIjj85pbQNqcig==
X-Proofpoint-ORIG-GUID: 3yVXxaVbbGqfo2hWbqm7VdFJ_btO-J8p
X-Proofpoint-GUID: 3yVXxaVbbGqfo2hWbqm7VdFJ_btO-J8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_085909_739168_C2070324 
X-CRM114-Status: GOOD (  11.80  )
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

Use container_of_const(), which is preferred over container_of(), when
the argument 'ptr' and returned pointer are already const, for better
code safety and readability.

Some drivers already have const everywhere, so container_of_const can be
directly used. In few other drivers, the final pointer can be constified
that way.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      regulator: Use container_of_const() when all types are const
      regulator: bd71815: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd71828: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd718x7: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd96801: Constify pointers to 'regulator_desc' wrap struct
      regulator: mt6358: Constify pointers to 'regulator_desc' wrap struct
      regulator: pca9450: Constify pointers to 'regulator_desc' wrap struct
      regulator: pf9453: Constify pointers to 'regulator_desc' wrap struct

 drivers/regulator/bd71815-regulator.c    |  8 ++++----
 drivers/regulator/bd71828-regulator.c    |  4 ++--
 drivers/regulator/bd718x7-regulator.c    |  4 ++--
 drivers/regulator/bd96801-regulator.c    | 10 +++++-----
 drivers/regulator/hi6421-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421v530-regulator.c |  4 ++--
 drivers/regulator/hi6421v600-regulator.c |  6 +++---
 drivers/regulator/max77650-regulator.c   |  6 +++---
 drivers/regulator/mt6315-regulator.c     |  6 +++---
 drivers/regulator/mt6358-regulator.c     |  2 +-
 drivers/regulator/pca9450-regulator.c    |  8 ++++----
 drivers/regulator/pf1550-regulator.c     | 24 ++++++++++++------------
 drivers/regulator/pf9453-regulator.c     |  4 +++-
 13 files changed, 49 insertions(+), 47 deletions(-)
---
base-commit: 353fda3a1168e7e38ea541c14c4e858c78cd2018
change-id: 20251126-container-of-const-regulator-20e240c45b78

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


