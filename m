Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F66C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F65320874
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z7Fxz/+R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="V4qGOuIm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F65320874
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uGeN27ZMjJRJfCoEqAgWIDn+EZVK/6gPwz7/f9zY6aY=; b=z7Fxz/+RbsMjKtFojfcJ94I08w
	2JqvRqXqBOOQ+2jhgSnGhl0JC9vxE+zm/RnZe8Vo5DQbseUcMj7Gj9ytcgBpavfYUGQYJBcPowggh
	d1cTMoE0Z7p9CatRrCAsqU8TVIhxjCXp54F7iuTzmedu6bpHVURswt923zTAQBXEheoErCFoVwDXH
	M+zS+0Dvf1ZGorQ77+FpN9LhNdOaLZHo9zBbdVPxucjOnccrIZ9d9jJqzY0byrPBFrszSav5RRV2R
	2xQ4S9MzicjGzsCxgU1zalkAdzeuVvwPdMKXnBTCqEOt3x1rN4PBhLMo0XW0mY3KLNyro+PtGgZht
	v/8t60Eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqphY-0004Ag-Da; Thu, 02 Jul 2020 03:15:52 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqphV-00049c-8y
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 03:15:49 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id k127so23829040ybk.11
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 20:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=lgjLNEI2c702nruZIf8/qVC3N2Yvj7eOc3xFcCXk4qE=;
 b=V4qGOuImI1av0lSmyLMJk52j2TEqAgPFSpa2IGTBg3P335rupJ/XJFDEVy6u3Y3nsa
 RxGOc5CrUOcD0Hx1SSX6EsLwS/YkM3rm9xE7r0RMJomNXcFqqngBD9LKQ8sdqsSMBuqt
 foksl0EJRlKlIsuDBk/TgVcq3AHjtf2S0T+hEssU9vC+kvaffGNehyx0mKdLema/9UQw
 76RivxWXQWWYbxnExz2m43fP0sc2RHIrz4bpQR6k8ck94uD8U3TW8qjdcGeItG3XDGWq
 8Lujvxr2kTUxQd9xNXkHoQ6fZKN3quOY96H0T651b5HMoiiTWgJvhDIqQoH5h8TlH97H
 1F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=lgjLNEI2c702nruZIf8/qVC3N2Yvj7eOc3xFcCXk4qE=;
 b=P0FisMeTwUs8XnY3tnOvjvKdfL6Uqa0wHpKDzQn2G3IKVNrgrrWLx+TAI7F5omEXah
 CVh+VJyqaHl/pfA83azr1KrsrC2E1+pLLhwqvTP+kLWUEqSqDTf1gy1EUhF/fCRzG6Hb
 2LbkZkzERcpqhKX3EZSRl45LWM4tPEegPQZiCyw0GbVzEK8O9B3qnv1r2MNZHAOr7xGW
 vR1QT4yEwKw+/SziFUvBbLZSObhY95uieEZgHjNvw0lR+ZXXp+cpiZyeYjIirJXK6jsd
 CtSntOMOh7RY13ee6fmxHdGUZe4kiYT3exa0ysuNjZgDV0Ie/KCVophGrh+AvdifVgdN
 QunQ==
X-Gm-Message-State: AOAM53198Nerw9Ldt9JP42wk1Yp7StAx63J7qP0918vjvVJRHaeGlfca
 YETruPsEyAWULxcZLQ7Jj642TiFFqR1zQR2J0E6QkcwPdzE6SZiLmcWWpWOGySC8rXNVQvs50oJ
 A6HRJhFeDXuLhFxfYhpahBOEUjchRIwvT4jQTcwXMe9jYbPHX3mI+vQIcp+2elfwNAb1DDFGk4+
 VS9EO5
X-Google-Smtp-Source: ABdhPJzMQo9PQ5D19hZdsGpjI7T+hKX4gBcCSrIxKzFL0IBLXNR6rgDXemM3ITzN7p5dT0NF4XRTdRDj3BcM
X-Received: by 2002:a25:84cc:: with SMTP id x12mr43165655ybm.454.1593659744675; 
 Wed, 01 Jul 2020 20:15:44 -0700 (PDT)
Date: Thu,  2 Jul 2020 13:15:21 +1000
Message-Id: <20200702031525.2662441-1-amistry@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 0/4] regulator: da9211: support changing modes
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_231549_335034_404070E1 
X-CRM114-Status: UNSURE (   9.96  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Anand K Mistry <amistry@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset adds support for being able to change regulator modes for
the da9211 regulator. This is needed to allow the voltage scaling
support in the MT8173 SoC to be used in the elm (Acer Chromebook R13)
and hana (several Lenovo Chromebooks) devices.


Anand K Mistry (4):
  regulator: da9211: Move buck modes into header file
  dt-bindings: regulator: da9211: Document allowed modes
  regulator: da9211: Implement of_map_mode
  arm64: dts: mediatek: Update allowed regulator modes for elm boards

 .../devicetree/bindings/regulator/da9211.txt  |  4 +++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  4 ++-
 drivers/regulator/da9211-regulator.c          | 30 +++++++++++++++----
 .../regulator/dlg,da9211-regulator.h          | 16 ++++++++++
 4 files changed, 47 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/regulator/dlg,da9211-regulator.h

-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
