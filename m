Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A49E74915
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 11:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=; b=St117NQrStd+KSS1r1wo2f2k+Y
	ZVNSpBFXyM1TpbzCLB+g5WSF40kfnhBsKGe7UGaStxyfS4rZQrwOVUEmqIPolTpkgoan4VIFkYYX9
	fbguiM5jTL7+ZGQpEHM7XUs+4fOJ17wfo/KD24LX1NmO6SkGXtP1IArUQBZ1TEPTJ+jV5W/H+diC5
	BI6rCX2LtQql7bQ2s96yEwCRi+lFd/hPuW4pSykJv61IT0CSBsp7aqofg907DEwfEXR+8A8WxgAO2
	oQKY5LP9+Itc8AJDvfjyyYpYFyMjJuaiGK0w4MDbD5hyn4GRCETXazVjb071vV8si5Ddy82vNYa1X
	uhcKOHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNId-0000000GlFQ-2RGj;
	Wed, 24 Dec 2025 11:45:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNIb-0000000GlDl-0hwM
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 11:45:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOAFF121597861
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 11:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J+XKdSXfu3p
	NvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=; b=Tlbo/2468UIwAtPhrj1yP1WOX/a
	XWGCY3wvXM7ALriBPExWdODaAZfAcm1TqF3ZJh725NrVmj93e5j6GzhTZR5wItI7
	jCC/jCnXuiNZzSv3iH7IA2hmvJx0z71POzlcXOqsJKfHIWKhAOm0PXDAuuiSobg4
	In+e/iMhAWZZYNAGtTdppyXdXTwhSNe9XBiE+N9scNlKjG9MgXv6hqko/dpqlL9w
	Tk49Y4S0eULGqzTPJdx58BjvVf8YYLb2HFnfNgPg1NELWrlDnF11HvrU/jk69iJd
	IMw0r0c38fstQnecmy+pmAvC8FthpCbzeIWI32NgY4b4S6289SQ1U7S7opQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683hg2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 11:45:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb6a94873so113871371cf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 03:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576700; x=1767181500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=;
        b=de1XHASE5OMAR40Dxd9fs6WLpBmrczky0McOabqHFo3fr0+Mii7DSvPSxpb9pN07oq
         wDzRRdN2oQ+EvDOpUtD2SHDiiRqho/poLew6ELvni5+7f5hVKSgGrKqSSooRK0jMRp2C
         /DbsEjDmvwk9mTFFGPbh1hn2r8vYWjig+EHDmXcg+ZOukZ7mYWyO3xn2Uruca2dmaL1F
         9kP9PimQunbPsS3Zq6mOphzN3CT42oYHVxnKjHPwy8kBivEeUbnja6ftwYYBXQNvYZtd
         hkXaRQaHyCWjN6BAEmD90XTYHL8lDS7Mfm+osvf7aCTwpVGQ+oDz6t0xHZYMp24IJmKE
         keZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576700; x=1767181500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=;
        b=TkpkKK0S9W6U2HG6KY7JK82ON8EAYUV5dEGssfjCN3Z5YEZ7y1o450YekVFKdZfOtF
         CRTWDltTiGamsMNcj0MNArdBwUpAxY0Z5WBWmudXRL7QaPRWwm/Jg3M/iIg7m/gVwtWN
         2ZVude6oRBIUWatMlVtyVDr7+oGAQv1euYL4tvCVV4PwpjCSeIRv12n4XvQoW59AJsP9
         T+TWXlamAIm4M7V830WUb/bTpSlKELzFeSW+d+bO3CpfZ4NNqoWZomCiWzN23cLWb7Zp
         gyanJohn+6Nr80gCm/VL+gAIsKN9KzqvCh8AKgyknQTNJMIRY5AIV8ietagGkan7lVcu
         K1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWO9CVx5wwHnO8l3uYo3GS/AJm17XBLsy2CFNPR4QaBX/1AvdcuDrTplaOZGrmcBlTL8kUgn4Xs2eh2oNVgIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzfH7JGT+lbUo9aomvaUkI6WJ+TgzhZJFewHoTjiuXxrvnwYQF
	zcSUBLhy06Lnk3BT/Z7vXbKlstb20xWvsyagOLtaGD1i+sEDp6CDRr/WwZwegRHHh1JrX3JKk/j
	TemxL0vFPPdfvMDqUw7PjMKBj04c31rHSdKDyIjOL3jZ7zBxJwOgG12wSvwe6Ysc52kIqvlUC7G
	o=
X-Gm-Gg: AY/fxX7UP9eomQ9zlthXvBhN1gJhuC/VdSlwtJyUjjomFmUmFze2D6atqxtBtJVQ15q
	3nbNYDSWBl1BAlo+3V0Gvwsv2hHtHgD1oAaK6Qbxpd2VmFGuH4/AzO7X7gIeUISlnYW+MX4iK/D
	omJag5oQXTZOHVTY7C55hL16P59F99c2TpYOSjWR2K1QSGAUl/fdgmkZtZCePKARYOh5axR1V02
	+TQ4Ia1613RjCkP/MNRaH0gI2AtjvuJmj7+8lRfoV5N7proJycvRit0QjNkbMJKbueX8M5G2Z8x
	3+cOJ2TEfRCVPwPKcomP5kDCk+SvsyKV1tg7yN3YjTxedfS6P0kgsPv1tm3pFd3i+tBWUW9e17P
	EZWcKEAV+l6POu652+a2FKxfh/PBhtMgSyniSdlvkXFoOCVeJqgXye7OBHB/8tyavl8oOrw==
X-Received: by 2002:a05:622a:17ca:b0:4f3:5eb4:61d1 with SMTP id d75a77b69052e-4f4abda5d9cmr278528301cf.54.1766576699828;
        Wed, 24 Dec 2025 03:44:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrLiQNTTfYjU8xtnklvYJHnZpC8la9TkTBBoz2WHC/caF0ubww+Yu4xp4HXHuj2pqeLZEO5Q==
X-Received: by 2002:a05:622a:17ca:b0:4f3:5eb4:61d1 with SMTP id d75a77b69052e-4f4abda5d9cmr278528181cf.54.1766576699462;
        Wed, 24 Dec 2025 03:44:59 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad83dasm1799758266b.25.2025.12.24.03.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:44:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] mailbox: zynqmp-ipi: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:44:54 +0100
Message-ID: <20251224114452.141689-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9hdDvjId8Te0bYmkEOvuaWPWD7t2fGMNgkoufbUfEGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9I1xFdAjYYZBxmeWM+XZB7/hJ3ZyIkYsDtvU
 8vi3I0eMimJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvSNQAKCRDBN2bmhouD
 13N1D/4w+e6HAuLX0/reiJwlrEpozrEsV6UWVqI/dv7R0jujuOg8ajKxWb8bNWUyP2orqVQVXXB
 9AxC+IZEKocTw/ENBp4WOY62YyRcJNKaZIxcZu250fgsyQyDCZYat5/RZPgzwLWef+XsbEjtJbY
 eq/ZkW5KYKQuaw0P+Q7D4N2VDpvFnsY4tn30nGnOkOPWrKEodoUgwV6DB2lOlGecKaJRC80+rzx
 tq3mmUmtgblP6XohKvVBsAlmSNkYk4FHClRPpIRTHB8gcX5xHlD5ZuE5n3H0Vmr0MSb2HGmF4wG
 b8CwPsRrS2XvRdS9z/kYZ0HwV8FUlrkmsAECKkFDAGt+0q93Ei5HyvX7ZbbPAZReQYfNJ8zSwRe
 X/cKtc3aC6nyXgLftrsKGoxHMeKmlDpfQ1P1Br2ucc6Lxo9fzmMZFOAHt7GGpwry6hIB42tzPnR
 pi11s733x/04JDxDOaP00Y31GdnLenuQlFiUC4mPXqft34Vru23Fi17nP4VfHMDYzhi412aNq/g
 vnHMkYL0oJ1waLCfUPUEGrxfgxzsL5yyt//3p+R1psDNpxwYH0Do9Kzo2VGWcFUzJjqHazK+BIp
 zNT7k+9uDGLoLbMb9KfKmV4hVquysIpRnoEWbzUk4s4LPfQvcECKROKOn3AZkykGUJM5lTPezUp BQKQitx8ZNxlUUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FSHz85_gX1OTwXebotrcwhAcm5aAgs8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX7H5bJClovkvl
 p3LjJkA7LCWUKWA7SHBHVhqijzfp0faw1932/LwAt1YtIyZOdWnjrmQtFfEO/hTP4bmB5vZBIdv
 9qOpp2rrhdcXw7XRrMPKax+ZdDHPv7Y2wETotXT8mFbL6KmL6/AcrjvLYUba4uznMDzV0tSw46M
 OGxWtjNZbM5XIuvMN+zW7Q/u1qTcSE9xKjWuuBIOETkXJaQ38lvJhXgTkE/fRMPegUN+g4nNiyH
 +ffrQpSh38Btg0WeregzWeDtDCmf+M24cr77O4Mhv/yd9kjvFNPVnAUnysoXOAawkYkS2zoL2Ak
 zYKaQqx5QxNF4X8ogXRBcoVIaB5ucZhi4+zmSM1gJnD8vjOknHNXooGGGZi6Hl+BGuz+NrDA1tw
 PNqHUf2JkfEt23Im/nqVt7fYb+iIkQmZT2YWjhsKAq0Bgsvteju9aTAZlmKYvZCzjN+WV5DqBb/
 +IV+1KwfcP6piwgnL5g==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bd23c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zQe2su8OYnrQ7J9-Y2IA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FSHz85_gX1OTwXebotrcwhAcm5aAgs8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_034501_207047_C5F4DA1B 
X-CRM114-Status: GOOD (  14.65  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 967967b2b8a9..42d2583e44ca 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -904,7 +904,7 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_pdata *pdata)
 static int zynqmp_ipi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *nc, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	struct zynqmp_ipi_pdata *pdata;
 	struct of_phandle_args out_irq;
 	struct zynqmp_ipi_mbox *mbox;
@@ -940,13 +940,12 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)
 	pdata->num_mboxes = num_mboxes;
 
 	mbox = pdata->ipi_mboxes;
-	for_each_available_child_of_node(np, nc) {
+	for_each_available_child_of_node_scoped(np, nc) {
 		mbox->pdata = pdata;
 		mbox->setup_ipi_fn = ipi_fn;
 
 		ret = zynqmp_ipi_mbox_probe(mbox, nc);
 		if (ret) {
-			of_node_put(nc);
 			dev_err(dev, "failed to probe subdev.\n");
 			ret = -EINVAL;
 			goto free_mbox_dev;
-- 
2.51.0


