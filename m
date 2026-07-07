Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A08C43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=47qH9DhdGsXSvcnn2TMzn7MFl2kXpbMH9aBDXUUfcBo=; b=Fv/07hbyezXG92LfK84uUIH/dK
	5xE51bBkebytk+/jPPt458Z39NT4/hjpsALj8ufeFmJsp9PN5CXpmvc3fhxY0btLkdP7Sbx389jg5
	3Wvl/U2F+1Xir2RMvol/VOgGwFvuFkEdqJi6D8l67hrEIj9M0fdBQImqoDAzGRLmbmVcYtcrSQE8D
	LF2eNg6vAwhxZRfOCvDd+CNg3HlN1R9uQ9UctIGbcEPffvquzz4aOjlNFKjRjeZbbStpYf5OsaVSR
	ljhqUZr4Yuzu1jvnJdQdtK+4BzlByNn9WPXjraWfAwJAfXdR3odDemMw2kNAMEovbwXM1ky1V3MVv
	dNNC6+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YQ-0000000EMHb-3J13;
	Tue, 07 Jul 2026 07:49:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YO-0000000EMGx-2kuV
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:17 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so3894968a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410555; x=1784015355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47qH9DhdGsXSvcnn2TMzn7MFl2kXpbMH9aBDXUUfcBo=;
        b=fXLhFvRFZ7piQVmZk/+3lHBnsqwgTQT8pR8RmAxdWslJCaUGBLXemEnDe/DpxtKRWM
         9hTu8EU2yLQQqY7IFFFMYbGZlYFvHBCkvi6q1432TOIwlEytsyogcdhC4lZW3BevsmP4
         11qOcrtN0E3SQDfvt3oN4HR2n0WFEqHti+2kkw71Qvuow0CDqK3Ab6vHiM1yvZfB5CXp
         qCV9rq+t4/LsRkVfJG1aOIZvLB9F6utid4xqjtMRa1bn1G68JMuoaK+ahk41GNkNsl7j
         Q/WEQe5LNwfhVxEm5ZFphHxpp3FPYrJ8dgSASeJSVttXOlAzVu3S74ia0+mc9sFaHS3T
         wsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410555; x=1784015355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47qH9DhdGsXSvcnn2TMzn7MFl2kXpbMH9aBDXUUfcBo=;
        b=P6BBx0iptJ4rIvEJB3BQYv4MPRhx88G6U0yqvAMg/+BIFi7aNIqmurUy4fJ74mTj0X
         kKLUmnfQhIiZqTD3riNKvsCstDdd5VHV1lcAxIerZp5bneVrrImm5ofrWUPH9AU/QYmK
         QNFb5Mui0O1GhYfqlNAupQUB6LuAk4AfqcFm7s23bkx00hNid1eGR11iW5YFezv8dkmY
         3cFM2YutHIVQzE315nGb/t2axRrxb5JZ8zuutZcBas0CcpOvVJ1At5r/UtcQqK18J0Dg
         QgzsYx5GapgnSYDItIpcSUQxQiwStM+Td/413JoRupcpGtgZcsv1f098ybBshWV+Jpxl
         3C3w==
X-Forwarded-Encrypted: i=1; AHgh+RruBMHRhzUeKmfiABXf0CuutNDsn+Novf9vIuMaxJlDW/palhHhLvBNa2FVDObD5J+UE4WadTPkr8/JD6ffUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvIIYA64xJr2ZfBslcHwQY16Q+bwKjo+w+zxwsIqaprc6N9ZTu
	uCqXOGyG4yAHjDe2BllcKzwv88xuJLDVfzMtQgNTiuABOHVE9AJ6at+n
X-Gm-Gg: AfdE7ckTID0e2iLBMDCbPR3JzVmFy4i2ZnrU/Syxv8sUOKLUJk/RjgAUaOkdQ9WS0Xh
	yrc8HxVzK8T1YRsLnE/qoBPywO30o/U96iVEyp5EedDMPhlSyjDue2fcHFlhPFrGxywfXIosHXQ
	ZmX8Uc6mrHl7jNHUa+Q4UpnDwIPTdOGLiAiL1swZWk6LLwCI0QEbSsTS4NiBJ0Dd82SCWHwS38b
	w14+gkp5/X73ri4GO2d/8PQsHVBhbLvBLSUVebdG7dppQUsfr0iEtYEWQipJn9eLCrb+D/5wP9E
	Bf0J4rXWMZbJKcvhtRoer6U3nIOyiJr/SiPfI4Ja4JaB+F/lkG1UN3R6M4+9+GO8YUDLfiyBbVj
	IbvumaoMptiqU6YNZAEGdTqSj64mmEzlWr2I27FsfZ5VRs1AuahpbF2wZxDaQ7yK8NMAGrGDLqC
	BagRXdNIqVfx4MsL68lTppsg7sZ/9BTBaAcJnPyrpmbPkx
X-Received: by 2002:a17:90a:da86:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-387597e83dcmr4179386a91.28.1783410555332;
        Tue, 07 Jul 2026 00:49:15 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:14 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 0/6] clk: mediatek: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:29 +0900
Message-ID: <20260707074839.240676-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004916_697294_2ECCD67C 
X-CRM114-Status: UNSURE (   7.59  )
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

Some MediaTek clock drivers do not call platform_set_drvdata()
during probe,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Changes in v2:
- Add a newline between platform_set_drvdata() and return
  (suggested by Brian Masney)
- Split the patch per SoC, (also suggested by Brian Masney)
- Add "Cc: stable@vger.kernel.org"

Link to v1: https://lore.kernel.org/linux-mediatek/20260629142348.273766-1-akkun11.open@gmail.com/T/#u

Akari Tsuyukusa (6):
  clk: mediatek: mt2712: fix memory leak on module removal
  clk: mediatek: mt6795: fix memory leak on module removal
  clk: mediatek: mt7622: fix memory leak on module removal
  clk: mediatek: mt8135: fix memory leak on module removal
  clk: mediatek: mt8173: fix memory leak on module removal
  clk: mediatek: mt8192: fix memory leak on module removal

 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 2 ++
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 2 ++
 10 files changed, 20 insertions(+)

-- 
2.54.0


