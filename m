Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B715BCD342F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 00:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTLKfYwhIwjZe6Ymneg9JySC2Ql7RJ72z20RwbSJyQw=; b=mxcl4FtRq/5vGn9gIpnynmd4TV
	Xi6XpSbwkR5Hw+NMxPsKnzIO3vw7cUdtQxiWacgixZtCJEgXC8S8sLJzEeyUQZacgRn0bX6iGf7qJ
	k93s9tLHIZCNNnyZbi1U5AsQ3U2EULyMJkblVK7jVGoyroZ39g4KxuQTJZpTA+OYF1Kbc6ZgjQhsQ
	QGZlhoa090wvLcMiDMOUerMGTH6N6wU/tGmfEvc9N1TJQIZVR+PJ6IAGCYmHMI9+kj2zFSzZ6VrTS
	KxO5qJ32dDBuMaX1It70rwCrBexvpZ5HPhtyx7SbvLkPJ9psJ0mEuib7LhUTAa9sWDkVJTGYngDIu
	l+Y7CbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTh-00000000LS4-0mmg;
	Wed, 06 May 2026 00:51:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTd-00000000LN9-13yW
	for linux-mediatek@lists.infradead.org;
	Wed, 06 May 2026 00:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTLKfYwhIwjZe6Ymneg9JySC2Ql7RJ72z20RwbSJyQw=;
	b=JTbxIIWpUdwYjAtJsV1dz5uEHh5c6oyL33tsKe/Yo3GljpFcMc4OWuEDUhtGTtCVoQntyy
	QAOjU8JeauxmvnSBoBoNdyDuSKk7ZL66Niy3mw8x+OCuPljhPDzXKp49k3sJVEWnBFMIjP
	r6wIO2pPBpDTlG1hPk2PaI+hbuDaX5g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-K1FfHEZ1NQOvLbUgbO3fGg-1; Tue, 05 May 2026 20:50:58 -0400
X-MC-Unique: K1FfHEZ1NQOvLbUgbO3fGg-1
X-Mimecast-MFC-AGG-ID: K1FfHEZ1NQOvLbUgbO3fGg_1778028658
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eaee67d1bcso1202006185a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 17:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028658; x=1778633458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dTLKfYwhIwjZe6Ymneg9JySC2Ql7RJ72z20RwbSJyQw=;
        b=ZL+ZTeRKNMQ11L6kGoZ30kdFgtOC3kHsIJA4JEC9Mq8ZI/+8bm5KV5Dxd6vIyzGyhr
         vlfDn7/dUHDMECSOlmBVHoZ5LFXfxWJeu0JXYRqloAfYEbKRdgYUWc+ZHReCJMRi5IXl
         nLYC29Jy/nlE4PKM+2Crj5UUOdPxHSVlRzGE2gpJykeSgO3P4DrGE9MFy2m+nsQvo4qe
         SUC2cCd7ns5e8MR7z+2/Ju7NVPAm4RjuAylWsHSYJbTFknSuvNQ95VxwrB1FxEq9+oGM
         6f5wt9M/mKC8OAt5WbMQrOKUaJ/fuFhw/yHig6L6dLpJmaeiiqoa9CzWZZgmips2nPf1
         LIOw==
X-Forwarded-Encrypted: i=1; AFNElJ+rjQ1dAVrq5nnySDJ8ASMLXMi759tkaElMpLVMMvs9ZdxZukPBF+ElOCEIxqnN+Teyje/MUbsd5fMnOILzNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0iFQefFeg2DieYBWjdA+rmOQ/xfCpUw1sCNXShJibUozoSLOy
	e4gpfdnSgG4N44fO4WmOxRRTZ8cQy279qYexq+5179qKOcHcwl5s+m1iiB6qhAgBXf9193/T3Bg
	oYYqRSOMSlgM4QYStk8FKPZIMFRK3NUymHRBWi2zKiZd5tdoenVOGDoNwHBOHTQ2WzZdKxAh00g
	==
X-Gm-Gg: AeBDieugP2mUYFm0fzHf0xKJrlCfw/JTRG4x42GWiK7pFvsFn6s1HaAePSTPV6Oble8
	2rlKoLf44BZZhTzr+xR6bkqWWhvuotSVxn7eBu6r2Nu5Mib34Deeudg7Kj+uzH6wj+YGomY/WVp
	kQg+KzcJ1Y4WJEd8yq63tCBBFlL1FkbIAl4LKef3vJ1hxUB1n1TPq9M65oN6+hsaZL26p/zgwg/
	SVdONECDPik23Se9XpN+rdcqgwGCQrGwDy6/Nil0vovhjjdWfrllVcq/w2OP93wqGjLjkskat15
	AGTYYMteiz5fgGqboN5us7ZDVerWuC3IbzRNX6EQDXS3B6C41CSUWV4tIyE5NntYyjFcTFDjUHi
	o/4gZliVeDVrtCsi2byZ7Nlo88+sJnQw8aZ0MHS/Q1XbR+qPgT19etiwkB+oyOGY8CuNd4qum
X-Received: by 2002:a05:620a:280b:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-904d4b595dbmr237797285a.19.1778028658212;
        Tue, 05 May 2026 17:50:58 -0700 (PDT)
X-Received: by 2002:a05:620a:280b:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-904d4b595dbmr237794185a.19.1778028657825;
        Tue, 05 May 2026 17:50:57 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:10 -0400
Subject: [PATCH v3 14/15] pmdomain: mediatek: airoha: use
 clk_determine_rate_noop()
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-14-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Plh6jLnyb5HRCGfMAFTPcmpUH7qp8GtHhHTUy3setgI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfC79mKWzcFFEvubdgnc2iO7/J7kEsfk+WtOMl1ap
 2Mk+yr9cUcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATSZ7IyLBs3fxvN1L+pLnM
 vLLFseeCwpsdgpUSQda2OW92ta9Tv1fO8Jv19CT98o3n2UuPedrfzXz8JXWS3L6au189Jhk75c8
 0fsELAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OlIJ54fxDRYGg05nrhAyBU_D3rYIeqPdPwWtQZ_kUaQ_1778028658
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_175101_382751_23B496D4 
X-CRM114-Status: GOOD (  11.87  )
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

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Ulf Hansson <ulfh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
index 3b1d202f89dc..5efd7a38f4da 100644
--- a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
+++ b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
@@ -21,12 +21,6 @@ struct airoha_cpu_pmdomain_priv {
 	struct generic_pm_domain pd;
 };
 
-static int airoha_cpu_pmdomain_clk_determine_rate(struct clk_hw *hw,
-						  struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static unsigned long airoha_cpu_pmdomain_clk_get(struct clk_hw *hw,
 						 unsigned long parent_rate)
 {
@@ -48,7 +42,7 @@ static int airoha_cpu_pmdomain_clk_is_enabled(struct clk_hw *hw)
 static const struct clk_ops airoha_cpu_pmdomain_clk_ops = {
 	.recalc_rate = airoha_cpu_pmdomain_clk_get,
 	.is_enabled = airoha_cpu_pmdomain_clk_is_enabled,
-	.determine_rate = airoha_cpu_pmdomain_clk_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 };
 
 static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,

-- 
2.54.0


