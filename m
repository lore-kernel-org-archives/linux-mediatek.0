Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F63CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 12:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=; b=AzCOWKxm9o90FQe/F+bXeSF1fB
	GlWXnI5/SYV7oWS3/VLU9Cuowhhn2lg89wIvSJWQAvw9w2Vyuw4R3Q/3mSrMg1O+Bvx9GqSBvN8Cp
	9I44lDCHBwbaGi8UQAPTodaHRfQmwiaNF8qQVOec12GnMWvjnKDs/q/m2xk0GdGsotXK6LXndyhvZ
	lL37gZ1XJD6bC0yaEi5RWP9spZRPUjvOOblmcD7TCotRs73Svb5xK944rru2xph5wiqEgn2oT4TKI
	2q8Vh56+gWWJLMUPGoXvsmwCZzjuTrcP+zBrb5EWUdTLkDA8N2vzT4yZRomMfg5uISWG0ms9Ro9n5
	lMb/pB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtN7-00000002Rhq-3izu;
	Fri, 15 Aug 2025 12:17:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqR9-00000001zrw-0Btj
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:24 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3bb30c72433so151820f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Aug 2025 02:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248961; x=1755853761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=;
        b=EXBt2C0mxhpPh/EQwlF25jFXN2Gl4e5zhKCkQoKtNLuOCzKBOs7wN6hQQOJdHdYswG
         0J/QzEVLHzID1ii1AtLhwGbXvApEq28zIXNx67cmhQ+EONPsow0Pk+tBKOWqypRxnonf
         Dk2Urb1wXFU4NZdzDpykl1dQxfCPJAnmBSQyUI2SwmxUuEJgGX69Mw2poRJLzBCSyS64
         nCOTrW/pJ1f6UGslHbSVqmn5zd+el6Wvb04bNHfaHPQqgSAZtUm9ntZhl0PtRqoYPMkh
         SUvNjGFKZ+hEQKdu35KGkqyt3AI9A8JiSp1C6z/KqZUdaPXaS78TWRKbt1HMAKL32ghD
         ffKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248961; x=1755853761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=;
        b=UH1TmcE2fBnTiSAh1NszullJqw4qH6CCbIsroWiMYIpJxaYF1cvZMlF2qBDdciOsAn
         fnzbfUSIOObY9uLNSWgHlVikun4UqlD8nkIovqGzaBHwRPfca0H4XjpMcmJqLOik6czy
         8or62VBi43bKDEcp/UpIzOeGIax4/AepEHAyKc8JALfxK2Ll4TRvpDJE8qmEwyB6KAz4
         RMj+r4tW+4mbvP144u3XkcnHXFK/t9csGGPmZ79mVCMcwKmHul/+dWJHirKEHEVE9pfx
         y5yP0B0LtguZGYDWA7TL1uCr/kHHHVcvzZFL42YQG3XrEVoQ+Zc51lrSSDxkc3CzYjBh
         2t7A==
X-Forwarded-Encrypted: i=1; AJvYcCUft4aZGb6Bt3nVQ+R3HW3wkyBmwVcBLjaY9JauUTuag3b0g3fidRy36u56zHzf90WRfkb3mMdAmiO7mMiFng==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzDkCU+QAEInmwQfX7Mv1ePBOO1zunqDZ36xR3pEmKg3uRDgEc
	f0F7+qecnYWdTi/Rasel8pcxOAD5bUtu+doU56f0LDlIfrKu6+ugPu/+cgshxiKfZm0=
X-Gm-Gg: ASbGncshs5Y2Ai8kBK0GxUippZytxJ+c3HuYBHYl0K6H/IjY/AI4Q5CzajzYlQ8lyH8
	n41h9I/vBbvCrsx46l7wWYeccpj0XhIRt6cyZJGHqDm26uUS+EdGU3Ygk+932dDKetx4r6I6ZYw
	Iaa1sM5ewYyseZpUGmqlXw/rVz66Rn6h9sEiQJfLGVDNWRiJdD4nHIKQpvker4mNRhVxTRby+MB
	vXYeUUKTVLyjogxCSeMNemuusW5yXLOzZ9+yk7f+N2V3k+PiAmkzTdN2ASm/iJwFn08s1vbBkiM
	4rrLMk4QorrkYZswA7q17JEq2i46RlFVLxdNL9dkmgVLMcVXbx/r0ZKnQYOT2oSGKlmfOJmOjDZ
	Y9ShA4MdwMIqLes1lsA==
X-Google-Smtp-Source: AGHT+IGtmJEYn4U7YmpLO/UnNwJ6EK4RcP2OJYWSbB46JlVxedVPjM8m1PM2GiWKy64gcAhtC/Ebng==
X-Received: by 2002:a5d:5d07:0:b0:3b7:9c28:f846 with SMTP id ffacd0b85a97d-3bb68fdd74dmr1039764f8f.44.1755248961432;
        Fri, 15 Aug 2025 02:09:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:05 +0200
Subject: [PATCH v5 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-3-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Q2YZTvBFgTu9mhuvELDYkYIT0089SG8/1kg34izHMkM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk3wzetzN7ylJyavj+6V+c1QQuTYpigZ2o4z
 l90cHMgWUaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NwAKCRARpy6gFHHX
 cnvxD/0Ve0I/ieyHdgZy9d8hX4H7/zjce73ldaR9BK31igi4keB/jOhJI9WaD35KudjwoaUzGzw
 jgISznL+LSmsieGquZ8+gBRfeDFsk/QkyYOG8K5axtVVBr5cN6yvlPqE/3RsS+N+YTgyNuGbLz3
 3D0Kvx0W/BbHBYyiXduuXF0w47ZAanPPQIeTTrF2XJiwoFinOe9POqsFSEH1DnmaToCgV45o6uv
 XSFDNLIp+Xagtc/kXU3cGEPdgSqKK1eYR6znpNollDIzo08v+FU9a8dgAshxGM8OzP0F41sD1oj
 uVAI95wnWjHnUI+ljFBaGnnfo4fBgC/HqrxNMWogKyTUPZLR7IA9jvGoNOs4EEBDGL8GRCUfiMF
 KyL7e6DpCArbWK2HEuBRlZKngzG0Oa8V9FSW8EmH5qdI0soJjorpMeZXpmlMeRELL/NOoJZAhY2
 nFfZvCfD1+NjIN3pugMpjt8A/DRMSOLMoplZdIiG0tpHth5Qz+TmjQ4o642CundaDH99bRBb7yo
 4JM20LonHqzGzEqmyQ646wKUBqzowVpaLSC34ilA9XcwWx+OhyylRqAsH4mQf2VQEB0iko2OJxb
 X3jX4SHTXbdKXaoel6+wXODnpMTOBXpFUcWMHQLRNdqjv7BRt25Q9Eq+BqDBJtgXr/2udIPVNkE
 dmGtDLVs1fKVjTw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020923_138270_33A660C6 
X-CRM114-Status: GOOD (  15.43  )
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
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5f1ec9e0de213d587b68f41d3458cf504ee1b21f..eb6cd27955fbe462f479fbe92c785588caee5ebd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -35,13 +35,8 @@
 
 #define PINCTRL_FUNC_DESC(id)						\
 	{								\
-		.desc = {						\
-			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
-			}						\
-		},							\
+		.desc = PINCTRL_PINFUNCTION(#id, id##_groups,		\
+					    ARRAY_SIZE(id##_groups)),	\
 		.groups = id##_func_group,				\
 		.group_size = ARRAY_SIZE(id##_func_group),		\
 	}
@@ -334,7 +329,7 @@ struct airoha_pinctrl_func_group {
 };
 
 struct airoha_pinctrl_func {
-	const struct function_desc desc;
+	const struct pinfunction desc;
 	const struct airoha_pinctrl_func_group *groups;
 	u8 group_size;
 };
@@ -2908,11 +2903,11 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
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


