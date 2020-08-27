Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389EBC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 01:50:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 048F32087C
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 01:50:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PDbUwjtD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="fT+dW9P/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 048F32087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Ep0zTkqew/+U8xAvHwNcZc3FcptyUPzq/AwpJGmL3I=; b=PDbUwjtD7VvGgor+JMRj61O+5r
	hg49plJjRZCyfO9LW8cRoraaYjf5a50DUer5iyLfcqNQUtD+BJjMVnpY++FeuJ4eEUIK5R4QhOg0m
	u5bHyUsJxH8MWe6LtoPxGBOQuipeAja3TyA/0sr0yhY7KVk50Mgh7pDwBIXq0EotwefayxVAy6za9
	+oPbpMLjkSc9Q+HLcaByOILyho0uRNkkAwyn2Nxqn2ojBi7IDlwaVJv2kZSGG3ckySNdBT5TngSjp
	qBvD0jmtTW4sOqehxhizv+T/lxq4zi/1Hi46TbPh59QUtA5W+7cpuGYY409p6rA+IAvyIwSs8M6dl
	1gQtzIkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB73O-0004lf-JR; Thu, 27 Aug 2020 01:50:14 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB73L-0004kF-8q
 for linux-mediatek@lists.infradead.org; Thu, 27 Aug 2020 01:50:11 +0000
Received: by mail-yb1-xb49.google.com with SMTP id e12so5292203ybc.18
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2020 18:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=kI87pt4IL87WeMlhQ+cq6jv+hjTA9JuH40a82jlPo3k=;
 b=fT+dW9P/B2jsQN6UzMCNYitt1FhkZ2EgLVRxO8SI73Y1MIl175TvZVJOkeJv9lKYS1
 7j7v0LBE4pPOY3NjfW6igBChFc3bFulo5XuCcTVNGL6EGEj/jy1O3fS2KTtezXxdNy6d
 4JgoLTvPWczkkgoEda/iQXFy8xIvKYGO2X9Tm/iu/qTwCPTOKjWrk0OoBWs/yAXNFvVW
 luyC/lOKK26zqSoITqE2rn+7SfNFHjHOgAOaBWoX3wFdfZcADbdpqh/aFFZ0enNR/nMQ
 QlXeMC7wmizyvNElsGqxvEopYaPtOY9pzv5nPsNasRj/3iVDas8cSQZBfiiFo/M2zSpO
 1+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=kI87pt4IL87WeMlhQ+cq6jv+hjTA9JuH40a82jlPo3k=;
 b=DyYnAhQsxHNp4c00gYUAySzUTF+Nb0V2cxeW2YhtCwlbJcsQZI8N9CJ+/cTIXgur0T
 zucNCS3yZdRgTcog91hKhOf2TQt10W1vkL+b0gOvxI/yIQoWaSXyutoENzEmiB+a6OI7
 ANgNF1DHrj3tftOTqr34xqDoTz5ljajgDszPlr+PoiA1FOLXpcsjlPMkox4r4py7xNbR
 C/IwAMxUbYApJ4fFyiY/qIhSsqCDggMXV+iPa8aKKcaMamNAcPHbIDMszwGTceqS7HIF
 ffoP0CXk7ItDTS3eIndGFAl7T2vQWkpqTqFLurU6zJARdiYznwMJ7s2HVq4kLmQF0Efq
 XyYA==
X-Gm-Message-State: AOAM533NxqQI+GFWe3xVu0zGikKC+iLEuMr9lViC41aSooHl9SNSfI2H
 se/bVlaqHpWwVWIneKZt2ZYYbez3HvqlMWKdu5YZHaAht7o9HPwSfvaezB6pt8PcCshtGy4jjIu
 lYeJ3zg0kxXyjUpirBmFXNIc1M65w6bwq54ORfJc5Ztlmyh3NHxb9rNdExf9O05UVhr8tnmYOmX
 rxUzOP
X-Google-Smtp-Source: ABdhPJwa3pv3Hu/+UkZbQW3sc70xWqy/UBXE05JvwXvifOJWs+ZvIJGMacTjSpT/pEhrLHiVX/Z062RKwsuI
X-Received: from nandos.syd.corp.google.com
 ([2401:fa00:9:14:725a:fff:fe46:72ab])
 (user=amistry job=sendgmr) by 2002:a25:8b09:: with SMTP id
 i9mr25344049ybl.149.1598493004751; Wed, 26 Aug 2020 18:50:04 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:49:52 +1000
Message-Id: <20200827114934.v2.1.I6d12081e37d27ba7580a1af877727d882935787a@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2] arm64: dts: mt8173-elm: Set GPU power regulator to always
 on
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_215011_310519_0D4B0EBF 
X-CRM114-Status: GOOD (  18.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Anand K Mistry <amistry@google.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Keep the da9212 BUCKB always-on. This works around an issue on Elm/Hana
devices where sometimes, the regulator is disabled before scpsys is
suspended, causing the suspension of scpsys to fail.

Usually, the GPU and scpsys are suspended by the runtime PM before the
system is suspended, due to the GPU being idle. In this case, scpsys is
suspended inline with the GPU suspend, which then disables the
regulator. However, if the GPU is still active when system is suspended,
GPU suspend occurs but defers suspending scpsys to the PM's noirq phase.
Since GPU suspend disables the regulator, scpsys isn't powered and
suspending it fails with the following error:
[  523.773227] mtk-scpsys 10006000.scpsys: Failed to power off domain mfg_2d

On resume, scpsys is resumed in the noirq phase. Since scpsys requires
power from the regulator, which is still disabled at this point,
attempting to turn it on will hang the CPU. A HW watchdog eventually
reboots the system.

The obvious solution would be to add a link to the regulator from scpsys
in the devicetree. This would prevent the regulator from being disabled
until scpsys is suspended. However, in the case where suspending scpsys
is deferred to the noirq phase, disabling the regulator will fail since
it is connected over I2C which requires IRQs to be enabled. Even in the
usual case where scpsys is suspended inline with the GPU, PM will always
attempt to resume scpsys in noirq. This will attempt to enable the
regulator, which will also fail due to being unable to communicate over
I2C.

Since I2C can't be using with IRQs disabled, a workaround is to never
turn off the regulator.

Measuring power on the GPU rail on an Elm DVT device shows that the
change in power usage is negligible. The two relavent cases are S0 with
an idle GPU, and S3 (system suspended). Measurements taken using a debug
board every 100ms for 1 minute.

In S0 with an idle GPU, current behaviour with the regulator off:
@@           NAME  COUNT  AVERAGE  STDDEV      MAX    MIN
@@         gpu_mw    600     1.74    1.31     6.75   0.00
... and with the regulator on, but no load:
@@           NAME  COUNT  AVERAGE  STDDEV     MAX    MIN
@@         gpu_mw    600     1.68    1.25    7.13   0.00
The difference being well within the margin of error.

In S3, current behaviour with the regulator off:
@@           NAME  COUNT  AVERAGE  STDDEV     MAX    MIN
@@         gpu_mw    600     0.94    0.74    3.25   0.00
... and with the regulator on:
@@           NAME  COUNT  AVERAGE  STDDEV     MAX     MIN
@@         gpu_mw    600     0.83    0.66    3.25    0.00

Signed-off-by: Anand K Mistry <amistry@google.com>

---

Changes in v2:
- Remove CHROMIUM from subject line
- Correct device in subject line (8183 -> 8173)
- Grammar/clarity changes in description

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a5a12b2599a4..1294f27b21c1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -304,6 +304,7 @@ da9211_vgpu_reg: BUCKB {
 				regulator-min-microamp  = <2000000>;
 				regulator-max-microamp  = <3000000>;
 				regulator-ramp-delay = <10000>;
+				regulator-always-on;
 			};
 		};
 	};
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
