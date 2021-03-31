Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC4BC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:07:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE841619D8
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE841619D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u3mzCPHxE3J8gf365b8UtocRhxXF4ig8G0T8cq8D92E=; b=FWWb5+Muaq78bTM2RFU1YTmOEi
	XZjnAzKmVC+c4AnhnmZTmTrbqak5ledmgAzGtcKb+vcdtWGrLQBhREw67iC6fbFGXjVdvr3EwYH4v
	Oi/+8kRjrvi9rI7dqp31swM/By0cVklWY+dGA6+eCZZLafdx3d0n2Mdm1n6O4G3x7AR1s7jS7FOQf
	9KPYKTPOEGSgIJmPa2SwNZykS2J0sE/oML+kcsp1OZToQPCcxhkzCfK+/9uddaCIPZUSmEj8npafg
	rvxMwDFdB+ouQnWVYn1rs3b21kYRFmFEHmVxAPJkWEDFc486Gfz+H0pZgitbW9bYn2VHigPAA2fhh
	fKpBHRfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWot-0063lb-8V; Wed, 31 Mar 2021 09:07:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWod-0063gZ-Pk; Wed, 31 Mar 2021 09:07:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 174A71F45B05
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Collabora Kernel ML <kernel@collabora.com>,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, hsinyi@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Max Krummenacher <max.oss.09@gmail.com>, Michael Walle <michael@walle.cc>,
 Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 1/2] arm64: defconfig: Allow mt8173-based boards to
 boot from usb
Date: Wed, 31 Mar 2021 11:06:57 +0200
Message-Id: <20210331090659.4169966-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_100708_950184_C0810899 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable the option necessary to boot mt8173-based boards to boot from
usb devices, like its phy and the regulators needed to have proper
support.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
This is only a resend rebased on top of mainline to fix some trivial
conflicts.

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d612f633b771..7b4be3807b6d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -448,6 +448,7 @@ CONFIG_I2C_GPIO=m
 CONFIG_I2C_IMX=y
 CONFIG_I2C_IMX_LPI2C=y
 CONFIG_I2C_MESON=y
+CONFIG_I2C_MT65XX=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_I2C_OMAP=y
 CONFIG_I2C_OWL=y
@@ -594,6 +595,7 @@ CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
 CONFIG_MFD_HI655X_PMIC=y
 CONFIG_MFD_MAX77620=y
+CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK808=y
 CONFIG_MFD_SEC_CORE=y
@@ -611,6 +613,8 @@ CONFIG_REGULATOR_HI655X=y
 CONFIG_REGULATOR_MAX77620=y
 CONFIG_REGULATOR_MAX8973=y
 CONFIG_REGULATOR_MP8859=y
+CONFIG_REGULATOR_MT6358=y
+CONFIG_REGULATOR_MT6397=y
 CONFIG_REGULATOR_PCA9450=y
 CONFIG_REGULATOR_PF8X00=y
 CONFIG_REGULATOR_PFUZE100=y
@@ -787,6 +791,7 @@ CONFIG_USB_RENESAS_USBHS_HCD=m
 CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_ACM=m
 CONFIG_USB_STORAGE=y
+CONFIG_USB_MTU3=y
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_SUNXI=y
 CONFIG_USB_DWC3=y
@@ -988,6 +993,7 @@ CONFIG_OWL_PM_DOMAINS=y
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_FSL_DPAA=y
 CONFIG_FSL_MC_DPIO=y
+CONFIG_MTK_PMIC_WRAP=y
 CONFIG_QCOM_AOSS_QMP=y
 CONFIG_QCOM_COMMAND_DB=y
 CONFIG_QCOM_GENI_SE=y
@@ -1064,6 +1070,7 @@ CONFIG_PHY_HI6220_USB=y
 CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
+CONFIG_PHY_MTK_TPHY=y
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_USB_HS=y
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
