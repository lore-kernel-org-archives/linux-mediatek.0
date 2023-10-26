Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654BEC25B70
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 21:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYFCbbBAM6Yzga/rYjukRYsp/POsV5oivqv/XEKMawY=; b=Y8DhdnINvCwbS52qyip6GDSSbm
	u8j16e/1CRnOJSTrzlmS8tD7ef9TI4us54Cngy1ySNTMET+sQAWmcNuZVTFnlk3GiY3whF5Izsv+G
	caHlURirO56GzZe7X2ysjYBniB1iXD91nJGdJrM0qVu5fPmJMrZT7lIvyFhtQf2kWD9hdBWhEEWk7
	vcQMQwvaZQvXdFnlM3xdLM7uFM4A2xfeJE8WUlMOSEIP7ELW9mieZjmBPzVVRji0mqSsN39GZdTZK
	7N4JGwzfHgCFUFCmtCZlOnS4shou2fObs0dFd+p0Z9W7Fh1ckfGFEbk4urKq7Z78L/yVG/a3xkkFF
	Z7R7JsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8L1-00FCtG-1S;
	Thu, 26 Oct 2023 21:56:23 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8Ky-00FCq9-0K
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 21:56:21 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da04776a869so1023980276.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698357376; x=1698962176; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYFCbbBAM6Yzga/rYjukRYsp/POsV5oivqv/XEKMawY=;
        b=nBQj3GRnkJlPU+lEBYhvVgO0NqBXY0t5x0jDc89m+06CJj0qOaY1KpImCC0C8NQDay
         GAFawdNavPhduZ0qAUDOLBwWZFKsiTAi8Pskiz87ADB9uiJiD257VUEp0RY9YOZE89BR
         Ve0wdLSMzKSiRkLOO76tSAe4NMQxFaq7tGIIsA8w92LQfKX/JToTyWAM4S2FE5NPuqL3
         dMPdf3Za03RJefy+nmP8Ik+eU+AOleQOSK/1pUx8IautDpjRMtkV4+QopiLahPwY3ROm
         VSCv+bqGDGqu4K3Yr98lD/k7c53hbwoQtrLCE5ZpD3uJVm1bonB1HAfpqg4VJ1xfT6np
         rHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698357376; x=1698962176;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYFCbbBAM6Yzga/rYjukRYsp/POsV5oivqv/XEKMawY=;
        b=IZY5o0N1IzyKS9x+RFp45+kQZpzpri9NKsY9EvJNP09wvTkmrdvFfwS0rxS5IGW7AK
         D+W3IIMgO5rcKzVWROYA9SrFHtLtByWMd3aJXDLNtsjWtgFs9yVzKRDeIq1tTcT4MCls
         Knfx6i29bJxn+rVeCIa6L6fYx2OCAB1nyp3n8mVmt19CVukUTWpILYAJA67ZYgwYXJLd
         Py6Tt/5oQWu+0TQtt7T5jEaiq5wrNg7MG1Qz3miUWuP2+BfWsk0aISlgzOURIVcVbfW3
         BYDzjW4n51tnj2TO4ec+JaS0MW/f/NcbP40uc5n6/O4J6H8hnKyMu6bsXbckHUOy4snL
         sz+w==
X-Gm-Message-State: AOJu0Yz5VKlMN8YTpDSevOiVvcfMuVLZwR0YlqW1uoL6p0TQ47kGIbZL
	1mJqbd71OqufR0l/cZ7/cO89y3Njtm6Hgsgmcw==
X-Google-Smtp-Source: AGHT+IEfb7oOzPF36nMjYrY6yuwt7u5aPWQywSkNLJU2looIRNzyUO73wvXREAmdoYaSsyaeoRl83oRT8BPm+HpxYA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a5b:9d2:0:b0:d9a:bce6:acf3 with SMTP
 id y18-20020a5b09d2000000b00d9abce6acf3mr18000ybq.0.1698357376212; Thu, 26
 Oct 2023 14:56:16 -0700 (PDT)
Date: Thu, 26 Oct 2023 21:56:08 +0000
In-Reply-To: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
Mime-Version: 1.0
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698357372; l=1942;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=Tttx+U2qjudejsJUauC/KpxZsIK2OKqCPCc+Ch/fVls=; b=elpAQEsU3HOMMos/TnCJkrVo+AFG/1lerU81cOH+T2BgSHRjrFvGR7BmTA25L2uIiNK2WLsQZ
 m5JhXI8wJOxDHnWxVC+YAmf+U1BnkfHv0NAyeBvW/Fv+InbmfMY7Pw4
X-Mailer: b4 0.12.3
Message-ID: <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com>
Subject: [PATCH next v2 2/3] checkpatch: add ethtool_sprintf rules
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
X-CRM114-CacheID: sfid-20231026_145620_170559_71D29BD8 
X-CRM114-Status: UNSURE (   9.94  )
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
index 25fdb7fda112..22f007131337 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7011,6 +7011,25 @@ sub process {
 			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr);
 		}
 
+# ethtool_sprintf uses that should likely be ethtool_puts
+		if ($line =~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\s*$FuncArg\s*\)/) {
+			if(WARN("ETHTOOL_SPRINTF",
+			   "Prefer ethtool_puts over ethtool_sprintf with only two arguments\n" . $herecurr) &&
+         $fix) {
+         $fixed[$fixlinenr] =~ s/ethtool_sprintf\s*\(/ethtool_puts\(/;
+       }
+		}
+
+		# use $rawline because $line loses %s via sanitization and thus we can't match against it.
+		if ($rawline =~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\s*\"\%s\"\s*,\s*$FuncArg\s*\)/) {
+			if(WARN("ETHTOOL_SPRINTF",
+			   "Prefer ethtool_puts over ethtool_sprintf with standalone \"%s\" specifier\n" . $herecurr) &&
+         $fix) {
+         $fixed[$fixlinenr] =~ s/ethtool_sprintf\s*\(\s*(.*?),.*?,(.*?)\)/ethtool_puts\($1,$2)/;
+       }
+		}
+
+
 # typecasts on min/max could be min_t/max_t
 		if ($perl_version_ok &&
 		    defined $stat &&

-- 
2.42.0.820.g83a721a137-goog


