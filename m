Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC74EC61DC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 01:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvQ9vLC15Q38Lz0nWGrTIxK1VywUskRZnArH+IjTnwI=; b=RWTuo1Qd2x6agim12amvnutpaS
	TJxIu0AmtIYa6MeHonUGmaOwYenRVXFEslnfvyRkv7iugCmBVDxKRUuj8z1y46E3RvkykyTXCVgCf
	u8q0vrFs8IkAm3X0ODNhelNZ274+S5LFnjf/6bC9dr7T7pLYOYfGUkIWoB7oMbE0QLslznKLMbIlf
	FLpDhoyXoEBGHHABrjPuOJ+pyi0tOpBrDOwgn9ateFBJKO9JyVghXLY7iJAk2dye7WX3V8EY5pNJI
	6SBRHrQrLkQnWVylGwnkwgxgATeLswMaeTlaEA8w/jHu6sGT6mF48FyeNoAiCraGEdl9xW7r0dE30
	mxaaFZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzlEF-00000004yyU-3CdZ;
	Fri, 28 Aug 2026 01:17:59 +0000
Received: from out-107.mta0.migadu.com ([2001:41d0:1004:224b::6b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzlEB-00000004yx3-1IIj
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 01:17:57 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vkWAAncEPqSCfjPN3H3wr6ysqgrRP13JfyJKI8czm9Q=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787879869; v=1; x=1788484669;
 b=Gbwa1ZrK/5lf9wiUzqwmI8B1wZ7sxn9QhT0ftXgMPwEAn1wDORhUBfT2ipvYRD1RHZGyBVGX
 yzVZiZz6HeF6+R+wexCKec6NSkwqC6mSmsaeGltKrg+eBvQcwrUBnJgG17zCVZ54/lE7FzItD0A
 UyUUa76OOn265DN2yvSRuZCp+XCtdy4fOga9HYOIcOIC4B9o2iP+10RPQ51RqISfLtp8ZYE5CcV
 f7CUiHPA1bTLOzSJS0fK+NJ+u0ViYdq2xoF1jJdLYAZ09lh6JiXioSMBoTiJL19NcXBX4kZgZAg
 kiiDHFkmUt1FcpnPcvIiI08Szib+Zj62IyEAqXyIt6Nmg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4063e950ceabd68a;
	Fri, 28 Aug 2026 01:17:39 +0000
X-Mizu-Trace-ID: 4063e950ceabd68a
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in ACPI SAR init during probe
Date: Thu, 27 Aug 2026 18:17:37 -0700
Message-ID: <20260828011737.22809-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ao3dyqWJ3nf3rMMW@soda.int.kasm.eu>
References: <20260825181712.28548-1-lucid_duck@justthetip.ca> <ao3dyqWJ3nf3rMMW@soda.int.kasm.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_181756_239878_C51B2B4B 
X-CRM114-Status: GOOD (  35.03  )
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

Thank you for the Tested-by, and for bisecting it in the first place. The
report arrived with the commit named and a revert confirmed, which is most of
the work already done.

Something odd, since we are on the same laptop. Mine is a Framework 13 that
shipped with an MT7922, and it has no MediaTek power tables at all. I checked
every ACPI table on the machine rather than only the main one, and there is
nothing there for any vendor. So your oops cannot fire here on the same model
with the same card, which is why I had to inject tables to reproduce it.

Which means the difference is somewhere in the firmware, and I can only see my
side of it. Mine is an Intel 11th generation board on BIOS 3.17, dated October
2022. What are you on? Whether these tables came with a later release or only
ever appeared on certain boards decides whether anyone else is about to walk
into this.

While you are in there, does your geo table carry 0xff in the unused slots?
Someone turned up on the list yesterday with an ASUS padded that way, which
the driver takes as roughly -1 dBm and clamps every rate down to it. Whether
that is one vendor's habit or common changes what the right fix looks like.

Devin

On 2026-08-25 11:27:15 +0000, Klara Modin wrote:
> On 2026-08-25 11:17:12 -0700, Devin Wittmayer wrote:
> > Some laptops carry a MediaTek power table in their firmware, and the
> > driver reads it to set a transmit limit for each frequency range. It
> > only fills in the ranges themselves when it registers the device.
> >
> > The startup step that does this existed already, but it never programmed
> > anything. These two commits made it run a regulatory update instead,
> > which sets the limits on the way through, long before registration. So on
> > a machine that has the table the driver reads through an empty pointer
> > and the interface never appears:
> >
> >   BUG: kernel NULL pointer dereference, address: 0000000000000004
> >   RIP: 0010:mt792x_init_acpi_sar_power
> >   Call Trace:
> >    mt7921_set_tx_sar_pwr
> >    mt7921_mcu_regd_update
> >    mt7921_regd_update
> >    mt7921_run_firmware
> >    mt7921e_mcu_init
> >    mt7921_init_work
> >
> > Skip it when the ranges are missing. They are applied again once the
> > device is up, which is where they came from before.
> >
> > Reported-by: Klara Modin <klarasmodin@gmail.com>
> > Closes: https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
> > Fixes: 9b80bd9cab40 ("wifi: mt76: mt7921: add regulatory wiphy self manager support")
> > Fixes: e9f3f1cc133f ("wifi: mt76: mt7925: add regulatory wiphy self manager support")
> > Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> > ---
> >
> > Reproduced on both chips before sending, an MT7922 and an MT7925, and the
> > fix clears both. Neither machine here ships a vendor power table, so I
> > supplied one through an ACPI override in the initrd. It also wants recent
> > firmware. The June builds do not turn on self-managed regulatory and
> > nothing happens; the builds now in linux-firmware do, and then it dies
> > exactly as reported with no interface at all. Patched, both come up and
> > scan normally, and the injected limits still show through in the power
> > table afterwards, so the skip does not lose them.
> >
> > With that table still in place and the fix absent, backing out the mt7921
> > commit on its own also boots clean, so the table is not what causes this.
> >
>
> Thanks for the quick fix!
>
> Regards,
> Tested-by: Klara Modin <klarasmodin@gmail.com>
>
> >  drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> > index 946dd7956e4a..b468051fbe68 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> > @@ -323,7 +323,8 @@ int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default)
> >  	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
> >  	int i;
> >
> > -	if (!phy->acpisar || !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
> > +	if (!capa || !phy->acpisar ||
> > +	    !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
> >  		return 0;
> >
> >  	/* When ACPI SAR enabled in HW, we should apply rules for .frp
> > --
> > 2.55.0
> >

