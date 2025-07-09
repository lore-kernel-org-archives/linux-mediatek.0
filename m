Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32369C83F03
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 16:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmTipmFVVxbCGcdXsiaH70Bk3Q/qRASYoTM1gDWBACY=; b=CHKlIYQpYFGIrRs1Mv4RMTtfoS
	a3zwRjfR6X7tTkoW7iGaPYaS6kc55Ol6Wf74p/8h8tU+jDBmYjJdcX+pMjKaTPT5+E17rLFhwRBuf
	skqrHmrtwMHGtBsdVgosM4CIYjALfuQ9XdVHl6mtu078ZX3m5siT/FXlOZqZyyDcToOB3FOqB5yss
	uN2f9/5VWI6g9KI0Si9+hV++5AkhX7dbBZ8/CgeRxc53NQmXFsshT7mvwD2AbAyJcUcRJ51m9wnBh
	CiaEwz+x+zCSb/50czwzp1LKvZjdGYsMemfQVjOFDz5TabZTMf4ElWBsL6DDaJg9S6oXxar13Iwoh
	/V2ApIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXxB-00000009LTo-3lOH;
	Wed, 09 Jul 2025 16:47:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx3-000000090e9-0Yp4
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so31474715e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071952; x=1752676752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmTipmFVVxbCGcdXsiaH70Bk3Q/qRASYoTM1gDWBACY=;
        b=BYTb1eRK1Yqb639Z8RtFigSiHHNuER7EZtI9c/iZh1VGVeOjpjEXi61CYoBHbCl/x+
         Bc+IhlQp0bjG3xBZHj3wuGZFcjX0ABR1UOz8XpqCyDDnpq3+sUlwuHVR7QFvCx+xNgWn
         bFHXxycsXfp5piR4A6fxeMamw7vHYbjQ4M2RZFvWMWMaNbfrs79AGweX4+6xZ4HF/usq
         jOSPDXwnwNP/cPatr3F8Y3tYXpmLEuF+sWaRaS9eVvbjfMAAbxOB39CgVoC/9vuGGFLu
         E3lFOfZWqc2vup7lh/p+dB1cWqzmw2XMiiNuSSMlm6XzZat85TduC79BY2BEX/WqmnwB
         Q+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071952; x=1752676752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmTipmFVVxbCGcdXsiaH70Bk3Q/qRASYoTM1gDWBACY=;
        b=k+h92qAr0Bd+7FFKxNBev0mtO2GOtxJ5R9Qe5L0Y+ENrKO/OiPZmqrG+/VxIcykp3l
         022rX67th8Mjk9xgsxv8xbsUi1CHzgHNZ35NNovAYUZ1UYsH31OvI+wN37HSX07UMK6a
         lpMuZUcktB5IPbFK8/+f/velNAWGaom+G35uKCLAbSRpptJ7IuZuw9imk6JFrI8mG+Ky
         QXyISc9Q/Kps6XC8AyXsSQi2iFjzfga/N2qXswZEbGcFEzqjOevOI/xYRDJSomZK2Zdr
         GWEnTv/jKEUpZer3ZCMuf0mb9Js0GZ/lIuNkRwJ2lqTCAIoPH6dFE3btDPbvF8L7n3CH
         Y92w==
X-Forwarded-Encrypted: i=1; AJvYcCWMWsKbgmB+jxUdAlJWhOIU4yBrf32D5hes1hdafzklAsV1kUKSR3vSDMZvefD61BDABp2oaqjeIzSO3vz1Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCY6+/WPVpVoBgxDyf58dhJGBnqrMk4nsCJmFtMZEx9jei41FO
	PLAV8kA/c8II3poC0jAU2ioupxdJRNK2YMVI/hAcUJAWNui+DHk+lDXaDdbKzs65K00=
X-Gm-Gg: ASbGnctfeFRbF+sNnellJTpTBDSbbXWKnfBAXU7bwArz4OMr1fbOS9/EiHblLH2oTUs
	HFyvT/pQ/Sps09Dkj/WLIl7FeZKkFKgvlqg98q4TZvYStJQ96txIMByS5bPb7kk/fJIvKXLJOJc
	usdfJ16O3SZUBGQILmEuhKbMCMbHF5MukCPEjPS7aE5CNQ2BT+SPqRO+bGK/AwJZ8de3TETpFP+
	nXPtKuNAiBmckzYnpXckbrEBbRfQNtWMQNA6lS2iMr+ek5xtVyV97ZU0TKp0u/gp7xrEztAMTWw
	VLgUW4aCneyOVW3m9J0WmcFRPvKEYLUIaUjHcTZzdf9HNncEt0pw8C0=
X-Google-Smtp-Source: AGHT+IEqHxbgo4BeTO0rlwHgfs+5cT4MK/pnweKO+TNdiAGszDjha7dmHPKUi9qhBMYkfvOZ2o5LAw==
X-Received: by 2002:a05:600c:b85:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454d53a7430mr25430055e9.20.1752071951593;
        Wed, 09 Jul 2025 07:39:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:02 +0200
Subject: [PATCH v2 06/12] pinctrl: keembay: use
 pinmux_generic_add_pinfunction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-6-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LiSip0OZ3qgm+1gIe35XDjDVlfL+H8JX04gXW7dLT1g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8GPdYY6Prvb78Lkt36Igp2P+vSPLUAtu4SU
 UOQ6CfFu76JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BgAKCRARpy6gFHHX
 clEgD/4/hywwvwvR7tFh1C/3Ky26RR7UITmtWx1t2bwLPpLBRA/8B4rCbEmpf+eO/3aF3TEB2US
 EYT5xt+1aNMdlx3uo+A2sMKw5nRorK9HEE6hURhLpVVmSk04hVEZE9MADfkaTbdRUoEe+OGaL2x
 I0kTBJOsZn05tkr0eEMOfrTnesHV4T4oWgM+9ChUQR0o1ypuKoqZ4iZjvyWe0D3aPwjRYL+frf3
 6zQMxdIIJwJAkHA9517OGixJJG6vvkMFMx89OGsymSIq4ONGDphjL1J1Q5Ne+hjQn5YbzRnB49k
 8rhdGbedPZUwmP5EfEj4V0JcaMCqZBkHgG+FzRmGGAxU819C0ITJUQharhh3VrtoJ7vhTPSes7O
 /LtdaGdMbMDnthTnRMvhVMRVbv0+C7d07RBE1cgZEkxXDP0O4cPrMvXSJhQHStTscNNRIGyDOsC
 hbXLZfQpxTPmAVOedaUaKleDfjlqz6DRaQUF6lA+//qOkpkOzaQ9VU3d6b1C6b9r6LIBu8dzy1Z
 WVWmrl5sQm5XkBjrlUtm5rzMSecnAxJoW4vUedcSZeooEqWzguv0INc84+jcbVStA+pJ2mnEo6d
 KiCGH/Xl4Tssw7AvLZSU9Kac2kfldzJXaNkyBSwSc7PurFd/MSL1qI1aPWOumrkmLq9r/M37v5F
 Qy5vLPoQSAjVjiw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073913_196038_104AB05F 
X-CRM114-Status: GOOD (  11.08  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 622000139317e9dfb95e9a76f2478366daebdcaf..30e641571cfe5396075cb28febd2d0776326365d 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1586,13 +1586,9 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 	}
 
 	/* Add all functions */
-	for (i = 0; i < kpc->nfuncs; i++) {
-		pinmux_generic_add_function(kpc->pctrl,
-					    functions[i].func.name,
-					    functions[i].func.groups,
-					    functions[i].func.ngroups,
-					    functions[i].data);
-	}
+	for (i = 0; i < kpc->nfuncs; i++)
+		pinmux_generic_add_pinfunction(kpc->pctrl, &functions[i].func,
+					       functions[i].data);
 
 	return 0;
 }

-- 
2.48.1


