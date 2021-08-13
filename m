Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4305C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 12:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A69610A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 12:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70A69610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3jIoRaVE6zbfOs0XYQCoKfu1HKd8WeiGx7UvEk6GIz0=; b=z4xgNZxK6navVc
	Z1YVBnxbcsYCn3MoqKLLO71b58JLGXWIwaqFUS12itnJW2P7KqkJNBHHE4J/YTrKXghlZCmeXgbNF
	tBKGYF7V+enKaKC7pYUVWDX5a1GtlXWI0ceXfi2ZGEyevnEXsSBA7kpRLDJ7hQqejdq4A9K146u2r
	eiM2E53ernfoW0AWRALVPKG4IyzH7t7zx+q0WUAiw/Qcly2PWIiBKW8fv5nbfwHzipybJm13xCeZ2
	OjM1EyMCd9h8DHIhb5pDPT6gO/dui4bT4Mlpza0a5ccuB5I2hOHJybgtZJNQiaB7x9Fx/RMYMn6TD
	YimtMfjYBWl2i+nncV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEWAj-00CbDq-3o; Fri, 13 Aug 2021 12:20:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEWAS-00CbAB-Tx
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 12:20:12 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so20352609pjn.4
 for <linux-mediatek@lists.infradead.org>; Fri, 13 Aug 2021 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YCtFiQGzSSD0WFlLn3y5kRxY45lpqdiAdKef9EbWCKk=;
 b=LmhgmB1aSkYNmHUQ7x4C0CJPEJsYjcxTYKjpTJzPXflVtai+MVevIpvUyeY8I0bQN8
 zxRJSp7jmxNf9vgol2DLBA5Evn3qtTVQdotTXcS0wIVVmDuRsigeTnAdUvcRnhzp2t3S
 v2q5vEv9HEP0DHWfSBHhrvOKbj5TFYVeaTAKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YCtFiQGzSSD0WFlLn3y5kRxY45lpqdiAdKef9EbWCKk=;
 b=RebohcdewFcLiHcbGOqoQLDWtLMNgNHAMmhaQHmv4zY6ymz5fLPBB80byzf0AW4Hr3
 6K+sEMi0AWN8ePaUIeQmTwbMoDh7pXrvmYgcv/Q282aZcGx2RHQW5X2W6SFRIWsSTi0h
 qvcXBEKzNfBgnywTvZAenP0pWRwnE4jHJQGVKb5fMUN2j1FpcF/hFR2Hadiv8JwzBu3D
 zKu1DOWbaSfrR9BoB3jE8BrYB8Is+f2et1sm5EaYfxRGjIFiNOT7U2+bqsQ+ldrJt/2m
 CQ3JEmOziblicUeW4ZZbDrJd57eodY4Hu3uUmiYC8e+AO4ISs375F7pqU5KdaxuSes2/
 N0Kg==
X-Gm-Message-State: AOAM5332D3uOnwdhw1yI1cf8XJqSUhprmtlFxAfqco3mtFRkMnG8Xu80
 7b4QOFz458giZm+SHO8ZscjvOQ==
X-Google-Smtp-Source: ABdhPJxi7siu4n9mjrZKiMUTXiVwqus2x1w6B4njNKyABlCL9wXM3/vTwkJchlcU2oExzMAR/5Ajaw==
X-Received: by 2002:a17:902:9303:b029:12c:29c:43f9 with SMTP id
 bc3-20020a1709029303b029012c029c43f9mr1806527plb.5.1628857207649; 
 Fri, 13 Aug 2021 05:20:07 -0700 (PDT)
Received: from kansho.tok.corp.google.com
 ([2401:fa00:8f:203:5293:be68:a318:ba36])
 by smtp.gmail.com with ESMTPSA id v15sm2181680pff.105.2021.08.13.05.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 05:20:07 -0700 (PDT)
From: Kansho Nishida <kansho@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jiaxin Yu <jiaxin.yu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Kansho Nishida <kansho@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 0/1] dt-bindings: mediatek: update audio binding documentation
Date: Fri, 13 Aug 2021 21:19:56 +0900
Message-Id: <20210813121957.3089816-1-kansho@chromium.org>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_052008_992448_C19B7853 
X-CRM114-Status: UNSURE (   8.70  )
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


Hi Matthias,

Thank you for your merging! This patch updates the binding description.

Regards,
Kansho



Kansho Nishida (1):
  dt-bindings: mediatek: update audio binding documentation

 .../devicetree/bindings/arm/mediatek/mediatek,audsys.txt      | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7622.dtsi                      | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.33.0.rc1.237.g0d66db33f3-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
