Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736B9C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 04:44:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28EBB22CA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 04:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28EBB22CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dcaSESew2+RgEXROwcBX1nYRnms/gzq7EdX4PSoiWgE=; b=w2ptcSZehNJWAMf5U3ypbIdq82
	ipz+cKV4Tnj1FtGVnaVc7ylyZfIzJvtLkgCSM1AbJK9afQK5CY+HXYNZzehnqLirulW/dav9ryUmT
	+ZbiljKkyGqDjEom1JyG5Unxk7gqZVZzJPZgEoSJOZ5RMQhwD+FLX/eHy7khXLg/tp05+WE3w1urQ
	WK8w7daDTSbgScuG2O+nY9kSXSrxrBo0Ycj985u3iHfneCXGAMPml+QIvN34UgEh3tjfHLtfFhAqb
	N/Gz5Qw2Pk0oMc1Wxp97Y79CMwc/I27XKiWpsgZ4sAWaHSPmh1buRt+hgzADozUnopNo3inicBp5d
	5ubyfD4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3tj4-0003Js-Oh; Mon, 25 Jan 2021 04:43:42 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3tj0-0003JK-I9; Mon, 25 Jan 2021 04:43:39 +0000
Received: by mail-pj1-x1029.google.com with SMTP id l18so1693084pji.3;
 Sun, 24 Jan 2021 20:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CjKIlCnAp40LXXxyE/ljdpUidkTMFHjswfBhcPJLNKE=;
 b=VtI1egLQ+tTQjQ5Tm7aJkEIjjZs60jUHxCHW3mSwKzC1nChsvZnb8tZekBZYwd71eb
 XP8va3jFniMofiApITFRgf87GCMYrAGcBZx7YQfvNjazFadZXiD/l9lPVHoqb0bcaaGu
 akG0Tkum04+Xl7YXFw1PNdVIU2okgZp1zHhYRw+6hRVhxZnpbOuSqyiwrp7FZx31soqO
 NQ84m1csamiGXIP/AzGz5o/3CQQEi6XIKC1UOnw2r882Iu8oXRxrYXItJ9pY+ZeuxI61
 o6wSZhgLE8pQMIP2mFeZaV44qfnknDZvQ6Xjen8RfTVyrFKRFK4uEfp3dUxnYnbY4c9m
 +04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CjKIlCnAp40LXXxyE/ljdpUidkTMFHjswfBhcPJLNKE=;
 b=lDRj3CelbebLxi5I7+zdQ+pSjkVKBDhGK7HtKmhmhMxEj2beNwj5cDMu7g9EMc0Hru
 L+8UUXJKhCG0x4oKtmi4K396ZkgbvqMPZwKlZsptZfl5if4I/uWj5sGnpQxTcO/PUs04
 kMY1Kg4aKmt5sAMoKEj1BwLzuQpP04b9GmVvHImLlbTm1cwoep/pzRpd9Y9EDQlp8Yoh
 N/3fGPBa2eq5jyoAsn54P7uJVM2D8HHXRACRJfxzJOXcOcvAQvoLVejkMemtE/RNcUSE
 P1cAxTjztnUJwLWMICXkAH6VLYvFni52rYzhFnGtm0r0oJTvs1R/6gGnLmlZdE8JZKcL
 qPFg==
X-Gm-Message-State: AOAM5327L/TI87pBh8CKbKRva0G25Evf0BGK8eYu9vhsgqf/rq6bTXGp
 HsdCUvvVVylC0GapLy2KCvs=
X-Google-Smtp-Source: ABdhPJxbu3zuYr6d4RIC2ayqOy95V7a1SqBzIS32F4SdMgpijq7017S96q5Cz87Dr6A7fv32F6tAEA==
X-Received: by 2002:a17:90a:8595:: with SMTP id
 m21mr4717423pjn.111.1611549816841; 
 Sun, 24 Jan 2021 20:43:36 -0800 (PST)
Received: from container-ubuntu.lan ([171.211.26.203])
 by smtp.gmail.com with ESMTPSA id h4sm11913369pfo.187.2021.01.24.20.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 20:43:35 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] dsa: add MT7530 GPIO support
Date: Mon, 25 Jan 2021 12:43:20 +0800
Message-Id: <20210125044322.6280-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_234338_631675_B4327982 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7530's LED controller can be used as GPIO controller. Add support for
it.

DENG Qingfang (2):
  dt-bindings: net: dsa: add MT7530 GPIO controller binding
  net: dsa: mt7530: MT7530 optional GPIO support

 .../devicetree/bindings/net/dsa/mt7530.txt    |   6 +
 drivers/net/dsa/mt7530.c                      | 110 ++++++++++++++++++
 drivers/net/dsa/mt7530.h                      |  20 ++++
 3 files changed, 136 insertions(+)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
