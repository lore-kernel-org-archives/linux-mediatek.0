Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B79606A324
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L3ywTvm0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EfCs8bOQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LEplm5NO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=; b=L3ywTvm0jNlhKU
	SHal79jWOs39Lmu0RBdYpmadugbJXbVMub7MKxYsUbEpOvQWgCqVW1nFQn/zgO1gliXahGcCYJvXv
	eXkxni7BHjd+tbjZgSRqf7xnZIjPABqVIHmpYqTnH5IXHVAjpwSOeY47WdP1ZbjLAnw5H1Kegbago
	Ue9Ypo9AayI4IcLJHpTMb6X7Lknebj0ZYo/CuZ75Mc7DzkmMuCoasegeqYWVjwpd7niOlhsbB38cj
	UeQ8fpPRvKFIkqJeey6MSOeq64vnI8ymjbSynR5RDooccn6vUFFT2Lxjh1jdPo5KKtlHtjD91Ef5p
	NGzsNSzoq1dygRnITPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99p-00000001NZb-1QUX;
	Tue, 03 Nov 2026 07:42:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99M-00000001Mrx-2UzF
	for linux-mediatek@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=; b=EfCs8bOQ8HvpWOmuZNSNNDY4rR
	/C1/oho/TbT3d20AbCFtyUQAC7h2ZuOZ7jGDyE9Cc52pC1bpGZmUgLL/gTXUwvVr+dQsxzy7tZ4Hc
	ezx1jjibSyxyyTbClLGuWPyhMc8ZaPNUk9iNk67Run0th9sgQWwQqFnBSKMdHPUgXeig7e+N/+VYs
	Vxk5mejaUA1fsCyMRTMLv0UMiDrG8zWVAJCOa844Wik6+jkb0nJFp0l9BzSJaTJV4EaejLmBNBJ1O
	nUFk/v1FVEOKJ3Rb1ReVLI4KaJs0eIierhxuEzlDPt9/iWBOyIfkEal5zglRFwO8+vyo2IAEiMmA5
	/FCly/hg==;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99J-000000007aM-04Cd
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:41:43 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1717291a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691698; x=1794296498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=LEplm5NOICyyKa1FhT6gML4+NlOG8rP4skM1GCXYtpD3FpcxW36cPpNw7OzXIHnJUQ
         X++yZjCoy0IN5lUuE1FSL9VuCfjmgZaI5vrnRnFu3nXVC0Koec/b0jiSddbFacGxYr6t
         b0n8btiEDfoxFNKmrF/TqEIp+mtbIiF0lPpITNH+YWdNYty5xCvt/fUebUBBopXam/np
         XSJi/2bcpp2oIERDh5LLcnH65zrBTsG/VotDnWR6ZDz2Px91XrqCrCc9xHnl04YvvJVH
         uMYLZei1w+yUCdjLBD7E0/+qoCryLR/3yLxeE+5T13U3mHloUFe09I+GWSCYQFSj9g9h
         ic5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691698; x=1794296498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=QgWOblACqaw4OAFFcodndhNXiK54PQHgA5vuJUhiGkCUR9R9CMBBqkou6W0qWiwd3M
         Knu5yjZYeNCoSViiTnwOx3ATNnuUjHelgFVMiWZJUezrkiMWByH++3FjWc//jro/gooq
         qqzm1hWtx9eDhUCOohR1TzNaoFttGMDqGUJxFWfghjgoKmpqboMVP2s/FpKESIX+kTeB
         TFdU3Gltfy/uKS8KOJ1TjG3Rl6xl/Z8LPnIzk1u1ubj9bmZNQ9Jq/1jvoaFdLwHuVE8z
         2ciWMZiPWTL0R8tvYXo9tHHIpQA0tK0c6jYUMadwa/IV+Mnzr0+F5SiDT9fBzcfFQcMm
         N56w==
X-Forwarded-Encrypted: i=1; AKwUvBzt7d+SHGds5hkpHJo8r58B1X3n6eWE4u0AW6WEp59Z9b5vgDEg2w1A+wnHkgg2E6aVLPXcZk80Nq7Wjmzzyw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Gxa3b3vm5aDXWk4y/sJK3FdIEb+Mer9/CSSJyM629ocAOAZ/3
	TJBKJnz8oY4+AzBLvUi5IjJxgqNdgnbosiNXoIS+nh1PFOuzX94iNx19
X-Gm-Gg: AYBFou2vCeXeirZRx85HuGq2YmWDQiLKhe0JZficqzFnVNw7QjlzX0kBMNwtkpLyH5v
	IpiJHBbUq6UX0pbhVCflN2mKMGddl9UzAE6BRaJUt8oKZDx6ycBbgzLCWsBRgtl4617QTiKliBD
	VpCjQyG7MuU2qrf24xc7J/Mg9/MAH0p84bCB2QMIW0QGFXoUeLGloUEMecXkem7uSf+PoBxgKOc
	wpI9UqsXkje/xb1XJayhy7LhhpiJfoh4E78rdiMtcgjpjJME9PRocDLhkNGw9vwxjYjIyz+12c6
	s6NzyNjmKP/b1ys5ylNN8xjOJs5D/DdPi2WAjuCu8V6FE7ZWFqMqdPV34tYysN4yVJrRG27PG2q
	Jr7aVzveC3vr7jt1mtvTZVG19/g/F1sDkQ8y2H+KXgx+w2jH5xrsownLZHMpKnQQhDi+pp1Zw/C
	BZS15jMiPsJ7OvJVNkuXJ6wsC0MvtaM+Y2AfRz+pRnWBA/bkEGO27eQedL7HPk2ta0yT1GUAOYJ
	vKk0DQO7fRrOSiVpqoZsl6qwiMJbgxzaKFodnAavVzsXFqCaetBCFQjlyrEUNUXP6zDeZ3OP2qR
	/1ytCofrumbcaF6wWaVFoZI505MfZ+0l6OJmYsbV/kw1+yrnsu5x6a51xbX0JYIdGmrl4kkvMZJ
	5uqBsoOgOtH2hRoDWebxS2CMRV+X9Ld4zfXy4WqmODrER1QeKjRty93lZ8ngcKaDzMIyB75B/Vs
	ruIjw=
X-Received: by 2002:a17:90b:2ccf:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ae897a8b33mr10316524a91.54.1793691697979;
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:58 +1000
Subject: [PATCH v4 10/22] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-10-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=91sg/4nKfvF74lrnGKYqCKgThTSUHsOM+GGCNFkYSqs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88JbPI72Su8M+7Bbd0Zf+xbV7Nr6FclxD/dnnT9V
 n7MU+kXHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKmOesbwz/IYh5nksXNOV/8cU2vXil8j0SZjyleck+IU2sYVW3tenuG/yxuJtQf
 /2BkYBE01uGa7Zk4Hl963N2flDnT7cRpfC9jBAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074141_168511_E42A75AC 
X-CRM114-Status: GOOD (  12.56  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..34694902c945 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator-codec-va {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator-codec-vcp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator-codec-vl {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator-codec-vd {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator-codec-vp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0


