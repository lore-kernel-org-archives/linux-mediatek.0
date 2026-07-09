Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7F1C44501
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 06:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTTisIRrm1ikhDDsD0zkfVo0e3j+V+q/x3H6zj2yL0s=; b=tmFrU6Vu/Ji49/4paVb/BwfWuf
	lp4EWEv5sXG5vdg7UZpl+7oytUsbJLtxS9xgYG8ozNQUCRAOq2p9Vh2g/WFnEc2ARWj7dQ48jyek6
	ECoxIJ+w4AgKtsYXCjub1KAagDhp25cp7UJtQbo650VfaDjCk6FwCrs5DO8EQFeYyHoJoOHFj8RwY
	+rqDBGyEeD66H7gDysxx614cP5x26+h4IIraECNiTZJqzlReHZMHnaBq7k9T0uNGuPx4JSbCpScae
	f/XRJkR9pif9qxBIDq4NEUCxIXTMMKG/ZiaTAhOk3bn5ZHiKGlHEq6DmJmu41vtxPumZ1IICz44wz
	IFx0Q5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDU-000000019Zf-0IAE;
	Thu, 09 Jul 2026 06:26:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDR-000000019XQ-0zNE
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 06:26:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Nkb916714
	for <linux-mediatek@lists.infradead.org>; Thu, 9 Jul 2026 06:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jTTisIRrm1ikhDDsD0zkfVo0e3j+V+q/x3H6zj2yL0s=; b=NqHIsSbpA5lvbv4Z
	47M3CAoj6uO6UEbJD5y0BQysq5L1Jr1rsf0AiPX313hzBYpS3K8LChKHvBfabvnc
	V9BSGWOrBDr2DZBQr9+B7/Pw+mjlVbaPKaY3ZTof7YB16OMWPYtTwsTmlCkVChBj
	P7lyNOhAzzk7GFFiC6wgEIsS3Bff7xMSxJlZXYrudLuIw+4puPBegSMEka9XgxXF
	la3aa+G5nxIGIfXjpCvN1m0vNN556HsMZgp0k9TETl2Ay1AZuCJPvhGpVEdKiOGD
	ya0cvjixpb/Q+TNZHJ+UTotRX0UDf/hKztHRgyPbpEln34SNELVk77g3jQkNYbXj
	rSHpTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv57rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 06:26:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so29431355ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 23:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578391; x=1784183191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTTisIRrm1ikhDDsD0zkfVo0e3j+V+q/x3H6zj2yL0s=;
        b=jNIav+uSJF6APxvOPjxhOOYbbBYVCQsQc1AsNOA175w2ao5NSwz5DhFbbvPAKjsf3t
         8Zue1qRK2yCPVq3wN4UvX5Et2qjE/hKLRrRktGQIkS/r7kWocDopYsPlBtPDSunmq6u5
         wOf5ySvbEhGAAz+tPxgpFIP3xf/qqpW6jW6wWeSyVYyLt7Gxglgc89NybkSpUdIEcwUP
         NlFtKQ2XtJw24C2b3KlxMcHwqmeqB+hZQfcZYBCwIYuOGzMblqJtPFLw7hzOlB/qtLfO
         hY3xpiDh6DQTo8IQ07bMRIBYSAsySDzRhTR9SeNsZFZ8jLHprhOXKpFiaoRyGZiaYaHH
         2ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578391; x=1784183191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTTisIRrm1ikhDDsD0zkfVo0e3j+V+q/x3H6zj2yL0s=;
        b=B8AvIr1JOLZZIsXM9r6QuyvsvznE3YPDzSh7yQ1HYynd7t5oQkTSL1e3pZaI+nO5Dd
         3UBzhg1OL1AUJmXmyb+++qSs8MZb+w8VDUFe821cmePOCkCsN4z55HYtLZChqzO/hOHn
         Qo+392Ecr/FN851W+j3w2fGBGOjr/1Wb5o/ZJiAtexVkYsjwVaLlC2WnLvzoieatdSu+
         zqendm8WccvIXhhMf158XGUxbaTy+1ezWvNyBrRkStb0Va6v8R8uTyOYtoGas90C/7/d
         wZPa+B7SyhdFj7WiwKvamyLzY5EXsvr/w4n+UYThVsvBu6hgScc1FXwZpNnAAJqujpop
         VlFw==
X-Forwarded-Encrypted: i=1; AHgh+RpsTQscPqerUEFiMQMgVdFQ1foolpetnMTfqZhtUiFXdqb+sdOaLZpG6WU94MUldCdH9VmMeGVGsjB0BuQIzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyE0ptd5NfEZYxr5VQHcJxaVzZtxInnVGgjw8c4fYIS5phPzB7u
	ppAf2wqxCo/PWmAHnanW8ATocheNqeQ2erjDEo/gcuKG7EMjxTDABxMz4FRl2GsWdndUzbJ8K/G
	81HllVKaLgfnETWWXflek5JCAWUNqlUQ/NAwGLR36tUGyfJkx+jA0YHssCo3BOu7r6Bj8SVQ2Sm
	SRqeJzj4U=
X-Gm-Gg: AfdE7ckzOF1HacxI5f/ZX16vLD+azor/eAiH3zJsm8xZkjmjNGLAPPuOnCYjCYlivUX
	pYreR9WfDhaGjuuQidKqPV40rrLVnXPXvaLqbj5h7KIyJtUfJEpNkTYxzqwdT1dT34sDn/Fj4O/
	9lCKfexk97YSW9T/LMWEwF3dTZ2L69C/l5VDbpqLG8ie6CwRERpQRe8B3nQkDcVYj5rQXDauzk3
	zaclLkiexMhF0VvFPeu0Od9kEgAfpJGF5b09Vzu4zlzGomNNxWB4elvvCkmCJ5y8oooT3dhdCkW
	Wcu+ExFGloaV43flpe+B2W4ldkoc17r6ziIPkpxtvnLMshJv6U3Yu+SCyl4sYNoL5nDWRDn/ZHv
	GRKUWjlJEZlYzmTWqh9qsg0fwI+7NWvhL4Gl7ERPqMvAw
X-Received: by 2002:a17:903:1b23:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2ccea36a539mr62888675ad.7.1783578391537;
        Wed, 08 Jul 2026 23:26:31 -0700 (PDT)
X-Received: by 2002:a17:903:1b23:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2ccea36a539mr62888325ad.7.1783578391002;
        Wed, 08 Jul 2026 23:26:31 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:26:30 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:17 +0530
Subject: [PATCH 5/6] tty: serial: propagate uart_configure_port failure to
 uart_add_one_port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-5-e85c6ffa8ec4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=3013;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=RCVhJVzC+wYdvFevPUgqoSKxgJUMAgct7Wn34WkXRWM=;
 b=03mWtjLIQU7aWmNkLwR+vaK5fDe/SCxXzqhpbBs8b/Xb17vYTfEsjAwodzox5hzEhqv5I585X
 VlgTWl/svaRAQ3BHkI4jtOEcL+pvacYHbhDmbmUE3ytsKKBRXOWcuW/
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4f3f18 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ix9lyGl5LlKgHWL4iMAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX30NUke9yo0dC
 pLJfm/28WsquqCyEHstA5a8mmervpendtMamdxSlYUvtRzvocrJ7rivnY7LOZL+zTmdHUYCroas
 RQ9OU/QCBi7Gp7wOFkCrcJ09FCD2/PM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX63gkOKC78JE6
 48mq8p0mU7/kuap39ZXAnToNUafOJwD9t9xgMQD3YRxplsYpDQfk0zlf2iYDbS7S32fcE9FNgQZ
 z4gwZuRS9RDrtAqnCd7X45kvQA/f7zBsWYI7MCDboo7Lxc1ZGIgIvHqly/uwiO9LveEj8iKkB/0
 yWsnCE9iuiSnkK5yVpRoQ16LNAGKitXkU8dLhGxiaOmY1w9LXm/nd0Fpsg9Evdp0GWDaaHBAzSS
 6H98gRgeOnkF0vOi4n4Qpp8JsiWdH4GLombZCQh4BdFNHASFab40SM/daNH2wsFFnAG71wT454h
 F/Hv+hYqbth3VrDfFrgeq9fO4NpWuYGVikBVPmiTc4QNiIj4GI8wuFUUQgfagyKXh/eypPdp5Ps
 RRBkecAsVvPJyzaLfiTEX/EB1jsmcoHUwqbKx9Y4U2qqT4KRksl2vjjoScXzJ0f4XjUBU2dyYjB
 bg3FbQWX27f+ZN0RdYA==
X-Proofpoint-ORIG-GUID: y498OsHq6DBXHYWNaoSrVdHFfpFmnnXJ
X-Proofpoint-GUID: y498OsHq6DBXHYWNaoSrVdHFfpFmnnXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_232633_275644_332D9A9C 
X-CRM114-Status: GOOD (  20.56  )
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

uart_configure_port() was declared void, so the uart_change_pm(ON)
failure introduced in the previous patch used a bare return that silently
dropped the error and allowed port registration to proceed regardless.

Update serial_core_add_one_port() to check the return value and return
immediately on failure. This propagates up through uart_add_one_port()
to the driver's probe function, allowing the driver to handle or report
the failure rather than silently registering a port that could not be
initialised.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/serial_core.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index e624a67a9395..6cb9e870ba86 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2526,7 +2526,7 @@ uart_report_port(struct uart_driver *drv, struct uart_port *port)
 			port->uartclk / 8, port->uartclk / 4);
 }
 
-static void
+static int
 uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 		    struct uart_port *port)
 {
@@ -2536,7 +2536,7 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 	 * If there isn't a port here, don't do anything further.
 	 */
 	if (!port->iobase && !port->mapbase && !port->membase)
-		return;
+		return 0;
 
 	/*
 	 * Now do the auto configuration stuff.  Note that config_port
@@ -2559,6 +2559,8 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 	}
 
 	if (port->type != PORT_UNKNOWN) {
+		int ret;
+
 		uart_report_port(drv, port);
 
 		/* Synchronize with possible boot console. */
@@ -2566,11 +2568,12 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 			console_lock();
 
 		/* Power up port for set_mctrl() */
-		if (uart_change_pm(state, UART_PM_STATE_ON)) {
+		ret = uart_change_pm(state, UART_PM_STATE_ON);
+		if (ret) {
 			dev_err(port->dev, "failed to power up port\n");
 			if (uart_console(port))
 				console_unlock();
-			return;
+			return ret;
 		}
 
 		/*
@@ -2613,6 +2616,8 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 				dev_err(port->dev, "failed to power down port\n");
 		}
 	}
+
+	return 0;
 }
 
 #ifdef CONFIG_CONSOLE_POLL
@@ -3094,6 +3099,7 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	struct tty_port *port;
 	struct device *tty_dev;
 	int num_groups;
+	int ret;
 
 	if (uport->line >= drv->nr)
 		return -EINVAL;
@@ -3135,7 +3141,10 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	 * immediately after.
 	 */
 	tty_port_link_device(port, drv->tty_driver, uport->line);
-	uart_configure_port(drv, state, uport);
+
+	ret = uart_configure_port(drv, state, uport);
+	if (ret)
+		return ret;
 
 	port->console = uart_console(uport);
 

-- 
2.34.1


