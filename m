Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B578C88E56
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q640RqR38QE29MmVFWdMcnQiW2Q7cR4iK1FcWO3aAjg=; b=bXu8r26azbP8rt
	LyRK1NMi1F/6rekpZsvow5MOHSRZ37DI8tNpIRBWIVRHewcxxik3ZSAuEDNeKUqk45vFaeXlpeSr0
	+Yz1QekHphPm3ULplgEZRGsLzzGLZu8YNoqUe+uQNxg7VWKHqU26Z/cVj2olpd8+0dAznTvUk576/
	p9f65Rd/xW7NOfT9WC8cd1TP6iMPMtTGVjAZo8Evd83ZMxqpWUi2bc7gN6JoLOi/AgOELi1B/0spw
	oO6TdNFHekAm8cVGI8vqntiwdO5sIbBWn2wYKqwK087TRJIwMN6wcv3YooFOUiRWeCraza5WRNu4c
	EjJ6OjDxxIVyfi+KxLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ4-00000000aDW-0B1x;
	Sat, 12 Sep 2026 06:41:00 +0000
Received: from mail-oo2-x00.google.com ([2607:f8b0:4864:31::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ0-00000000aBu-2rr6
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 06:40:58 +0000
Received: by mail-oo2-x00.google.com with SMTP id 46e09a7af769-8047334328bso495711a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195255; x=1789800055; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q640RqR38QE29MmVFWdMcnQiW2Q7cR4iK1FcWO3aAjg=;
        b=BVoVW7EGRHbkgWXsEvfU7nTj2xY0e5wKYCAcgH9sPJJ9QtLyWzVUQnuf7ZyddAbwN0
         8aTZ+lf88w2PVinVKs0vuIZZw0V0m/DOb43QW8596AB8IYNnCgZUi3iFhKscwUmbsieP
         JZsaQdZeKMOTS4VEvSMcLeOK/LZ99ZfrgqTILXfKf/MZwz1XNAd7DYaBeQKPu4SbYiS0
         L8dKSQxn/EcFfAzCjJAkIv0+13KEGrd2CiFNPAd/MGSfsM6dD5NBDiShnjeXr1StcGSP
         xCLxpon2tVD9eW5Phbg3S+ilaFsc7ppCN1b9tka4qWGsMXNRuIMJsi7sLAaUY2PKc57h
         ezlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195255; x=1789800055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q640RqR38QE29MmVFWdMcnQiW2Q7cR4iK1FcWO3aAjg=;
        b=VXJyksqFRDGHGQr/RNyM5Y2qD4WpSMnR/K+shC4IjIbe3s8lXojbEQvRQ3hSqOe8xz
         DhiadQvTvom5H8Jf9mk7iqkfv8SizhYNvCjo2Pr6Smht1euXDmTbL7FaaslRDDNKHtuq
         PX5yZ2ukWOSHA+NshS8CUpwJyvOzfgyBBVHFdZC5nBvm7JTaKm9c2K0ia4tPe7YKkR8l
         6675+/J3QhDoXL+lZ7sYOQgPPEL79sR+kVhDWAnMu//9gaPmPlr3CNdr0vBFFkz02R7Q
         urog8MevvLhhws4jvv+NOqIOK9k6jSyE90gLWWXgIroQAXGfyo6QWJAXX3rhVQkFzYAB
         GhDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu9WgJBbIQWde+yagoYeRrrPHAK+wnjDA/Kr0Cm2+mGQ+bQlDi94WEt6Yx6ywlWws7rvGiiWA3ATR0dVQevg==@lists.infradead.org
X-Gm-Message-State: AFuF++nOsa2CEJpe40dtAMiy0nN4E8lP1R5yYcJyxybFlD1WiVJo0Tub
	AFDR+Naro1NpV/teqDdsT/bIHp//vnAGHAkTzps2E8Wk2VkYBmO/fwFA
X-Gm-Gg: AYBFou30+aPe1lJHgwLt3+i/k7EEliTXpm5RgVxTwS6rweFvefF1ZDqCQeKnzUkLRG/
	2M3ekJgjOfSWgugzyTY2I/WADZv2i/SMBqbziwXWIfzY7/qUg5jyfhJclv6dAb6iG5RwzyTCTgX
	h5KCEXBy+m3QJKBMsnvKNonHpW3a769+IQyYYael/0ESzWI/Agwxe0Ba7U4XBibuGRoCJLkW7ix
	HadCSBVYNWX+CaHX4QJhVaWGv2bWP1ZT1sDImGMGTruvh0Kjtd4lZOTW7o7Pif5+ONZaEmgNs7E
	ynx9xMApyGbfY/JKTO8p+C37zA74lgLHazvM1JgrLny78W1CxDIoPIPWGXlZ74np3mqdbMXMxUP
	gE37MeVPngB4G2A2SsL9PckKw/SI9kXlL8q5VpdSalq/vvkm4/RuaiPdT3UvVi5NT0aMmNPFUVP
	/DBCXj46y9gtc91jXXoEIP9TPxAwmibJ5wSubInb5xqXfK5KiJWyBa213LIvsAhAG9Ss8=
X-Received: by 2002:a05:6830:348e:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-803fd871808mr7192047a34.11.1789195254741;
        Fri, 11 Sep 2026 23:40:54 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] clk: mediatek: Fix FHCTL DDS mask widths for mt8173,
 mt6795
Date: Sat, 12 Sep 2026 01:40:36 -0500
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CQAyF4VchXduEjmZAX8WwgGmBakAzHS8J4
 d0dYfkl5/wLmEQVg0uxQJS3mj7mDDoUEMZ2HgSVs8GVzpdncjilmqoj9vpFZsOptTt+lNOIPnQ
 VBd/LiQny/xklr7b2tdltr+4mIf2DsK4/qaqIzX0AAAA=
X-Change-ID: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1557;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Zt1FOqW2KqdoRYXtktantBzoTQDsX3R4Zq/f08ZKesg=;
 b=f+gU2KPV4GL3RlxKjra3EBgbSRpjeS0ghAYC7hkFJHSavKdwLttmPfViyyZOeMjxCFe3rP57A
 +UtDJosJl5FDBkDh1Pme7YytT+JN9WWHnOdfvJLKSqQ3pYoiBiSGLRM
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_234056_740836_16BCE117 
X-CRM114-Status: GOOD (  13.06  )
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

Discovered this while working on bringup for the Amazon Fire HD 10 (2017).

In f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping
through FHCTL"), and 45a5cbe05d1f ("clk: mediatek: mt8173: Add support
for frequency hopping through FHCTL"), the DDS masks were set to the same
GENMASK(21, 0) as mt8186, mt8192, and mt8195, despite not having the same
pcwbits (21 as opposed to 22). These two patches correct that.

Tested on an Amazon Fire HD 10 (2017), an mt8173 tablet, across 6 MMPLL
rate changes. All of them timed out prior to this patchset, and all of
them succeed with the patchset. mt8173 currently doesn't use FHCTL, but
this will correct it for the future in case it does get used.

I do not have an mt6795 to test with, but mt6795-sony-xperia-m5.dts is an
actual consumer of the FHCTL node, and switches it on for mainpll, mpll
and msdcpll. If someone has that device to test the second patch, that
would be appreciated. I do believe this is the correct fix though
regardless.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      clk: mediatek: mt8173: fix the FHCTL DDS mask width
      clk: mediatek: mt6795: fix the FHCTL DDS mask width

 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


