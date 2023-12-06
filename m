Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2776C10F07
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 23:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2kWA06Tv172IMegEBtFHRUM7NNFaAXM0DXA+ADIdjk=; b=ZK5/Xvwj90F54fPAEVBVkM6vrX
	UolIv72R6AbFDdDqKR/rTbGcpeOJLNJuwNHSUAERFqSDCzZi0iOPfnbL+FTjnV+e3QRQ09V2+K1L8
	YutxUQbDBXy7BxPFicMMAafQ4zpg0aQVJtEq1l/C3/kPpaSNGJFBUN+qZn3r0OtJ2OYNIR7D7F8ye
	N98ZHmJYoI7SGAWzxgxVMrY2pBy7LyCAY0c14YDat7TWSgXc5mxTAiD2N9KBkgAK8Xsgvb9SI2NaI
	iZ0NC8ATfgiNye0hK3I4xNWmx0IzPhMWFmNGwZf55GYYRK3hqfIEMkZ+vfbZnd61dRAwcnTErFTWd
	g8bFE2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB17y-00BSpn-2U;
	Wed, 06 Dec 2023 23:16:26 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB17q-00BSlR-2c
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Dec 2023 23:16:21 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-daee86e2d70so534453276.0
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Dec 2023 15:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701904577; x=1702509377; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2kWA06Tv172IMegEBtFHRUM7NNFaAXM0DXA+ADIdjk=;
        b=GV9QVOCQL4hnw26HMNNYu6rpFgF4c8WEuSBaAtAkbTStAcRbWAmwnH1Jbi+mYs0Sbm
         rszSRIKPFEuvCcAFHFdZyN1SxqegZHwcOlMUvAz5yWnrqkQ8EUQcFPUyqNQ7hAJdgDow
         ILMgCBP7ksiilRsxlLIFTS0aXZNkFYTES2JFq9H0rXISbNLyNITjzsKvrjy3wNgRZxeQ
         1T87omOCnWhB2tOfM442r87OR3ftqd8+nJwdoylhW+Q9Uik/vAWbeyElFU98U6GIsaDH
         2C4pEiOOSel1nuKDtdQI19bQWH3PeC4umQyA8WjYlu1IaRTByBmGYoafl67zVT6Ms1af
         9Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701904577; x=1702509377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2kWA06Tv172IMegEBtFHRUM7NNFaAXM0DXA+ADIdjk=;
        b=e2ILjSI0JjpuR1cLiTZcHesJbFCA9YfBZdRkzy6hH64XQTDAhCEOe4ou2E4KAAK4P8
         9zLH+bZc+na2zrr44m05sxD5ZzxlOm9meEJ56VmNVn67Zg0X5LlGi7mlG5e9DMHEzwuy
         vMCZvP7EGnXGgCVbUhz4PoIxmqRv2s8iIgxisjtwWajxlCjlA22BC978M45pm5TTVGZs
         gAVWD1m9RW5nH2ZIAZUDJaeRhm3mVpwipMzuxWVpTlIzG/nh+MDILjdsDfORxKO/lyzf
         3L26fL2mn9AP2egqVhC6CIMqFpOJq/Qy0r8Lo4aZrZIeEwD++nuZYxsD9C28RijkDnCF
         ty2Q==
X-Gm-Message-State: AOJu0Yztj5YgpoXr4/5/3jsmb9PoxhpxqBTUpVzUvKnlZG0BgUk1y5HV
	mUqRq6yrTsQ0QVdayE/3nrddwxKotU9ZvSoKbg==
X-Google-Smtp-Source: AGHT+IEMd/xS2syY8YcxUE+jFNtUErStoqR6wMHC+Hu8IQ3Kowhzp4mcbmDmCUP7K5L1nughcxOsG1xLC/GwjEheoQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:d84e:0:b0:db3:5b0a:f274 with SMTP
 id p75-20020a25d84e000000b00db35b0af274mr25995ybg.0.1701904577009; Wed, 06
 Dec 2023 15:16:17 -0800 (PST)
Date: Wed, 06 Dec 2023 23:16:11 +0000
In-Reply-To: <20231206-ethtool_puts_impl-v5-0-5a2528e17bf8@google.com>
Mime-Version: 1.0
References: <20231206-ethtool_puts_impl-v5-0-5a2528e17bf8@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701904573; l=1994;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=JqgyVZ/lMWBcIL4WYVyOFjI42i4J6KNM5TZC8fVlDHw=; b=5wv2E+fU7luADvsAMYtCjNbTJcSsyC0RjHSAuunlQsU1ZDIXqaBaMVwfXSYg3av2hcyZ4RP6s
 XfEcT5fza/xCUvpPtigE+b//xXA7T8IwbrdOIZp8LHuMTe8gG7Y6xG8
X-Mailer: b4 0.12.3
Message-ID: <20231206-ethtool_puts_impl-v5-2-5a2528e17bf8@google.com>
Subject: [PATCH net-next v5 2/3] checkpatch: add ethtool_sprintf rules
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
X-CRM114-CacheID: sfid-20231206_151618_895290_32475C94 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Add some warnings for using ethtool_sprintf() where a simple
ethtool_puts() would suffice.

The two cases are:

1) Use ethtool_sprintf() with just two arguments:
|       ethtool_sprintf(&data, driver[i].name);
or
2) Use ethtool_sprintf() with a standalone "%s" fmt string:
|       ethtool_sprintf(&data, "%s", driver[i].name);

The former may cause -Wformat-security warnings while the latter is just
not preferred. Both are safely in the category of warnings, not errors.

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 scripts/checkpatch.pl | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 25fdb7fda112..6924731110d8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7011,6 +7011,25 @@ sub process {
 			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr);
 		}
 
+# ethtool_sprintf uses that should likely be ethtool_puts
+		if ($line =~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\s*$FuncArg\s*\)/) {
+			if (WARN("PREFER_ETHTOOL_PUTS",
+				 "Prefer ethtool_puts over ethtool_sprintf with only two arguments\n" . $herecurr) &&
+			    $fix) {
+				$fixed[$fixlinenr] =~ s/\bethtool_sprintf\s*\(\s*($FuncArg)\s*,\s*($FuncArg)/ethtool_puts($1, $7)/;
+			}
+		}
+
+		# use $rawline because $line loses %s via sanitization and thus we can't match against it.
+		if ($rawline =~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\s*\"\%s\"\s*,\s*$FuncArg\s*\)/) {
+			if (WARN("PREFER_ETHTOOL_PUTS",
+				 "Prefer ethtool_puts over ethtool_sprintf with standalone \"%s\" specifier\n" . $herecurr) &&
+			    $fix) {
+				$fixed[$fixlinenr] =~ s/\bethtool_sprintf\s*\(\s*($FuncArg)\s*,\s*"\%s"\s*,\s*($FuncArg)/ethtool_puts($1, $7)/;
+			}
+		}
+
+
 # typecasts on min/max could be min_t/max_t
 		if ($perl_version_ok &&
 		    defined $stat &&

-- 
2.43.0.rc2.451.g8631bc7472-goog


