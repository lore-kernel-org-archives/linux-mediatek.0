Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD952C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:26:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A02EC20706
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FcdV5KO/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="NfYTCdeL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A02EC20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ifw8CPwdIIsgeb9Tnv8PrPOmPzd1zcxxDsFWvylfd6Y=; b=FcdV5KO/VJY5VFkRAagO73HKVf
	Abpq8k0RySxkRjK4/qQA+BCRDqQuOP8NMth2FL871U4clgKKjKlVlSKPadB4lpPze6EorLYlaLkCU
	/1t3r3XyGqJ0HfdIqE5jAYBTrMNWY8gHOQ5EOHFwfK7gA3vQJ8s+X1zsayitGTUgEPgFhUg1O2mZH
	lk8+RZsyIepi8WiBjG+XkEQEdEbmWpycY95eNuko8gGfjT4PP/VODq2KzCEBaQNlmvkrKT3p1ll5V
	vluJIgLBiSbZTBSHuSy4XhNPa71hYZQw7C2lB77Ov5jMzon8qkTQeB6q0rBpdP9+jKE7fdrG0aXLL
	chOHUFsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kARTP-0006Oq-3p; Tue, 25 Aug 2020 05:26:19 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kARTK-0006Nb-QU
 for linux-mediatek@lists.infradead.org; Tue, 25 Aug 2020 05:26:15 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id n19so13732951ybf.0
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2020 22:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=LXGQz3dUPtoQDrSSVVfnKwCnxD+dn14EASNuB71qWps=;
 b=NfYTCdeLik8nJHJ5W4Tzig5h9ofDMnLBuPWzZCTEfqi8uMCurIa2DrrmIuBV0yl/gQ
 ndZfPCAipt4EMz1ePICSNhkeLQ/HnPG6Ix14Doua+1ifnEUiA4/uX/M8GghFDb0fQBRy
 h/WDsoN/Z2322NPGYOO4daokc1abHQ2FF+21vQIBXM6I1WKzV23/juUjxRAfvIFk3yUS
 vITMdYOnP0+9rmp3WenpSiGZJd58GEO2FJvUUL9daC7sLU2fO4TBRFugkiX5LjjPlUqe
 vQ+nR57aBa17NAsIww2HrUlg4xTGOE/JpNNm3ZPhX9XgoMeZuoUrtbXHRdlRMGlnFg3+
 j+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=LXGQz3dUPtoQDrSSVVfnKwCnxD+dn14EASNuB71qWps=;
 b=hl+CpKXRCQo6/HbPmYT9qiMJfHwmJvK1OQqM18pG5YvNLRNXUmWFAzsdzaAm6PWBaH
 dMMLWkcBRsvqc2aQ0i0nlhaIOnouTW/CdqALEqu2DrZHldrpz7hn7OQkrMf54+l0fJnm
 oDtuYUshBbGK5X4Otsz8wOpXsjKYkAiil+dL2CGQm7FKd9Q1Qm+pK6Zpk8YenjOQwf7f
 bZc3mJPEH2C0QYnoWdOzlT9ddhpAkTCwBlEwK9poseRaGkP7x1oMlo51g1+FvFRs0eM5
 GGicQZLBZxyIUqV2idL4j1F27ksF/imQDNokMWJIh3Wssl8vPRqtOK8m7Q0AnFYoCAz9
 mfKg==
X-Gm-Message-State: AOAM5337N6Z6y0ae4YUSvon4e0OFjuGH9VcyOZv+Eia9g842ULNas53B
 H+U82iclK8hDyQEL/U+Jt1PZTaBcNoZ0Bz7vdLzylLNCeiikJ6BTo6P3XUpHc2zzP0r7RGmoBY9
 xNHrVrddB1SR7WIrknI9V/oGNbjGyxIdOleqwgX0MNkETzsswNuw9TMnin4rksCLDVjockr/lNL
 0swSLT
X-Google-Smtp-Source: ABdhPJzucRsZmc5RkVsCa4ewK6Q7FHUmorTbrz/iKmabcsEFOS5l9YC8Q8uA5a0g28dzMhczWRrg2G7qU62o
X-Received: from nandos.syd.corp.google.com
 ([2401:fa00:9:14:725a:fff:fe46:72ab])
 (user=amistry job=sendgmr) by 2002:a25:b196:: with SMTP id
 h22mr12483522ybj.350.1598333168733; Mon, 24 Aug 2020 22:26:08 -0700 (PDT)
Date: Tue, 25 Aug 2020 15:26:01 +1000
Message-Id: <20200825152551.1.I6d12081e37d27ba7580a1af877727d882935787a@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH] CHROMIUM: arm64: dts: mt8183-elm: Set GPU power regulator to
 always on
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_012614_863425_D215BB4F 
X-CRM114-Status: GOOD (  16.81  )
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

Measuring power on the GPU rail on a Elm DVT shows that the change in
power usage is negligible. The two relavent cases are S0 with an idle
GPU, and S3.

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
