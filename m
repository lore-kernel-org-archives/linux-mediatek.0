Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21441C10F07
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 23:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7eYcPC4ZNNyPcPPs0B5tDplF0arxw3r0vINNNou0rY=; b=cXBq8qkj5SLO6u+6FWnVUhaflQ
	9pQt5k+a1OnFMS93g/F1E5EuvImEZGOc9MbMctQlpLLaiwfzjUlGuK/fcEyUZ/mmBQ63iwauFuBqq
	KvQWEu2geKUhEHW8nDtT3k9O0A7K5LS5gLYu4ceI6vXVtoCv2EUml5L0roONGx/DvzdMq7R7YTT3u
	XNtNr8lK0a7YOwW0u0HjZlmivB2TkCYZ0FXYPj0vrbD8iYFn4mGs9G3vpUO0MLsj7fsZl6kgCNLyQ
	dCi/7BgsVyEpXPKjcw9qNh25pFn4HwT77Szb0mVsNVcI5SDqlRpanDRW1uhm/Mzq6kx4h/PWNWbyl
	fIE1GsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB17t-00BSn7-0j;
	Wed, 06 Dec 2023 23:16:21 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB17p-00BSkX-0S
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Dec 2023 23:16:19 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da04776a869so420578276.0
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Dec 2023 15:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701904575; x=1702509375; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/7eYcPC4ZNNyPcPPs0B5tDplF0arxw3r0vINNNou0rY=;
        b=cVlwdv7jWEBoXqvzq8NjvAYrdfq0KoOMiyuCfs+fm2Y5BdMhFpmU1QaW/iLh0Otb06
         f6aAXPwie+8bVxPvyCng831MyVnNgA+LFVzlLg8H4crP7gDwEYKXFQbeKaAzt20gKzEc
         BnWnh2+MpST1zFKqT8KvinFOrx240s/utwK06WYOn7s3ZsyhGTElPq0lOCkTgYdL7t9S
         pZ5MlpNuGpX6HNT8vAwRH8Cs5TUAN26QGdDZofBi3lu2HVDczR1L+kzafPw33x+vtwHm
         YKVJBm4u9s1S7iyiOUsy8ZxvIz5Q77xfVfimmDh3pMPYF8THiwrcb9vdVp4+N82+wct4
         fEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701904575; x=1702509375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7eYcPC4ZNNyPcPPs0B5tDplF0arxw3r0vINNNou0rY=;
        b=TFHJlVczGPTceb7Mo/J/MbUSpYP8PNqBtNgdXXySabtStxZvAyzRrcORU6VsLxFMMy
         ZbnXWRBZnaL+H6f6196Q3ZRB78uk6bUdzxBOraUJ3sC99A13r+TFH4xoPGED68eNc94E
         2Sddp54s3lmouvL3ANiND9kQT8w+0l5FX5KuN/2GhslX75fuSxTGEHqPEjgSjrzGzSB/
         II2qgGMO3AP8xY+4fiUYlZz/KyauVBt7FqM/qTXTFV6OFJs9bV7TqhT6v41bUXxtT6zn
         33Gil8g8/cMkQiffQwTizJiyrvZKrcHKv2aKbYZ4auByu/Ozvgm9zJcliM49KL7ZYHgO
         izKA==
X-Gm-Message-State: AOJu0YyO4Vb8LHpw4YU2ibIOyBizsrAqWly024iq+q2zgejxXTq+6q36
	A8GvgK9fMu8YRiqPjCbf7DqSvQGqTx4FEdEmPQ==
X-Google-Smtp-Source: AGHT+IFRXxBV6JuX5Cl/k2o1+WKkCwkR8j20MJSkmoGCedPAtqFttH8OVh1/6vdfnq8MPN++A2h89peZQhyG8OsJ8A==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:dac7:0:b0:da0:3117:f35 with SMTP
 id n190-20020a25dac7000000b00da031170f35mr28652ybf.3.1701904575576; Wed, 06
 Dec 2023 15:16:15 -0800 (PST)
Date: Wed, 06 Dec 2023 23:16:10 +0000
In-Reply-To: <20231206-ethtool_puts_impl-v5-0-5a2528e17bf8@google.com>
Mime-Version: 1.0
References: <20231206-ethtool_puts_impl-v5-0-5a2528e17bf8@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701904573; l=1840;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=UMdetIL2ZsPIkSodqhw2fM21NHJVjCu0lRImFuNhVoM=; b=a8rMnXfVVQ5gsxHWG4WRMwOLxZgflqXZtNuKx26vv4DwYvvCtCiYjl3f1frOjV/Ul2kaxq5g/
 b/UOv678JKCDASVokxG5GJifAnU7/kqRxdhcwfRkrD8RUfcsmiZOfyF
X-Mailer: b4 0.12.3
Message-ID: <20231206-ethtool_puts_impl-v5-1-5a2528e17bf8@google.com>
Subject: [PATCH net-next v5 1/3] ethtool: Implement ethtool_puts()
From: justinstitt@google.com
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
X-CRM114-CacheID: sfid-20231206_151617_180918_9C2B3635 
X-CRM114-Status: GOOD (  10.85  )
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
index 689028257fcc..2480a4e4a331 100644
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
+ * Write string to *data without a trailing newline. Update *data
+ * to point at start of next string.
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
2.43.0.rc2.451.g8631bc7472-goog


