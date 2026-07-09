Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801DFC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 06:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=; b=S/EeFGmV6ON34H+wBJATnYfAI9
	6z9dgRIZScoYFSXjNCoWftO2UJEwIgMeZyYgeqTRKZtcGwIlV5oIRB4MvvcVfaUCaGb20juZiYpNL
	E02D9cVQ6SWdaIHpAViQEVpM1TsMal6OK+88+5nMVatg3enHj5mRYXO/4HU45Kd2Q6dsz6FLvqnBa
	aYHFGEjT5QfiuEwEHSH2OhXmLLtCHGUBinBtmXNgW+HOJt4pJRfDqMiDP9XbWlr4vRQyNBrtAT7+M
	1SyzO8Xex1rJ5DtvfYTNqORqdMv8JOMibTcnT7DV3ocv8OJb5rPolV7U6VpPurGasELRKJYms2rQU
	MUjC2Oyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDg-000000019i2-1l4D;
	Thu, 09 Jul 2026 06:26:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDc-000000019fj-3wtX
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 06:26:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960LgO916680
	for <linux-mediatek@lists.infradead.org>; Thu, 9 Jul 2026 06:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=; b=TO/+YiWHz6cxuFqq
	qzv+0B/gddlxjqw7W5u6QCi1+Q5k7D63FXxoFjj3t8O5SZsGfAp8aaF/BMzqjznH
	/0XgRQPo8+dmjJw6HU0nFMFl1NGXVT/G+NG6pAQW7ZepcQjzKr4KZI/cmcxp/3z/
	URT5MLHK4BjfJR0WyIzO+4iDnxM/yxuDsXKDylNQlXfixTpLeIT4Qi5M5YiiWdxB
	q3p0z4G/ZWfnUmdky0Elzu6CqhWcrdafuMKBiH0UzjXrMBF1WsSQV+aDeY3hzKVO
	xEXKkRTV6KNjNkAA+Tcd7H4+mAM7DrCWVvRm6E85kQrm6DeB4uDJrBJ1bKiCV4b8
	7aXVVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv57sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 06:26:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce14a21faso12352365ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 23:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578404; x=1784183204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=;
        b=OoHwi9e42uRWYXLae5Dl2xiNd1FRmwQx8pQsR2M5osdCtw8GWgaRkgdxUU1rIqd/aK
         x+XHKNKwfRT5UF7NyLyEPNSP8+PBJUf2jQprZlxGTq4+z4+AmVThb6ycuKDGNq6bZUqW
         hGjn6SWN9WPGzNcjVlQ7TdKXou4UEw25VuJ2N7tUT6C0ujcfT1QERH+aoTaPkSGjCp87
         EAcKiKW1LQo1I/OFFCS0VSms/apqIbCl4M9Uy/cAacHcdW/YumE7YqRK25WxQqWk5Hxd
         VGcl6Fo1Cd0I0DluoGTNWNIDa+hzF7u73kJ8mN5DLVdz25z+rrqWVM3GWAIE9VtnQuoX
         wrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578404; x=1784183204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=;
        b=PQt2/42P9aYEqovco5ejFhLxTet5vO4legGToC+8wYsasOF7toABc5k4xstPip0T/Y
         LOf5X7HrYEbJjFDXCkS84WqD42XfP8FKrb5tCdz74wUVSf+GnQbQPcPULA/yqeS5z+oj
         mOkqEgaQD546ck6bVX3k1h1UdO3kDazu8LNQwXifUelfGVKvugo9Vrvme6OV6Ve4jN0e
         Z93eIqqIdVeTKVxN9NdccH3PZCT/gNRqBdCyJIVcm/LsZSXxkxaQ6NfDOWjqGY76mo84
         oYnbgx22LjtL4K8fwrCK2Ki2G4Mq8fxSpBcewzsXB2Ov2J+4qUAf7VC6LYLM5nKCtkdd
         opng==
X-Forwarded-Encrypted: i=1; AHgh+Rqg8f1ZGuSZL8+BWZpdRAFaK1LQneFRvnAjFhO8HUDaotgz2YfmJKKRa9TWUFCsZMi9i9e35Rhj+cDvWW11Ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsuT9TBhXKTqTRoP9rXcM+aFIBGnP09dJUewns7Ck9GdpUXH2X
	Go2Xj7LX4JXp/xKh5BqxQfzea3EYXo68aGrmSJ9fn8C9hJ2waVMx6wq5qxD2P7aXmWcbTvUIppm
	3VI/0dnQtlz1TYDOUx1JVOZipIVuU2HS1l8JFleigzGjQh26QROvrVyBR3GWQ2ZxbFPcHgYOuqf
	FqaTII8+I=
X-Gm-Gg: AfdE7ckKrivbPH+UwY3NFFM5zR0jBbWAF0Qb7xZ/uauuc+/UNCfaYOR2HhsbCRXxhRt
	XmMVOJEaPT5xnBNlQ7OUI02w+q/gqMIZ1eb+A7gsJYxSbKqtQbUlPT+8nJ7I+WCJluB5Qa8ojQ+
	ACgrpPam4DpckedMFkCbYCnlRUik3HIWQtL8IrO1VapaJb7Uo7o1tKLzVdubRSkkdicWmGEE1Rl
	0s5BEaykxUtiIc+E/yGzOjEn29fgcIdG+du03c92u2AuDY6lZdayyh9ewVRlP/Ir49JwbceRfbz
	abeo/kBoXDDNRzqK6NbzTM8sIOheviPRSzwx7FveINpg70hIP+Nt1okqdgECP35xNSJCobmWMwJ
	gQZTvD2bKthvKY+XcugJMGtvtRo2eJZtZ7wsJvw2q4SRB
X-Received: by 2002:a17:902:ec87:b0:2ca:16:c169 with SMTP id d9443c01a7336-2cdd8a8446bmr16030455ad.12.1783578403741;
        Wed, 08 Jul 2026 23:26:43 -0700 (PDT)
X-Received: by 2002:a17:902:ec87:b0:2ca:16:c169 with SMTP id d9443c01a7336-2cdd8a8446bmr16029695ad.12.1783578403107;
        Wed, 08 Jul 2026 23:26:43 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:26:42 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:18 +0530
Subject: [PATCH 6/6] serial: qcom-geni: check return value of
 pm_runtime_resume_and_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-6-e85c6ffa8ec4@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=1832;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=aLKsWDAwz2GNv0and/N/QxAf4HluEjygqicLIneo6A8=;
 b=Hx8QUSLFIpbdbLJRMgaFZQcfWKI4SYHgH+sbG/r5N+1eUuprXpiRnOv/uNONREm1aauXqcg5E
 vvr6LWy+bUWDhuqdCnrvTyC5LuYYyp0okWLAMvA7Bc49vRU5kMASEqP
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4f3f24 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=f88WUc_itYv57WQCX9cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXxJAQRB5Njrcr
 cSDnn0MbX6MhCTcWrU7Yjs99B/sVJYip7VAWRWsZ8C//4emdHqlY7cEKMdBhPS36jLaNY36gZln
 trUwuCShj16olqwp+RgwjxUlDcoM5v0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXxDKo9RdP7Q/U
 55B2l5ifdW6pqc1VP4WUT1uEF6lvLU7aQ8Mi1vCf2j6N6qr0p3b7R1qd0cMjzQCcHibf/0sYcpF
 f/oJSsdTl3RU2haw+MMJrzkIOr0+gIvMEC6btqszIU1+fiLYr1zwCUL0fUu2zgRzt+C9D1oserG
 dVUZO1E3JA2ivHtDZr87FBNkv2k/vbIfFm5m7CkYxHdjj3tJJRuIDgnqW6z/VMi0mRXFX4rxBMk
 pyzG+GZFeFrBkMmfnR2bdj7DHlRFP/0QjU31Dr83RuzacMkk4tu1IbFqbJJ8i157j0W+O0ggnR3
 r/MLQHb2ub6cQYw/mnO9WoQQXDiX0b0GYuNHqk7aCLHMitlP3pGmVLdvS+4+dm+UiEAAa9Coin4
 lwxtvyN8UbsGQc9dZz2e37A/N6R54hTzJaPfS1rqpbYK/+w5eca+G2y9dbWRvi3jp+qM5r/0f5W
 4Oqlk+JG0KVSrXEI/gw==
X-Proofpoint-ORIG-GUID: S2hbnsPI0Sg0IXPGHs7G7B7JOxaN63oY
X-Proofpoint-GUID: S2hbnsPI0Sg0IXPGHs7G7B7JOxaN63oY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_232645_030695_2C3CCD8E 
X-CRM114-Status: GOOD (  18.72  )
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

The .pm uart_ops callback calls pm_runtime_resume_and_get() but
discards its return value.  Failures such as -EAGAIN or -EACCES go
unnoticed and the driver continues as though the device is active,
which can lead to register accesses on an unsuspended device.

Check the return value and propagate the error to the caller.  The
.pm callback now returns int (since commit 6ffcacf023cb ("tty: serial:
change uart_ops.pm callback to return int")), so returning the error
code is sufficient for the serial core to handle the failure.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 17ab8acb3b8e..1ed09ac0af0c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1727,14 +1727,19 @@ static int geni_serial_resource_init(struct uart_port *uport)
 static int qcom_geni_serial_pm(struct uart_port *uport,
 			       unsigned int new_state, unsigned int old_state)
 {
+	int ret;
 
 	/* If we've never been called, treat it as off */
 	if (old_state == UART_PM_STATE_UNDEFINED)
 		old_state = UART_PM_STATE_OFF;
 
-	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
-		pm_runtime_resume_and_get(uport->dev);
-	else if (new_state == UART_PM_STATE_OFF &&
+	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
+		ret = pm_runtime_resume_and_get(uport->dev);
+		if (ret < 0) {
+			dev_err(uport->dev, "Failed to resume and get %d\n", ret);
+			return ret;
+		}
+	} else if (new_state == UART_PM_STATE_OFF &&
 		 old_state == UART_PM_STATE_ON)
 		pm_runtime_put_sync(uport->dev);
 

-- 
2.34.1


