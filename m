Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D275FCA0EC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=; b=4MbIIZqhq2ZU6uuITtmVJM22Gr
	8TdrEDaRknXBU4sGTRdv/1B7JOrBv2Z+qfigYNS9VXnZuTXkxOMeSOOHD8DjCqRK52T8tEvnj5oU/
	IDSxq6acvO1crsHmg43FDU977EiRUiHeo29HyezmUxSXmI286SBRotGTEXXoG1c48cS+kf43MWJCs
	IeNkZYGChbpav0ZT3W+BqrGztOmBGyQjMnPTj+IT6IoFUUSvKLAF0r6/Yi2h8FeQHV7SN8ThnjhnD
	8eJovGZvUbe7UH9DI5RDZ+1cJrK0b9E+t/thN/8D1jOLRPWZkPJtsx5tOR50t+Z62yZ99fyu94Uak
	o2iAYeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFO-0000000Aikq-2YxH;
	Tue, 12 Aug 2025 12:36:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLv-0000000AElT-2CN5
	for linux-mediatek@bombadil.infradead.org;
	Tue, 12 Aug 2025 08:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=; b=m56Q08fDLs+lqBDKqK0y1y7QvO
	nEfx6JdME5cutllN6VDXK/Dfj5sPI57evk5xkpmBaZz/d6ygFh6c3KZ6aHnFxk8hERgT+kZmugOzU
	xnNZQPQep0kHk8SIaWagnvmAvO32umMEI1jRWG3v8asXbdtftgtwU5Bij1gXLRpzcTgC41Gz5uHiN
	szkJk0kMpgiAe94+p2HWVfGsH2Vw0YGMefRaODQGoSHum4WbjI4zHHDSG+imbZn+YCJ0S9sTMWt43
	IvBrtMxUTXkjVYWQBfVA6qG0JNxurtZk8cQy67mnH9ySp0FT6IA2teI761Yoiq0n/rd3pza6eDcOo
	PH5wlOSA==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLs-0000000Fksl-1GUA
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b78a034f17so3938202f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 01:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987242; x=1755592042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=iJV4RhOJdfXAq+2bm+WNBsTpuO1TaHDdCNc5RSqmKZG/Jtu7rFDxQ1KavKkuIy5coP
         eHODzdWzWjTSdBdtqc1zVUg9c2kfCBrYrmF1Frzrma4DXvu8Ws5oa0+vE99YbwYy/DyL
         Yg0hPKcKtBJcQMnBca0T9iDR+L4fuGSRD03GHaUtrfFORVQj8aLrvRkxGaWI9YWQwS5r
         CyGOkn9AP4Nec/h8+U4GndjtQAgnyi4ZU6xFIcCX/YKw8oQS3wSggyzOKURabq91GHba
         7vf3QOqDSgeI1cdNkaUf5ugS8SLfMXQPqF07yCyA54FdZfJ/MjOZgeOO5FM0/ZAbDHqj
         HceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987242; x=1755592042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=N+znEpQFPud4UCv7QVeSbj4UR3+yv4Qowfcnxnd9Iv/Hh6IMQ11K25fwDr9o+d1jd/
         hJUnXMPGskWcMZJv5narSPawzRNRtYBHhWqytT1GEXyttbDZubv3wkLEkvL5cp4v90I4
         4uOURynBZS5YK3t89qAO5g6c9MjS32RIKFD8l0RBpdCj3HP0KxgnaWdXuvMQXIExs8xC
         5dW1M+QZI5rde6O8hKE0hocCW/mnsv27f4OPC+ttwhthGuK94c5jiydIZphMv8f/yZiZ
         OgLJ6dBzxCRtZV5d2DX/Z19mqgce1xCpbdcO8xKarWpzOTHFv1BzXJCCtbYo0kfaf7EB
         B4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCURelKFk4vswzLJaM7F8qUufo6//8p83t+Fi75tuqn1oCc8yxsUwknTbXKlnJhxVOultOWKr+PLZsTGxCyyXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW8o6riGON3eMuK7UVP/i7f4PXlKzcwBD2ivCxnwp8JPh/oym7
	10LgMl6CUD92wCuVOd0nYz2rqLO54jomCfRBTiB6i0cK0caffZViBZ+yFTqqIiSets4=
X-Gm-Gg: ASbGncum/d1XlYuLULPctFk1gPXM05mc1WRyw6PDK6dsIHiob+Yd1FYNT5tYC13v1Nd
	4QPPn5lErXqX4o98wL71hsVeqEKgZalUBcbuW7N5W1tvyEvV0FhAyDSBnig0uFAJOkFpO8hi/xS
	nHz54qNnHA26aiMtk7NSFcPOLIYJb5UCecXuK3b1aBqggxWm/7xqDgXo+mI1MUME8TNZChVOZ0R
	KBTl7XjtNvL+i70Qpr89ggoSBhAi3JcxmP2A89UNweNPO+JHseKQHdRFBkMil1kq2+kF5/vQLWP
	oKi7UCT1odhgPivXkg9y45/99J5OpY/RnEjJG6g3wBZzJ6n+g7I1YDPl1RAej1S+hVEHMBQJ7T4
	cKQhZRhajQ6CNDbo=
X-Google-Smtp-Source: AGHT+IE7RzdqszohpjnIT7cc2wTKSAeG24gAzL3U1lbvOrOc1qeSqca8LmuxQAuRcX6HqNeYGrkvjg==
X-Received: by 2002:a05:6000:2003:b0:3b8:d69b:93b with SMTP id ffacd0b85a97d-3b900b83ccdmr10680009f8f.52.1754987242087;
        Tue, 12 Aug 2025 01:27:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:07 +0200
Subject: [PATCH v4 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-8-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HD9TOJpRmpG6enieox3SLEnzfmanpdaE65mOB6T5MYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrY8MuBbR5f3WyoubwUxwTmfyIcSpxQ7Ha5S
 zLVYHlj+CuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62AAKCRARpy6gFHHX
 cuHpEADDsPkguck9xZ93DDbHm+dAkW+gxRyBIFKg7MoqDE8bGz/PJcKk/1pqyE282dOw68stYlV
 vWEOPXQXbw6Kn/H8LprolH4tci+fdlUYSuFCVbwEZHEr12487UwAWk0X+B2HpqF5xcBnOdVh3aO
 XhnFfIkuVErPutmqWZP/8HbQNkc5ASjwIqSDD14dJHZf0wFw7eyA4KvYcWH472lCJ/KpQZgrFK1
 oL4rj410zLawPhIN0OT0AIYF1gECMQZsfoW6aXo0YqgMWt4z7/gVDJgbhpgs0nSWqB1/ri5wVg+
 9O17SbdM3avEKfy6ioY37j4RypySOqOaDC2cNt+/8RhGVM77rMBmEvMYESdtX9Sp3nySjpOPaeg
 5kQTLr7RSho6OQIM4GK8qciMCFnF9AcggpTOOw3GFWJKKWHUQOAdfJbiPyF56YUp13+rw2d52Zq
 qcBjz8+t3mIvEpCUr02fqA1yaeFZfjR/CmIlvEpkYCvBxW9o60l+SL7i4LNbQYppZQsZv7V6qwU
 59JLUvYSuDw2Z8OkViH9CzlRqd3PH3Z8ufgkHBFZX/jrwufWqycyN17bhs5PxI7xzO/JMD2q3rE
 Oyh+AdI+WlSwIi+nk/ccSPXY5Ru6x6NE9iJr8R11FGaDLpiRT1xMit6Vk9/CGA3AUU8FVayq/hP
 2n/7CMV5EcQpTVA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_092724_633257_A1AB43EE 
X-CRM114-Status: GOOD (  19.27  )
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

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. We're working towards reducing the usage
of struct function_desc in pinctrl drivers - they should only be created
by pinmux core and accessed by drivers using
pinmux_generic_get_function(). This driver uses the data pointer so in
order to stop using struct function_desc, we need to provide an
alternative that also wraps the mux mode which is passed to pinctrl core
as user data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 6aefcbc31309995ec1e235416b40aab3e4a073a9..e78c8b3ec245aad56e3e74a26d27c41ba4a98281 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -135,6 +135,11 @@ struct keembay_pin_soc {
 	const struct pinctrl_pin_desc *pins;
 };
 
+struct keembay_pinfunction {
+	struct pinfunction func;
+	u8 mux_mode;
+};
+
 static const struct pinctrl_pin_desc keembay_pins[] = {
 	KEEMBAY_PIN_DESC(0, "GPIO0",
 			 KEEMBAY_MUX(0x0, "I2S0_M0"),
@@ -1556,13 +1561,13 @@ static int keembay_pinctrl_reg(struct keembay_pinctrl *kpc,  struct device *dev)
 }
 
 static int keembay_add_functions(struct keembay_pinctrl *kpc,
-				 struct function_desc *functions)
+				 struct keembay_pinfunction *functions)
 {
 	unsigned int i;
 
 	/* Assign the groups for each function */
 	for (i = 0; i < kpc->nfuncs; i++) {
-		struct function_desc *func = &functions[i];
+		struct keembay_pinfunction *func = &functions[i];
 		const char **group_names;
 		unsigned int grp_idx = 0;
 		int j;
@@ -1588,14 +1593,14 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 	/* Add all functions */
 	for (i = 0; i < kpc->nfuncs; i++)
 		pinmux_generic_add_pinfunction(kpc->pctrl, &functions[i].func,
-					       functions[i].data);
+					       &functions[i].mux_mode);
 
 	return 0;
 }
 
 static int keembay_build_functions(struct keembay_pinctrl *kpc)
 {
-	struct function_desc *keembay_funcs, *new_funcs;
+	struct keembay_pinfunction *keembay_funcs, *new_funcs;
 	int i;
 
 	/*
@@ -1614,7 +1619,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 		struct keembay_mux_desc *mux;
 
 		for (mux = pdesc->drv_data; mux->name; mux++) {
-			struct function_desc *fdesc;
+			struct keembay_pinfunction *fdesc;
 
 			/* Check if we already have function for this mux */
 			for (fdesc = keembay_funcs; fdesc->func.name; fdesc++) {
@@ -1628,7 +1633,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 			if (!fdesc->func.name) {
 				fdesc->func.name = mux->name;
 				fdesc->func.ngroups = 1;
-				fdesc->data = &mux->mode;
+				fdesc->mux_mode = mux->mode;
 				kpc->nfuncs++;
 			}
 		}

-- 
2.48.1


