Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B39C44500
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=4D6Zu4uke54nzG/PnIM7GJw14k
	p22Jr1PLHkULzFcNK95QUN/Z6yPCE1DFWdQlCHd35KXFG3gxPyotEICYNxWUKhcqA1GAjCc/xdwsS
	BbF3Nu/Q3TYPS/7d8m9x6dXw8ONLs7B54MDDQ/vRJDrtMUBMUb5KRlxgfAKq+o9iw4cDxWXn4ZdDw
	25SFkI/yLiUGQpihQukJJByFHDaKLtceoPRM0JuIJDD1tY+QnszLPmiiGpDnUIcjz/Yltsx22v6oH
	MhG9+i2VQYhjxlkKVJj5Ge54jAoTonpM5hIMJIiNNMDKdj7c3Qh4Jh3LpDOWMUqgYckTsWJVsZskp
	/xRpTlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShw-00000009da2-1c51;
	Sun, 05 Jul 2026 19:40:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShr-00000009dXa-3xj4
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:40:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhrcZ2326806
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7OthzF5yzbE
	g8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=Lc/WGFTEsBR6FyBf8pb2q2cTo/S
	IRTkAnMpy4BZluObjv10Ds1+8wWUnkRZLMFnZfxn4lwUf9wNpTCxvblYHfxq/YKl
	Ovc/Cj5jLSEuk8ulecmXZk1CDgTUxGIQtjZKnuWR+K1jUu+ftDDZonwnoZEjSzlk
	ct1xTk+NVIo42IekyeGwdAr5vq+YHarJ6RB16P36dz97W6pvhWCceSyR2czSTYp6
	hSXnIp2oW/ZkZTxzubwpV++50pKMPkSorshnXRFfqderNm50KPgm9F/0EgLX4x+X
	hMm6Gy4Wmztc6y63i7GrlHroXX0TGdaLddDcR9h9VbzCKd2rrL7p6658Gqg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh3css-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:40:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so1912840a12.3
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280446; x=1783885246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=E1KiN/USKHZ4naFdttrMSBXHZvB2OqtaQG5UlgYA6y+DsvEUd8LJK3RP4G7lpUb+Au
         jZt4VlYaUMdzOYFeHKfGWX+Y9SyeJ118eQ9RL2oTS/5T+2em9z2DkS+LNK8aSAfEzWQ+
         L79AJZb8AKXgSjLuTTteVTs8y8Mke/9SwlEXDhVG+0sv4X/8v0QQ3U/6karTtC/IJlkF
         FP9mMWc9YjFXB61cLvIrLqamdtibmwQNMMZBcxRFrsx1RVOc5+GwofEULTIF2XI+jySc
         T0jCoRth7GBUucJfhVvMu1S87BZdO4WbERJmrrWft4yXBdh3GfWMnaeIiHaKdMT0dMfd
         3gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280446; x=1783885246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=eu+98U+xHssH4xNOkI74GlgJg6rovabmoLN6dxVvooOJLHwRqFws1Ci9cudCR96eDu
         LhLEwDadX8YJsaVgSaZ7yow6+PdKbPHOmt/ktjJbvPgzyL9F9cUGgPYho1j+vDgUnK5T
         WOlGZt1zJXuO9+i7PM0YK5d7kJ2gmiQSrnIytuTElWRAa022ZDJ3fnDROXjOogeB1tOJ
         Dt5bmY4LorFUIWbv6BZb0ut85250VQPaCURET2hxEiQQq4gUOCwPKqSh0QCRUsjsjkoy
         dbfbNwtr0BbKLeG+vue6nyW2yLj+Yd7N7LCgXCV7EnNgQ1SlZFH8E2gXikd77NdQDkyQ
         bYLw==
X-Forwarded-Encrypted: i=1; AHgh+RoJKFQOFp3PUoBON5S5Zq9K/LeXk2rI18pyG6Vftnr0w/GbXNiA8LRHncRzj1hDEmF0lAIt51XuXPgJPI1Qdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWRIFElEvSsx8p0eCZDeXek3oxDR9abAmf+c9TP2idBRvZhmxG
	DXbNvmNB8YmrzVMmXIfVJ63ncRhNEj4qbexs+hHBtayBvZ1Zv/UUOMJYZBIpFMv8kV6BoTWHuXp
	0Tr4YLnXLToKqQuTJykILoEWjAb6hfK8GnXwUG006TqYn4wge4J1ljO3cKBwchVXI/6XVvOEb7T
	o=
X-Gm-Gg: AfdE7clFoi3C94h4BfHOfhLnsmYFqZB39hT/5NbGswdJuq/WATI2PguZ3bw3iinjPKv
	ITUo0dpGSrB7RQOdtsPGzsehbm/fRajk0Mqi3p1bsDPylspzt1mNCZCTESp1wKOhRtVqOGoeRNv
	C8B5yLdy6gTJzO6TGHrUYchscVncEEtZif9Osqm49X+Qi4fkWZa42agvZ/5/H/nPFMoop2XNn4s
	8J/0NGCsIjcuAQoraHOc3BR4UJdzsK2JjBJvBej/9kUj9jUKtl1MhxWfCsWwi+6NitypvvijF3x
	zPcnJJwO37FrJWt2qqOD+eoBcO1yFib1owhI4SB1FgpezoeGYNrsSLFduqpNUb52EfdzEvl67rM
	I8LU8TfVKC279JbpvUYMnPo3YIZPOMH5njRMOGA==
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049928637.60.1783280445923;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049907637.60.1783280445455;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 35/42] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:11 +0530
Message-ID: <20260705194019.2565498-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4ab33e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXyWYnrwPHWslK
 ln2u5uzoiL1Mc3ho7hZSd+vXubDqsgY0nnJ8B2bofq8F48K2M/+zCBeXHC6TbPui0+DFW5WxyUy
 mU1tSVjhB6BY/SGFeZWh0zFa+RK1/25p53e0lN7mYyDs0AM8Qg0qly+4Qhs/5S52RdncIKXYnVk
 IlJS2ItDaERfhKGtCKT6kNDPAThInbViRkxuKchuCyki1XamSJ3tCq+EncAxFLk7yOYddjlweeg
 /2mYjcgNzqdsYcA8p6yutHVW8xFSBe0LBHR7H2EGfKm5z9n0rijthUJlcu9NtgN6F+3QkNLPgHS
 SFYlqMFZFq1QTCJZ1jS7yUERw/aIRX64fcGBA1yi6vFAeS47XZZL/wrmvfqPDK8yOkH7pC5tZWr
 xzm4kP12WQu9VKSh7AjIo0lc4nOR7X6M7WhL5KquICa6aMG/hI0h3KjDuCAIvWT4RMdloZJLwu+
 TETh10qlSgkR+F5Cp9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX344EmSUGesQU
 97RZISMhNPHZ9k5O7HYRQwnXw4vNoZgKVpmY/eYSjY8Cf5fMEz51f6Vrj+LQbdMAdNQui/HjwRj
 yAxA2m3SfNOXmDsS9pe55In2TeLfdXY=
X-Proofpoint-ORIG-GUID: MQaGki5Ojqe9sntjy8ilvZDcFXYhF8Ry
X-Proofpoint-GUID: MQaGki5Ojqe9sntjy8ilvZDcFXYhF8Ry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124048_101266_6B88A876 
X-CRM114-Status: GOOD (  13.79  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0


