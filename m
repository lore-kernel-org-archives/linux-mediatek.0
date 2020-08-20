Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D813C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 07:54:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B992076E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 07:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pJHhczRS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tYF2/zRf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B992076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7aEUB6KbEqKmWcZYqnNTv//xiofngSUJzcxe9N1ObcI=; b=pJHhczRSsZ2K6eGFyDzJ5TkX8s
	Tae6CA2pzGTFZvu2lNmed4EdAS52xaoGBTiaNAchT5KLsZ5+Y8aoFJi9P+VU8zGKS9ACJzAhmZSMh
	MxKbojEpbUrhZcXG7nxzSjZXGPQRb138krs3w8KquWi/cEOyDz3bD/r3595n0PEvlnLbHI6xWlJE7
	wP/cSTGtko64dvRuhuqqLttGBY1p5sX8Vbh548suAU5s5iTt8lmQqqjbkmuyRCK79eDxjYBW99KSh
	z7tRb+8sC+EUcnXzLy6XN8INi2WaoM1/ICMzC+OmiMyktwsSpmiI/fV5p3e3/6dJgc/wKpygcLj82
	Bx0yNJiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8fOm-0008Ml-Sg; Thu, 20 Aug 2020 07:54:12 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8fOV-0008Ck-QA; Thu, 20 Aug 2020 07:53:57 +0000
Received: by mail-pf1-x436.google.com with SMTP id 17so617631pfw.9;
 Thu, 20 Aug 2020 00:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=V7dpkHJntuEfI3gKLsHKE5NL3K2FF0k9pm8mQcVZr3Q=;
 b=tYF2/zRfp2/3qZWZpfB0jI6w2gnBzZfpQeDXb6SkrlT75Uf9PlzW+WPVgo9Ym1Ad46
 GMeVOeZ/Jh9Zk+wh94FZsa2VlbLLZfAAX2ZaZ5IicN/bK1WFlEfs0Eg8x3SIygqcpvEt
 UJxagkQDG/PDSn9VmyXjO+6TbreP3Lg6xEXEfjmmvPVYRhYWRZOtJOGWX5b0zd+cVgkL
 +GN6UZVaqnWKOxLPZQGTJ1L0BNrFLIBQyam5No0lHpnLFqV+TJSt0DfCXDOIxEt94Uzk
 tIhFGesaA2gy6Voyk3GVN3QK2u5AhzzM0nLArhVNeCXaZGeZVTViB3KM0OKL6rVsO/k6
 cu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=V7dpkHJntuEfI3gKLsHKE5NL3K2FF0k9pm8mQcVZr3Q=;
 b=UkEwfkFPx+jSreT2+zXjfpudgqF0yd0MxISugqQa/JU0Msdg0Q2J7tE0n+fyMnb7w3
 RLJXreQq4KKaak/7oGTQVSMPFlrTxjfL09P7/Gi5mhNLDAYeH5ciO7y+Y+W6yxhQlB86
 pkGQux4PTXVH5EXWtrKMzuph6aXKmErRZ4vqqqKuVBs8GYUj2RmWLmsRul8yLmc+ArMN
 m8UtmmTkSf72jgSjgSZKqK4SZaI98r2DS0SUgh2FLKhy1NQccrlPo7wsZg6CF2eSonWY
 ei/D9W5Xwo7lA991x34hdJjmSxsod6gFRIm95TUJH6X4m3PqUeIWZiS+20RFiiegrwj5
 YMdg==
X-Gm-Message-State: AOAM531dukGD7TzO2MCDuf70onS+AjHAJxI7XSipNv8b4CaWR8y8Pr1G
 KXDZKQd+PD1kUEdsLtmMFpw=
X-Google-Smtp-Source: ABdhPJxcTwXfOx9IDdIc47j4nhuqEyt43NJ7bWz9WAYnPXuZZyknl+AgRk2hE7/Mk44d+zJ8Vw+iyA==
X-Received: by 2002:a65:4148:: with SMTP id x8mr1596525pgp.245.1597910030790; 
 Thu, 20 Aug 2020 00:53:50 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:577:c217:67e6:a40c:a3bf:1945])
 by smtp.gmail.com with ESMTPSA id q71sm1273832pjq.7.2020.08.20.00.53.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Aug 2020 00:53:50 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v3 0/2] regulator: mt6360: Add support for MT6360 regulator
Date: Thu, 20 Aug 2020 15:53:40 +0800
Message-Id: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_035355_911003_F037EE01 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: devicetree@vger.kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add MT6360 regulator support contains driver and binding document

Gene Chen (2)
  regulator: mt6360: Add support for MT6360 regulator
  regulator: mt6360: Add DT binding documentation

 Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml |  109 ++
 drivers/regulator/Kconfig                                         |    9 
 drivers/regulator/Makefile                                        |    1 
 drivers/regulator/mt6360-regulator.c                              |  458 ++++++++++
 include/dt-bindings/regulator/mediatek,mt6360-regulator.h         |   16 
 5 files changed, 593 insertions(+)

changelogs between v1 & v2
 - regulator: merge regmap to mfd driver for r/w with crc

changelogs between v2 & v3
 - Move regmap define to MFD parent driver
 - Add bindings document


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
