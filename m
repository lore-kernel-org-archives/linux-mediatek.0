Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462DDEFCE2A
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 18:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAARsnlrqcfDm8ekZAoMmoCRNxm299rJHElT0uztVl4=; b=dlpJrV2ObIhgxCFiy3nv0X5dnv
	SZ8B1l7OJuxdg1nIv/g76IAZYw0FaXZQbomrHhhy9JGxLyK3pAoXymqUaftRIkowC75lrENhepzBX
	tbUUHTc7ywEnfqKTHAVJfUycIwcw4Tkh632wu51F9vUKr7VhrqD9kaODQrdeia+C8KNLmW+YcCPMf
	85sWQg7rfcbp1qRj/7Eklmm6FmNm3mZknhZyNhhPcVwUPx3jfSnG41UZhKUmavdQuKGncEBoutuEn
	W7NDkRiq8Zr8PBg6ILt/vebeL6H/Dcxp1qMHbbB7gthp/c4VfIBg3WZeRvWAt7qfKJkK4xK4X5zLm
	KcmrYcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqh4-00000000JJW-3MoD;
	Wed, 04 Mar 2026 18:11:34 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqh1-00000000JIZ-3Qdq
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 18:11:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso3650326b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647890; x=1773252690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CAARsnlrqcfDm8ekZAoMmoCRNxm299rJHElT0uztVl4=;
        b=Ayc0e6NaBTXyd+ouliQOboGCn4lsnIB0TVSBnNqDEf7J8qtEgLKoHkldcguUK+ELvq
         1BzLPCCid8WD+e9sTvctw89vEmwHUZK14zPGgU6XQdUGcTkOny0YBYJ4GrRbdk48qaIq
         tJUwV1Fi/qt0FOA+bNYHaw9X1JVgm0VqAxldXEAWprYauWq5YgmmgklQAGsW3jTAknhS
         tLh7dM9K4mqxQGhcT3NIObX8fhj6fDfh39UF57m9h/tuPYdogloHKIopLXeJwCwAeWCu
         gZBT/9ksJoyMap4zFi2KvMrYph+M3hygHLRevHpiX8hkETCJIQvL6+k2NHSTn7RTVERJ
         qe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647890; x=1773252690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAARsnlrqcfDm8ekZAoMmoCRNxm299rJHElT0uztVl4=;
        b=Q1l7NMIOFRgFk1+4VBrga79WCJVJ40gWpscF50giCT63nPAn4cPs//nKs26KbN0zcQ
         HvPyary37JozmPuFYRVB4RnThzxTHDqz40nwM+0mt1kDMh+Z1s9xxjz8m8xczfUSVQDu
         AjyQtKFX0Opbvtc3V/mX/b30i43l+x2sRHOf12qfSjmKjSIAqoxo1Jxu7SJsAABP9JI6
         jQaKkmShkqAB7tafL8WcR/5TyttzzNM4cNJzu/nXB/B2lxj9x9inycF/EadVciBv0WhC
         CxPTwzP48brdMVEg26dgB40j4PuPMnLhK+AfMrqASn5vYNEFQwG9a7q9q6wNtBAicXuR
         Kxtw==
X-Forwarded-Encrypted: i=1; AJvYcCVwXtZQpVdH7DXIyKnEwXKyDCauEnc8ATwhl2+eJelFdi6jnfnjb8f1ADoIgqVa/tjhPnESuXP1nGJiTZaB7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjuT/OTaRRMAeNUXwEq9GU7JeRKNo2TH0LvRAKZjmwnxqXqZmk
	glRnyaPRehCA+pFg8ncZkyFLZDtQTA7mDcIFZvdixGMnNOYxDd+MRV1k
X-Gm-Gg: ATEYQzyO1n05TCN6IrggI+9UCcJzUz3o1cnN4EaJ7Z366g7jOt+FqCiPWPQWICRaVpw
	usADkqOItzGylY7VhqM/ClsyK1QUZdBQjSjcIbCDY6HWEJWuoBKzwgKdVlHggznbXXkNsJ8r4tf
	5a28jK5+siqtdB1aoyy8nnn4tOkJCDITYnivTH2YFFvHDkSrahYhow0xKNlzE5h5GUCrDfy1WOy
	Cseu0ZNnxsf86XLwpIkkjXYnedqGroUWDgpF6Hokr3q9/jhmEA8rfNQXsvA8KEWURwUDWcCpYEa
	SMl1tWqBxYnYte0z5Cz0NnaLOD1h/0V0I0XqMxvbDa2J3U0+wK3jdravniFkoU/cnW5EU5P4HPM
	A1IxBHpNfJ1jRXY6Si3wR3Rz7367bWofYjMjR65ZnAkS7aKTSsD3CJUTftvTTb3c7VJkQF7fDAd
	RK11sMyHSvBthpEUc5Ccm3ugDLzHFx71wIOc5FFv9R7CKWSK2G7ghF7kECnUqX2Ygt9PeqxK/Pf
	GzNMGU=
X-Received: by 2002:a05:6a00:a21b:b0:827:433c:ba7e with SMTP id d2e1a72fcca58-82972ca0908mr2672299b3a.41.1772647890346;
        Wed, 04 Mar 2026 10:11:30 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:27 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 0/3] Refactor infracfg drivers to be able to use common helpers
Date: Thu,  5 Mar 2026 03:10:21 +0900
Message-ID: <20260304181024.738391-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101131_847475_B7AF6849 
X-CRM114-Status: UNSURE (   7.81  )
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

This series extends the MediaTek clock common framework to support
cpumux and converts existing infracfg drivers to use the common
helpers.

Currently, many MediaTek clock drivers implement their own probe and
remove functions, leading to significant code duplication. By extending
the mtk_clk_desc structure and the __mtk_clk_simple_probe/remove
functions, we can handle these sequences in a unified way.

Summary of changes:
- Patch 1: Add cpumux support to common mtk_clk_simple_probe/remove.
- Patch 2: Convert MT6795 infracfg driver to the common helpers.
- Patch 3: Convert MT7622 infracfg driver to the common helpers.

Akari Tsuyukusa (3):
  clk: mediatek: clk-mtk: Add cpumux support to common probe/remove
    helpers
  clk: mediatek: mt6795-infracfg: Switch to common probe/remove helpers
  clk: mediatek: mt7622-infracfg: Switch to common probe/remove helpers

 drivers/clk/mediatek/clk-mt6795-infracfg.c | 70 ++++------------------
 drivers/clk/mediatek/clk-mt7622-infracfg.c | 70 ++++------------------
 drivers/clk/mediatek/clk-mtk.c             | 18 +++++-
 drivers/clk/mediatek/clk-mtk.h             |  2 +
 4 files changed, 41 insertions(+), 119 deletions(-)

-- 
2.52.0


