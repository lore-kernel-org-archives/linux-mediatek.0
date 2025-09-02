Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BDFCA1005
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 15:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G59MubZTeiU7liQ7BG00dmfAPEuJzh2uMSB42Di6Tc=; b=Oi4R80pAL2VahHGTwsjdNlM9iX
	8fOCwsXUArBs7qy0RJJRqcNYwjGWLhdRt2JDUKtEdSsxgs9J0jsS64RJ4kGjELP7NWPX2daqUPhoY
	OVT2l/GhrzZeRCXemIDFxF0DKmY5H3l0A2r930bmn/XGBlSilYQ0CxZABhh2nlrG1RJKxx150/NKX
	XrO3JeZxkWywi2Z4chsiUrLKtOgsk2mLyVAsZmTSc5m589U9O/g9ra+PVc0BLq0fR6Kyz0KI0dGYQ
	Npft0Ky38LcRDnJarysm0Kkg+o7WQFcYDG49JrSGFDkzLU8M+/USKy/MWak2hLtciP1/W+rCuGQPE
	HS9g7KGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSiL-00000000cN3-2OxS;
	Tue, 02 Sep 2025 15:14:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfj-0000000H4Sf-3Uvh
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45b7ebe667cso34154045e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814374; x=1757419174; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2G59MubZTeiU7liQ7BG00dmfAPEuJzh2uMSB42Di6Tc=;
        b=yIlzwSZPKz7ix/JmIIwtOUrlEOBhfnGxLtQhLEAsnXVH+SmzSWmcok8iE/MnPtR9+7
         8E1lNNhcCEiUfsQXE+rW/BeShvnHR+e9ouwrLuJN+VcNsQ6Wj9wM+ZQigk1xfcSwzqaS
         lCigkokttr/iEbkaQJ4jg1KoygsMR9M92rO8RTxCxK65xwCQjRJWdox5l9KVkzisG6BF
         PI+IgJ0wv9jK87P+gzLCfDXx/nj4/Zq8q33idGkrnzEY981vQV9bTPL/Zhj96vrsxw03
         meqslmnsG4rYoR+88YnWElONxQqFpQuFJ/zl5TewBriSDgsvLYYSN2cP2b4E9rYn71IL
         z9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814374; x=1757419174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G59MubZTeiU7liQ7BG00dmfAPEuJzh2uMSB42Di6Tc=;
        b=qatCcuDmbCTmOOiZBPMjPR5XXiXxOKNC0w49NLGBZ2oOjQQk9t0PTS1GT0yqB2STIv
         Sb4y77Or51GT2ajcLs/UsHRq49mhvHV7zKeHfhriErz+XfbJH/iCemS75Sa2agA9Cu/Z
         x7KvCP0ztgbaZPzi4o3oy1V1SMNaS7Wj9YLm6odozE7IsfazG1GEwhb9odNvIRM8lZh5
         +SVMdrIwrKmtIulWRAJNHLMuaiaPLBxXEI+SBVSS1oYLZEbBsjsjD18lxZMM0gxYjHuU
         H4SczDnOeDGq9fhgE+mwEXtkzBvTYJ7eaGanwRSrPMM6h185bUmUDgEIhxAuXzHWNP6e
         aCgg==
X-Forwarded-Encrypted: i=1; AJvYcCWJG6NdadM7bnt1KyL534x3bxGUUTZC9Y+OzKeeil6y7Jcadkfsv3+rq0DL3TgsOAZenoongqTWUT2YyqJXXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAWSkgcHwYX/VV+F5Lse9oWc7axtg6uBycpXOgH5Jcn3BBOXAx
	U1ClL3SvCM88tn06D9fyIlC56UxDyuXi8t5unwPt6vX9yncJOLB2Rc83WuwHMz1BaAU=
X-Gm-Gg: ASbGnct2lumeOMcq1ftYyOzdM+LXihIG8fStUQgEr/m9OEiSdoXkjX8FNzNIh2ggbuQ
	VVbuf3DmvYpxlc8QxnVe9+hT6fOYEzleJw18D3V67jnm7+IqbM68jcYhTeMrdnVhbDqkMP36yw5
	7+u+08aMuD9vh5nI1Gw2KlAuaCq90MgcBsZKMMlmdRZFuQfCd6QJ0S1CGtfF1S0k22h6JkaRoq5
	wbeGpS9gVE2cGq8fVoUXi4zl7GcaNdPMDrQZ9gLmpxKthiS/myOo7vJmYepVRw38qIk1N9yeTmM
	GefPuaam9Fpth41Lxn1nM31ymMjRiyxiShxRfKvSeu3tLhCNyAchhGn4k64O3gmjmGyIUoVzIHO
	7X2xcFnFQQT07Vc69
X-Google-Smtp-Source: AGHT+IFLYpm7MHCoBbrYA9yPFwTU4Oi261s/PzucYOvn9j2GG1ZzAR8wL2RYvG0trkoc4GH+jx5MDg==
X-Received: by 2002:a05:600c:1d07:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45b8553417fmr112095205e9.16.1756814374299;
        Tue, 02 Sep 2025 04:59:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:18 +0200
Subject: [PATCH v7 09/16] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-9-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ow80ySNnxG4YPhFZmsqjHWDVkfwZ7d2knu+v5a2fm7Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwTalJ9xEimLer/4deaUbuj2xh0hSCbfKp6h
 mSFLsj8wZaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEwAKCRARpy6gFHHX
 chHMD/9qieRrB7kLN2tVVNwNzCXwCyEqCxacgLrSqioX/qG8i5nUPX7EHz277hj9w0PidEZ1ntG
 zmHYDlqsFEPXAuTkXZgG9SopO1HVkY71LVr0hPzCGA3VBpWobmAQSKm/9IMrJPw7ZA2XtQhX32p
 kda1warDySg74DriEQwkfYimyMZ3TQ7pHNBxj/YXFrUqHE2bOWZH7roy8l5AF5dB9oc6S8PQ+Zx
 iS/JncN6wC6U5Ah+lX+mMsuTa6M5HJoJ+Rn00ffY3hUzSpJvZncDxwqdY5oYbRIUnhm31mZ3u+b
 rK9QwspUrOmf2xLBv8KmvqFUo1tNgbKyH8bEe2ODS40J1m4xfAyT81CicpoTkW4hTRN/LoWDmRH
 RUnueU/QhNGG0LtvDy3EesY1kCD0PHgPfvs0eknqOYCNnbgVchgt+WJFs8yWWN/Uh9jHUfgspnL
 GXaBzcEcN+KMnMuO1WjghdXpJcpBfPZK53ftw/blY6FQc3I9OrH6wBgTL7SWFN6WKIrNt6xs3u9
 a62AdwWvXg2t1O7dAJlzT2n25b2Gw+nGqFBM6MI0xKBrxIiV0fCxwFjWnVp0y7jsPy+6f43Jma3
 oTrvmRfRyonsRPxFZ6I3JXqC+NUq2IfQ7hgKvO6WZzeEHpqX0fiqO1ASQcW9zStc6L0O7YQzAEi
 yx6zfFbIqCxZOpQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045935_897407_214C4931 
X-CRM114-Status: GOOD (  19.28  )
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

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
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


