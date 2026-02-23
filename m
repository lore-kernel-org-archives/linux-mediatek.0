Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067CDE98DF7
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=; b=trrYpApUEBeBCnb9KGdP59g95j
	RpyJdT/+IGq6eYENWvY0LvPk4ol5THM7YZYfMOj571uvcWu5z7+TqE5EXk7FMFEi9sueaTMBWBw7/
	x53JMWvNoiPc27HVZCptFTUwsKQ0zlTr6Ttehq8Wlct66vwCQYAKbB0kXqWW3m71cmqnkE8PbfmUD
	vaS9uiMh5pbTQl3Vv8ad3Rm69zMXzxR2bYVgcbpHj6BQJdt6dUryGLUmdmnOhyQceOoS5SN6DPV+8
	PuxmVOzQCeBNLcRbTqTa1+Jl6gsSUYXnUX1vXhJXguIED1Ip89h7gBfcKF7EeqOeK6JnDEKvwP7bU
	+41qcnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMP-0000000HMsQ-0MMd;
	Mon, 23 Feb 2026 07:28:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMI-0000000HMj6-2y5d
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 07:27:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N0Td981921214
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=; b=bXFefgdhxPDsuijE
	pYnRuIw6NL0O9YNgYItg1nt7i4ZCQEWOoOkFJAUghwrB+umKaoiUYEtnZpPxNNPv
	OlxrAGmuu+grnE0hac0PCqTo2xII88LwC3ifwVKfvHze7LyFkgVMOAn4C6uMF0YJ
	8jmAdcTJaXVqOp4YC+mru81BehBD+pO8nU349x98rPbYDSELkEAXuHO7UYcyA+yV
	K0q+d/6efiT0GCyZpTSr8tHZ67dyXrgpKBBLC7c8thjs3hNPl4RTemJhOjlQSZX9
	zgOUbR4t5ODWBY2zjHg1jkLRKO2p5vtjTVKJ21Y/ynHGhui94xPGB13nXFD7ys/s
	uWY9GQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9useh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so3812229385a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Feb 2026 23:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831677; x=1772436477; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=;
        b=fWP7xNQAGI6jhhOhmY+qLmZ2QkPjZAJs3K3RlYNq2D36ANxNJElbR5idPTYj+Rn7zU
         plCRil4SsjPDM0Lho7lHOkawN5DCrldNCCeTQ7I1uv8TFTfD8kzRoZxZ6gW7Hhr4UYev
         2JCS6ahqy3lK/2+gyXTwDuKpE+Nr+24WpYVm1HVEhtPorI5uvBUHWJmvZ3IgkPX1ad6+
         rpm/9yFzy1GMNTXx5NyBHVG/HtmFuo0YMAm3tso+5V7Pcj+Rp/vUQq0rugr9z2ic59vn
         1mtpNChFUffpx0fZnMWSPuYMoTVIK7O9JXlMg0tphhssKz3an6I3MtSdLrQHJPbsKxxo
         Hzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831677; x=1772436477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=;
        b=DPFn4MBA5Wxk8ZuQKkQ4lV3BL3zgTwL4cp1oc+rWK3zm58i8khj3Ndzz02Qni+voNH
         ti8ixORbEHQgpsr0BKyXqn/XZGUKfxSPH0OEOyu7TEwlsIrXHVkwI6juHODrsis1WK2X
         E2v4uF72EHEoVBsmLUd9fc+IRAVum7fUKwYVdE4zOO0O4SjcsmX8yulJE6/vBGG9ma4+
         whf9KzficNOHJt3sID2xGNc6E8/17C24UKnF62MxWaUhjckkNRegHiU2buYp6G8cqA4j
         yYMYU80XKHWL6Tx0sCrXae4v+Vzy/1MicvA7meBfni0JotV07yorl4BUy7VtAz+rCV0o
         AnyA==
X-Forwarded-Encrypted: i=1; AJvYcCXgA3SjZwod4/LvZ+EpFp6RpeG9aFpynyYKfQ75D2JjCtykEIq6SMpoXWq+m6U0OTSM3S2Rmnn9LywvBfaVMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yygw3RPjE9hUaJlM1QHgOsYHMard2S2hrQxjLlNDFcp3MMKkr99
	HaD7tqEFQbOLbhGnSm/Vph1HMwaToTAyQru3UeCMr4Fj/JbzKhH+fOSi8kxbBSPNG/cYrBSY1az
	qmdhCbazO1Fl0CcDmmagViWm2MI5fZHgFvtz/5uHdL7kx3MUlzSNbSsFVbGx3FED9LgTrjFOrmG
	4=
X-Gm-Gg: AZuq6aIhpSNokm0xsMNYEwyBz0joTQNWQgyg8tKu7+dck8+zKU1tGT1JSCqJ6ltZfaU
	6LW1PsmpVWl1AJac+REcldP4kAy5oIAb5j9nUh/aZ0EQF2LVzw++E1GFFwj1As5GgEM2dF+RxUa
	4/UMMm1q331WjhmhAnZ/VjYUXdSRz1MEA/RnnlD6He8M85+ayNQtRP/eNUJ6cN3T+e2OPSE9zXt
	5dszFuDvDEE/BgNDp/x1UyXxVE8irxIBRSL8X6x1LkimEDAXZwrii+VSMvv3G+OtdYTsc+YuPJs
	FDXzFaEwtE+Iu35051ofmvu3Z309fE9QxtBDtKQn/SGBo8qcJmBnNeRuD3/v+wcZNiB/1HaiTNy
	IQQS0Jeo/uN8AATS54Ukk9gBu2iGaen2meIScXkfTC+6zqQ==
X-Received: by 2002:a05:620a:4726:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb8ca740a5mr760939285a.56.1771831676894;
        Sun, 22 Feb 2026 23:27:56 -0800 (PST)
X-Received: by 2002:a05:620a:4726:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb8ca740a5mr760938185a.56.1771831676321;
        Sun, 22 Feb 2026 23:27:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:34 +0100
Subject: [PATCH 6/9] mfd: ezx-pcap: Drop memory allocation error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-6-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r9x2dulUi2i/xHeDpXgX0ZLrT/131D7Fe/8Z5nmd+1c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFrkKbfiaWJobMJ1uaOgm6ZHmwStj8BHlR2u
 vp1CSwCm1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBawAKCRDBN2bmhouD
 1zVfD/oC4r95LjZ3DM+u2Ns+t8NFjd9MPKu16F32jeMboQjnWCR9YCLIRwn7Fvr1TR+ff5UtpyT
 XBgB2Rx8udmj/g956wfXJx/U4gpvw4kMozdxk98g5ROegzSW+zpfBmSdv/Y0RkSJY7v5JcH18E4
 nWjB6GjTLB5VOxQQj3pioJknmyxmuwTELNXH+jJri9kT3Z41Bz+Klt2i8/wc91yhXb407gbpdfR
 4DvWYkfuiKiF3C1e4MhjzEzlfuG9qQD3KIscOucgJL+YRlX3Ey7sED06o+WoJPNrPK0QfFXhHZv
 NOLX6kWeE53OeTAgE187NhmpJzoj7zvcDbaBI31ndIEGgthZWx7pORQJu6zkRlU71fOtYDaid9J
 FrKtxYHV0/sGCkFHormsZ+GOapWYEhWEJR50ScVUbd9ULC4ZlxUxCBTIWhz+Lkm9Gv5VXaFcLS+
 7OxY4GcIIWlXpspwcVNxWaSdqZ9JRVxzaRyzkcKW3kuNAn523XVBOUAuM9iCufA13SLXkpczN+Z
 ZZSw0XB5klJtECmOL/uR9A38T4ef5aU9LT4QNNVIEmKT6SgLS7zCvlvFse5bWOgrryLV9WAJGQ4
 W5iU8ft6bo8owCRtIIzDxGrRgVlwrPd6TNb2HR4Nqzie8fw3AxXahDDaQMK6t5HaFml+MzTwWfh
 z7dV1TA37i7F3gA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfXyBoWa6rUf97x
 uEuxOdRyKR8IykH0/rHDYqqNV2BhE8QovcFjUMKowZmKSgFpeHOLgDmFfsID4DWAdm4mxHwpSw9
 4H7ujBeKZJbA9kxfrFXNSL0kkAqoYGNHukcjbNu0hrh7SUD9gVaG+S6I0cu2ubwebNSZA6beOG3
 BrGAjK3VbkyHB7jxE4en2n49bmfMqDg/C51fZU4HWv1Zwj/ZGvw06vL2uztOaaB+GRpBdB9GKAi
 fPoxNNeli4uk9a1jHtLNjIbmVGbCH2nyyJH9NgeNFaI0Qae5BdjQ5UvtKtWhjpIPORsjc6KjlHD
 Puudm5PI/WGfsobehaCQJHewr3mlrPhKBXzrpwEMFmfAUSMp4glAYR1PaLTUQcmsZpE0Ah9Upob
 49Nh69//Y2YpFwZ3SkwfZybsGEP6TimtGC3hF0kiZ56Thrtw17AKMpV3SEiie4EpS8NQFhPHW2S
 Cfn7crTfiyzfn4Jc7Iw==
X-Proofpoint-GUID: QI1bF2KQAWk4ofpdCNXkR22cneFrBRrO
X-Proofpoint-ORIG-GUID: QI1bF2KQAWk4ofpdCNXkR22cneFrBRrO
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c017d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3HoxRS3-ReI3PdwluWoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232758_860327_8C62FE96 
X-CRM114-Status: GOOD (  13.91  )
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

Drivers should not print error messages on memory allocation failures,
because core already does it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Further patch depends on this one, thus it should not be picked
separately.
---
 drivers/mfd/ezx-pcap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 1be4557b7bdd..13cb185638a9 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -416,7 +416,6 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
 	if (!pcap->workqueue) {
 		ret = -ENOMEM;
-		dev_err(&spi->dev, "can't create pcap thread\n");
 		goto ret;
 	}
 

-- 
2.51.0


