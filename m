Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A70F513E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=; b=VVglmClE3IXvN0WdP2c/XRsw1b
	SlhCuGi4KxeOWEZPHJqdDEaPZFUQSnQNrLpy2LV1EBtRpxOqQtLWqZ+N1Q7sN7A7gFQWc/lV3LhPL
	W/BaHq6neXQjgY+SJ3TD5JPWQNDhG7Vtg5LWs/NwYJNCEsESaXzK8EFdLxWJMQpf6RwJVcdBnNaaK
	zLBwGUZfDMs6NEnFTEOcvGOWkV3dweXXhfbo9TBcjTBAL7fXTYdpnwxMjBueKXygBBNenUmH1i+1q
	pn3S9gyEtrAqC0/kPpLdu0wIkWOZnOyPvRJXYWjc54a+00h7/0Xwftr/c6rTh7CN/ZQI/3vAQ54dL
	Nynzd1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWr-00000002bZs-3Nv9;
	Thu, 05 Mar 2026 21:46:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWl-00000002bP2-1bKN
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kn0A21810535
	for <linux-mediatek@lists.infradead.org>; Thu, 5 Mar 2026 21:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=; b=kTDsn66dim843s3x
	bzoXPIj8EMMuopwYjRQyxsAK0/F0JrLLNjwqqwjHiYKYbhwfPNhqEV4WSOKJTCUw
	8oRKJBIWpwqKxNHZ57CpnugwbQWqPa5aSY2ouGRwOTL8lVMY7JpN/Y+1wNYXwsZk
	q/ZtWA4mj04NpXSgvJwO18yHZexy5y1y+Tj+Fzp0aTNXH93IRWMLAetDFFsYR4U2
	Hpbx66OeSEqYiZt20rz+ClqHIZThDHpoZ3Ovg9QCfci4I6W4FyKD5qPoLWMoyLGk
	x0hL5k9uvxjBs8nNVHiSI8VkubHB0rMzXHqth4SYLMXk9Lp7OmDgRmKB3vX5TH+e
	YzxRLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp407q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 21:46:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb6291d95aso1095623185a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 13:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747198; x=1773351998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=;
        b=YvWxuSkHghJKUe/hZ/ZZTa03gLVijIXhw95n7fwzrV3X5JBx4LmWW3MsWRoUneoqAI
         I+rS/yx5i3pnLQglFgpBHt4cBThuiS7z/ecQyY56MUZ4bnjWUG6y4IPrAY7Pmnw6x8SF
         I7BNI/8T0Ygj8+yiljALOxdVwHxaJCYRFVg74kUnGOKjLlgc8BaN10maVzVdXo7DU87Q
         BoB99gAIRi2xpxv0gvf3GSVmooNYw3FcP8N+p3vbfK8tOgsKAdHyaOpTHlsyvGkAJHMu
         DwHPliLtWExP4CizD3UMigO1cyuLVRaYvXSTRwaiLQsGtwi8zUubR0CmB/LW+8M1ZrjQ
         M4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747198; x=1773351998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=;
        b=cFxcV2iWNNqI6eXvfD+z+Y3Rpv835rVZrO3/TJLBkgWzsh1ZtPsiF1oz09FZ67wP86
         ar3SR+oe60oL+Qz1ini92JhVAReU/ptiQDWGK0xSrunzv9g2GiELapRRCQ/AfkKlQpXy
         6L2plhCMaVmEKT5wf6kFbTPPVu3NOrMZ4qD3JVKd+TzdVWvvkTlNxUzwFcDDqxXX4lN3
         h7oaGvDJXJhAVBWNNGr72rDcIjplXyzXud8c3tNc1jbmwKkJM4wCd+Vege8mG6RZH8AJ
         lDm2t7wZh8XiB+C6rhueKpfHSWlJ2sMRdqHjBIwWt4YSGP7Otf5j6pYz48gtJmbGpOaj
         b2zA==
X-Forwarded-Encrypted: i=1; AJvYcCUmimwwNvr5skDtQ1z/rjQUBH2/fAVJ94+rgrlmGhHWJrF5LJPxkoBn8x9HPtTB3oXx92fztwSzc/NV73NdWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW/BI7zCofKi+mgVx/5Ev+D5AVg0KqzJqh+Wt/DMvduTJYjZgG
	u0pyqLX9I6GLjlTcs+P7aoHkZB9TKp5vGFmWS/p8oZfoq5u0N+mnfqwrKlu6ikdLg8dU+jZzR/R
	rqkySCRcWkK0AjJIMu8v1ijnCgQziZU4P6VL3HadtLVDgCx1sCI+cu81lPvpJ318M5JFCCJyn9p
	Q=
X-Gm-Gg: ATEYQzyo9JBmhBhSc/TwOGEK7M5MsqgIKyPvHMFjfbuXUDi+b7enztNrIWzWxj34muD
	3FjGjn6SWDt+7aCRGPjtViKZf+EiNyT+f6JL/Q+9NXu8arkcGIxP2xBGQF1BoUBuCPZnr1HLr9f
	b1XMYHfKctJ7itL9z038H0McbcAzezVuAN6cdU3EW9hPKvDRePqVyOZxXXBNfYiqdoALRMk1ePQ
	rg7yjjlCL4Vt/GxWBNhJ/upYpQcAvRf3evt+VoIRrVe+4UKTOlorxl0BcZYgIRfniTF6m4vIqhD
	afsEvfNbUS7rGPaFlwDeWIe8eItp3eJ79srrJ31UVq+qf0uzWEIwfw3U5tw3zrJBM4VzKvTftWl
	vEB+UX0EtD8XkPr7s83ysdfGSo0AH6N9vzWxSCI/HXYs7
X-Received: by 2002:a05:620a:4687:b0:8ca:3fb7:2570 with SMTP id af79cd13be357-8cd6d4cc0d0mr1697585a.42.1772747197577;
        Thu, 05 Mar 2026 13:46:37 -0800 (PST)
X-Received: by 2002:a05:620a:4687:b0:8ca:3fb7:2570 with SMTP id af79cd13be357-8cd6d4cc0d0mr1693585a.42.1772747197119;
        Thu, 05 Mar 2026 13:46:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:48 +0100
Subject: [PATCH v2 09/10] mfd: ezx-pcap: Avoid rescheduling after
 destroying workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-9-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8HCvYehjmNIH+BlrLf3/jZA0T/6LceXynB2MmBf1YZo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmgTLUiHh6rin6gIR8tn/yHPbJ7keLcVF5yZ
 GGBAe1ny7CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5oAAKCRDBN2bmhouD
 1+A1D/46IEOXU4c7rCB302yiUbZqrN3J0Box+FRnliJ/p6E8EXiDnmOg4obwzDlEUpFEf7ibEyq
 GYEw9cFAKDrszgDdGRbIFVYHr8RFOirL2Hdrl9Km81dPKqBQLXZQWnvAIKZe4uFGm8rDEiTS3FV
 gXubYix78Obr5LtZTm+Tn3H4VlOmRf/a1n/SAYakf/wp8btHWAgUY7J9nNAMK2Lbwsc4nzYJoHi
 vZbjtyC/9Gclm/CRe1O8vCpyJktvnNgAqHtQ/jojtr4XybHQF965vKIWwvLvoJBrhi2yylmf/EG
 S8CxeogMKobJs6UveopZ0d5TANJ1DRYacznxvzG9KA6g6X2xQKhxgYl480SHuTQMwdI5ygPt58U
 YlxL6+Ij5kO4Fz14qrhXHTZ40edvx0sQflZMFPcB4RVEyHUSnt2upCd3xRWA+BtmXbJ3NVnN7YE
 7JHqzNSdItYNG4lO1wHyEOQRHGJ6KLMq+xqetuC7XXGt+e2iAroOx4ODQ1itWBm9mnLq0brsQkX
 aZkgptRJCcNG6nj6JfVtXI5u3cZGNevrxo+gGHIhTsR2iQROE0tCQbAzduBnKIEtq3Pm4AyCrGB
 GzbjoRK4ad8uW8GvCPBi00G3EXVvoOWPBuOLeQPVp8BuTwkTHYs7DVw1wsrnE0aEKQYge+pTQo1
 a1ws7+4oKjEY6DQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 0z_lcMiOA2xh7Ui6AxhbcHgeRyPTtzVA
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69a9f9be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3MYFky5D01qQmCoSdzEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX1+OEOJ/Rds+z
 0sGhzRB8eRv9/xCITxm5BPgjI4IMChDOzPcjweoY1ftEKO2nMPe2gKUziLlmTegS7o899EWZkgM
 JTanH2cBVAXqydeHTaesOro+51SGApJkZBqLzN62jB4Bw+8XKmBI8x/apO+Vt+lDizoIFxpLA7o
 fYqbcBBylokeqw3VkiYoWLQ5imlSmVE+KptWbIqIRT0wyACLyMwphcHWJn5R5VxuhAv/Wy/yNsL
 07vPI9bI8ZTZppAE/qq77TEAKV6C9DS5kGWdCXfxPjzHrdkdaqquE3+VYzKS0K9a4PO04q9VQOe
 Zg+i1mX+pX5dOJPixFGvxXNvuvMdnKaaAE1QGqMgxyJbAQHRIYYDkjv9z/e4MyJoJl4QjfoPwlq
 kPKSzvXFFWdzJeQi5Et7bNRMUJn3wgnhQ57oHFvoAnnqNC986UZBP+5cCW26r1RtvvDL/u6a6Tw
 d63EdNLsRJAkbeV6s0g==
X-Proofpoint-GUID: 0z_lcMiOA2xh7Ui6AxhbcHgeRyPTtzVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134639_677505_6358F818 
X-CRM114-Status: GOOD (  18.59  )
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

Driver allocates workqueue and then registers additional interrupt
handler with devm interface.  This means that device removal will not
use a reversed order, but first destroy workqueue and then, via devm
release handlers, free the interrupt.

The interrupt handler registered with devm does not directly
use/schedule work items on the workqueue and the remove() function
correctly removes other IRQs handlers, however the code mixing devm and
non-devm interfaces is difficult to analyze and read.

Make the code flow much more obvious by using devm interface for
allocating the workqueue, so it will be freed with the rest of devm
resources.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update device registers, thus there is no point to run it for
memory reclaim.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_xxx() from earlier patches.

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/mfd/ezx-pcap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 8e51c113a320..9a685ff8cd15 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -375,8 +375,6 @@ static void ezx_pcap_remove(struct spi_device *spi)
 	/* cleanup irqchip */
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-
-	destroy_workqueue(pcap->workqueue);
 }
 
 static int ezx_pcap_probe(struct spi_device *spi)
@@ -411,7 +409,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
-	pcap->workqueue = create_singlethread_workqueue("pcapd");
+	pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
 	if (!pcap->workqueue)
 		return -ENOMEM;
 
@@ -463,9 +461,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 free_irqchip:
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-/* destroy_workqueue: */
-	destroy_workqueue(pcap->workqueue);
-ret:
+
 	return ret;
 }
 

-- 
2.51.0


