Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E8ECC6B1C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BUb4KLNzv8UvtcG3rPoNWcIBZsIhzqKZtTn6CJci/w=; b=AeSKYdnUU1K0rmxHVAtxoFcTle
	2IwagFZxhZmNd+0i1oJP2QOM0o6zhjphLY1Fr7+e2YGbWAPVY2K+GBhov5KW1WaxFGVLet4kNtnwm
	dZx2b9RLwCigWRUqzVBneOe6RB7ORH8c6yxqQHI0188ZPqayEC+koLE02bCIyjqL/p+hX7sfPPoj0
	7KIXB1gsAHoNwschgV+xZZ74TlkS9tdyASFzThGY7kYwBKw41WjrKL4pCxA1bucY8i4yshVLeja0q
	ZfQDcDya5tiOiRFxF58CpKsSW9XJemmswsEGvHHqlS+hIQuWJu54S+B465iwQGDBCFThDfqz0DpEm
	gH4SAt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHQ-0000000DGk0-0EUi;
	Tue, 13 Oct 2026 15:19:04 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHM-0000000DGeg-1UN3
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:02 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so1271494a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904739; x=1792509539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BUb4KLNzv8UvtcG3rPoNWcIBZsIhzqKZtTn6CJci/w=;
        b=VUsnc4iuneH4TKrQOcPmvMA/UEGOvG3f2FsMX5dJPk/q6LVHc5kM/8QakSfYo7qqwJ
         vIy9MUqaP1w7GIyAd7W6iS733GAJ3IKh1NfvZPAn0z0sjtTuTf1QUSeFBebqVK2Z5hoR
         U0fIbnYxzX9IqMQw/Wvxqlkm2NOKH4kUHtMIBStAI+2V4S8zc0z+XrW7o3JMFe5RxXNS
         ZW4VuP3DhQmJgujyRgIdNTYKfGRocXwkYv9gCXD26LA1HGeNxEFBEN1MVnpep/kwQUoo
         0BOkk/AsrI4DeZ/O/Cfn4ImZ9xqh7+9/br/zT3P3qzk1HjCluf6RHyZxsF0xxyZEbcjN
         snrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904739; x=1792509539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BUb4KLNzv8UvtcG3rPoNWcIBZsIhzqKZtTn6CJci/w=;
        b=NSTWmBDF1NExeZtUmDx8eREnf49K611UKi5tj0PKQAG9PItnxUkTRSmYPvRne88a8H
         4kSNRFk+udsU/PhHC+YK/hdVHoGK+9Y5Pl9Rbts5yyMWPX1Pq74A5cnWHZUlZ5lhswQx
         JDWhmJbs3tbXj0ERSCvOEaxGS+GOWoNqD4SRtHfD0aVkwsisvIHAVnr6tG8wHaP7mQtd
         HZKoW7WP8ysln85npG5gsM209u9Kwl5rym26zYFSgs50STtXKDNTtac42SCCh9+cuLEC
         1oOb2KMGyCM7JEPAqfFCmJnwmwGIIwHBB7nvHD4B8cJ/HnvKbYpWZ0hSzY/dHNjkEzsG
         Jx8A==
X-Forwarded-Encrypted: i=1; AKwUvBy2Td9bfqmA2HZs26RX7LKOgGSSYlzJDa+YGUtXK33vEFZLukm49YwTwk9RqhPnhwxa268z/6d1WzXUVcqkXg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1FL7YKcH555ZrPzFO+HV4AMCgVTb6WBlDZy1qvQCMlSgIK0f3
	4mOdfDC7UF/X5h9qs+xcvEQ3EO9P06wtAUxFzHX4dPuMEluD28ee1rfl
X-Gm-Gg: AYBFou1TiBHPgTN91thEZUbEFQH6MvMMwLL9i2cBEK8ZDpd687SE1tDjxHqjmeQjrWn
	vvf7stcoHvLBKS/X6sQW1+iu0LDGnYwG9+s1zTrF4MzIpALg+D0yl9GW8MLqwJrmlb6s3bIxtTi
	DvTo4ZFIPYF4Q+EBbC0OVrcjvOw411BnizCPrnWp4safMM4VzWVTNxhfbJlJBDw6ogSUgobYALj
	AFcseHMZ5oltvg3FyJZa4RjfDAJoqnGAppp5ZvRQJb7ZD+7FcPeIKF0NYTqtxsgJtZGgYDGElP7
	TtGEz2QIaxiMWOiTUfSPh7g2RIJY9gKJ1x5SxML/tc/O7JhGGozoxkxcy7ECIIJ00L3oMs1bapW
	SoBTlOE5gOkRBwHn39fzW3cQNoWhVjBoRBY1+RiWA3TdEbgHnAA/DDATBRoZeM/zX4XrdqRAPDy
	Fcu8OOgbsprgzjySm+JyTvTMGTymFVroQlTD+Jp+/xv1ZjEIbVFBlizHhlZWSFJG3e9EbVD3aCS
	qq1GCtMkJCPKaGO1u9OhqvBuQPG
X-Received: by 2002:a05:6a20:3d82:b0:3e1:c716:3a00 with SMTP id adf61e73a8af0-3e1c7163de7mr1785092637.53.1791904739466;
        Tue, 13 Oct 2026 08:18:59 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:59 -0700 (PDT)
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
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 11/35] clk: mediatek: return 0 instead of r in __mtk_clk_simple_probe()
Date: Wed, 14 Oct 2026 00:17:10 +0900
Message-ID: <20261013151734.3177690-12-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081900_409114_BD893543 
X-CRM114-Status: GOOD (  12.16  )
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

In the successful path of __mtk_clk_simple_probe(), r is always 0.
"return r" is meaningless and confusing, so use "return 0" instead.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Newly introduced in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 0b10a4b14a6e..11741cc6ccc7 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -592,7 +592,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->need_runtime_pm)
 		pm_runtime_put(&pdev->dev);
 
-	return r;
+	return 0;
 
 unregister_clks:
 	if (mcd->clks)
-- 
2.56.0


