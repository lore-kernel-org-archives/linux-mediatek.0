Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D1CC25B47
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 22:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDqGU1lZbnWOljJhjK5QPctoYCimsNeknFpCayVMkH0=; b=ce9StYH2aQ2k3U4s+bVfzhVgsV
	9YXW8/yJ6VRzbHC8oiPCP40pyi3SkAWu3AklRfJYUAgIymCO1Sx27GsoEw90KgJhzzptsEf9O9SzZ
	e51ZtnsoPCBcbKgJ9mQXp7Igb7gjO5xxbDOk4lWNcfmk1GOOTKmq1kDMoiVvd268LMs0zcDIIb6YK
	G9XJNCg1ca1J+NGg6cwfUDSTC9H+ZYh8YC2MRj4/EEQdFKL+eqBZtKNFPGcMxfKXPL9wVArhQFTGW
	Kk9U+6QPZW1xdrV+QSeX2V20PDXOPT7AkdtcgAQjPJOWzD7n0qkxew8a+6T7XxHIgmHqcCc5a6luF
	HBfCVwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwUxb-00HGee-2P;
	Fri, 27 Oct 2023 22:05:43 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwUxY-00HGcR-1L
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Oct 2023 22:05:41 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7b9e83b70so24403967b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Oct 2023 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698444337; x=1699049137; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LDqGU1lZbnWOljJhjK5QPctoYCimsNeknFpCayVMkH0=;
        b=e7h2RZhJx5+mtw2jO+t9qqQJ2E9rmGiiPTnqTIL+ezEYhVMSAgqX3Be/fEZmNQc0He
         OlAOksJc+6JNR93p0drHOjwGkQxCNe8z4+OYOMQNBdufzDd8mYL/6RYu6wl96IUjxI45
         P/rPjDYn6ahVD8ctNBq02dIfdjuh97FHCjAF1opN10ghbBrkj9y4ybehzy3I+UWeYew8
         cpTR/qDnVWKp1QgUapGhNI0aycHLKX+ZbtkbFjEoB7CgOorcR9Va5DAHT52qgR7WrLsx
         b+/4VCfoCXZJcgsWpH7FvAEYQ8n13t/wd99yzxG0snWvOY1zPJ7ES9WSxc5t2+WQNT7X
         nd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698444337; x=1699049137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDqGU1lZbnWOljJhjK5QPctoYCimsNeknFpCayVMkH0=;
        b=lh4l9NTBrZusDc3lbe655hKNE3upB93RHn1oW7iO5NhibZdT2itBo4rHLBWXYqyFme
         Ba7FAUrnkTKmN2uiirvnIGQQsQEsQqEp6My2IXjmpH8SK/DWSoo+9hwdKfJ8QzDBGpTv
         TgaKIaHbD1X3pt2F2Q3Km+bOJqeazPFCi+xnB+al+4nXj28sqNELV66pYYCQeNyeWUdb
         c+n/zCDK0gdyn2eJcNZ0QkOvoj9s9lYZTZ1IL0BkIURRP5ZkUAGeNuGwSW7hkWqSpP/N
         wwPJH9XerDXPfr5aoOpXTyl4oO4PKHT89l8i4kvuhOx6YWeYHPQGvx7yVrPH2XhuBFha
         W+Yg==
X-Gm-Message-State: AOJu0Yz1zuUepWrIIaUkt95j49Zvagec9PMTH665jFRlINrZi/lnbj0e
	iOXYeKxE/NKU5eAprT3NlBM0pSERsDWiuNKpmQ==
X-Google-Smtp-Source: AGHT+IFN1c9i2r/wiCSD+X1LWX0h6lZjdnfsn+e69/pEBxll1JXsLesAjuKUQaQpc97rldVXqAyKuuT7TJBMZPGrZw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:690c:84f:b0:5a8:207a:143a with
 SMTP id bz15-20020a05690c084f00b005a8207a143amr169382ywb.0.1698444337337;
 Fri, 27 Oct 2023 15:05:37 -0700 (PDT)
Date: Fri, 27 Oct 2023 22:05:33 +0000
In-Reply-To: <20231027-ethtool_puts_impl-v3-0-3466ac679304@google.com>
Mime-Version: 1.0
References: <20231027-ethtool_puts_impl-v3-0-3466ac679304@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698444334; l=1790;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=C2aJLhld7+He/NhanUu+TBSh3mm30JdYcWWvhqdYpEE=; b=AfZV04Dc5Hq5NuvZos0GZLUC7hu4efQeSkMnA+v2WXw4qwaSx8UWMdEANSs/8b+Z8OxORp/XA
 9gfZVq7L8M7B0xzZJ8a2FS7J1UTFxSmVPXAm+Z47MMNan57YnyOAbE3
X-Mailer: b4 0.12.3
Message-ID: <20231027-ethtool_puts_impl-v3-1-3466ac679304@google.com>
Subject: [PATCH net-next v3 1/3] ethtool: Implement ethtool_puts()
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
X-CRM114-CacheID: sfid-20231027_150540_458997_559919C1 
X-CRM114-Status: GOOD (  10.47  )
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
 include/linux/ethtool.h | 13 +++++++++++++
 net/ethtool/ioctl.c     |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 226a36ed5aa1..e340ed822cc2 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -1053,6 +1053,19 @@ static inline int ethtool_mm_frag_size_min_to_add(u32 val_min, u32 *val_add,
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
 	u32		speed;
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


