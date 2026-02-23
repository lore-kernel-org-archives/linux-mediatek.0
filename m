Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7339FE98DEF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 07:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRA3RyVyVxbH2SrEeG1JLyYKtVz8CEHlktSTCViEaYk=; b=zWgfkE74GIUmoGf/kb2X+ncsVS
	B51U3v4oFU2StLXxzqQgIRJe41nEmkoPJQ11LHw0eRjI1kRle7OEHsa2GWPDkdLCGkelCOZ48IWpU
	FOMyC0kSwJgY+/hOEjPYuy0LUoRiAZuqOJUuFbwYUbYMdrp4BFQOYzP9nShZCR5vTEqlKRP+L7XaU
	FIxeEmH3NbGPMfQJJX9Gm9g18P02Ok2BNpWARj+r0Aevp5Zihk2ON2LFt/goDrYM3hDTjbXZWSLOt
	qwoa+bdxUCRth/4e0vOVNrxv7MnRcqbp6wh1eL+EViQszSbcDc0+8qhkBTbtFuKfzkYGRpDi6bq3I
	+Fa+/Rtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMD-0000000HMdZ-1HH0;
	Mon, 23 Feb 2026 07:27:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMA-0000000HMbl-2ZCJ
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 07:27:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMOIKd1884126
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRA3RyVyVxbH2SrEeG1JLyYKtVz8CEHlktSTCViEaYk=; b=P7e0PJNiKELxPETZ
	Awfd2x6s3dW2Ylcim2o3xqoz2thYA5k9ocfgidH4deTBUZaahdXtPDtZDGwIPiao
	f8EizRfXlZIXjA8p3hy9D+vFKPt6tgzMarQRAUBPNm7kJyv0Tvd/2xyxJQ8mdP/C
	OZYeQ+DA5RPkIWFqd01XZnueIN3ZDeRL6Y6yilnH/UA/vPixzT5LxVhdwnhsC32o
	nyrtRQ7k7rwzahA8RX3iQd8H+GZIpTAspfrKBGvVk3KUZFGdr2+NRx4ddgzrBVRd
	jEZmEgqbMC+v4M42eSCtBWNfGk5P95Q/CT+OTkxjyIg7IVTdCtrqHCVXf1MTiDZ/
	VbN/kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbbrxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so5198401685a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Feb 2026 23:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831669; x=1772436469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRA3RyVyVxbH2SrEeG1JLyYKtVz8CEHlktSTCViEaYk=;
        b=hYZcaKyuZ34+wbjtzzXz/LdZij/b5522jmUUlc2LjPk+ltKVUurPMEYVV+XmqM2hO6
         QB3ZuqROZl7ove2c7QHIDLsAu7NHi1C8DcrU4pGpUls/Y2OP/D/dMdzwhWSyn84m6KRa
         9n4Kd2VudaayXD455TZ7Z348iJarRBno3X8xOvpguF30RCA7GQ6exMPkeGKgXMNusYX0
         HWEvfDFw5UYa1v0xquollXf+tet54BTMlRmPzB3Oo5ot4PugHlSbbtXyXqhgiUOeo2Uk
         zd3tqqJdMvHDy+BRk4GzrG4Fh7jGrhfQD/8ARN+2YOabHD2LlSqhPGdE6X7rVuruiMbe
         j1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831669; x=1772436469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VRA3RyVyVxbH2SrEeG1JLyYKtVz8CEHlktSTCViEaYk=;
        b=bAm9w0iTN3fhGgHG4uE4f+2Wl02VCzSrvHvqhtKGpnliLYfAmUukcv/XDrlKP5+jmt
         M0ytch/fin/1G+qRGwT6rIoYWCaEzNUy+htXwBUl/NeGGruOdmR3UxBNhFxDl9cGMYAG
         yWiPZghIc6bNbE5hFd9Tv2sxpWTdFZwwQ8JqgOIBGfrz6T7EtMaXWCIbjJj7euUP5J4w
         xmJyR0Ddvr/BAPdWvpzbMAGrXOoNUJ4HIdQsSigkRvOY4mnPhIQdCk4IHhBDdL+aJdNK
         0GUnIR1vkWHUBkIPwdxbZDNb+CZMQP/Z5haU+owgm2aQykCqZA7av9bxJS4O+K8H1bmv
         UzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFMCSo7Q1AsAwgUatlBjtdJoyI3jsk6PzAdvAHlR75vTCN1xdIeHqu5ICIo/ZBzRj/IkIOBmkBpZXg8iKXxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw83B4QbctF2FV2XumtrICn/+hUQWULwfEi253v3eEWlowoGArd
	g06ew7baJ55K/5s+L5jkqQ8c2c4i69W32gg7frxvEPDYpRkGXaAo+QYs3OYzIy9LDa6GpV85VPx
	Wvm4879nPioye1zi0YxwE8Kj9dx6La6uqrlJ/YBTkUSg7mg3e/vEFGXGzcg2mrxOxF6/pEae29T
	o=
X-Gm-Gg: AZuq6aKN1m30yxzUX2kCDnK02XIfb/C48zk09FodBF2eZjx5Hl0b7tSmm5URc3EIzJF
	8o3i2duAQhrqzqpIc1KSpQbMJM/voLo8cuUENCIjzb96wQg+7rBAKeoAdMogHdz/k8pahS5UZVZ
	LdYxGvJugW9Ik9Z/NKyV7einRk2LYE939MjxlFEc6PaTC7PQBZG/82ZqRkg6/ZYShtlAxLLZmvl
	snknC6C9wkbcfoiou4bgRCE1ualIYfG0ANdDqA4v3yweEGuoYzxLeK5b+8Vj7lHt+n3r2pErmst
	jIxbdIN0uo9Y8aRgK+5rVFMLe242gjSrNA23v6iECgbdsD8e4dVLWHRvgLHiHLVgeGCV4kTYty7
	tBRzPV/YxBRYsz7hkhDBt/D3jqRONgjM7bldaYpMu+heNhA==
X-Received: by 2002:a05:620a:410a:b0:8c9:e989:9d8c with SMTP id af79cd13be357-8cb7be3b56dmr1528261685a.3.1771831669214;
        Sun, 22 Feb 2026 23:27:49 -0800 (PST)
X-Received: by 2002:a05:620a:410a:b0:8c9:e989:9d8c with SMTP id af79cd13be357-8cb7be3b56dmr1528260785a.3.1771831668821;
        Sun, 22 Feb 2026 23:27:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:30 +0100
Subject: [PATCH 2/9] power: supply: cw2015: Free allocated workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-2-10b3a6087586@oss.qualcomm.com>
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
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=H4Qs2JkZdWI+ycAqQDT56iXbPAaAVIJgWc4JAWD+760=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFnlKggUmMImpH+2q+EQOengTlEViaDst80b
 rri13T4ETCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBZwAKCRDBN2bmhouD
 1wL/D/4i3PYKpuAx1K5RL6gEvLpHiawDOSj9vjal+PUYon/bPYEopOZ/FUPvvzcyO3xwk1aE3fN
 Qjt1X6KJA3m12Rr3HoU4uzi7+QOtZhRC+Ee+waflrOuc2nmN4mgkRK5IZOP0P3ucCE7D0In7bU1
 VaDgnrh/V3ZCm37EuD+mQYYz7d5L0M3aXvcA7VOYqILqkUMKkSsY3F6fG2XrLIXh6XAIXjpKyHW
 kRH+idw+/a/tRpyCvoWBeHHdap8DB5XfnKr23uqVXt3Bt058BG82+iRoUjAk5RX0NchuKOAoejV
 mh6Yr1zLGVrUT7WJLWURwo+hKOyMx16oSSHu34xPX4RCVgbF1XLH6h7T2RAy+sNSv2pbMtcprVO
 d4xt/XcLU1usNGFqYiOKxkWyt0d2g9BL90vIdxK49QaKrhi8FKAJa9PIjRGf7Mw2hcaj8wTxzAf
 nBMpjwYqK9tj5Dma7CIHUZ5MZZpjZrlc0PbAOOs9UyXHWLWG0t6A5KoemPUprjvMqUTOJkTkUM8
 GVVtlaKnQwwUlKc8PHzp5UeJGRuoyXDOFUGsiarCRGWkISypxdARJzsBArPz8zFpm3ndeOnysuX
 lgYIX4UMonp+qXf7JQ9H520eW9Jwek8+IETCZeEhCvykTsj3Dwmo8Ip1VxDlwZ5+IeYSnWyiQkH
 4+N7CZUWdWSHfdw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: bFVbkbhYLQagr3YvzfyOBhu7n8XWOl6G
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c0176 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HiF-IioCT9ZGAFrUKQYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bFVbkbhYLQagr3YvzfyOBhu7n8XWOl6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX5PBdC+YkZR0i
 jxwxFN4L16ESQFtSL/f78qJAaFa/8YkxVfGLLlSCEUtMqcNRoOPVYhUN1otrSYk9PhSyck8HHVe
 BGjFaEhuyeYXahE8EpJOnk0kcJBeZ+t+faQqCODvXUuIr8COZunVRlcgngUigVTLvjxC3a057Pa
 0Iox1PJiX86QWzrCqCvMfkwHQIJVZ4CntHS3+tpjHptaaqiBpX4zrjWQcFvZOKpgdjaeqHMdl8w
 JxRrEemr4jybzaosEo0JFbEKj+J/7haidbQmeLiN17tqs76NKcVlEVBfzne41tLVo16HBVkauwH
 o4q7r4nLiYIaZizmY63mS/7O/IgS5jykdKageB+33+7gHQYC+ncInSaw7wP5z2GOpMisnji0SKP
 Mg0EbKhr1cexgopOsMGP3smyDYzzzZPhQrZ3YkDj4P+pk5s3EPsrLlYm2Q22MaVbBemT/IX5EcZ
 uGrRjJMrv9IGdEvTbIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232750_678493_22952A1D 
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

Use devm interface so allocated workqueue will be freed during device
removal and error paths, thus fixing memory leak.

Cc: <stable@vger.kernel.org>
Fixes: b4c7715c10c1 ("power: supply: add CellWise cw2015 fuel gauge driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_create_singlethread_workqueue() from earlier patches.
---
 drivers/power/supply/cw2015_battery.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply/cw2015_battery.c
index a05dcc4a48f2..1e4e3b4c7460 100644
--- a/drivers/power/supply/cw2015_battery.c
+++ b/drivers/power/supply/cw2015_battery.c
@@ -694,7 +694,8 @@ static int cw_bat_probe(struct i2c_client *client)
 			 "No monitored battery, some properties will be missing\n");
 	}
 
-	cw_bat->battery_workqueue = create_singlethread_workqueue("rk_battery");
+	cw_bat->battery_workqueue = devm_create_singlethread_workqueue(&client->dev,
+								       "rk_battery");
 	if (!cw_bat->battery_workqueue)
 		return -ENOMEM;
 

-- 
2.51.0


