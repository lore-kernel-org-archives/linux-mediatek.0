Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B1AC55184
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQTegJW8Vwp7QjW3gCxx6DQBByocZqrqYYXa3MGI9cg=; b=G69rvyjS3A7kgzuxxMKjcVEza/
	tJvDTTU4kjdhxLSf8rzwOrXhURIjMOIJ2LQauy0VOeYhq9STRPOQD73o924/lj+rPX54/0PS/R5Nl
	sA+Lp8/cx9jsTrgfpjOPbxfEWGhpgI6NpFU63uT2RtJfFzZZmreTgIALaWOK0QbtJV7YlzuxZXDTP
	Ky62g/5oY9dc1AcMkEi88E2iQK9jM5w09Z/qmgc2lEhG3iLI+r12FXKKSoPS7XNOSnyWhBd3qGont
	fMKVSxH21En2Uwwk/yusc1CqH9APjS7jsOKf+iGK+6PaBIigvY7kqOpW1WuuKdM8vjSIU487QE1co
	jaDPpYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtU7-0000000HJnX-3Xhv;
	Mon, 03 Aug 2026 14:17:43 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtU5-0000000HJkk-1HfN
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:42 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3811f512167so3468354a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766660; x=1786371460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQTegJW8Vwp7QjW3gCxx6DQBByocZqrqYYXa3MGI9cg=;
        b=MW6+132u6DsqBtuWhCdZE+24wYVhv+SkYKSMQI3fPGHgT2dnlUvjgfCQvgrGTxi5KY
         CWYTtRehqAxNXrN8FvkxS2aczDjlKqSQEESO+balkXpfxfRve9erQyM75UCDcxltSUow
         7U14FIKbdl03iQm7DUx6Fu4/znVmQOJaYCLC2C5gYT3hseWLaWi8xeoRnbJsgG55Zj4k
         QH816SHTgLeKKSZfe/AOTxneOifsq0m08Oo+9MaWnpsO4lrw1Nz6TQXLBWsxb6+hnEoS
         VuGtngEMxDlH80Q/dLvaEnffbS9EfQ5x/+kz4fjH0zVmANFvPxZfZ2BuSXWR6a0EeRdJ
         TiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766660; x=1786371460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQTegJW8Vwp7QjW3gCxx6DQBByocZqrqYYXa3MGI9cg=;
        b=RaK4KyNAIwQJegnbq39FhR7hvM4I1BCLktwed84a6ca6Nl8t4NsldfGxm2gdeOsCNN
         xc/xJN0x371/Lq2QIKrF270feLRINTkmYLTXTb46nurPjm7EVn7Ti1EEgbLDnzv1WLDZ
         TPQOnjv77w5p0AJ9OFgLvsE5+7KWVIw0v2hZK9d6Hnnod86BzBgz2fjCGJ8O68wHuTLQ
         NesZuYE22qIxfNmit2lHswpNNpQen8dlxCMXMkNXK3naAE9kfgr3uKoVRpaOLWzALnz6
         KGgXzF6R8+w+h5whThQuyH/h8iOOl2dLJS9UOAgnaCFmeFCeaUu7wdAYor07g7HWsJGQ
         byQA==
X-Forwarded-Encrypted: i=1; AHgh+RqnQa1OITquq/ee5KT7JD4rt2b/1BZzA3tRA0pxEpD8LnKDF0+ToQ3QCHAWjQsLqSzJ6gdWNNqg8kngjJc2EQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzwJHqAs1lr5UE0abpEnyODtcM1PH1oChQwzO9/V1346kI9piQ
	NI9pyNh2052Kh67IbnJxDi+hJ3loCB84wb/nvElzPz8YQip8LmRtwOjz
X-Gm-Gg: AR+sD13LTr6D2h/WJOM28zBXMCaa/xvds8cB2huwDKmXVo9hCHmOG9X7BcB+pU0e906
	pDi5ubmMo157KE409+kW/LFzxnrZNogvubJtfasdmsHszlnUQrePXLH7j+tCzmHNxSl2P2vbc7f
	9AZrWtbFqJFC7vr6iPIMfsOilmUP1t+MRMfTvSF0kN5uKqQIunhSCHBIN5fjaItcPBwEWIu3kk0
	CeYmpj2JKMlaRJCUmL06zQMthRfwuEXBPtxgy9DYgLFc3xNp9/HeqfinOJCtWebHr1g3eHcXJCU
	TvpmSCSbs7MrOzrsN6H2MkIGm9IG3Z+8qbWAAmdGPQMSyvPQ7W59QN/XPVJ1IYGCRXjgLbVlZmL
	EoWYyHEuP1bZ9Jl3NlGsO7yv5QWVW9G6feSW1wjW+s1aKEavO88XrmYKCc/jwdKUcANIZn2lQO6
	Q0EZh408X6WDHt2VIVFHNgUfJRY4VbxuTZFXG1bsN/RMXRsjtuP+kZv5hswBVdyetAj3XJpPy4U
	yyyKNE1NLTK89h2wnE1
X-Received: by 2002:a17:90b:51c3:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-38fbc0b4881mr9861203a91.0.1785766660245;
        Mon, 03 Aug 2026 07:17:40 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:39 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 03/32] clk: mediatek: mt7622: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:30 +0900
Message-ID: <20260803141659.559129-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071741_356849_AD77EFB4 
X-CRM114-Status: GOOD (  10.64  )
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

clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..fae8abda14b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,8 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..cec19447d637 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,8 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
-- 
2.55.0


