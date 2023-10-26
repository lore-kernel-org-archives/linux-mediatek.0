Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28FEC25B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 21:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGnfO5yo1brrl3JG1fuz3XeacVop9nGYIXct/GsCbHA=; b=gzNHWHEV+yxXzrHhaF8toREc6/
	b2ULqTLz1ckk6Ed5aDEBM6BI9A/2eG9zCtlFfWKNuQrtBL6ftkLQpF7xNwoUbHFddQiDnU22LdDIG
	f+2a812BIH1pRu1W26Mt/syiB5ZVtw6m1XkZSAeEfo/ne0n+ZI8HvHt1j2B4JDgO8ztAa2ElTkBH/
	DZnwYnUvPeCHlxaAcEj5YIr4OkufyU2rZar/Z72fahirT51YSro6z2dBg3By88d0X9YDicmpc5ayW
	lrw7MXJhK2Sl0w7mq/EWWU2CM4KZMhJyg6ylHgAKfeX3bQqdvum5dzaQjHaavY+lWXhYvJQ5r0t8O
	RnkB0AwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8L0-00FCsq-2I;
	Thu, 26 Oct 2023 21:56:22 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8Kw-00FCpu-0G
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 21:56:19 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-3b2e7ae47d1so2122899b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698357375; x=1698962175; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BGnfO5yo1brrl3JG1fuz3XeacVop9nGYIXct/GsCbHA=;
        b=becVg6Mh9diSUpDYK1ZyRlvWOQ6ma9kddftHtOAY9KedMASsY7o7cGeNIc/mFwmnAY
         Z9w7fW1MzYhAaM8hqDmvqB0A4ELJxuhgnjLiw1Yez+JoqVfM6YvNiAkRd+GERrXwmH+K
         oOTMIRvD/l2Mvn2i3y8YbcTpNsihk0WvBNo2DE1kkt1dOYkrV384M7a5FT0sGgsLIfRp
         xweGSM1mAs87NgFTWErZwK06d6QuFDArPZjUgZT7p7zXgbEIV5VBGu9EnfLRzbAzE2XK
         t19X4XeVLUM17Vl+13ilx2XJLjUqdsdE/eiuwOMU1YIhP1+xNiuNIB+fVNNA3vo2JFF9
         0K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698357375; x=1698962175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGnfO5yo1brrl3JG1fuz3XeacVop9nGYIXct/GsCbHA=;
        b=gRkoXpAP5MWcyq1PUikJ69X5hsXTEITp71DAfahwEGb9T7dmjtZR9VnoPqEQRJweyT
         iJphOfp0KKIbMlTyBazsGYoDPxBYggDW3DhNVixALis/O0dnThnj+InfXIUFMkpM0ki5
         tdlIck/7WHlEaQ/xGfBd8zMwYsfIfOUqGMFQr/ncBnFuvOJmzpRnrRiyT70ix0WehrBv
         G4OQBLNZ2mdqujHz/UBeFixHQGpWeW5UlW9i+KgNoAiBO6KI3TFWL/UOTQEYcrIX9g5a
         5+dX0bQit+1J9B99L9vVDSKXkKd1K4XAD79Yv83utwRSSpKwgFxWutY1G+031yKMea+Y
         HsHQ==
X-Gm-Message-State: AOJu0YyilssT7UvTcJMIG3pcDkqOvFDnrMiJ1+t+hCZxrvGJ0MXTVR1Z
	Ls3kFCGlevIYvsF58QZt0LBqKDVEzpS3c6M5qg==
X-Google-Smtp-Source: AGHT+IF5gOPekjq4+QDN3pBVLuKGKeKe6H18GFsh2OoUyXeyiM7MMvJg4zKShMICsysc3GRHujvfELlFaE0x7zGmTQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6808:f01:b0:3ad:f860:b315 with
 SMTP id m1-20020a0568080f0100b003adf860b315mr220107oiw.2.1698357374848; Thu,
 26 Oct 2023 14:56:14 -0700 (PDT)
Date: Thu, 26 Oct 2023 21:56:07 +0000
In-Reply-To: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
Mime-Version: 1.0
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698357372; l=2655;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=8djdPmMRDp1kcBXDhs8ygPXLuTfgtvGs7Yo95u6cw0k=; b=oxdmPg9KABeZlWyohpoRER6suttzISQsU1pFrM2utjhSx+ViWnRXf8IVNcElP/r+ITJcWQj9E
 seeyc13ojC5BXu0aQZG5KcerhesMEYloY+EmDxWK7pulBdKUNUGMRBN
X-Mailer: b4 0.12.3
Message-ID: <20231026-ethtool_puts_impl-v2-1-0d67cbdd0538@google.com>
Subject: [PATCH next v2 1/3] ethtool: Implement ethtool_puts()
From: Justin Stitt <justinstitt@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>, 
	Sudarsana Kalluru <skalluru@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Dimitris Michailidis <dmichail@fungible.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Louis Peens <louis.peens@corigine.com>, 
	Shannon Nelson <shannon.nelson@amd.com>, Brett Creeley <brett.creeley@amd.com>, drivers@pensando.io, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ronak Doshi <doshir@vmware.com>, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	"=?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?=" <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"=?utf-8?q?Alvin_=C5=A0ipraga?=" <alsi@bang-olufsen.dk>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, intel-wired-lan@lists.osuosl.org, 
	oss-drivers@corigine.com, linux-hyperv@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	bpf@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_145618_121778_24AF3B1E 
X-CRM114-Status: GOOD (  13.56  )
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

Use strscpy() to implement ethtool_puts().

Functionally the same as ethtool_sprintf() when it's used with two
arguments or with just "%s" format specifier.

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 include/linux/ethtool.h | 34 +++++++++++++++++++++++-----------
 net/ethtool/ioctl.c     |  7 +++++++
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 226a36ed5aa1..7129dd2e227c 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -1053,22 +1053,34 @@ static inline int ethtool_mm_frag_size_min_to_add(u32 val_min, u32 *val_add,
  */
 extern __printf(2, 3) void ethtool_sprintf(u8 **data, const char *fmt, ...);
 
+/**
+ * ethtool_puts - Write string to ethtool string data
+ * @data: Pointer to start of string to update
+ * @str: String to write
+ *
+ * Write string to data. Update data to point at start of next
+ * string.
+ *
+ * Prefer this function to ethtool_sprintf() when given only
+ * two arguments or if @fmt is just "%s".
+ */
+extern void ethtool_puts(u8 **data, const char *str);
+
 /* Link mode to forced speed capabilities maps */
 struct ethtool_forced_speed_map {
-	u32		speed;
+	u32 speed;
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(caps);
 
-	const u32	*cap_arr;
-	u32		arr_size;
+	const u32 *cap_arr;
+	u32 arr_size;
 };
 
-#define ETHTOOL_FORCED_SPEED_MAP(prefix, value)				\
-{									\
-	.speed		= SPEED_##value,				\
-	.cap_arr	= prefix##_##value,				\
-	.arr_size	= ARRAY_SIZE(prefix##_##value),			\
-}
+#define ETHTOOL_FORCED_SPEED_MAP(prefix, value)                      \
+	{                                                            \
+		.speed = SPEED_##value, .cap_arr = prefix##_##value, \
+		.arr_size = ARRAY_SIZE(prefix##_##value),            \
+	}
 
-void
-ethtool_forced_speed_maps_init(struct ethtool_forced_speed_map *maps, u32 size);
+void ethtool_forced_speed_maps_init(struct ethtool_forced_speed_map *maps,
+				    u32 size);
 #endif /* _LINUX_ETHTOOL_H */
diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index 0b0ce4f81c01..abdf05edf804 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -1991,6 +1991,13 @@ __printf(2, 3) void ethtool_sprintf(u8 **data, const char *fmt, ...)
 }
 EXPORT_SYMBOL(ethtool_sprintf);
 
+void ethtool_puts(u8 **data, const char *str)
+{
+	strscpy(*data, str, ETH_GSTRING_LEN);
+	*data += ETH_GSTRING_LEN;
+}
+EXPORT_SYMBOL(ethtool_puts);
+
 static int ethtool_phys_id(struct net_device *dev, void __user *useraddr)
 {
 	struct ethtool_value id;

-- 
2.42.0.820.g83a721a137-goog


