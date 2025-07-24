Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8474EC83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 10:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6taTiAJxmvKWwV7MRUnViIWdyftorILSzVZsNGCp2D4=; b=dlGOnu5VKRoyS1ngnhsRlVZdFL
	tmxVHt8ffEZdCXbqvD0+DJr7QeJKJ/3CU87yavO6r/7aKlGubA82fBfd2iSdLehp1KwnLx/iQtOtj
	XtfE8ewmkn+po2+UeCZegbiMmbt2/dLBeerPtH8BqROZodPO0jA5qY3zDVkfemFk87es2Jjrxk/uU
	yt+c13YRK4+5KXIq0uEQTL6IwznqCl1HZm+6owpIlP44cfFa52V9dvfhon1z09J77xoUF0QHib7cR
	0iIybTKlEzKAjbiV9cEsFt8x6y2OPfJrxmKmIYwUv7jI8rX/bIku1YrL1ba+Ck+W6+ihrtTlrkBH9
	b5ulOTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uet08-00000007BOE-2NGt;
	Thu, 24 Jul 2025 10:16:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesBx-000000071gI-0tlS
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 09:24:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-455b002833bso3181085e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349084; x=1753953884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6taTiAJxmvKWwV7MRUnViIWdyftorILSzVZsNGCp2D4=;
        b=PrsYUF6SITyEH5SkxEVD/ySIJ97IUjYJicQvxl08lhp1031jP1nLeEQySgNj0IrhMV
         aUzUM1BlBwHj5vG8yHGlhZ4SEewiQxVsKVOJ85qEa+y8KQnN2ouETX4grbjpA3c5mBPt
         8BJ9vIOWavwLkahVFh2fjnnVyzyoV3i/EVg3ceW2/nBB3O+VgiWQYm7y2SqZlORWXv0Q
         DQtXf9R2SPwgHbSXWggZNbaD1/Y+k4cxXvrzH1IScXjVz3OyqXiUXzww9gvg55KilZI2
         WHlYD4ibhRpEzjsRm2bFSnt+2rQvien5OHaRU3s8gP3l61pdnbUKZmJtp51J5rtYa5b7
         S/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349084; x=1753953884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6taTiAJxmvKWwV7MRUnViIWdyftorILSzVZsNGCp2D4=;
        b=RzVtrzqlQjm8BtqVEALXdUwD4HLNFb7cnzzMuHDmu5o2NWg48OocX/ZTf5YPdGf2lc
         HWGUWBBBN96I9rlrTjFh2igYrEd5gwrpU9ypj6SNLeUQgKfPB7DptSUVlSjwsBAI39+6
         10Km+X6IOCmqT/7xoUtndKlzGwk7hXleUsIdx9CXEAt0CFwkFg3kz2Sl8bAzlDr9ho0p
         6yANkULD6mqBFqYXY6UvZjM2OhU/rm2UCVcDXSg8lYuyqXKQT7P09XGmDja1bSaXep2b
         i7Jv6/OXY2uc06IF3nrtPLjdVH81ne8KtlnscQqIPjFJ8Q4iYSDl02lGXQTDEubTK4MR
         8YYA==
X-Forwarded-Encrypted: i=1; AJvYcCXM9tPEuHX9Fjg5nNXsu9DF/g+YNfBuqDDtqx3WpjxhLV4xOR4rgzeujDPY6Cxs64TZorjvwLC1eZbnjsnyTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMOihhtYmpU4EI88NVY8Y+WuimFw2swj8fF7ui6xH0pNwK3+g9
	aAZiRMbNpDj7iFDI5JtU93qIruFe3RULcbVdm1VSMfc20GAX/CGA517xsredq2bkQ0M=
X-Gm-Gg: ASbGncv5Kbb+pyHbUuA8nt8tu/wSIyLYYtiuNuT4Arc1Icoe155C3XO3yypet7mpbnc
	eP+ez90LJyc2SQWfuNGboBMENTMyAjYRQ5MI7NLvMQCmvHiQ3aYVbv3PKZwm8ZXfhMsM2MNyEj3
	kKZYcWoNxanoRqBmXMwZsfnCIxp2JNZHHMHASC5FSTqdGbotIcLY2D6Ze5xzyS3kXLuzqkxi+0E
	aDXimjuiAaFpdWXHRDMBc24Ov4FMu6UlVHFx3AK5nijwaer20HgUYyLMR/wo7pnI7ramw7LF411
	7N1XXoykopIo6L7OwMyu4mAkDQjWQFqQzpow0WxvKpkyEycD1K1qHuu7Iv2ctwttaGpAJEAMiUo
	Efn7RA4/BSL3cnX+2BVu/Acfejgc=
X-Google-Smtp-Source: AGHT+IHK0dYi3xsnoZaYbdsoppyUow3KIWIi5jwOyXEKrEo3jgO5fkBiWGVoSb9P3rLxzjmZh7JVig==
X-Received: by 2002:a05:600c:1e26:b0:456:25e7:bed with SMTP id 5b1f17b1804b1-45868c97accmr58794135e9.14.1753349083444;
        Thu, 24 Jul 2025 02:24:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:31 +0200
Subject: [PATCH v3 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-3-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9XGd4dmoHWG203pSJBEuuDLVpVNcYHStbs3CKo1ub7I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvRgqw0m/InntV11HHUCE+MGVQkjCMalwIfS
 KMoPh5ezd+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70QAKCRARpy6gFHHX
 chrwD/oCtF7meIzX7ZXpLEsgWK2HnP775ycIOrhIwy5EPDMyiNJBCALS6V0nGhCUw2Z9MV0vPMu
 cMvZp0ZAetbm9VKmdQDWRldx4ebo8/xAdFA7QNSl2v9Py+AuX1OymRUpeGqWEgxZdMIMGLePvDD
 J41mLtcuKXxdpZzxVQkJ6eqotgtxLicQ3Kd5nyfAGpPv58pRiSOk8ShfVzgvbDt4Cm+4ZmI1b/g
 6ADxlGARBw7Iv6e0y3aarJZY40cDArbMpSeMsthPxd2ckA3YzpqfFpPoYaqZLzPJLzS9qs+JS9m
 FTPjtr7zEsks8DyXoqQmEomYi7djHBa34IM/+cSpTShC+uUPWxn5WIh+e841X0NjZvqiYltThhF
 TwrnuYapLpqUE4A51spxZbKr86qfYwSaIvQX3GQGjYh7PEcsD8bupfDFxuoNPxI3VJG7QGRDOQv
 WZ3Vmi7GS8vyhYTBQS8uXK9ltMPRVoPNgmGHSR/k0ZSAN6h8loFb6wWYuxhqSgvLEbwtaWqGgH1
 zm84NgtIT/M6kXtus0iI/i4ig4d4UjPmMI/Jhq9pjP9RBSMZu/EKa21utlbG/Go5IGqI/n2vHDS
 SwCRIsWrcI2So3cc+c6i7Sawc/UqzfwIcEMaOpwtlssOTUANHxZLwMt12cdVdexmaqY5wPjLhmX
 qFbRaYrqSoXO3MQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_022445_260877_6746F43F 
X-CRM114-Status: GOOD (  15.15  )
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
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 1737b88530c385644a360e8abe583416bd6d3fe9..aa71e02b661c992c117418af910ae157c4f75fff 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -36,11 +36,9 @@
 #define PINCTRL_FUNC_DESC(id)						\
 	{								\
 		.desc = {						\
-			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
-			}						\
+			.name = #id,					\
+			.groups = id##_groups,				\
+			.ngroups = ARRAY_SIZE(id##_groups),		\
 		},							\
 		.groups = id##_func_group,				\
 		.group_size = ARRAY_SIZE(id##_func_group),		\
@@ -334,7 +332,7 @@ struct airoha_pinctrl_func_group {
 };
 
 struct airoha_pinctrl_func {
-	const struct function_desc desc;
+	const struct pinfunction desc;
 	const struct airoha_pinctrl_func_group *groups;
 	u8 group_size;
 };
@@ -2908,11 +2906,11 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 		func = &airoha_pinctrl_funcs[i];
 		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
-						     &func->desc.func,
+						     &func->desc,
 						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
-				func->desc.func.name);
+				func->desc.name);
 			return err;
 		}
 	}

-- 
2.48.1


