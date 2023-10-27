Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3A6C25B48
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 22:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdSXo05ZDTrQ0bolpnGX21EQgcBZaNy4lNpYoejJ8s8=; b=Lb0FlkJNzdlktov9t9yfRW4jaS
	4TbWsvnFc4dVfpHRYooz6e+7yIw+NIqj5d6GmIr3LNUvFOYL0LdIjiKYuh/M01MmcPhvYEa+c47FT
	zQjnKOg16gOWBK59RTrihnh4hPjxR+5VfwwtISYjfOUT6uKrw61aWeJXc/JaelvUuADtQrOSQ0Roi
	sNoLA7IpXtgpGH1Llgdq6axbYguCeLX/ok7Mi4TupjE5Tb9TvqeXOw6MHegshbXLUbPxvdQ+eFObh
	cvo69eNgCZ+fPKdij/pi1kWKYpfwp+EdF33ihPWHkr1cUlDXVGYV+E2tHzOmWQJxKnVHbOhb9z4I/
	YbU7sF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwUxi-00HGhr-0d;
	Fri, 27 Oct 2023 22:05:50 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwUxa-00HGcW-0z
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Oct 2023 22:05:44 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da04fb79246so1855115276.2
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Oct 2023 15:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698444339; x=1699049139; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdSXo05ZDTrQ0bolpnGX21EQgcBZaNy4lNpYoejJ8s8=;
        b=Zc7qn6g6uVwEckEJZ+PU4LY8ElODYhY3D0XG5V3Hiv3j+/LYmN2EEoMbQXbe1dqqJX
         f/Pobjm5xXF29wBp5pIqpgRLB59IHf4/dV0rFtixlwECZpZWvoRRtwzQdvpOVb89ONg6
         U0Eue2NvWulkX+BM3TCIE7h81E3edoqcRzakS/fcNT8gRt7UmTptve/Pzjc/Q7XJZ0F2
         j5C+jauMO7gF1rlPRwixaiZhQOuGwI1CLsTrh5oXYfpIB8Z0v2VsxIZGJaaYKwR47Wpe
         iGwLI+dxsg/tnHkD578IdRq4/5DC3cZy3UY+pK0+Lja6PFTnTO/ioFdkwjg8dXbXYrbn
         CUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698444339; x=1699049139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdSXo05ZDTrQ0bolpnGX21EQgcBZaNy4lNpYoejJ8s8=;
        b=QPL7tgbP6KdWbMcRa65ju8FFLf1oAsxnn1yHl0eoXEX+ZOdkKaV5eYeFXjvnjMniWN
         jwcSPhqbcKFK4jwMuHUzMyfU2KVv/sMLvGqZYsXvbnFaLBrea0+kG0ssJVkQsKVZzOaJ
         4YQTPbWpuVtx2Z1ztsYCQJkN/jEukLg7ZdSpuk0mlqtQ9UnAcDZDhoH8xAgvhiAtV853
         tYOWrYrTwArXeHlctY7brT8aFEcR9f/V7/fmh+2XUfcKx9rOtpPnNYIPub/7iC3w+hBk
         3db0HlzAdCX5oAmxEzjI3Olz0SCtCRSWntZyirNER0RnvOF/8+GwwqNXIMVU8srbM1pl
         Egew==
X-Gm-Message-State: AOJu0YwO85JXsU1KNanmwes1yeCattk/x41fsoXwZFuKowPXdaoqD9Fh
	FnYhMPKNqmYgnnZNZQUEzpuZEFR+5a/+nSiaPQ==
X-Google-Smtp-Source: AGHT+IEGanE/VPWiVGsYQnojjV2LR5zrl1qUYV/9Hzl9G6z+NxdeOgXz6WlWY7Ge6EIQf809mb8uIRPVcG/rsXoCAQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1746:b0:d9a:59cb:8bed with
 SMTP id bz6-20020a056902174600b00d9a59cb8bedmr69382ybb.5.1698444338644; Fri,
 27 Oct 2023 15:05:38 -0700 (PDT)
Date: Fri, 27 Oct 2023 22:05:34 +0000
In-Reply-To: <20231027-ethtool_puts_impl-v3-0-3466ac679304@google.com>
Mime-Version: 1.0
References: <20231027-ethtool_puts_impl-v3-0-3466ac679304@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698444334; l=1990;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=Peahw3CmOtnUj2I89Tjap4JSwacXUbTFJpotNKfpIAo=; b=/dV8JH6sg2K0SMzdRYoIByKAm/hZGtV2i2RyZ0hRiSo1vOQmFG+LMPEoIUTIwPdSxZVjgBWW9
 AOzrjCPUG+eCexFWJvZZE9e0rOdmAbkRvivrtrYWEohlds40p4HoDCE
X-Mailer: b4 0.12.3
Message-ID: <20231027-ethtool_puts_impl-v3-2-3466ac679304@google.com>
Subject: [PATCH net-next v3 2/3] checkpatch: add ethtool_sprintf rules
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
X-CRM114-CacheID: sfid-20231027_150542_374203_80D70D83 
X-CRM114-Status: UNSURE (   9.49  )
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
index 7d16f863edf1..9369ce1d15c5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7020,6 +7020,25 @@ sub process {
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
2.42.0.820.g83a721a137-goog


