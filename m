Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB244CC6B1E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=; b=21Xe9Oxsrh2O/qHXLIQdQOn3D2
	4a+mhJkv6KceURaB96Y6qeeAhyB0j3WkIvuxbwM93DsVL+jP81s2d8+R3SxCHtjc0a45MZvNPvG63
	NVAnKGyyPY7wFD4A6NlhVSjJMjMPzZlIPbYFUO9fd4GcJDHc08oht9w/ZSr1jwoAUfo4gZbqKpPVP
	EA4VOa9DErPtDWLEFRDntULGIk06yLl7okb9LgwryBJHuXwvl2dI1i+QabUsZqKihHFgOsh+1WmrG
	8r22RrqLurv743F7uRr2tnu1IlbzVWVrlqLCi0c65PcYngs01IRlbLveoTC52FZlJbgakZ0XpTuuI
	pz5QIJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGz-0000000DGFg-2nEg;
	Tue, 13 Oct 2026 15:18:38 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGt-0000000DG5G-3SQP
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:32 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1206785a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904711; x=1792509511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=;
        b=cTW5sdBAjD3WRX1Ayjgl1AvpieUu61j/I9RquHwwAS/xcd/xKBwa2n7nmI60zcHXZw
         aTPjyJsRbhplxAW+dSTtV9S8Rrr6E5/j0jCFOomEOmKiN0W8KIVWRLevshZRQNVr4cdn
         FGqTL0x7LYhN5VN41vrcUk4EFAeoPYXVJug03lhvam92/Et79WlAHBwngBMFFMV42PTL
         sGDEILRxQSV7mI7vaTmBahByaR5qtJa40/KqX7NCOvOh6wm4wSfgMcndDcRnvn00goNE
         5JfMr7KDrasJz7iKuN5e6II7WU+X39E+JeyHdMlHyVlDPAJIAt/2YXaV0Oxq07dh8r92
         p6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904711; x=1792509511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=;
        b=0TNaZR7p82aVay7ykzREMuNjBT5YnTw5P2LiubhdSJyaJsPiRaGdukRnO4fkDY/cb2
         mr+iLeqBLN6dFSy+a5u2H4fv7mVrVE5jJJjIZqxw8UYqmAEhBOwbiEwr3J5PVF1aHalU
         YFkLk2dSAhGZRBcPmkyIXsfjXOppkU8aO2xUoERBbVfGFt4NreGBKoyQqUyGm1bSZuhl
         rcJXMdcbqG/j7esysmmOmyDrkugl6xUOydAbYS0+B+46YxwjRsjicKu15vl2IX4SrN4Y
         sq2eZ+T0vz2Udyv3B+bg4fszxHZhZjpqcO0l8VjDO/4VeZ/GCHdn65wN10J02SteEHEj
         G4Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxXTFJmkvpDwXqnasV7mfE+WhmHt3c72jKfnqUM8K6oaqUsBqh/MvNb6In1yNglZd6t67PceKR4uFxV0B7E9w==@lists.infradead.org
X-Gm-Message-State: AFq9FYLSOqmUkiqWaiJzDjORpEjkhSiFZ7n2SbZZHMi/qxVrJGcDI4y1
	0r6tR8EhCCoTChuUmemsyptQ44J1ewlG9xJlTBagHX2RrvRq+v7nTgZW
X-Gm-Gg: AYBFou38X0RczomE7beNmvePz5/ngoh5yetRD9XtrtjJToKffRm2KGU5Vu+k5ZaihKj
	q64IMW3yEgXW4m/S71TicKBjNgp3sHhy+xYEmT2G2i3n4zT6SZGNKgArStJ7uk4zo0bE9MyBAav
	T5YHrDvweA4k7e8r/AcXRMTif7/fAjxt/m9UVkqXAgpy8xc0BJrGICyGZ6aJSVR1C198PRoeecc
	ElhTfJLSyFW327kmvz/+F8Sb4AGYfKkZ/kt/hNw5u+yCQ2bUfTYz6ki9HdrDHu8KkgJGP6Uqvf5
	to6DaYyDkdMNHLbjEmMRtaaWmiWaUG8AZ9z6VAcDw8pbJaHl6rw1WsS+6AXK+ZbK6TqVCIg89yf
	sTEWntFTKFW4RjSaoUO0jC7OKxNTrkmyDVuTUz3rvk/CdFP8zuN0uhw1qK+2dsgJ196LxR3kD3Z
	QVx8Fe2rnZxKSkexm9ICMQ0X8+WamCzi4JqEhOHW6iS2vWZ2//6P4DfGbi32DvYY93wcAzsuuX+
	uv2FdVhMPhHVf5hzApfhWCh/LoV
X-Received: by 2002:a05:6a21:394c:b0:3de:3f4d:f2bc with SMTP id adf61e73a8af0-3e16badf2a9mr12154427637.1.1791904710777;
        Tue, 13 Oct 2026 08:18:30 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:30 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 06/35] clk: mediatek: mt8192: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:05 +0900
Message-ID: <20261013151734.3177690-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081831_878701_2B3FB436 
X-CRM114-Status: GOOD (  12.09  )
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

clk_mt8192_apmixed_probe() in clk-mt8192-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8192_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..e6ac40e2f12d 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -176,6 +176,8 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
-- 
2.56.0


