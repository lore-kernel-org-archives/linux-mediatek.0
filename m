Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAB0C83F03
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 16:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgqgvxwCqFfnj3D+ZyyXgE4JDdDG2zRHT6bfz+Oub50=; b=mvTBwPZwXFgHkPvw0Ktjrkq+hn
	cbsSo905MgGr1vf36bBfcyWancFZEiVnADWRSZooOm//g26D1ypCGcrBWWSkCL2gqcU/VpzDADzdI
	XBy+I6u7OAkKZVdcBDHrDbw/qK8fmwfiWvh7r/+QLq3SR6ueqKh6YJm/NjgCG03wzzdI2wFzvj0gs
	znSuFQUVyxzxRv8qy0B2SU2uChufc/1FdApiKU/46xaIxLYF95VWcg0VKI6AcWbbIP7scPv4rPyic
	H46zZS6khVNr4ddZ+rMl5lRLvmo4lP05jPqb2QUvsx8hhY59ADk4geG7DHiQe1+quKhx6uySpfRk3
	jWOnpTZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXnz-00000009KPj-0TWn;
	Wed, 09 Jul 2025 16:37:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVwx-000000090aM-2oV3
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a54690d369so5620599f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071946; x=1752676746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgqgvxwCqFfnj3D+ZyyXgE4JDdDG2zRHT6bfz+Oub50=;
        b=cUNTIPxLHFpiZlLwjLxkjnwITxNUFVjuJrZIziRCya1saPExo+Beon/HbvIqLyHBDn
         vxEh2yHGZGAEd5oG79UW8y5M4u9IQckj//d1bLzi3Wuhised0jpetYgTVMP5rnYS+XIW
         bhnQiJ0Vu2DqEXHidw/ntyTUI/Wrq+0X9+nj23TT/A5f8EkFV9KWKk5ST9j1a7c13vPm
         pIsKVIoX42eltMTRuSp6Veo028D2IH6dJW7254atd9I2eEArTXGubmoafBCNHpccIe3p
         IpWj5RvbJxtfSR0yYZfMAIjAp4WFG35/8IZvHGCB9VDcIEDV4Oc9/8sETXOXhud4tnt9
         jMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071946; x=1752676746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgqgvxwCqFfnj3D+ZyyXgE4JDdDG2zRHT6bfz+Oub50=;
        b=SBJLf+tmCe2MSsXwK3ftixxuze22Wj8AKIvHxU1D2bYpz7jSkxovq3YAWuXVrFxfaf
         1AP4xWfJnBAKJK2lQnSZSz+uZibJM1XRxr81hbzX1NUlnsReon1SOvVv63ghA5MGJPXA
         +6b9fAZoC8VzoZfRXng0OzNACLNwZ+rYj34/1Qxg662W74c2xwuyhOOsM139bkuod4DO
         0Dj78moSdhqtcpyVtnpRCX+rKZZzONOJwp9HOO5l2xuCfSMXOh6MFkM5K5TN0BYT3Zpz
         WHOsDos0Nwxbx6TScS7kEG/tdXowrN9HBfwMbms49xG85DY0D/sybkkD+pKhv9OQD6zk
         DYEA==
X-Forwarded-Encrypted: i=1; AJvYcCWSBhDniyaYpDZkOUnBUcoBoER/62CH1rXJ6nlyn7vh4YbxzO86ibbDVBiQpdRCYP/kgeXXxB0o2RcYjQOCIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHogZwuyZO9fgizwVV2k3791ZEwCIvu80/3smnEhDY7BZakwFQ
	mumRafa4BsMIfpAqkZDsTYNmIURR48Mk3B/KOzZywbnV2B6X8EwRi8mPRJXwbrDgQMc=
X-Gm-Gg: ASbGncs2fj6GFYSowhceH9+5s7qU6zZNq4Awz6uOO+uW7s6XSPU1069QnfuLY1NS2f1
	fj+PBJEdS2cptVKk6WeUF5TtlXuoG19WaJy9MnRf8aesZa6FHRLC4Yfidqls4hXF75RUXWP1CrQ
	SpcKm5hJU4WSDEdGuZM80h2orYCoAyE2XEhX5dGQsvsjXt71HZq58sd54k4Q/yDK9VckAiKOmIa
	fRyu+nq+J36Vt7wx1eK+yVnZ+4+p1xue0wx+1pQ8peNREtjmaf2DfnHH77qeTrVWvRjRgc8E3em
	QqkwEJw/8uKLObMKx9kg4WyBZ30OqNAzg8scj4F5pKHCMObB3Fb3TWY=
X-Google-Smtp-Source: AGHT+IFCxWrONhSHA0cousnCUUTqf0HNUo6HXPenRsFNCAgJUX4vg4QvqspTli9NjL302vwuxtMC7Q==
X-Received: by 2002:a05:6000:2410:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3b5e45291a1mr2441471f8f.47.1752071946002;
        Wed, 09 Jul 2025 07:39:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:38:57 +0200
Subject: [PATCH v2 01/12] pinctrl: pinmux: open-code
 PINCTRL_FUNCTION_DESC()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-1-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SCktDGdssWrdS3fPrm13PpkBLbdVvTkxfS6ntdt/GdA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8Fn5vbkSWEZGQidWF/DLtAdBGAPpe0LBr6s
 hA7h1HUlj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 ct/ZEADXo1zYj3JGoOxHCAszamqrd3iGcngdepn9Nn73ljY3c9cLbxU9cu2jwSNgPpAh7Dh5iGm
 KfJ7vvZaC6SCUUj8UHwIOJl8W6uiYdJh8DdR+amPrvf7vp+XSV5xzj0Oiy4B7AZ3k9zfdi5Zqd9
 6rXUNWprQ35uNz4SZ3ZlC+nR1GeZwh440KfN5xaRc0I2NP2oqZNgwZdjI48LZsVuPYKIV3LiuDv
 30/FkUZSjr6uL4Y3htJwW3bvYZSamBDzPkpUtLmEnoHDwLUOjL056vSIFTB3arspJp2hE4MNKKf
 E2ZSHXcN7V8hxQblKeqwX4hKEPKOLksyRqCcQYIhjnQGTF1OOQdJAtpW/liqQstCHd+t3hEYySj
 1TWsXiFMF2GmwMrOQkI3hZIVMLVU/bwFerouobUyraWcNiqQbDDlr+NED63W0FnLgn58M0aHrH9
 lrwr/As429fr7Z+NKMjcMIaD67YQnESCyufKQxHBaOlJbaFGq9qOq8gPrUH+C8DQtQLIPBaifyF
 bRmK+g5Yjkkb6ZePxJWYpEasghmbbEip1pzjgL4oQaw33MXgGLLA91yvu11b034rbgjUuwVLYZR
 TQJQihYTxefGANWzFUr2rHEC9UfEan9NXcptfoMn6+Hz5LEkfeTmhiIHY4+8Xx0BzbHqNIxoaKR
 jFu1SE0AegXKSbw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073907_717328_7A2AA8C8 
X-CRM114-Status: GOOD (  11.66  )
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

This macro is only used in one place and pin function descriptors should
only be created by pinmux core so there's no point in exposing it to
other pinctrl users. Remove the macro and hand-code its functionality.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c | 3 ++-
 drivers/pinctrl/pinmux.h | 7 -------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 0743190da59e819d1c72c1ed1ece72f206d60d65..daa7a11adabf672f802a8e9577c14e4da56b8678 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -893,7 +893,8 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	*function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
+	function->func = PINCTRL_PINFUNCTION(name, groups, ngroups);
+	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
 	if (error)
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 2965ec20b77fb360ca244800e30f1eafa988a2b1..5c039fd09f7474b4c104d3c36e0e8b8dc73a2ddd 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -141,13 +141,6 @@ struct function_desc {
 	void *data;
 };
 
-/* Convenient macro to define a generic pin function descriptor */
-#define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
-(struct function_desc) {					\
-	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
-	.data = _data,						\
-}
-
 int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
 
 const char *

-- 
2.48.1


