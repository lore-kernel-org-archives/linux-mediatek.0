Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC562F513E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=; b=ft934FWh7S1WTblmwf0YcZKNos
	UXugesnFU+K+GJqjt1J3017eOKVEifKByZKWBHCvXUFG6hRSDOpxhttDpjJ44foH2GyEp2Du7OyTv
	4lxgQErq5ZHDJ7xH37Ej0rcHDMwevmlQUlWp5YHf/dQ+Xrf5b3iGiOLQDYqXwYpXmCB5jp+nDaCzJ
	Mdl0eK43gBOnZag0f33T9nbBupmdIZOcGogrU3VRUprrJrdhfMLEROzELe8jCrA9a1/OAvv5vLMYI
	+W96p0Qa2A90FzhIvIx49ESrthD5q36iicvKXwfBzRC9bNTpw/4ScnDqMcscpxouXrFx3HlqHHMCL
	DKD0tjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWk-00000002bPO-3neQ;
	Thu, 05 Mar 2026 21:46:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWf-00000002bFq-0tLg
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kma2r3136527
	for <linux-mediatek@lists.infradead.org>; Thu, 5 Mar 2026 21:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=; b=GeBv2aHNVvKJuPtt
	eqOaebwXuSQyRXKB14SiCirL5sWi0kFlG7GjQG2PGoGLP5iNIdRwlb2APnrLD29V
	AcWpBx+LDgm4Ns9G5c5nNRz/Bm1VOy/z2inACLoaXG84LKgsYo/AwHUh3izX/eab
	u5T9A6Ww+RUQ76gVcYzTGMEqQifcJorocpBhrICD+UHOdQkIS+q13LQEWyQh+HKa
	2Lo1uTq+1Q5MFjbfzsZVmjzeCaHNdhWGCW1InUj+W5iwk4Z8Far4fEmkpAz5ZZlm
	Ay7u7UY/xudN8LiOczLN9xi8YOXCgWCPKbEPaLfJMl3wusZurk7q9rmRR6J+XD8q
	v2yp0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk3hx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 21:46:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3ad1b81aso1091075585a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747192; x=1773351992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=;
        b=NBo2P3dRYo+Lyb+aEuOtg59qC2JaPBcKPVyHiwlQ4scCWCfqQO51nv71B/Vh/2l2ca
         ZNFILRoNeuspnAFPCyBLCCWG0+zMdk4uCa16LyLdfVvx9FmKONMcLitXR0lmctZ5pEgN
         CeEN6eFsmCKr2Y235PUY/VJ3jJVnsn6q2pYgjLz+QAt5EkeAgQ/EXV1UlUAXgs2b/MuJ
         d4U8VT2eyyCYDoprk9On1/BugfsAw6DMbb++rWwGS7lQnPXyaeX2BFj5ga4hiCAeQaMf
         aJl5l2+ggzdhSRQT2TFpBtTWlkKlWmqALdWluvjk143X1Bv2jbDU4v4KKfIBc60nlp80
         HB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747192; x=1773351992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=;
        b=o/0RyNaovtc3Cx4/Ux0RzsZUae3tgQjTv3CTVr5jr6AlC4vKWWbF+jbHSeIshz4BMW
         estxensZacNgvwERyYdoeOBiCikKYr3zghnf+tXOzW4cxvq5EsQ25zy+uQzZZq3Q5jqL
         4fz+2X58GgGlcVMwiEcXRbYVgVxrycUFkxnPX//WgUwIqJ+ltWKsxhaAz8EkuwYWBoF5
         t4X63UOhIoOw+ne+RQttELdhMwkFEZHjzi6Bss+xSKR3Wti+0xh6zURqQk8oyGLSNBGY
         wZhiLnikHvdryA/JY4Ahpzv8AFNWlbd1hS/47LjltmyACtzCfdbuPbjwcC8jw2KXtHt5
         9+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZg0dNLlN6S6Zzk+H0Lj0/aI7RS+Xehz9uHcqyEdW7mubmIqKwNmHkZfGO1QKWjE43RYeUJbgmgTfNK4lZ8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yykk92IWIofBZijRBCyey6AsKeEL6Hk7VEJ8r7PQbFBBhkCewZ6
	MqMCzBf+aApZDKs+OPezhQei0aL3v9CS+cDr5Gn0/lslWQG3wxp3zZ32ZC66QtTq8JKbP25j5xF
	smVZ51RuahHJ1uJ6ZRKakGrFk59Kcdrs+9IgLYvow5Kpv8jWxK7cu/tXGurT6UWNGUepA82A82B
	w=
X-Gm-Gg: ATEYQzw2Or9gTNEbOcxsNKAIv9ePRolacJ9ZyWQKxU9uEY5YkdAA/MhOtc5VXV/JCv7
	PCqcpnwGOjm+OmwdBBnJ/UVjMZFlkA0yi0Kbs/qnjFAXC1Nzx4XWzhSA9GKFT4qVTS4X3Ko+DYU
	7PCUdlhLEeApGPhSYNVcwCG3rgwpO7VlGEZYw/EDxVjTraqiN4HZJDrI98vPtdQbhtvwdkSY1Zq
	yauYdboswU8YqCGPbgV4v4PbwDvlknK7IrcVx+osxm7N3fN4oMegVV1F3k497fB7d0qI3WKm4EX
	anF2HarnrTRPVYydAoGlMu18d/MIHOU/0auBbKa0CYTRaLvulkbAGXsoyb45oQNvdrbKBVI/Pqv
	ga/AAPk2IAhpr62kCfbCgD6WRLSGv9IYO7LLQExg0hwFV
X-Received: by 2002:a05:620a:470d:b0:8ca:3ed2:175c with SMTP id af79cd13be357-8cd6d4cc1camr1439785a.43.1772747191597;
        Thu, 05 Mar 2026 13:46:31 -0800 (PST)
X-Received: by 2002:a05:620a:470d:b0:8ca:3ed2:175c with SMTP id af79cd13be357-8cd6d4cc1camr1436485a.43.1772747191067;
        Thu, 05 Mar 2026 13:46:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:46 +0100
Subject: [PATCH v2 07/10] mfd: ezx-pcap: Drop memory allocation error
 message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-7-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GLZGLUI6y8mTC1CoUCYnqXy51nlJ9FI78lkz9mC/UlM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmeJzlU8gtQ+4HiL7LX4Fy8K19t5RszehHhz
 SdtprdfKQWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5ngAKCRDBN2bmhouD
 1+uJD/9YHgJPFhEWQZRYuFGzeWe8z/r5Tj5iDNybutQ6RysEUkerwdr2pHTgfsRQ//1RBXmWi4/
 cGOD0AGUW3fLq4SM0ozdgKVp4SGjHe5iS324Xf1SGuW4PJtLu0+DMjDrfZ9Kh1ya+NqtjLYuctz
 EwrBWEFLt253pIx8JCBgt1U9C6IW+kSFzgE0q/6wqJA4aWn75PrcCxhf2XrRd6gNe80PoXhkOmd
 iPj9TycFnCTENdm1LWjcEsZRyEROU5nbnitPogh3z/3ryvudV27PKHPdqL/LKiQpefeIln5miV5
 ykVaKnRr187X1a0M6VOJWFeleyCQwr4MXqY4dHZnwAwm2mzUoSfV/+72TagqkdYkAtYsXcGEnp4
 qwXZqkweTKfvInlQcX+MyS6503tvm1UMD6Q2kjN2gSX82uO9lbiHdSpFRU093QPrKuJupoShmdh
 c+IRyPPixT8vJaH4ptL0qsHeVwM+TK/12/SQ7fPsshy9snxcABFZ0LKXOo30Nt2gevOrIolUsGX
 PNGgDwpP5Mj32fue94/BZgfPd3GFsPgp+6L/76kAS7UKVXl62a9ZGQ/jZEwxiu0d7y3zwBnCiYL
 sOSc37AP/ai745h4xjt63Iu8AQz/MLguOCoJxLgCfbcrRpy1BlqgAR349lUqdkuRtqt7TOnBopB
 uVBAFJuWvfRWAFw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: wrSnhbiKJusHXc5UMlVu7-gHcZLEyXxo
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9f9b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3HoxRS3-ReI3PdwluWoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wrSnhbiKJusHXc5UMlVu7-gHcZLEyXxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX+K20s5Vw2Zao
 jVBzzk8a5a5EErABuoAL/AAYq7k97h993aBBiuU8G+4HFF+z996UWSMcIIVOFxIicvaZXXjgyD+
 W52jea/c9l3ClSnlryB76OV51J9Kl6NIYB6I6Xnnh7eAZ/qrI0KH6n1ud/lKJHArzBSRjkwLHVi
 etKQa5naoCpubIqpwJKfhPFQJZh5n6MPrNliCKa1aqvaqZarCQtHDzxGEvBK533g28iwXTc1oi8
 Ip2GSPtxRYC2qqO0dTqR+PbIvR7BwuSz/2GoS9UYDVt9Zsvuh25HGlWxKD17piurYMrDxjfHE9q
 c5+Wo1h+TkyEsc1CiKm4kTjtVN5fwpSUdkhwxqr0Yyz/rLf9saJJudaDSJjOzDZSDd0Q8KxhDwb
 I2BEK7bdvcJPCHWtkZhRgIOMzGkkWiguKZ7a307NWGzRJiF7CSRrL3dIJq0Q1K7wyA0kINoJZd1
 LCYuxPewiSgQI7qZeog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134633_905388_AD9CDFBB 
X-CRM114-Status: GOOD (  13.80  )
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
index 24ca140d6a48..cd0520a08224 100644
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


