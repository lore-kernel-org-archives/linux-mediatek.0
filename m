Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85378C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OCxdUjL6PmDMyEESFvXgGV5Ex7I0WvzQ9v/Xyw70l0A=; b=Qe1eHow9It9JgJ
	k7iEFC+vHxOBtBRyDPuVkQiIAs2yQ03tNlQvV0nSTPpLpQzSTapwkpHJLpBrHsNQHWX/aK8RYWysx
	jFUDjB7orQRztRDwvsPSR36eDBA6kuzaeEGyGvOR+d+GBWx2IIUb/s8/d46jFWJrELgaJrTbkrtFH
	klFmMHQO8jmBTet2Zk39gQkyJIsZeYXp+QZHXjm+cYFX5UYHwUkgSUa/tPPqRU+coes+rrNaXeNim
	QReboRjFmd9C1CyTvLjmo/ctYfqun4ddvUC+dovOK18+ArL4vJji1JV+p5bl+KPSaPbBcnbqxdQ34
	GJM3/Iryw0qp+HMuEEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrEld-000QfV-9p; Wed, 18 May 2022 08:10:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrEaQ-000Jk9-S6
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 07:59:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id f2so1510627wrc.0
 for <linux-mediatek@lists.infradead.org>; Wed, 18 May 2022 00:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cr9IuqWtBo466Tia/00HMR/yH/z82IE9n6W3kz9q2kk=;
 b=UZMxd0RalgViWp21dea+ESesYp/kKT9ZVbvLTtlj8Rht3kSJW6HqrcGEEXPwUskqqN
 rJyuGGQTE+C/W/SaM2lAyWsdtw8rdtoRoWTvf2Q6rvvz9Z0XEic9YEbbFpo2sj9d53cF
 nyXSs5HotYKKP5nfWw77fWODsom/CNHECnsOPHeDKNQaprdx2OgwWjoX3OJsRNpjO50h
 Bxjy/4xeTibxRcpPJA2DB5TIorlWQwBuiIqcSUKrbQRSCN42JTDC4l6i4UrP4SZd+S2y
 jx8fYqUROIObvSLP7IFrCIghf7bjwRsDEf8MChj5bepSOg7sKtkBZ0kDSeS5mfq6yLBM
 giJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cr9IuqWtBo466Tia/00HMR/yH/z82IE9n6W3kz9q2kk=;
 b=6tsuxH7XV9vcG7ZmTc0FQhhheD120vRB4eL7ynlCDTkbnUL+ekC7pGUthe+KBf8phG
 pmjNY2qoas1RZN53gQ1WhThq6dyv1eXYRpovX3jyTcpu/folbrmzpmQrqdDWwx21+mU8
 1JkX0IF5oKByboHa8mqEnBJSFGrT6elqLPIwzRb/UxqYV8zV1v7Tqzj8x+RI1qYK7GLy
 H0bV89xMtxo1+FU+bJvM3xeSqnhcGsUQdTJ1hj9Ft9+sPPOJZEH5vGW9TZR7tjjAyUAx
 IlfG13C+B1teUA2+L02utOk1XbOlWCPZwYgEK1krORYm/RsgtLcJK7wjLBKwNoDiGhHO
 z9jw==
X-Gm-Message-State: AOAM5307mEhP7Z3WDlJxbPslJrGOdQLoY0zmGNO0EMxft4CB/8AVpkPB
 9YLMWPqd7j4XYdjRZg5gPK8XdQ==
X-Google-Smtp-Source: ABdhPJzVX7UQ3EXyOePlliPc9lSitJsKhoncu56QgpwvrEr4emm+cTnz8pUVLNqTQZB6AhsP9jKuug==
X-Received: by 2002:a05:6000:715:b0:20c:5a15:9409 with SMTP id
 bs21-20020a056000071500b0020c5a159409mr22138319wrb.146.1652860753188; 
 Wed, 18 May 2022 00:59:13 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:bda6:8356:4db1:4539])
 by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b0039706782e06sm1041300wmb.33.2022.05.18.00.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 00:59:12 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 0/2] Input: mt6779-keypad - fix hw code logic and row/col
 selection
Date: Wed, 18 May 2022 09:59:07 +0200
Message-Id: <20220518075909.180629-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_005915_163417_124BC1DD 
X-CRM114-Status: UNSURE (   8.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This serie is the first follow-up on the mt6779-keypad in
order to enable it on the MediaTek mt8183-pumpkin board.

To fully enable it on mt8183-pumpkin, we still need:
* double key support
* dts changes

To ease up reviewing, I preferred sending this first.

The first patch fixes a logic bug based on the (non-public) datasheet
I have.
The second patch configures the keypad correctly in order to not
report bogus values.

Thank you,
Mattijs

v2 -> v1:
* Simplified SEL_COL/ROW_MASK macros as suggested by Dmitry
* Added Angelo's Reviewed-by on patch 1

Mattijs Korpershoek (2):
  Input: mt6779-keypad - fix hardware code mapping
  Input: mt6779-keypad - implement row/column selection

 drivers/input/keyboard/mt6779-keypad.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)


base-commit: db02d07308ba7e94347ca037a662b3a1b1afe8c4
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
