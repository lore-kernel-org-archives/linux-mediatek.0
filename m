Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B92EA3F0A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 05:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMfztC2Kl9bZJ/11xcUAkYHo13BsJ5PSJi+vhPNPnC0=; b=Sg3c6w2xmLLSrodDmPjY3FklKy
	cfZgsg+nV1f8PueWQxVdJzw0rExQzYgzJk8p3YbxPjjOAu7QXZH+83ZlaOVVCZY7uoDzyAWRprc4s
	UcvC56sWL9RxtQG2k2XQZFNw4sMzau5wTyOgh6BOAqFMRnRFcGoFkOgb0AroxKEG9fRXCukFAvvg5
	VQ0QhLI/kjYCZo0h/SwmHZj5KlrUSmh+B9xWGBoqgHLqD36bc85CNOw8QVooIS62lV7/y5io44a2Z
	tJee71dbO7gNHcOCel2So7vm6poqzbllQRSXcyaBaoCR52QXKOHbce8moy0qiq8pK4HtatcQxorBw
	unoRSQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUh-0000000GU5c-1Oix;
	Tue, 10 Feb 2026 05:41:03 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUb-0000000GU1D-2mYt
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 05:41:01 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8c6ac42b91eso615839885a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 21:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702056; x=1771306856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMfztC2Kl9bZJ/11xcUAkYHo13BsJ5PSJi+vhPNPnC0=;
        b=Op9KR3AafXnkFMFcK/uWTspcjXQr9f54i5owLIBN9Wb9WdGx1cGDZVEUbasR7ACWN9
         oaMGiiFbfKgCHo6+UPA9QbZu0bnyJjYOTEG2ttOgMeIVfMKbUTUIbrOJVcGJl4HoeulE
         VVj6OkomZv9fn1Ch25+7JrmoFQoMDV/aezS/KgvjwVm6b5W0z6yAUyc+k/Xqa1H2sQlP
         3Or8IX/VUcTCGgda1FUPlWNeWN53DiNKyCiyIdUERkEvh5tcC5TQav15EuAJHVxmJNYL
         MUqFkj47hUtWP1aBAq4XYowM7uEoIh4leAHZnDU9zzqlou1nYLCqPNdQFdDka8TvpWQm
         veyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702056; x=1771306856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMfztC2Kl9bZJ/11xcUAkYHo13BsJ5PSJi+vhPNPnC0=;
        b=CAcreq/oaiIJ5GZq5aBi7kpbpoFHsRy2rsAeXlC0g/pCaNzi25X4z4tWMnFJE326Ja
         vosrD9jDkdqdEfxNSNu3A/vTUX5kYA5F74NbLP3dN6s3Y/M6JKlBadenBOwlRf+DBIf4
         +dHoM5pq5kzAhvKWwFZUInUMjSoSCX3n5fxeBTszXhk7Tdm+M6FwnAHGeieCcEt07CBt
         Xzb9CyEStgkuly+zwUabO8r2N0u4U2Ag3N9w1okc+DNNhviJhwsTDQ58vkPWIMtJecB+
         t7Z4oHDj9G90IHGN5E8Nq4N3e85SramB6gBnDhAvy//6lYhPbPWO7mnuaVJ335VyFg0m
         s9IQ==
X-Gm-Message-State: AOJu0YzxsAFXcU51TXea2Vb44w0vzlajckj9qLZJAXiKU2ZMRY5xHIvL
	2Ca6zKtppzRcw8gujCGCD5obEKkup++m8ND5vUOx8+pB386DGdUuAhZXRN+unNTw
X-Gm-Gg: AZuq6aLOpmjo6q+GBqbKagltqtDsIwCb5hz2XIALBfMUTCWn+isNawVoUUwfYHwBg+Q
	BAIHooNpWsdLm5upi48B7FDrlhJEKu9k+h0rT8/jAg6+rHgA0WzxeRJwWIHCHkGneJBEwk2FujT
	mcxuo0hGlFKpKqnyHds1OVTAHUNhli6EkYwvXYUJMdtHpEeAkQIcvLmFzNiV2QRx9aKJRElVlv9
	EU8KX6YFUn0c/ay93sOM/uNLfPygwmQ7BUo1CWAalwyyzOtd9ll1B6G3Ceu6Rf6ua6NaLhcvdKL
	yi/6Epv0BKgowAbElZJ8V6l7YqdRa9mei3LgpVOD65wU8h3Y+3YNQJAXs5yOBoVA97ZVFNqexej
	g369LTIiz0OZOsdAjjQBhyx5S31sNjR5JBA5ywTpNXiQI+n+Jz+aEgPDfzWvwXEF9NVhAGZNhL1
	neSYUG0KKUTlQrxh+oELiRHOtXgctSkRUqmZ69q8YLOpjOdRdDBL540SY6bAnsTBdLKhjbn6SeO
	A==
X-Received: by 2002:a05:620a:1a1f:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cb1f74d3bemr112907085a.43.1770702056479;
        Mon, 09 Feb 2026 21:40:56 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:55 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/5] clk: mediatek: Fix MT8196 topckgen orphan clock
Date: Mon,  9 Feb 2026 23:37:03 -0600
Message-ID: <20260210053708.17239-3-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_214100_283974_7BB791DE 
X-CRM114-Status: GOOD (  11.94  )
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

There is a clock with its name spelled incorrecly, so when a child tries
to associate itself to a parent, there isn't a parent.  Fixing the name
restores the proper parent-child relations of this clocks and eliminates
the orphaned clock.

Fixes: 895ab0134d64 ("clk: mediatek: Add MT8196 topckgen clock support")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-topckgen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen.c b/drivers/clk/mediatek/clk-mt8196-topckgen.c
index 6ace11ef6b69..2482597b9b7a 100644
--- a/drivers/clk/mediatek/clk-mt8196-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8196-topckgen.c
@@ -324,7 +324,7 @@ static const char * const emi_parents[] = {
 	"mainpll_d5_d8",
 	"mainpll_d5_d4",
 	"mainpll_d4_d4",
-	"emipll1_ck"
+	"emipll"
 };
 
 static const char * const ap2conn_host_parents[] = {
-- 
2.51.0


