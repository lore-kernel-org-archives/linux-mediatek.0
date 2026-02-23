Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B71AE98DF5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=; b=HaK5eZ3ZkdkczhUV9B5GtApIHd
	03GqUVr6sOlx0g5N0f1PWadd9uPP3VjUm86odwJM8+TQH55vBt+eQk69z82r6fx0ZEkr+dgdXCbrv
	2E8qn1X7LCPZvDa5A+p5XIRqVmb4e8pXw2t7yPJdTygMTd1w1bNOqasBk5w0iL2RpMXJs4HE9/43O
	4NXxr+tKDcrz2ah/xDjlOTLMN141J23jo9FdBx8ka7AmDNM2ulqPKxW0fahX4fb1cnQVFr6HEvpz5
	wPije9XDy90ByZXmJbcBII1fiV1QZ3ECRL5TTB6hHu5qwiBk2vOYaJmRpogKlI5Jm8crtLSKFJash
	MLLYKTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMI-0000000HMjC-12fy;
	Mon, 23 Feb 2026 07:27:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQME-0000000HMex-2J6C
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 07:27:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MD02n31323538
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=; b=SpVHZjbmZaC1Z+RT
	50XGF06GAFXw7h4mNNwaUvn09re6nys6p0++c6ufA08lkdSvfVmuzzcSI2D+p7PW
	0kbwQeoXfuQleIRzkZ1jdUEp43XPREr9XwmpZAcri4ihmzWnAWV187icZi+kFlik
	F7Avbuj12qOGhO9n9mNLtGsHKM/Zdoh0sXVWiIXvokaEX+ci3g1Wt/M8lSMV2C1I
	P1nPmHYLdQ5g12mUQjqkr1eB9K9z3c9wGKmFjWVmaDuidGQzMoz/S5R4fCoO8ri8
	5byBZT8kEdPx4TwygRme45jgmViQIh7amKpIi3MqHzxeaTxHeuF1jdpXfxOTLlKU
	5EvOTQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyurw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 07:27:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89700915423so111897116d6.2
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Feb 2026 23:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831673; x=1772436473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=;
        b=Q2SzJl1I/jzG1tZ0HshmcS3vPVZx/OYnUDz9VxGUnHDuErJnQC0ex83KoT1pqHZTK5
         axhcC+zt+P1lfCn+epncnqq9ssy7Pwu75wyWGo5wrUz1t7C8xbFXxJwt20PaXHzNuHNK
         gBJWXAxa23hZSTBq+ZnCW2iN82KY3WJ8t4tJkso32m4oZoFgRegEEdnN6LS/RIZ7ZQP1
         yGIdKY0MD08kdCCTAphWRHicBs0LrNkH6gT2qdjREZVcplekDlVxG+REV2hM4r3FIPP5
         qnUE/ffFg/CZCXVIi35KiddMjo59Z/dGq2z9lvqv6gjpWfqIcP7bjrKasA6ZzSziP1TD
         nr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831673; x=1772436473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=;
        b=KXsnL+wS8ujysYUl7nUpb5WbCqA1Mqu7cmmxpO6c7PPODc/iFG/3CdzvwIgqvYotAi
         PkpVDc1YviGXdxB/TSlB9JKw8NVK2AADn7tDCtmoCILwrjWpcAXARGAzDwXDT3MMWBtH
         lgkNmdcD/zjqjBimwyCXBoNavLF1fVSuUHpzAyEvWy8cub8d1zJP/u4grWeqKNs19htq
         ZUIxsG7lgMQ61Ob5KcRFuxmwp/aHZJaaTW9M/Mhek72UW/iXMX4uOPF00I01T7eKlYo1
         pkxjnBXmWM3Eo134c6MCpnAiAl5B2pmaD/ebIrr+zClcJM5k2x6Szw7dCheGqJXRyFx8
         2oPw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ0gwt3IR711KDLlPSnxdtUW/eE3jlxKXerT6p7VrV5r/ub1EmMVsZcbWmGXX8qYG2gACgecubrBs+Viug4g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5EQLtMpEVgUdEi6wP9P6AWVhxFrZRZTo1e/7+6ii8nHVl+ZaE
	ufeHpGvaG894w8H5zNpZbHIUcKOiaWyYsMolE1bCrryy1vYWQ0ISTR8e/aAxU+Kodagu07eqINe
	GMvWLl3Z0OYvysulu772jmrplRHWnOQlF93qK+zyZJWdgjtoMK29d8sIac4F8VKij95FjVJ2JaR
	Y=
X-Gm-Gg: AZuq6aKIZqhg+KO99e2skX/6DdfKwICVkkk3JN/mbv4JzYJGTn/7Tj/0FmNYm1QXRhq
	Q/eK14PjrFJXXil0qKLt7WRKImkzbGodVQgBukjqDsmmGRZVcbOR/rdFTHYvvAXlvLf46E7oRj2
	E6pVOYwrI2hsGPCc7zJlJM+rHhp4lfYYq4wSVPHC9yPiY+fXvZjhUKIN+unvm9PnMeVYXJw3Ojp
	KcHQcDni9zl9LCwdJFQhLUvz72LAopsHCwVfl9PBAzMTeKfPO1lM4AGBWs6u0qj8mK18BckHaBx
	AXg15x4te7aSZ4XLbvuwdS/xJqYfiI7Ogxuia/NS1/IlwhYXNusrshqox/LyLHcZZQYp7kzgMBs
	JGuE89z8vxvdhy0a4dkF+9QVL9AlBqR04R424bYwQuRK1rA==
X-Received: by 2002:a05:620a:2a16:b0:8cb:44d7:39aa with SMTP id af79cd13be357-8cb8ca887c6mr919029985a.74.1771831673109;
        Sun, 22 Feb 2026 23:27:53 -0800 (PST)
X-Received: by 2002:a05:620a:2a16:b0:8cb:44d7:39aa with SMTP id af79cd13be357-8cb8ca887c6mr919028285a.74.1771831672680;
        Sun, 22 Feb 2026 23:27:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:32 +0100
Subject: [PATCH 4/9] power: supply: mt6370: Simplify with
 devm_create_singlethread_workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-4-10b3a6087586@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JXjiqG9T78eAGojjEK9/Zi9nDA6gm8rfDk6Pl5Nb7BE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFp9FpdXlORK3TYpQCMwkXfvfWNBaac//1X0
 vhPZnV5DAKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBaQAKCRDBN2bmhouD
 1zzREACQTNEy+SyS8bNuKjvXbhz5E4jN7BzYOJgWNyNmgpmJ/J0B04PSNn7WhRDzfnj20zlc3no
 4Z7M3WMZLj5DqvNNbRKuKmcYK8fumg/o8XU9WV33VRrFKXZHZ9fTesJOPKo2Ldub65X3GHGkqK7
 DpQ4aC8bK8O++YJp/QxQn1SGyQaJisOtMDOrk6nsOrOmZi3FftfnDF1yDgBmbHSZgSYrXGYFxJx
 LOA8z0QczvhcVAZdmENDdCbXK5OArtY07J0o/Gv3rHQ+2PvZmwswyFz4dsaQ4ckWnsX3VQ2rDTw
 i/gsWSxXY4M6NXKOo6267SGHkuwUwJhyALG8NwGGNncwrbNGuChatk5zV+ia7yiWwoRm4kinVV5
 H5hMs6RMj1luoPCIO7NhYLwgePLg7PEQIyL13bkMLl0ZAtO7InkRRbRBj1Sg4LrruS3gg4QOYFH
 chibkuHJZsfg4m5bL7vjeqDilJ228Ymmh1vH1CBdvvfmHKziimERsZvPLv+dF0BXo5LwFpPrNrn
 gqno1C894RfGiUYOj9LEKWcVleHEfiUd7WIj1WnDhgVnrmuuN6W2NqNSR1fYWKBUnzm57jZK4Ie
 eTOZPwdVIE8s4gcOtEZ2LNfkUjadTTtP4gjawJ6JsI6T9QM50P9nuFwrhox4a3nhNO3DJnk3qc1
 ZnclO3WsVt0zb8g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX1OPXyJWxbeNK
 vTSm5q60EWFkWAzWaEaPo9mX8qzgsBl73QRUTSzBYmv+6oh9FCbOR53Mn5YIIGUXRPWEyiGwl4H
 1aQmj3kUYFC/dGe08IzS5DhfxbmzRX1zjSXCZuVSMJ0Yoh72uEI75D5RuVkhSwo5nlNJyopU+dF
 OwcqcjR7uvu3biqBB59huIzxvcINp7NAaDs5ypsPQaY5uypMBwKuvk0hRuzSSjYv79j0YvVN1LS
 Ti2e+fhWEZklFCMN4zAp8TJmtruYJN4MhDe54fs8j9qgWlyxrmy7SjXGu0yjW1nzeN/yaYedBpN
 KPF1a3y+mhFXkDc/U4iCBKfBhdoKnnS/epNfVqh0HmjzwxwdNzPkioRbpcVfMbowoIViRadRkDb
 yZ4u/SqzjPGLF1GaDkbb9BkkwN0YG54Ooabmn9N4rdoL0JwsgFbJUyUOnxSyM2+osplf1u9w/ms
 qVCaen11F7wGR6fa9Jw==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c017a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ztnre8jBXG8j2NFRlM0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: OyoQm5akw35jUMNDJi_F64suZycIUqU_
X-Proofpoint-ORIG-GUID: OyoQm5akw35jUMNDJi_F64suZycIUqU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232754_666181_6DE39FAE 
X-CRM114-Status: GOOD (  14.72  )
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

Simplify the driver probe function by using
devm_create_singlethread_workqueue() which handles the cleanup already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/mt6370-charger.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index e6db961d5818..f671fe62876a 100644
--- a/drivers/power/supply/mt6370-charger.c
+++ b/drivers/power/supply/mt6370-charger.c
@@ -761,13 +761,6 @@ static int mt6370_chg_init_psy(struct mt6370_priv *priv)
 	return PTR_ERR_OR_ZERO(priv->psy);
 }
 
-static void mt6370_chg_destroy_wq(void *data)
-{
-	struct workqueue_struct *wq = data;
-
-	destroy_workqueue(wq);
-}
-
 static irqreturn_t mt6370_attach_i_handler(int irq, void *data)
 {
 	struct mt6370_priv *priv = data;
@@ -893,14 +886,10 @@ static int mt6370_chg_probe(struct platform_device *pdev)
 
 	priv->attach = MT6370_ATTACH_STAT_DETACH;
 
-	priv->wq = create_singlethread_workqueue(dev_name(priv->dev));
+	priv->wq = devm_create_singlethread_workqueue(dev, dev_name(priv->dev));
 	if (!priv->wq)
 		return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_wq, priv->wq);
-	if (ret)
-		return ret;
-
 	ret = devm_work_autocancel(dev, &priv->bc12_work, mt6370_chg_bc12_work_func);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init bc12 work\n");

-- 
2.51.0


