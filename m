Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA858C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1MFejYfcIlhp5L6UBckhhQYL5s7bmRsL3b92h+ON2U=; b=pFuhIF2rGBUlQABpRUqZtkVCGx
	Ya/MOaOe+tCcO9SsRVLqlX10/JobbwoXeLYcZW6VDW76jugtDEV2clJToXw2ulH4PuZj8F2mflGa9
	nCFAbURpiYU0Gm/aGds0HWe9yFLL7MISQysN+DoBNh3/AZpOmeMxa6O2+wTmWZut9qI/e0GzEGWaW
	VkOOPxDAcvae1sErMKs7W4rzkkZe7rEFK05LBntuCzYfufL8aePZF00mJNaVn0apqzohubSj6oN9Q
	b3l+a0GMpZ2iJdQdjqcwMkGDebFyh4Zdi/UXX2/FDqkK82Y7E0GKJt7ukh7nYl1bPMdgibfaqoH9R
	1FWSF5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qycrF-00A7Ne-2j;
	Thu, 02 Nov 2023 18:55:57 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qycr9-00A7L8-2E
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 18:55:55 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da04fb79246so1503504276.2
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Nov 2023 11:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698951350; x=1699556150; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1MFejYfcIlhp5L6UBckhhQYL5s7bmRsL3b92h+ON2U=;
        b=YHaaPOOoEDxP9jUdoKYNSnfNdSjHD5Nzhn5omBrkxvD1jpA5HlaVbIzaHAEcGphaTn
         p+f+hglBK6rU2QJsgzllusaPOVbfhEiooRq3b9yo0LNLA5A5OWuW0o7lugBQ6m9tkKGm
         YYU2DMLEyBfdY6x5RgoZB9NOzXiKm4j5FiQiO1gI2ib6PYKZ9yLrgPeC2wBIz/PVDyN+
         xz+rPG4fZaIP5FgB/a2iva8i05G1YT1Oypd4KU7r471oTkJcnANOZVjjKNc4Ioakvtog
         +PjB08mZa33AFGMfqrLqA9hq34JAa9mpRnDKIZiOvaqOsxBr4SvawP4j77Go0uF+NMJZ
         zFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951350; x=1699556150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1MFejYfcIlhp5L6UBckhhQYL5s7bmRsL3b92h+ON2U=;
        b=mYTYkJONLhQdc5DyZASOaU4MYIeIOIz3gtNzZzo1O1PYcyHehEFP/cD6zymUh0LkVD
         +7/St3UiOgEgBbGj1Nb7gZ+fKXwF9wNw+QLGXdx9qcxE5DPNqyFFpwPDqPubykXihC2l
         Dl8UdkyQNREkuz6rCbGUfrs0K3GAA3hLFayuRynC+p4Rj9RDexkHtp34fcLMVBtwyjUm
         82I39yynviBUN7hOX0Dc/PGR1nrZNX8c177bKxvuhgUmkM42UzJd4VlvtPDmNnG2Qg8Q
         kHbthauu0aQUqMSwKrAci9uAZVil8j9b3pNd3MBIvOTivcK0ZWM0BqRHx8cSwTeJ1IiW
         gNbg==
X-Gm-Message-State: AOJu0Yz3lsh0MTHs3pbWBNJMbYrQiE/XHnV9cmID3HgI+OOlUJ1KplCS
	06rsXylAyPk52amvEfIikHGlPvEhKJLvMXuo5g==
X-Google-Smtp-Source: AGHT+IGur+9ubZUYTGwViJK/0T6WuAETQMOPNATCoodiS/vweDFcw/ci9wvenAIu4f9YZlxzEAf34fot3JrUlSjZ+w==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:e7d5:0:b0:da1:aff2:bfbc with SMTP
 id e204-20020a25e7d5000000b00da1aff2bfbcmr316486ybh.2.1698951350112; Thu, 02
 Nov 2023 11:55:50 -0700 (PDT)
Date: Thu, 02 Nov 2023 18:55:42 +0000
In-Reply-To: <20231102-ethtool_puts_impl-v4-0-14e1e9278496@google.com>
Mime-Version: 1.0
References: <20231102-ethtool_puts_impl-v4-0-14e1e9278496@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698951347; l=1809;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=CSBVoPDv8bUcjz46YxS9QitvpQ3NGLvmBs8lKX6nt0Y=; b=ahqS7od7MuaYQgDwf1xLYrlZa/EPl4vCGCgO9aqOLDD54X4Mk82mLZTadznG6MV4/eOfOwtgq
 gVYFH7WrWL5BPoocw4PUQQAzqFcybf4biUS6+am4p7pCOnSg+h+I6qg
X-Mailer: b4 0.12.3
Message-ID: <20231102-ethtool_puts_impl-v4-1-14e1e9278496@google.com>
Subject: [PATCH net-next v4 1/3] ethtool: Implement ethtool_puts()
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
X-CRM114-CacheID: sfid-20231102_115551_726367_8DC16A51 
X-CRM114-Status: GOOD (  11.35  )
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
index 226a36ed5aa1..7fc0826d443f 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -1053,6 +1053,19 @@ static inline int ethtool_mm_frag_size_min_to_add(u32 val_min, u32 *val_add,
  */
 extern __printf(2, 3) void ethtool_sprintf(u8 **data, const char *fmt, ...);
 
+/**
+ * ethtool_puts - Write string to ethtool string data
+ * @data: Pointer to a pointer to the start of string to update
+ * @str: String to write
+ *
+ * Write string to *data. Update *data to point at start of
+ * next string.
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
2.42.0.869.gea05f2083d-goog


