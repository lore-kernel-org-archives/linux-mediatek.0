Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4827C43458
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=MAJRkBMrPSXrEYYWiroec+6Ub6
	rIjKo3FFe0djpQAxhLMzsyrsvPngP0h8q+SD18+RbGvJi6r6JJBAE1Mpb1tEf7SbZCCw9J90S2pBM
	O82l3dXibkZTUvN0IUpNJpxOaqZ18fBzqNP7KzM1VPaWjAfNH44Ci6+HtFnuOTOX8z0yUO9wOUBVT
	90j6ka6weQ5+8ENesvBwdHOJhV+z3oKWxYvMOq2VyJQAwbzxLoDxrePM7mFhaLsD/LWz3UlxaucgQ
	nlC08o3T9ZaZUPnqg8a1J22I3PmQiF6ZTudcqlQitxjDSlQKrnydi1IgdsHpv4iTzy+5VwUCGp2TI
	be5uijJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShf-00000009dT5-3iXA;
	Sun, 05 Jul 2026 19:40:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShc-00000009dSJ-3Jsk
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:40:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiqCY2316887
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03p+FFlmwi4
	5suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=EDqYFdv4Pmeqy9IR99dcNiLiDAT
	/yuTE7Ljg9Hev+D7GIua619X8FUaXVlexko06UWo2I1UG1HwTHa/3pcOiO1FNKdk
	YiY1UO4+AP6rm2LO5F78feakLwRgePs5DdWtrzsXwhYCgTfecFqPFRL/MQqcfyO9
	pb9r2UQAkfcA5gru+dfTHa2mdfv7340zDAANejxt7cH1lKuJqEenlOMOzxtkjth3
	hBP3jcZzSc9vRDjWjL0r4gMT/svWmjZh1dvVGSJdpYFTDJ+ZtuRTINMxgHG6Wmig
	3zizUVw2wRtMv7D6VUvWZqVy2hRD9jXlwyfLqvXinpJSMddoU1sfRGdzOYQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk9s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:40:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1766753a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280430; x=1783885230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=i74Kh40Odq2Lgt7wQqlD/nlLK/0QuZtpHaMm8PmZy+AdyXtDHL0r77JrlEfPLzA9Pa
         SSfnJab0Uepc3/ZXLl1HQzeCg1PfW6eoOnKYqyFYOGQA1nsuKKH+BQOScyv0xLZPkcqc
         +lBXeEp/FS3/J4qemiWOflektwnP3eyVX2rQUnoAyco0NzFt4Pwu+coM80XoEPQWrvBr
         1KzovXod/KDHWnVmCRJyiQeNlhOfL5S+x+CApkWjY1luby6HjC/ZO6NGTpKkN9SpH48n
         r3pPmueg+7mrrI5Pl9t5vQceH0LazR4jDWUONVkJZpX5TaINT3MBPjmDWoT8CghcJFAC
         1Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280430; x=1783885230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=BLhL37mqQLPwbFtdO0kwrkeWjCctBaNi6Vc/D2NddEML14Syf7eCiyjiDE+oUv6g4F
         3YT5rmJWo0Sm4deivyy3c5xiDxyAnlximghp61ttXFVqaih17byql9Tk4RfUcPt/f2Hi
         UyJsyGXCheYUdkrhLapx8P/KgQywhEbZ9/7Qby2znlP69oeKKREhePlIXN+8PfWWJyFn
         LJNl37R9Y6nQh3eSD3fxoOH220Fo31EOrtPum7ujRZzxwOjLhEiNNTXVsSmTDu+vyHa2
         wJSMSHVIqrjmNAd5LWL/Mv1PpXXmPvM9C/NwYToJ9h2cB/QoRJIH/T7Jq2CM1suCP3dr
         oDzA==
X-Forwarded-Encrypted: i=1; AHgh+RqYF7Ya+Rl4A2+w1h2YmtOEmAMbtU/Ip2jlz+cfnbJDQf3WriXXHfFOMFArQvvSOOnCOa7D2eqwCtYQRZSctQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YywMXsHbzIXgvCZt6/cjRmobtcM8JSjoyfnj2JErErwLNucT9a3
	jgsNEGxvyf77xj/Cj4lKfn6T9O071qkXoCnzdCKN2zmJPovTFMJDfTjBR83r0IptwPqsSXpz92v
	YGf8nO3jbI6PG6Z5CSWWF0M8aQyXqo02y6gev8BgdsGmR2urN1ZPse5cpNYeybhf3iP656TQlUn
	s=
X-Gm-Gg: AfdE7clC5zblkOSHjWf/FVekhEaSQSsGHfd8LX9KzyFY9FCTkVfiNIrxEwgJRQyBQPM
	iE8Or+K4BfGXc3HQZAIX7XFzzBBTRp4Jy7UYYRPhZWbtz5QvGgm3z0NwKN7SqdexOfyuet8MMkQ
	rAKgpmqnL4Re4Bduci81EMOeJUqh0lzhj4yq1lFU8dEYh+jC0ZSrv+7XWZJcLOtEYfCkPSBBlHv
	WbiOQH/LndlQKmQ4W4gQvs5uoELqGXdEDpZWDZ43LYx+VH6OQF/1YU7CXCYiWr2+yvx1L65HcXU
	Ir8gJsj5qLkQFydmcuSIeYlWn+47KNbcFq4XnQ2WYPMtM2E0ijBFPRxcoE+yMcnjtNPZm3qlQf5
	WdEvJdip58TXril5nXjyI5FeakMwV4wiPE8PyyQ==
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693680637.34.1783280430283;
        Sun, 05 Jul 2026 12:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693658637.34.1783280429779;
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
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
Subject: [PATCH 33/42] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:09 +0530
Message-ID: <20260705194019.2565498-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6RggW1VDqZs44QhglveNUqMiZ-7fE8eM
X-Proofpoint-GUID: 6RggW1VDqZs44QhglveNUqMiZ-7fE8eM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxV9JcT3WGKUY
 IlKPwddhc8RGjRThPSd2DCMTmwQa/GZDmKlkENZnqSnDd/dBzM9hfNgrx6mKtFVo7ToXZE1Kbeq
 1XAJgZ/7KDXeJg0kjtdhPlZpvd5G0Qk=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4ab32f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX7AcI6HtQ+YzJ
 BHRNUU/l3IwIfc8aCZ2V+Q+pgTBaQCkOA1tdeP1tKrtSK4tf8HQJUVLSUAKYtVh6AOF7hKoi46+
 PTyVtxHVyyFy6+6N/51ST+Jnf6E3EpjeYr9YT5csMwiq+gdAqRnWEikuCbwtHF9akUqRikXHyUk
 wA6YC90ss7E+XZMGPsws1ZluLj6zRLD+BP3dQ4680k1azYcus8pLsRVaikgeQR5R23r/7DRKLvh
 DBv1pCOOg1xrkaJoBHDD5EjsJH941mNJvtFnbA2/32nM2Q8XMw7VTIiE9kxhvEpYV5Smj/P8wNg
 vkvDWT7VYICfGF2TXzqHWjaBDeW5EXl0hrnLWx9MN9Ps8P64Y1aE0+cQef56TZeos7O2IAbONF9
 6PMPxtoVOtz9pN+uZjdQ8epOez5Hafd0MKLNOtljbJCkg9n2LJYWP/6QhV6wKNSaNVtSO7QgKXO
 j76W60ksBbRvquhVKuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124032_948883_280AE0D1 
X-CRM114-Status: GOOD (  12.15  )
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
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.53.0


