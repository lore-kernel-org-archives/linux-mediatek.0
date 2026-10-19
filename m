Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFC3CCF2E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q1kDGFOBuUTvyA06Flp2KWhLjMc4oScSjHsi2pPF/t0=; b=ZCRZhaq3ZfXfJL
	rAQru/QropM71eRsObaArsyOCoaWQ6PgPvsLcqMXI+LDTVUSuZwuoMh+oelxoAN+qWNYogwdm9d3h
	O27zt72BBgCpk5JgFJyve4L+gQOmEwdEsJ6wXtL8r9EDjlAoPY5B3wge77gSttl8kbNL34BsRiIjc
	c+rYrfUquUzejlRDPhxLlMToxeT525CjkqhyQ67Vsh0iC99RbUwQCsNu9zmWop1lWDpgABnHdCI2N
	BPA92VhYU+En2o/yhw1KEjjDzleYRrOdrOvZ70SSXFA2QqtwqPFDN3kZYd89j5U3SzRZAuo9ialPr
	mDDFgzJIcIhcoY1LtrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYf-00000007On9-2Bif;
	Mon, 19 Oct 2026 12:33:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYc-00000007OlC-3NuZ
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Oct 2026 12:33:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so15424615e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792413216; x=1793018016; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q1kDGFOBuUTvyA06Flp2KWhLjMc4oScSjHsi2pPF/t0=;
        b=GC6TQILMwHA2H6cFc6XdM0anYHd/KnIzyTjV68NKQCuhW8VB7Ge4LXaHuTcLgqlYd3
         jhgwmiGnGWehYz90MaIMzsK+NqIUT73PSO+gSkZQAf7jm1PRaeIyOwVkq0WPaS+KVtYG
         +u3uQv+ZYRtMRrIWwJdz56frV01zzaXgnVMjrdhNrHHKqah7cswG/+njtHgB44YGmC8h
         RErVWa87wOQ7TS0haMtl5+GXTk0bguqItCPbR2QH+95Zf5u4AjNahepYHemGyqw7Tg4Q
         ZqikoV+i4NIX2lC9+j+w6XP3VFRyBRD7NwaX+lz2obbYFEASHOJmdGPIkt2KITIY3MDj
         e/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413216; x=1793018016;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q1kDGFOBuUTvyA06Flp2KWhLjMc4oScSjHsi2pPF/t0=;
        b=yWjcl24MJ3gwVODyc6V4/KqUnhc3BQaZ1SkE4QbGw85oYK3gfwfeY0pqhcAXtz6c+9
         3qaaRBBQikt6MYNxUShgSGXGHfJToMd9vgGGI0S3TwU9eFsLgd9cr7NFuj25McUhdCh3
         WpYP20SOZNHPlkfxJCrk+FiyjpF9O1jPH7djHM6nZzRxKz2Blh9So8JrUxqnHl/RSlGv
         66m+3zmlzWgPra7dFLK9tlpQeKkr39J/mwbSNXlugj+7XtRkMkF2s1jnmxBRLYY/tXc9
         8IAYM12dXgOySiixuHZWwEcwvncE8ixKA/RSfwjS5VdqII4+S0+N8WLOWK5ewTqx7chz
         /txA==
X-Forwarded-Encrypted: i=1; AKwUvBzZiqOMmJODHaVfEnHyem27gkzKOHF67JiU4Sk/X7H8GOQTFeG9jnssnxkMQqckjQOTE2wSSrXKd1+V/QcTVA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJSqJJ+7g2wEfxzLi/f/kNknPqnXxOqnHpNbXgQyhhw7aOCYCSO
	fAxSGC1H1kq/iNmCLuBdEwqeqeUCKJ1wfbTXTpHgh2SWoj6+5QtYF6wlX6ypZFzAeXM=
X-Gm-Gg: AYBFou35kq21AwadeH4jMK+XNwO3pRBHvzsjKqI4EskZqoLg696qFmL85WN9/VLH0n6
	jK1hJ0oaIiySCAb55kDbdrPtyWXW1t0i7LP49DqZgM6J6y1ALr3MpYYXh6FXagsE4jTyOb6Egoj
	DEo9xBVP5r17NCra+qwFN2uqh7NZ5tNiBEtnVfN1dXdkpLoXTmnWgiVid+G4IXcIEgy05aUKbTs
	jqwkFY6KuiyxXck+qRcJ0Uf4R0W/+6Yy/8WW6bxPD3BptvmQKwihA8WuEtBq+mNESNLDKKIqlLA
	FClW25nYMtBA727fnoaSTr1fQQZWWnDCL6R8qCWQ9F1v/ay5x7VhllkNXxdUIyxbgW3sBzOgxcN
	9g6XEe/uf1U0Gz9oD6WEd72wcfhaxbEwOMn+Dfs3ph8iJQBzAfI98DeuFivn0MYP5myICtyTxe6
	AEaO4hb4fiz/610bVj+W66rqLwpmk66arAtRyRwMat0zIuV6zBA8tZD9CSqvoNRspoar2fd9SdZ
	DsFYG40a3xacAGaNZGDg6iAse5hzlFsjDhWB6k8/F60dha4sWqRH082OqsSigdOnrr0f5f6PdoS
	vAxqOWafG6S7qZ0eFpZfSFg6/3WBYvuuLrWb8Mf2yqNaotJDts5JWGo=
X-Received: by 2002:a05:600c:154e:b0:4a1:e11f:b2e8 with SMTP id 5b1f17b1804b1-4a1e11fc15dmr105829485e9.34.1792413215929;
        Mon, 19 Oct 2026 05:33:35 -0700 (PDT)
Received: from [192.168.1.100] (2a02-8434-7c41-c701-8278-849f-666b-c282.rev.sfr.net. [2a02:8434:7c41:c701:8278:849f:666b:c282])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm24677930f8f.32.2026.10.19.05.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:33:35 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/2] pmdomain: mediatek: mt8365: fix defines and add
 missing one
Date: Mon, 19 Oct 2026 14:33:54 +0200
Message-Id: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UBTSbBeRVykyURHSVoyVQqld
 3daF3/x+PDeCkKVSeDarFDpy8JjUTCnBsLTlwchR2Xo2s6Z1vQ45ThmzwXz/NZdzs5i4gUjJS4
 kGNxAzqYUfG9BLVPVYzkKt/uf5TO8KMy7FrbtB6RUIEmDAAAA
X-Change-ID: 20261019-pmdomain-mtk-mt8365-fix-defines-c6be65ffca95
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_053338_873230_08B1D1A6 
X-CRM114-Status: UNSURE (   8.26  )
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

While trying to add a missing define for BIT(25) in
MT8365_POWER_DOMAIN_MFG, I realized that the name was already wrongly
assigned to BIT(22). Trying to fix it, I also checked all other defines
for MT8365 and noticed a few other mismatches between the defines and the
datasheet.
This series fixes the MT8365 defines and adds the missing one. While at
it, also fix some indentation issues.

Cheers
Julien

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (2):
      pmdomain: mediatek: mt8365: fix defines
      pmdomain: mediatek: mt8365: add missing define

 drivers/pmdomain/mediatek/mt8365-pm-domains.h | 11 ++++++-----
 include/linux/soc/mediatek/infracfg.h         | 21 +++++++++++----------
 2 files changed, 17 insertions(+), 15 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-pmdomain-mtk-mt8365-fix-defines-c6be65ffca95

Best regards,
--  
Julien Stephan <jstephan@baylibre.com>


