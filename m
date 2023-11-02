Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEECC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 18:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32K79yUePS03VyWxcYP10LK3dnc9q0LtbXtqJtsNvV4=; b=MOTnVuRKgNqJfqcCqQC8y/mkY8
	rFy3Gh24H9T9uuFJlj2xgkse2KoWU9iVdg6oGn45ZvAXmrT7mE7BVbx5LvOK9HHoCEovq//0CkzHN
	3lKlVcOlGS7H2WRDjxvcqkNzxsfBSoBzYTj2tnyfTbLRP2IERIptBZ9JrRNMFOdV1Aw8LlASUxnv2
	l+c5JfkHt14dUJ/a4aK/HwfSeAGvW2vpgCGwmGGUMedQdPQRw7EYF3gCefllf2ynfjH5I81yyh1Gh
	aj8BiD8pGeQSrIGnKZV5NrcJSGiDL8UFR8d/WqEzdJ6+BoO+hATmUFFT3s+uD1FeID01IOZppzcY5
	9Z7uMv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qycrI-00A7Og-24;
	Thu, 02 Nov 2023 18:56:00 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qycrB-00A7Lr-0V
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 18:55:58 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-581e2fc1178so1516066eaf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Nov 2023 11:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698951351; x=1699556151; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=32K79yUePS03VyWxcYP10LK3dnc9q0LtbXtqJtsNvV4=;
        b=E+omKZfjEtjonhq3DuugHl6yWY2ugIe4RKgdPR7cZnVw6NeNceaj+o00tBpiS1f1EZ
         FC5CuBrQYadvdIcfMrRORmn+IRNumZ3CrLmRTDTA3Ql1GocbELfCj40OzKQ7fMjejFer
         ZezPaeJsGBbN4vX81vrn5lSpShMYwTs8Q0+yx8AquH1iEHUqHM7rvX7lQbsrprcVgz7c
         u2ua2oJloR+GRa4j/CrU7fT3JPz98pMV91tfrEC/n36AzO64Mquds7eEWkL8cwwzlgOa
         sjgFIpUZJ6/t8xKsxyv9yukceM7FwLyhKULtLKW9ypPjbAD9lCe6Yged0BGzScH+AWp9
         zG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951351; x=1699556151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32K79yUePS03VyWxcYP10LK3dnc9q0LtbXtqJtsNvV4=;
        b=OJwHRLQNUl1MpgG7KZmpdsSpZKV1/I97+2OmAEZxeTUhUzGTkFhb7DIj+CnFMWmk3X
         PgSFPIJ9olbngFFEkHM0vDym+0sPrcMQt9Snv7/OUoRjTaDESFIy5KFJyH/e6/RjqrlX
         IqgqWtiH+Z2hSeLs9a0y0hc2lBYDnWplZnwTF8P7bTDtmbwZpgIsrpRlATmCW+laS3IT
         2bMwj034gJHBGVEQvtMiSNkE9EdZvk+ALnuo6+UVx5fuN8TAqg75OEm1GCS/MNaX0gcx
         uRYRJIUYkGgME0w/vtdXnF/CRWAKSxTUudscOg5AJBqsYk1TRw2qNyRsB6K2KGEidl8q
         b3zw==
X-Gm-Message-State: AOJu0YwzvkidUldV2furk/tlBWc2mnlgZesCXGlXDOgKPhzJ1eBwE39L
	eEVyGRC1nUjDyzKUwdJj4uqAWzCYhHqbJRsJvA==
X-Google-Smtp-Source: AGHT+IEDkF7Oi1IvBAECUO1D2BZ/WfZR7U3roLxCuXWWPqD/1I8emyNHZYAH7mCiA7sr/QX8V5tqqhhnpUgVQ3gPTg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:b629:b0:1e9:a86f:ec44 with
 SMTP id cm41-20020a056870b62900b001e9a86fec44mr375267oab.2.1698951351424;
 Thu, 02 Nov 2023 11:55:51 -0700 (PDT)
Date: Thu, 02 Nov 2023 18:55:43 +0000
In-Reply-To: <20231102-ethtool_puts_impl-v4-0-14e1e9278496@google.com>
Mime-Version: 1.0
References: <20231102-ethtool_puts_impl-v4-0-14e1e9278496@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698951347; l=1990;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=5WZCSRmn5I240grrVCw4x/4n7/d4Ou3ZeMgHOu6QRHU=; b=1nZEvR6w+gOAIckxQFx/hzREhfGTALc08T+ct+mnZ2DmKk8uycd6z6khwq8TbMAwCu9Ezqp/H
 Dfu4ZT5igmOB2KC0bZOz7azBMQm7Hj6sTI87CdS0CAZqv2537ilCpzL
X-Mailer: b4 0.12.3
Message-ID: <20231102-ethtool_puts_impl-v4-2-14e1e9278496@google.com>
Subject: [PATCH net-next v4 2/3] checkpatch: add ethtool_sprintf rules
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
X-CRM114-CacheID: sfid-20231102_115553_193533_58A1D819 
X-CRM114-Status: GOOD (  10.03  )
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
2.42.0.869.gea05f2083d-goog


