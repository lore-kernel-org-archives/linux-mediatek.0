Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D51DC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 03:49:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB3720709
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 03:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X2QSGOeN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tONaBmoO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB3720709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jxvP59XAvhvmQoIWHq3Q85pzrpqujsm9+lG1fvRh6Zc=; b=X2QSGOeNXj/4QnsZYlQspxMRh
	PXFMBgBiH57/IFufv6jByRK9Zl8YsObTjDLWHizjREE7ZaCW5E6+vDoqrdN8DmH6jUW5yMKU+tj2C
	Wg2stvgMcbUOE4XP3qxgjk3xazVi1fXduTEqOZCEwK/ZrLhSU8yhnnV//E1sWxrC5c83dbCThdgM6
	aUVKuCNIU1VJVg7QjUXuA0S59LNjek45q8hFO2xDrrooa61+cnKhGZgcZZGrmPEW5zqy/UkMWd6J2
	jeahn1VuYBDdNrXAw8B75e+fBrCaegW8xcRLsjmKoUAWroyOg4T3LYspQTuGz6tAn9S0rhkmslV81
	kEOBTUl6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8F6W-0004jM-IO; Wed, 19 Aug 2020 03:49:36 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8F6U-0004iX-EU
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 03:49:35 +0000
Received: by mail-io1-xd42.google.com with SMTP id q75so23456795iod.1
 for <linux-mediatek@lists.infradead.org>; Tue, 18 Aug 2020 20:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=31Pn+vyy/OxBJKmzJxO+6FXSIT/jmPkXuyC19k5Pzvs=;
 b=tONaBmoOnjOaHU/VOEMNYXxmfOdznr+BZCfZdQluPThLLdL5dr7uBPm8KEy+cSlRPE
 9CRB8HlU/XUON5y1jdnhtasvGpzgikjlcFhqjEcIqoeruLpnfaA3K+6LHJJYQxKKLeCm
 WINSm8gQWy8nxZr4uGGAdDe4I2WJEWD3QxJ3xPvM/47/NxI79huw4dwEvTcfz+KOjxHr
 3BgH8+Gb2GOtNZcBj3BlRGfAJViEY17VT79teaPto2gxNDmrYjUCVjn/II630n/oZZHy
 yjN61HSqDpX5MOvzUp/YJR9rrfG4Dhwv57f/a03DvH1RQ/vQmNwQM6J7n2DCNd9dgvSd
 YBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=31Pn+vyy/OxBJKmzJxO+6FXSIT/jmPkXuyC19k5Pzvs=;
 b=hGCDNsRFxvdGE9mzTbNYlJMzd24SF2DqJ6+wsqs9+TQJMGK/2nFoGKUux4jYX8BCcZ
 AH2BaPWdiZ6jWBPjUEdXC75w/fUmTLAxoFSMG2M3ZcDdXKrJK1FKTUKVEfkp4TuHj53j
 jfACJWU0FYfYfR9az06j5CB4OXq4s7YarZLyzHZCiPzCZwK812OZbPrU5LAahym/9xzS
 w2Pt2MD2KsSiHnRVPOPOwprUJlSue4WaT6p4hRy8FXVbvHHtOkUQLS/BkUEPYOLcErK3
 B7mcWvTO6gmdjJWi8G6KyYIYQaLO/4jXlvZ1mtmluowpbFIWTTY97x8K4vRyyOyW4MQw
 mUWA==
X-Gm-Message-State: AOAM532haLmmvbN1Sy8Jd7DPp5O4Tb3SDhlB6ItNLMiTZtANNuI5vwnL
 ZMMgl1S0VwQfGH78ubBXql+DPQywQ8K9agB5IVk=
X-Google-Smtp-Source: ABdhPJxiFnwR4krw6L9w1YyGDNqAoI0e5YwKQ6usbijlbVVzNyvk9QdYWoQa+p7JAZtnW511U9jy+qym9HUzbER4o/c=
X-Received: by 2002:a05:6638:1a7:: with SMTP id
 b7mr21799413jaq.1.1597808971328; 
 Tue, 18 Aug 2020 20:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597729692.git.landen.chao@mediatek.com>
In-Reply-To: <cover.1597729692.git.landen.chao@mediatek.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Wed, 19 Aug 2020 11:49:20 +0800
Message-ID: <CALW65jZRWwW4DqpsCM9J=GRp6KnxqT-9MHUO7WSRJtp4E9vnFw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/7] net-next: dsa: mt7530: add support for
 MT7531
To: Landen Chao <landen.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_234934_507877_994FD334 
X-CRM114-Status: UNSURE (   6.79  )
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
Cc: mark.rutland@arm.com, Andrew Lunn <andrew@lunn.ch>,
 Frank Wunderlich <frank-w@public-files.de>,
 Florian Fainelli <f.fainelli@gmail.com>, vivien.didelot@savoirfairelinux.com,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Is port mirroring working? Port mirroring registers on MT7531 have
moved, according to bpi's MT7531 reference manual.
Please fix that as well.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
