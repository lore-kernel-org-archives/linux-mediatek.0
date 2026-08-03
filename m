Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD25BC55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YUTKcwC82n8dRAk6Rq6PaXfV44JobcORSU/s+vRUxE=; b=hTdTIzh5wG25n9bDRl7P9hDH8y
	qPQNulLBQmC12UtagHMc0aivapK3cAb3hhtZtVv29ZFHiZLthXkr0xX+aeu1Lp1YTTnPWitHeugpC
	Eb4r9s44TWix/qgvjWeN4N6Sr7LTy3sqvV1sQhks3TiiSYQgt8Ue2FsLnnyqnZpZ7eDRzipwNODuF
	CAjQI3yDaAzjwNoUWrk0cTtophhjeXiDySVmtALU649LwAgsN4dEbDJJCTXPm8p8G4IDWKIdKYaoh
	CaqTl71gq1EKdhWdQ/oKOM9q+4NhCSMAwbuflYqSHer8QiQsKd/8aDBu7oZhsSee8JI5645Wt9pis
	h+UL14IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUM-0000000HK4m-2KCj;
	Mon, 03 Aug 2026 14:17:58 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUI-0000000HK09-2hm1
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3564234a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766674; x=1786371474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1YUTKcwC82n8dRAk6Rq6PaXfV44JobcORSU/s+vRUxE=;
        b=VanrsIfAuD1Cscnn+u13JpZvhanzosSN2CjcmQmhLj3yuKHIKG6+ryOk0KQxlNQ3ni
         jGnFmzlFwUvrx48zkPZNp+hUrufQplABqrrJIfTxZKVBBQWTXWqtnrh3WVSyPkFReZ+P
         4Qc/3KXtQ3f+cuQNpbaogcfbxRVkwBRIZWLhD2dAVMW5K/cL9DePg/VzGT2RdWywoByN
         Lnqrp6NGHEQVZoZqKZtSXR7DQjYHBIW0Ljr41X61E3q5AEu9k6x67GEbfDSUAERlp/DV
         w+tMJH84elMAdn+O5X9e4/FkkwLxoa4IuPy9fqpocvvvjSG8hEOoG0Mu8zCo8lVB7U7s
         mAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766674; x=1786371474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YUTKcwC82n8dRAk6Rq6PaXfV44JobcORSU/s+vRUxE=;
        b=LhMcEzKiwUyAsXPJHSZG+14rmozkerBhyJMVD0r4YmFzH74URs1UKvVQDSDxEOe2Dj
         UT6Ihw3P/5uCo+PJQBT0lG6JatcMsuPHc3K7hEA0fXK6Q+5ASYKap8NjjovWMMZWLPIx
         h/bjzubBjupT66AIkSVNIWf2qexixe9PuAu5emrcY/iwnaK9V8kRLwtHm1jEmD5L1d4e
         WHVECOOUcYWK/CgFWru1NlPjFWdAQODdHZylmPohEQNqDXB9QXnfFuXt2LLEOA7QbUxO
         t4tjU33eRxblzNULz5ZewBftI3poK+XpfMonhP7pSVSdOmVjrGmP1TfAd5pLgnef8ew0
         Sa2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpY6ymRGKPeggHv/Vp1hsfOy3QuT0R43FOeYDoRY6zUgB02LHAuea701l7eYcQ5ih/DCjLk54LmKoOTRtagGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfwzL1yc8eeX+0MTG60ZU40+HMBwIXEAWf6jYIJd9x3XXqU7Tx
	24P3EA/KN/WpV8dAYlza2ufKdK2D7t9YrBG6s+2dtIiZ+X8bor3mrIJT
X-Gm-Gg: AR+sD11jvVR1XJuaErsRFIkamFEgTl3q561lUSTdRnqiPXv1viDfD99uQ10MvEAkNtw
	/ta+1MKK1kYgIZ8L1l572aYAMUtvBjzpX70iLV5reuLUlC9E/oJtKfrskQzT1MzAA5NCa/UYM9n
	0ztBmFRwbitddnymOwRHygRNtuWj0mi2watfemxXAD8vXm4yYCRtthjflTOZZOt2GmMiaNiXmuT
	QLW/ftrD8MVmGjzTAfFFqDCb/eagw9hHikfCUJfMXLaT06hi+pQ4t3nAi2/NtH7WyzpUfiIHBqN
	t0oAeGWsbNuHdU3LbCIMjCPKDWDQ9MWy5uf5cLjkWghyoN1+NE5F4CUEKz1sTKKZQVKAg8k6W4n
	OW3YoJ5KJ03nuTNjbJpI1bEFYic/HcwZwKi4dgVgcjn9sh1HFvuPpnGD6Ahjmf2NyKl+xisYKpB
	u/7KrYWNIfHO+3HkBFBkhn0mM5DBWvFA/R2MDYwWP9WtUuSuz2RJCuyI+sUWG5dzcIX0Gcvef52
	qyGLcBfecKZ0y9/0KA17tzRTrKkzcU=
X-Received: by 2002:a17:90b:4acb:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-38fbc4313c2mr9516829a91.13.1785766673989;
        Mon, 03 Aug 2026 07:17:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:53 -0700 (PDT)
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
Subject: [PATCH 06/32] clk: mediatek: mt8192: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:33 +0900
Message-ID: <20260803141659.559129-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071754_678193_2186224B 
X-CRM114-Status: GOOD (  10.83  )
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
2.55.0


