Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA66C43602
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=fBnYU+2manZmRcgZPAkyph0iPz
	IUNIsLtNg4bG5IcbFeAFJ73NjpS032yLQ0j5c9c4OPezCGAjum1HxpZTddeTlz/+YiRNoy4g8pDoI
	gFxTjQol9AG+WjpJ20iARng48XHrmt0iY45ZeKQgjmU6VbUt9VpOLN21jmsMc0KhdxwM2C/i4yj9A
	E3ON1+Rd1fDxUkCd9HHux8wIIzG8bURwTYczkGGZ+5KG/yZ+rutmnB8yhVaqp3WijCFwf2F7JvWfu
	xUQvvZWeWiq+StPF5bCkJrhjjqQsWQrSXlfQhat/znTsKztMH8ZGu/9GAbYmVw6lPL9pPk516rHwB
	JB/944bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiC-00000009dmw-3XYP;
	Sun, 05 Jul 2026 19:41:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiA-00000009dkp-3Dww
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665IW2gR2287822
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YE6y7UueLsf
	6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=Gu2AUpMPsdWihBeIKFaHZTQdE6w
	3hlEj5FaB6LO25HrrwgnnnhbotR4nd9Z4wSGwf4UfkCGQV/6ByGXzYxc9t77t1UR
	KxydvfiZRzO7LVQt12P9iUwRudBr1BpCa8xRlWA11APsaC65cFh9VkqkdXLfhVEu
	RS7FUpWGXF4DoGxxuONB7a1iHQSW5kUybFXNTGlhVzncQd/ITVBR3Qzh2FEbhv44
	Ssss7TOOyxh8WnUK7ITPBb/1fcoeLek05gTbaYXanK/TXcrfcsX30aor/3gRRzD7
	xH/7V5eC+aAPsHQJS4BlpVVOM2yO5umWhzidCMbdBGwQ6NruQAfsY+kAKHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf8358u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:41:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9e9cb6a44so17510035ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280465; x=1783885265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=eV2IwkeMveZnv844kbPDCw+Exlso4ENegauz+kTAPAIgL5iZg/HmemcZeSTvvwkRBs
         NQsf2hd8naXNAKrxyJQxNrHL6ySG1zL/01dW5v43cdWqcctxqBPL9WdcZf6cyfMhdh1p
         lw035lCtTLAAgFQ1Ho+kJq+LRKrWL7mkbKXpZRAks4QRoIxhTYa+ZTdyNQE/yhtANUUP
         bTUFDLdSHTm4q0osKwLhqWwwSFirti40KOPIxLJrYtH4vvH+pOx7N6ixDtTipNtjdMc1
         reEJO1+7PsqVLks2unNml2SnO4/RGIuqliAA9Tc1e3iV9NWF2tCkW3NBlMBHppRqI8rt
         iEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280465; x=1783885265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=PuA0dAw+K7F+zvdfdalXJ5HBgnCy/fLwqq1MkWedQDzY33PxIb1GtquWQpb7XXhsdT
         FTUt/w9xeOpVmOlkij1CxZXKRkvjUBQLWo+klWVWFRmvfLo3wOZtiJQnP9zg77gOyh13
         pPzPFR1va8i+h4EURW6QrhBGb1kQAg+iA/94+aXYWpLOpy5imYLlo8Q0i79icUff97gI
         XwFAtaqyIJnnOBayXG3cSVEz7OjhIHUu5co75UkgD1n0m5x4LJ+1PM2ugT6TW7CgKHZV
         zhqUdlJW1awPmXQrHQ5OVrYPz5jJ6PtewK0txmJkcw4sg570UT23ZcuPPLnIN63Owi9J
         VyUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFkt5GbId8k4wDUY8P/Mnd9tADB+V32wdpQhaL0QmmcJCpmiNbyl+AiMXrz47MyEiACvnVGvTCWhDfVEb5XA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySKhL7Nt8C41RVEFYUXHktNroejsBZiXR9Qgo9r/+FKFY8SXOq
	LBVd4NJrCQ64VsTX9Dn1Wzus3t0G6jDGUQgyR7XyTsfac6Y9wyi4Uy4Ysm6NLFn5KjBc0o+69kS
	tW7yaYNZ0gwMStnPhlf7Zt3sDf94FEfbRGv6b99qXZaky4uz3SRJbfvqDYX1jJzE9OG4UfmoLsw
	U=
X-Gm-Gg: AfdE7clJ4mCCvKLgsNvccSck42CPd8m+KPAOtvCHu/vEquZdsRDKtGFRBSCGy9vabkM
	qUltdAxISF4C4+97dIkkMw1HxuJNPJIb/k6cafLFJxVniMORZp1PpEN8ob0b5x9g/jQWydL3dv4
	lw+AL+pQBWhNgLadMrJWMgC6QyLOhQ6TiM6JBaV7jiExYCX5uRYBCu1aQBqkUHHQm1j7sGVFsJ5
	mBrIqfJz3irPjBoSeXGiresoesTk0MnmoP0anCeaoUkTek9ph6ka3cQMx50YXN0PkR1s8h+2mz+
	c/Cgs/5mNrTSsJGXeXFdvCEhwv9ydB/sQtdX2NCRq6R/PJrfjjzjGyMXVSUNX95XlQ1ycUKgrwh
	DFVLHwLI08y71DoDhDMURhCTg/b1OE98Hs5LgOg==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673675ad.17.1783280465198;
        Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673415ad.17.1783280464710;
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
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
Subject: [PATCH 38/42] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:14 +0530
Message-ID: <20260705194019.2565498-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NHQLKE_B4N-2qVkjpp4xHYz1Kaj8Wq3f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXwQyh2ckwBRQr
 pjH/1Ru4fYyACIFoMU1umdQCKlWxJspO7IqKdlJbcD42L7GhoC3pTwVQTYzeWBMjoEYKhiEU/0k
 1ODClMIR/wvHunO7YhzzjX8x6flI54g=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4ab352 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: NHQLKE_B4N-2qVkjpp4xHYz1Kaj8Wq3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX7hGPD/roPce5
 L18brA0+B+Rpm2oFwRuxVP6oFa6iWPx3FRz0XYKtQ3ShOtFHMTQHtqPafKFI0DTI4W5zS5YXkJ0
 RcEuPdqm9hKp///xtQgN9dZ0RvPRFxvOEBRiZiBzERGnSB4XPagdxWjkW2ZwOBug5BpnrfLGteU
 SxRaTzIdkjrOU0mPWpck6Fi9MQYZCsun91PREpiAoJ3HVRDJmywOjRwXwJegqDP3NylDqEbO7rX
 ngDHwY6QA55WR1Gxi8bgIQaM1IcN57yT0dwvWLQqwJ99xUzaEXcHlV73BDoBFVigZ2g84eaziCJ
 CsCJNht9JnGGWRi0nFwz0piE5DNtyMykVzPRO9FQRXLqg+B17MGd3TzdkCmqox8kStCygCUzsb1
 +S5wz3RM9cdt1l3siRYAj2W+IDJwXe/MoZPgRb1OJYuzIMNEpBCD/TjPCgzWuVVduOENZ7Df7Pc
 rO7cw/BEtITyKbFZmFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124106_818028_A148F664 
X-CRM114-Status: GOOD (  13.87  )
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
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0


