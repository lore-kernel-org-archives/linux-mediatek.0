Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA60CC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 06:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnjvUz+tLyUI32WEpJbsvsuJ+c/cX/I/b+xJ3yrgkM4=; b=Gxqds+kwGwkG2K5x4NDD7d5kBw
	s0Bi6Ls82AU8CWmGV8WLa3SWgQ/17Pd7Sshx6sG1fvF9/rDh9eZPgVYbt/OaUZkLmuHgS4JCTL9cX
	4/b7bsMobcS38JAT5yetbnzfrNK97ZPyu3oN/gAPY2JI5LbPs3P22DxWUUNB6MOFtB8TCe9Hh7uGJ
	5+NTxeeCf3b4hBhSGmvaP3Ob86jhbfj3/uOEcODtbdzaineyk10wx33jRUAYzuRrZHgqBZlIYIEbr
	VoEoknZEK21UrrGVx3PgrnC5VztBncNsyP4Z//2s4vVEu99JrTOcB/eSpbWDiZnAbo4j29rnYhXeh
	cLHmr3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDJ-000000019RN-3x8h;
	Thu, 09 Jul 2026 06:26:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDG-000000019OS-06PH
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 06:26:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960JQP750012
	for <linux-mediatek@lists.infradead.org>; Thu, 9 Jul 2026 06:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnjvUz+tLyUI32WEpJbsvsuJ+c/cX/I/b+xJ3yrgkM4=; b=Mkog3pYJ7tn+zULJ
	/fo3Qw4k4eJPYDjH2q/dFwCBWtPnM9WhyDO4TrahAY2DyjQ0R92BRwz8BJTwDiEv
	5m78QVX5wPfAokWCYhjEylaSPfV7EY3kdMzHE1ltpMS8qtzGADMUGX8br4SsVHab
	AomcKTPm4hNZ3UtEFAoOM+nNEwY3TBKEhKHhbQNMuS2C1S8awHurYL4fQ89L4vi/
	7GylYylnGfHZ64eH/lYr6WIHsmzFhzxYIFQhY9E7po+mMDyCKpsfGsUqtA5C2ONm
	My0pMQO1XGNi+OAXeoMIP7+hMh/OdHbVHWv1FuctA18OEvxe6FDjoHat385USL3f
	RHfwRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfsms1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 06:26:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce406883eso15527065ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578380; x=1784183180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnjvUz+tLyUI32WEpJbsvsuJ+c/cX/I/b+xJ3yrgkM4=;
        b=Uxrd8fPc90vcgeVHf0v20XuZsfSEvxMBN6wLiSwNiSAQhkjowBKtuaqaOQm7pv8S/C
         itMei3C1kLiV75lABgVhZLc5TI1/Wf/wmRGFT3VBRYID6WIA5Wcp8x0EhkbVnNbR7ahH
         bFm3dCpdThgh97cARFC3J+0Hx1KwgQ1QVuPU7QCnQrLMv013iG7l0DH69hLuH9QzTNR2
         +jebyMYRMJ5eotjGItEOW33xTYkl7nGbid4YwAXFTi8rFcESEcE4hlVbk+/mYbrccoyS
         9yELjUZvVVqmari2NYuEKDWuwEsXYDvx23wfHYoT9g3ZmLfTXkAJulwZxeBlSzMryNCq
         e94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578380; x=1784183180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnjvUz+tLyUI32WEpJbsvsuJ+c/cX/I/b+xJ3yrgkM4=;
        b=lSklzz5M3LjE9D5QbRINNejtFFISFeKzqhGz1aqB1Oin4ZvMgCEdptgOQqQ4u+dX9L
         a1HYAfRnHhqydS/J8fzwBfZ/Y5jbwldUycoeRwCZ6UY9qlOdqD53pqxYMP1CEGSw8d5X
         ozrhXhlmSb4ZWvbef8Q9xfUxOJDbbDIV1PjdBoHSHdDUgWvHn3G9H/HyrXI+t+weixSE
         m/9Mm5Ybu2iXSCOw6J8Pzz+qJplGoIIpUOxH9WYK8EqphPBpsL2SXxYBgMU+v1b1d2nM
         cbcz07nNrnNeyeyz8rpoPWvLeO3y+9shQq68zewGBgDCpjEGHEJC2UgagEi8U4CFeTyR
         6WOw==
X-Forwarded-Encrypted: i=1; AHgh+Rp804M2meXzHhnusrJ1rA/L1+RQRpKXK+OePuLv4pbWxZ5vEK97YhQriuKvLeOox8OD+JZwGXIWGOcOSEAhhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm4ybwu5llJ6BXlcDTXjDCzg5bDW6a2taKZ8fGQg1yVUUj9PV7
	zxwSsPhAgpMqRtDw8+T9tlsIJHhIt9mXY0io9qcr+m9aPCOZLK1CuZdJ2MOXkXpPKN3mz8kjZft
	/eS1dnS63HXVPuV1j3e8Vjm9tI3F0YouZnPzrly1Ckr/9ZnyJmUzRifxnEF/rKa8d4ZuJKsUC1M
	1RJZ7arvQ=
X-Gm-Gg: AfdE7ckoK43HMSdtCzKD3Dq2EF1/C/PHTV018t4HrKO7eEIiRA6WWgfD74aw5bCZ6Ej
	w8YNfJFJxewHSDCb5tb2RRepWfD0dExK+LsOucNW/LgAjO1hDvXXAvbzGyJJ24gPmCv7Xb4HVz2
	9OafcmJL2RwzLYBQervIzaawqKMOu9Z63gxQUE0LNzQ+2Vdk3ne08Jy6yPb+c+WSkG3g3zAWSTl
	0eg9h81Yzvwg3NenTE3YAhL0h1lWKBsK69CWfQCJmf/C1HQCf8e/jXnPm3StKfYZt6nQYPZ/j/7
	y8MTB9BiDY98jVsDBd2rX16rIj1b9jvnJubDjzn36D2ze8hTvJsyD20HogqlRujs1iZ6sSYv7NP
	mgIsUQYw+Pz6b0yZpZWedV/DpKihSQuV5NcuDxtRJzfIE
X-Received: by 2002:a17:902:ce0d:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2ccea3b5089mr59094045ad.16.1783578379920;
        Wed, 08 Jul 2026 23:26:19 -0700 (PDT)
X-Received: by 2002:a17:902:ce0d:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2ccea3b5089mr59093555ad.16.1783578379292;
        Wed, 08 Jul 2026 23:26:19 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:26:18 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:16 +0530
Subject: [PATCH 4/6] arch: update uart pm callbacks to return int
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-4-e85c6ffa8ec4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=5267;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=ICa2ixYXQCQShcbLWiANred4DfWKjbRwuNEMyfbpR5M=;
 b=CBJQcr1StBfCKgCiFExqiQ7M8QhGHy52FU0kMlsvUYVyqZjr7DQWWJDaIF8hjah1SmBoEdoNw
 jckAiu0TkLbBx+pz4ekuZMMx6564yLJV/1h1ccPX1qXYkBxB0kccnis
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX1diTN+IGC7Kj
 chiFLbaJuaB66eV1JgWEQSpt60v2VEvCcZS3S7I/kRxlDZdU9KHSLnDXnVy1STB9SyEzOlfhhTB
 L9Elds+e93pH4e35BIqAWdOVup6kNEoyL3OYqmJF8QxC6cgK8NaWdnCuETrSeqyFi8hh933z+xW
 N0t/7+IuNv0rRldZdK7HCgBF31nyeD0M2d42r7pB/e4bz9mwe7WoTj3SfyFvL+pPljGOv4yvBTD
 2f21riaPBFLFgv2KvHO31Cr1cSn+5rozfTG2q7TgsmOdmQjs/PnC5kUJkzutvuDWmtTZBj3jyVA
 3Dk+FHJlEw7HSmKsn59OgBUEAuKr+aJUahDF3dpQlPOMlWzwmFGs7w9toWwAoxRdFq3mDIx1+fx
 gZ8ZNe2/wwFndtCFflmYudT1gcTFJP+ajlFl2gQ3A4lNR3YAnSZzhVn7b5Ww3CHmki9P0kkYptB
 OTIXn3tUJ8/LYYQqWSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXwhHLQpRnhKca
 M4gcVuhREVpuu7/1qdshjhm9oB4t1+MaRIERLRIDSrlyTxQOzVq1e3WO7vnxtRPF8xslTi0wr99
 jsxS2+iOgq770rGzIRuEOHka4q0tQRU=
X-Proofpoint-ORIG-GUID: nuTSEpsjmmhzC5CYx2ubn14oDXLbHtRY
X-Proofpoint-GUID: nuTSEpsjmmhzC5CYx2ubn14oDXLbHtRY
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f3f0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=B5ILv1Qk_D0jGc0hQdkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_232622_193814_36649315 
X-CRM114-Status: GOOD (  20.33  )
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

The uart_ops.pm and plat_serial8250_port.pm callback signatures have
been changed from void to int. Update all arch-level implementations
that register a uart pm callback to match.

SA1100 (arch/arm/mach-sa1100/):
  Update sa1100_port_fns.pm in include/linux/platform_data/sa11x0-serial.h
  to return int. Update the two board-level implementations:
    assabet.c: assabet_uart_pm() - controls RS-232 transceiver via GPIO
    h3xxx.c:   h3xxx_uart_pm()   - controls RS-232 transceiver via GPIO
  Both have no error path; they return 0.

OMAP1 (arch/arm/mach-omap1/board-ams-delta.c):
  modem_pm() controls a regulator and already captures the regulator
  enable/disable return value. Update it to return int and propagate
  the regulator error instead of only logging it.

Alchemy MIPS (arch/mips/alchemy/common/platform.c):
  alchemy_8250_pm() wraps serial8250_do_pm() with UART clock gating.
  Update it to return int; return 0 since the clock and pm operations
  have no error path here.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 arch/arm/mach-omap1/board-ams-delta.c       | 10 ++++++----
 arch/arm/mach-sa1100/assabet.c              |  3 ++-
 arch/arm/mach-sa1100/h3xxx.c                |  3 ++-
 arch/mips/alchemy/common/platform.c         |  5 +++--
 include/linux/platform_data/sa11x0-serial.h |  2 +-
 5 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 1bec4fa0bd5e..5cc8274013b1 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -758,19 +758,20 @@ static void __init ams_delta_init(void)
 	omapfb_set_lcd_config(&ams_delta_lcd_config);
 }
 
-static void modem_pm(struct uart_port *port, unsigned int state, unsigned old)
+static int modem_pm(struct uart_port *port, unsigned int state,
+		    unsigned int old)
 {
 	struct modem_private_data *priv = port->private_data;
 	int ret;
 
 	if (!priv)
-		return;
+		return 0;
 
 	if (IS_ERR(priv->regulator))
-		return;
+		return 0;
 
 	if (state == old)
-		return;
+		return 0;
 
 	if (state == 0)
 		ret = regulator_enable(priv->regulator);
@@ -783,6 +784,7 @@ static void modem_pm(struct uart_port *port, unsigned int state, unsigned old)
 		dev_warn(port->dev,
 			 "ams_delta modem_pm: failed to %sable regulator: %d\n",
 			 state ? "dis" : "en", ret);
+	return ret;
 }
 
 static struct plat_serial8250_port ams_delta_modem_ports[] = {
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 2b833aa0212b..48c3372a0f4f 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -649,7 +649,7 @@ fixup_assabet(struct tag *tags, char **cmdline)
 }
 
 
-static void assabet_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
+static int assabet_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
 {
 	if (port->mapbase == _Ser1UTCR0) {
 		if (state)
@@ -657,6 +657,7 @@ static void assabet_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
 		else
 			ASSABET_BCR_set(ASSABET_BCR_RS232EN);
 	}
+	return 0;
 }
 
 static struct sa1100_port_fns assabet_port_fns __initdata = {
diff --git a/arch/arm/mach-sa1100/h3xxx.c b/arch/arm/mach-sa1100/h3xxx.c
index d685f03f51f3..8a307c7ad9de 100644
--- a/arch/arm/mach-sa1100/h3xxx.c
+++ b/arch/arm/mach-sa1100/h3xxx.c
@@ -83,7 +83,7 @@ static struct resource h3xxx_flash_resource =
 /*
  * H3xxx uart support
  */
-static void h3xxx_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
+static int h3xxx_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
 {
 	if (port->mapbase == _Ser3UTCR0) {
 		if (!gpio_request(H3XXX_EGPIO_RS232_ON, "RS232 transceiver")) {
@@ -94,6 +94,7 @@ static void h3xxx_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
 				__func__);
 		}
 	}
+	return 0;
 }
 
 /*
diff --git a/arch/mips/alchemy/common/platform.c b/arch/mips/alchemy/common/platform.c
index 02bf02164752..ef39cf52b168 100644
--- a/arch/mips/alchemy/common/platform.c
+++ b/arch/mips/alchemy/common/platform.c
@@ -28,8 +28,8 @@
 
 #include <prom.h>
 
-static void alchemy_8250_pm(struct uart_port *port, unsigned int state,
-			    unsigned int old_state)
+static int alchemy_8250_pm(struct uart_port *port, unsigned int state,
+			   unsigned int old_state)
 {
 #ifdef CONFIG_SERIAL_8250
 	switch (state) {
@@ -46,6 +46,7 @@ static void alchemy_8250_pm(struct uart_port *port, unsigned int state,
 		break;
 	}
 #endif
+	return 0;
 }
 
 #define PORT(_base, _irq)					\
diff --git a/include/linux/platform_data/sa11x0-serial.h b/include/linux/platform_data/sa11x0-serial.h
index a88096bc74e4..be14a0152787 100644
--- a/include/linux/platform_data/sa11x0-serial.h
+++ b/include/linux/platform_data/sa11x0-serial.h
@@ -18,7 +18,7 @@ struct uart_port;
 struct sa1100_port_fns {
 	void	(*set_mctrl)(struct uart_port *, u_int);
 	u_int	(*get_mctrl)(struct uart_port *);
-	void	(*pm)(struct uart_port *, u_int, u_int);
+	int	(*pm)(struct uart_port *port, u_int state, u_int oldstate);
 	int	(*set_wake)(struct uart_port *, u_int);
 };
 

-- 
2.34.1


