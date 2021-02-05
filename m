Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D80C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 07:19:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE2964DFA
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 07:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BE2964DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4crItir2MiG4rWjPhn9Zq5n0GtSGGOnU6JvMxhqYyRI=; b=JFct1X7KjBneMXKEaCLMH6sGve
	FgsEs+LupiX9digOZfANw2r6MEoBI8NbKmk0PfOfHZYrdK9T86fEaSjrE51RLkPywryNo0UBBir4t
	Z5thz7dSwgiWsfEOA29JJJ0dAizS+IuBFlPIr+a4YXWxlW2wFAMIUfrTCb4oDjkohHQJyDJwYlUIt
	0faKBYK5aNNs/oT2A65cTwOzRFuuHuTtOAHD+AfwDkgcl79aqNSyZjFnO3mDY8X1MtT8LeJ2MPVKi
	OyoOImqhHlaEdQehvezz5+f8bICp1vVubqnqUhrCUedYr6jnAPPmfwTNjyMzqyKGt+wfxdSr+EGyn
	+g1DVreg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7vOD-0006Zv-3W; Fri, 05 Feb 2021 07:18:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7vO9-0006Xl-4E
 for linux-mediatek@lists.infradead.org; Fri, 05 Feb 2021 07:18:46 +0000
Received: by mail-pg1-x52f.google.com with SMTP id o7so3944013pgl.1
 for <linux-mediatek@lists.infradead.org>; Thu, 04 Feb 2021 23:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPvlIT0HoqfzZ/kPoc529sp4UTquUpxTHygdzOzpf6k=;
 b=h5bCogGGi7kKVjxcIMg4MtTIPxABpO83xNsg3cS18Ysfjkgf3YP4g0i/WfSRE/swuo
 GKdATqNb65ipswcMkc7mrODTQcUPPcPgUAkT7IPBdhFzk/pzwouO/L3WnV5Dd58xUosv
 sjTmUS/N5RvxHotu9O+ra3mIwOWYPx2WKtPGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPvlIT0HoqfzZ/kPoc529sp4UTquUpxTHygdzOzpf6k=;
 b=RXfwGhAeIwupU20xFDT25Vgyhbrv1nVaRmMS/cW/n8gXGNJN6rTMNW5HsxM0FC4DgE
 B6/KJ4WhlaBD9le03oHYbon8zvxuO41GFbEZ61W73hU+si1yfPQ/oodKwXWiaDcBtpCB
 Tfw3sxUYAm/zuDPrxw2fW8Da/aNIRIeDtVMdNaNQ8m0M149SHGWk2oEgL0WWI0MS/lRt
 YoXbBD3v9OUwcZsBZYv8/2xo7gNAWr8+qolfGckBNjfvFg+P+W1WgKB1DZB4vLGa6Ayo
 HQayQT1Y9bEjwM/BqQmJhWvB2nyz20rnc70eQBUwxkuTlQvH0PsTZpHEMvASOoHkcYQA
 MjGA==
X-Gm-Message-State: AOAM532+JrrgDTLHxdGJEVEkaU5N089Woy9NroiyuydJZUHAJ1+9MEMj
 hbollU/fF8d8KW2YSRIafX34Ww==
X-Google-Smtp-Source: ABdhPJwt6ELkujlzDtiBO5NFLk+8rtHdnqs2ggIxilA4kdYsoyGvhf/+SwXS3b7NARo3AkRtwa28lA==
X-Received: by 2002:a65:6152:: with SMTP id o18mr3112704pgv.392.1612509519160; 
 Thu, 04 Feb 2021 23:18:39 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ed70:6d43:9c6a:2e22])
 by smtp.gmail.com with ESMTPSA id oa10sm6292028pjb.45.2021.02.04.23.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 23:18:38 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/3] support gce on mt8192 platform
Date: Fri,  5 Feb 2021 15:18:30 +0800
Message-Id: <20210205071833.2707243-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_021845_233636_5BBF80F1 
X-CRM114-Status: GOOD (  10.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change since v2:
- add controy_by_sw for mt8192

Change since v1:
- move out shift jump patch
- remove useless patch

Yongqiang Niu (3):
  dt-binding: gce: add gce header file for mt8192
  arm64: dts: mt8192: add gce node
  mailbox: cmdq: add mt8192 support

 .../devicetree/bindings/mailbox/mtk-gce.txt   |   7 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  10 +
 drivers/mailbox/mtk-cmdq-mailbox.c            |  10 +
 include/dt-bindings/gce/mt8192-gce.h          | 419 ++++++++++++++++++
 4 files changed, 443 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8192-gce.h

-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
