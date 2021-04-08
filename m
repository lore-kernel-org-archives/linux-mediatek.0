Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B1AC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 15:00:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A04E610F9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 15:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A04E610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ueFaEdzwueue8f+V52q+v8wCD2ZOQQai9i5eYulZZPg=; b=Y+n4X4tCtRgeGnAo8Cn1pacSe
	AN3Nh9haLZzSLUC9OScN7MxiPV7/5bJ/WH65yQKbo48VcRfG0cvNydoUfoBgF4RIpGBTQ7G179Z5Q
	VaVIhWRa9qSTEPQvckP+MkS9rjaEmt2h5GzLTw0DN2oUepk667BY2rxJeHtIMzzPceQDP1VU8h4MQ
	TeXHJzpdTAMRlXCGMCMo640ZGRlotjCUvEpokwVQBPhhC93Bb2ASyd4JFk1Jj+F5gU9jOio7Jg41I
	hGHd+8yyzDPiEfwUfP89GixdkZnT3YN+YH6FYRdokLshWYjHCtrrIQDlq6qBQL3Yx8bNU8wXie3Sx
	YaYmLEgHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUW8v-008Jbw-Lj; Thu, 08 Apr 2021 15:00:25 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUW8r-008Jb8-5I
 for linux-mediatek@lists.infradead.org; Thu, 08 Apr 2021 15:00:23 +0000
Received: by mail-lf1-x133.google.com with SMTP id b14so4532977lfv.8
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Apr 2021 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FjPNKJFXnPLlIkn9ofe/hgNOiX4jHuRRHt6hgl/CzlA=;
 b=XbZQ46kuRoE8CvvYGZdRG7dg/QOplHjo7etUJYk4YVHrjZT3NA85gaoysHXoEEMscI
 5eIzjIauhjJHRn+s2BeO6XCW/EP6IrCLfCsVbyDyrXM3rg0uFrSBSAYOLHTlOhNwux0B
 5eVE73WtGFAuKNOUnbvg+u0JYoB+0Ah4UenNLHTLYmBzLjXeaOAQoLGOeGQQ422RsPfi
 Hcvu7QB8tkyboyurVK1mjBv9DEqucCDuu3igcXiJ5GZTW3T3cGJBdDcU5FUP7f+mphm0
 ZmsLpKKnyHiHsSH38Cud7G2mu5HWtCsI3f0l5qzwjUrfneucL4Bg2uatzY8F+tp45Sp0
 aX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FjPNKJFXnPLlIkn9ofe/hgNOiX4jHuRRHt6hgl/CzlA=;
 b=AYIeIgqNvYO6gequyGVIqc1qXo7plZ58s3b1XSwJ3SYg8idEYTGwmjMeyDI9zKfS6u
 FlggPVLnlTWE2p8fUc7Uh3Po/6M8HMqJ0PloBbVUFEIG0C+0V4h0QG6/xQn7X9oCiuyk
 8y2G9kctu0Sv0BxnE7WTIa0iwTvWaoY/EUbpEMXyDyGyeipMKtQQWuDjJau9T6r8UpQx
 sl9l0r4lR2ETUpk9yCWLdL3RTC1R9nW73j2+Amrv6azNmqAOhrJIzvFwDXGMhKNxcSzu
 lJGNWqHuxpETkHYg51xpuO63Gmth9sBSYEx1mmD0SOTz/k/Q2O3P072wnBWOzVEbqa4c
 Mc3Q==
X-Gm-Message-State: AOAM531YiYjECQ6ALXWHLm9QJQ6UB4jJ15T2YzKFihqpQnSxJFtES4A7
 A3WJ1T5w72eLD/LVcxa6AG6uByP7/+dxZMp7zlw=
X-Google-Smtp-Source: ABdhPJzjEAtp7tSnx5kIvHtgEJeseYxS+FKQnHvpnDHWEm/cOFqXyqTMKAR3dgjC0R3Fe6+Hrb+V8yEVk7P8pi+tQOc=
X-Received: by 2002:a05:6512:2295:: with SMTP id
 f21mr2490389lfu.166.1617894019468; 
 Thu, 08 Apr 2021 08:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210408123919.2528516-1-dqfext@gmail.com>
 <20210408140255.Horde.Pl-DXtrqmiH9imsWjDqblfM@www.vdorst.com>
In-Reply-To: <20210408140255.Horde.Pl-DXtrqmiH9imsWjDqblfM@www.vdorst.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Thu, 8 Apr 2021 23:00:08 +0800
Message-ID: <CALW65jZujSCk16RX_xgcg+NGrc9yyFQOQ9Y-z3qz-Qv1TvUQLg@mail.gmail.com>
Subject: Re: [RFC v3 net-next 0/4] MT7530 interrupt support
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Sean Wang <sean.wang@mediatek.com>, Vivien Didelot <vivien.didelot@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_160021_536182_4097FEEB 
X-CRM114-Status: UNSURE (   9.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgUmVuw6ksCgpPbiBUaHUsIEFwciA4LCAyMDIxIGF0IDEwOjAyIFBNIFJlbsOpIHZhbiBEb3Jz
dCA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPiB3cm90ZToKPgo+IFRlc3RlZCBvbiBVYmlxdWl0aSBF
Ui1YLVNGUCAoTVQ3NjIxKSB3aXRoIDEgZXh0ZXJuYWwgcGh5IHdoaWNoIHVzZXMgaXJxPVBPTEwu
Cj4KCkkgd29uZGVyIGlmIHRoZSBleHRlcm5hbCBQSFkncyBJUlEgY2FuIGJlIHJlZ2lzdGVyZWQg
aW4gdGhlIGRldmljZXRyZWUuCkNoYW5nZSBNVDc1MzBfTlVNX1BIWVMgdG8gNiwgYW5kIGFkZCB0
aGUgZm9sbG93aW5nIHRvIEVSLVgtU0ZQIGR0cyBQSFkgbm9kZToKCmludGVycnVwdC1wYXJlbnQg
PSA8JnN3aXRjaDA+OwppbnRlcnJ1cHRzID0gPDU+OwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
