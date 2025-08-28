Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5299C8303F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=; b=Q2BnN0cvLvf+mCp37gOkzYc3qO
	HOuz/vVDhdlmHRW9AUbZ+froRznJGCOeLBTe0whu29clHsSawoNY3REXCB5n3P5gGxhXzPttU586u
	Us3FbUi0+e06k6/GYwz2YdV6Tj7T8hAvCXlPhPoXJSuCLniGSM8A3nqm2dfQU/y3Qjj4Cc2l46Hpb
	9T03NTgJ2VY5E7pcLI/5lbxH6Fcom+Tx3DKOIVQfk50vxgonsh+3DRTKjah7Pf3/rycGn1GWmlBeO
	rOnDkPlc2TfKn0SKBaSXWuSY5tGb/VqbU8Sk8STrmS5wPpTLQZR7pR7cskVQKDk8KVhSrEc++6DB+
	I9fvMyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhuL-00000002uu5-0Q4q;
	Thu, 28 Aug 2025 19:03:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf3B-00000002BMW-2f8E
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b6278893eso2799325e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396832; x=1757001632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=slcKjOqmbt/W2Ax1YxYz4G1awe3n8/MHrloJ01GTzKCHH6QpbS3WWlh4lOHszHO4kN
         11AhbfQONXUmwEKI+6eNm5xtIbFhs6gv2UkI4PzH30Ff+UDBwjbnfLcHxCGsDbtYV9dG
         HFWW/XX71YRjGsXIzWl+sH1H+LXlCIMnPPlq9gx9r7O7xDbkj1wwpsCz5YPchjhhBrgJ
         4acl4vPdPkBf2X/u01/w93Wcu6kwoXC10kKAUK7mnTiEt1liqj3vXDgNKOUfzwfK7oMD
         zGZ2Emv25AJh6FHYWHzEP3lrYWnLlArDdb6xG5iDkfgLhYXkHTd71Rw9w7Er9N8gRVV3
         +rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396832; x=1757001632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=eAXQ6MsWazPjuaBsImdRsnf8NXEE+Bmd3njJtdkYxk4G6mG4aUSH14q2TfqKR/wLpe
         4SlkcoDcw38NscluwPNvJpZdBBerJxXu2YluwuBEpR0fnB5TwdiqgJix/42yjqKngNZo
         OaS44YzJ2sKx6iPIZvz4gGuWqg/K5E2na53cfKbrtHlyZjj4UyRuvABGiXWfTsMYDVrN
         TsHNx/QkPf+XArw+nWDqCXsJ2w1E9J891591gvcAVfw0/MFjfRKmmzBWghH7u7jgIU1V
         +8aMMDOIYOX85mdF/MdZvxoJlcmnoDtYCz4iBA5WoUPJi676w+mcdnmlZI2JRkZdIRpp
         ma3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE/gahjx2xpjzPB+0qWhzDgEHQIY/RfZ0dk4yiMK3nWKji/5VRuCYAWlI3UMl3l4Cthz3hWTa8BFX6a2sLxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq7hXF7951i62hmIcVJRia30ZpTT3HMZn5XeTKqHn2QwtTxGWO
	p1aMACrPD8ctWPJ5CxO6d+X+ZkmluX8lNnNArm9WcdwDpOCgyNeh0omvpalTH7DoYOs=
X-Gm-Gg: ASbGnctwgLmbVOupT0/JkyftTcNWGBMAgciOKo5Mfma94D/uK4HxEHl6LWhXFxRCreh
	laN6a1hI79oXHOrg5w5bjTUDBurZhMYw2GMWxWnjpm0k+wBriCr3vwy1y/nLL050gBBh4toOMkl
	8m+S2JKfxv+3cCJTbJ62b16a/G3+wqnNdlQHZL7NSU8Y4WV55T9RkpdSwHhflNy30RRmr8VgcYW
	sT509o1rnfOvB9kxU0b9CM3gCrLkgFhry0rAZClRHaPr0D4uXbqHmjmYjSqCjDOt92X0qnXzHe7
	/uc9SM7TIgVFN3Ny0Ar2wB6JvlZBDsQO4/HEzmVfncVMemLkmOiqAsJWPs6Xth5Q9syZgLUPfRq
	7RBnG1I6zGq8vQLiuGNBeg6Pr16p+mhmn9MkFVEk=
X-Google-Smtp-Source: AGHT+IHLEb+XALx3SQT5OlVRvtOHeQcEx93SoK5JAJJrN3hgR1oVUvTEfB3KUoR77aDoDBkXnhfeRQ==
X-Received: by 2002:a05:600c:45c8:b0:45b:627a:60c7 with SMTP id 5b1f17b1804b1-45b627a62e6mr140635195e9.6.1756396832146;
        Thu, 28 Aug 2025 09:00:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:16 +0200
Subject: [PATCH v6 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-8-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HD9TOJpRmpG6enieox3SLEnzfmanpdaE65mOB6T5MYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0OqeB42/YsplOuPBdejGDZ/d5WKJRcg95WZ
 LR104xQjUaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DgAKCRARpy6gFHHX
 ct8cD/0ZuQK3BRMs5wFLGQuOWZuN0q36r1G7AhQcVy4P7PCRDLcyiRs/WAoNUAxuaMt/WwFIkRO
 hROoXg0+TORn04NnzEVYQhTRbqJnwFISsG27ucFDhABh7y5SOZAAEGAgDlmr87Wj7BXyliVSG4F
 pveiULJuhiooGFP3u3dmVo4/fksZ2iNxe1F6Shfa02B1qtZrPp80GW8KrPmkyWiXmvnBdpr6jft
 smrDNxHL4z1e1B4Q4Vm11l1dWwpD09tf229YOZsHkOJHC+PLAI54oiNWw/e3RbsyJ9xoXCKZL4b
 3UAlirH9CoqoulHfkqYeck+FpiINai8UDbl757HTSOvr5y/NC1SKghf5Sqs1Ltlko+1rCexnQy6
 d3sz1GFWgtO1sMkKdFszISAXPg1mPITBS0afAMVUs+Ubz8zwNQEQHc6Fr1/RryMhvKlD4Ic3qds
 DStKOup5b4+KcfB+dmW2pXus3SYVlmgIVpnuwfPi8aNU6bFwKc08EPXn9LYBDNrVpAl8PKyaXFs
 hMuv74QQ0Rb/0y/urOvaoYVoZZjlzgU5L3OYCWXSaoHyHqC1lFGH3PA3jpMY8wKOJdDOr+Ugx+d
 jppbIfhciMtsHe9+7bBfnwJ2MhpzRZXMsMGY8dnba+fJOj7cYEgnMUFWpcChK9su76J4X0jsLs1
 +9KYwX3UDLTLIwg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090033_708722_21C41F71 
X-CRM114-Status: GOOD (  18.68  )
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


