Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4CDC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 02:51:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230AB22CB2
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 02:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 230AB22CB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ywKfLrB31MaSyxdbL8k036diuDH8yfAeMkFv3nIevY=; b=KREdN/qqOGOFA5JYd+pGxyggp
	z4564CusnMECAzJKatJXuCY4mL1brjazLAxN1yumQU4CbLXo9auB6d1dcBjSlJ+zmy5uJYpFCGtrD
	PmZS7m0Yv/mC+yjSQS5RqZ+K5zSgyPKlp+dFhNJGenbRqjeAlb55ntai/HPk/fuLZ15XkQbrzJ1c6
	VbLJUN+1MycVnZQeNK2Vy7a0kF6D6CCll46a3sX0Y7ZERubvz0BuBB6PP7LlHMLdqA9Q+iy+FZsk2
	Bv+20I0ZVhso7/jQELXOWmpCvelIIwHWOTj3R78YNWLgxKqhkgqXrBnsv5EfA/4C0Qhkdu2qLm2A1
	T5xJ6SXtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz9lw-0003S7-AE; Tue, 12 Jan 2021 02:51:05 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz9lr-0003Pc-8x; Tue, 12 Jan 2021 02:51:00 +0000
Received: by mail-io1-xd2a.google.com with SMTP id w18so1036695iot.0;
 Mon, 11 Jan 2021 18:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5w78tzUXX0I8RLg/o+73uKu20yriP3eTMDkxoUSEBt8=;
 b=NHJNCgjrOquzygHREJEL8tOelgSod+g5e14cUUQBq3m6q9Tz7J7kiFWgiqScncNVa7
 VtHn9W+sU/HKdfD3qR7v5xRLrKMbfNHHzzpC+dPGuA6ZVNhDN5GiTHPAdTX/GWIgL7Zk
 ZSqwdCu8uD4NTwENzTRv2gLX9uyzmLvoH+s958GGTh6A3pDLE5iw+rlFMt9azCpqzhPt
 lQ7W1L010BxxiDvfV29HppOK5smgJ3xRPGWdLQrN4kexe7ZVHxZZ+rpTK43nSC51xLYg
 6McdgrO73jIn+GCdIEab7GPB4pEvCTaXPLwtEnoISDVaBuXHuQH4eL9KDpTjz9lpejyx
 VtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5w78tzUXX0I8RLg/o+73uKu20yriP3eTMDkxoUSEBt8=;
 b=W2OkrUQiM1ok7mTgWBDv2NQ/1VPyU2K0SM4SqceE2nsGNk1dUaHEbthhsGXYNCTb7h
 iLHo/nyzp0Hqo1ftUAN0K2EbIEZawdIDb81/QM2tcyZ84hIvpnqBxWG08kCcOnaULj+o
 5PgUOdBQIvJ2rvkjZDX68jB5glgz0+J2BEMk02YVzteTAnFpnAcruZVY22rSPYQYaSf6
 GnNUEDHpeI4fpxv4NRVTYQVjto4sRZRVsB/X0VlQW2jyUrjpYXy5qBlmAh5phnsxsyAI
 LVp2k0U0LHCqrinjhEDun/7yrSuqvE1iPyVMjmX2Pr0UXjqzM/sierFDg6DGsm17IDPY
 WSqQ==
X-Gm-Message-State: AOAM533G8k1+urS5TbIcBYQFBKh6tD4Y4rmfTwB+bX3IShfMqF2AdGhj
 FNj7Zfo+nPU4h7/sPUWFKy4TCOUMg12m/NE9iEE=
X-Google-Smtp-Source: ABdhPJz0j5BLfPgmG13n4HxFvJkNZxPuemZywJs7U1swOc8i0mMqZy/C2uAL4yRDpNC/M7qFtc/loQ/5mbS5Plf+tnI=
X-Received: by 2002:a6b:b5d2:: with SMTP id e201mr1630874iof.111.1610419854594; 
 Mon, 11 Jan 2021 18:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111164616.1947d779@kernel.org>
In-Reply-To: <20210111164616.1947d779@kernel.org>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 12 Jan 2021 10:50:54 +0800
Message-ID: <CALW65jboizW2J1S0BYBrOM_xNEzpFM-gdJ6OF33+65vMiJtmWg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] dsa: add MT7530 GPIO support
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_215059_497363_591CDBF6 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWFyZWssCgpPbiBNb24sIEphbiAxMSwgMjAyMSBhdCAxMTo0NiBQTSBNYXJlayBCZWjDum4g
PGthYmVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gd2hhdCBtb2RlcyBkb2VzIHRoZSBMRUQgc3Vw
cG9ydD8gRG9lcyBpdCBzdXBwb3J0IGJsaW5raW5nIG9uIHJ4L3R4Pwo+IFdoYXQgYWJvdXQgbGlu
ayBzdGF0dXM/CgpZZXMuIEJ1dCB1bmZvcnR1bmF0ZWx5IHRoZXkgY2Fubm90IGJlIGNvbnRyb2xs
ZWQgaW5kaXZpZHVhbGx5LCB1bmxlc3MKb24gR1BJTyBtb2RlLgoKPiBJJ2QgbGlrZSB0byBrbm93
IGJlY2F1c2UgSSBhbSBzdGlsbCB3b3JraW5nIG9uIHBhdGNoZXMgd2hpY2ggYWRkCj4gZXRoZXJu
ZXQgUEhZL3N3aXRjaCBMRURzLCB3aXRoIHRyYW5zcGFyZW50IG9mZmxvYWRpbmcgb2YgbmV0ZGV2
IHRyaWdnZXIuCj4KPiBNYXJlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
