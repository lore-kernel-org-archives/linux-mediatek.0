Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB20C61DCB
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIbTgQLKlI2fS2y4pLFsdcXAtLTrLaglnOlC7jWM3PA=; b=fsgLQpprQNNyL/jFeWNuZw175x
	17H1hF1k6OTs+T2BwZ2yMyLW6gk6LPImiv6EguUdYyzjmoIHc7I1SRC1hkDfimKG7YRVxae64IVBT
	LaOU9W4GwnZg1z0o6rp6ftnw+Ma3ESeqN+RK3mA+z68zqdmDbAId9C7uKrUlXRQ7NVtM/w1qkwPII
	16nrg9W4OCuJKCxp2x8iOfR3Sqhdg3swYx51MRp6GzaWymEZ9EUyIQ0DHdcTMGGojDv4C0K214P3G
	qrPIoqU7uLCjUIPPWLyxFHy1xP5osKvPV8Uv1EQJ6aiW5Rrw4KvlDbgcIe2i1fZhPXo0x8nRjADp7
	SxSgGTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyUA-000000065o0-0nZS;
	Fri, 28 Aug 2026 15:27:18 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyU7-000000065nY-4B5z
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 15:27:17 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5b4ab40d839so1018238e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787930833; x=1788535633; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UIbTgQLKlI2fS2y4pLFsdcXAtLTrLaglnOlC7jWM3PA=;
        b=e9DwFjeTU4Sy2PXJt9IvhWIbM9H5b5EELmqXPkcXrsp3R/brOiWaSpGQg9clIH614K
         dR2ldlfGp41hCjLi9LLoXkzyCucd+WwbBsSV3Gr0fpRKZSsbddadl669JuR++4bc6ow/
         pd1UgNjLSq4nGrzQe0Y6YRhsNDsK6yESM19dZjijXGxOk2Ums2JgCnhuGp99MxgzNQeZ
         a08XKsnCO+B9uS4MHrELe4Ix/HZNV784Ijs1UQwuUDX1+uhyTxw0N7/69oj63sSbjcml
         sOlw3nWL3IFBqURBMZlgFoNI2ghUrAh6mA41mMdkhNe1XjahnfImCgaCxq3e89CeTG48
         ZiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930833; x=1788535633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIbTgQLKlI2fS2y4pLFsdcXAtLTrLaglnOlC7jWM3PA=;
        b=PH9fv/U8EfoU5f9hnSN0IBxkLOQSq/j1zD41wePEJcjIjNwdPIqaF8xuvnq20xtw9T
         Wr72hyTH3HAvil95aQ/8EN6hxx3ryU+CHWGxmmSFC5kURohJHuPii6CWC4OLLUjF2Fl6
         nEEUlrIJabqUunVXKO/pDta4o+05zgPSXPxbR3fSA+MZ2RMNBCXV5g6PT68SKbSdcoRa
         ituhoiZtOh7lkiFkCBtS/KLy43vaoFiFb//GqtwJyhQ4SgLVep/igN+2J5Mbi74XFxC8
         z8vhT4I866DjGTm2WX3Qf5XQiblnY65/moWGzhpp+l/PktTTscANXUjKc4jqp/JqEqY5
         7KVg==
X-Forwarded-Encrypted: i=1; AHgh+Roj6XGbh0o8NmYVmOjhYOi6pZLnXL0w4XAaXZjFdDpYWbXLCRW4110G5s16t6BgYYGxUxSb8khjY5hTcE+QJw==@lists.infradead.org
X-Gm-Message-State: AFuF++lSLvNJch5W9cPxHLh0cxMQsGIEzkzW1PANTYr8h44g8wx2KFQL
	tEubnbB/ob4zB67eD1MdMLRRDn3sfUojrUcI0R+QMuwGKW4nzjpmPXJM
X-Gm-Gg: AR+sD10PyYOtMWr3CjLoixMCd5Ce3rVud1YAz38FycJ/lVs270BffDSHUIvC4xQKqpj
	h8qeSZRHhnMy5To+mQlxHFNDesbBE6wyXPsf9G1k10HuzWs1Vhy761m9ZxBUiu9InSWqztgJ4z7
	9fWd42RA5pkb8ZeMpiXwuOsoOR6dAuRr6woP+N+ON0S3+bXE1Yr5ODn4KCNJ1NNoXtLwTyPu4rv
	CTYJuQUyWch0+GHDd647byHu0bLvQyax9bqv6h1yuPaz0jmI1kkr3/pTBWTQFxGrqiRe9lZ3DKh
	roZ6c5Mhv3WxRJAAB3LLHFmjDAoWzXx5/5uY+vD0xswr3slZAMTCnH3JUP/EFhuTX2Ul+DcSawR
	st8Aer3uExgr1l16LESwcVqk9hlgahQNuMjl/WGIjLOyRxDm4+reNhcF+k9BmSK22Za/cCBH+1Q
	XWx44ivwpyOMsnRGW54NLIShfaKxciZPz0qsMe2kRaL53BDKfjUSyOcpL98BniaDsrYyEgIG/x2
	0UD9GFJ
X-Received: by 2002:a05:6512:3b24:b0:5b5:e2e2:5f2e with SMTP id 2adb3069b0e04-5b5e6905d67mr2591264e87.18.1787930832156;
        Fri, 28 Aug 2026 08:27:12 -0700 (PDT)
Received: from localhost (parmesan.int.kasm.eu. [2001:678:a5c:1204:126f:f00a:513f:807b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a11f08sm455754e87.71.2026.08.28.08.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:27:11 -0700 (PDT)
Date: Fri, 28 Aug 2026 17:27:10 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	nbd@nbd.name, lorenzo@kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in
 ACPI SAR init during probe
Message-ID: <apGWXuPOSqZJ_ShO@parmesan.int.kasm.eu>
References: <20260825181712.28548-1-lucid_duck@justthetip.ca>
 <ao3dyqWJ3nf3rMMW@soda.int.kasm.eu>
 <20260828011737.22809-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828011737.22809-1-lucid_duck@justthetip.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_082716_107736_C3B49C93 
X-CRM114-Status: GOOD (  48.25  )
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

On 2026-08-27 18:17:37 -0700, Devin Wittmayer wrote:
> Thank you for the Tested-by, and for bisecting it in the first place. The
> report arrived with the commit named and a revert confirmed, which is most of
> the work already done.
> 
> Something odd, since we are on the same laptop. Mine is a Framework 13 that
> shipped with an MT7922, and it has no MediaTek power tables at all. I checked
> every ACPI table on the machine rather than only the main one, and there is
> nothing there for any vendor. So your oops cannot fire here on the same model
> with the same card, which is why I had to inject tables to reproduce it.

From my short look, the driver seems to look for MTCTL, MTDS, MTGS, and
MTFG? I don't have a MTFG, but the others look like this decoded with
iasl:

 Method (MTDS, 0, Serialized)
 {
     Name (_SPT, Package (0x1F)
     {
         0x4D, 0x54, 0x44, 0x53, One, Zero, 0x02,
         One, 0x22, 0x14, 0x24, 0x22, 0x21, 0x19, 0x1A,
         0x1A, 0x1A, 0x19, 0x1A, 0x02, 0x22, 0x14, 0x24,
         0x22, 0x21, 0x19, 0x1A, 0x1A, 0x1A, 0x19, 0x1A
     })
     Return (_SPT) /* \_SB_.PCI0.GPP6.WLAN.MTDS._SPT */
 }
 Method (MTGS, 0, Serialized)
 {
     Name (_GPT, Package (0x1C)
     {
         0x4D, 0x54, 0x47, 0x53, One, Zero, 0x03, One,
         0x24, 0x24, 0x24, 0x24, 0x1A, 0x1A, 0x02, 0x24,
         0x24, 0x24, 0x24, 0x1A, 0x1A, 0x03, 0x24, 0x24,
         0x24, 0x24, 0x1A, 0x1A
     })
     Return (_GPT) /* \_SB_.PCI0.GPP6.WLAN.MTGS._GPT */
 }
 Method (MTCL, 0, Serialized)
 {
     Name (_TCL, Package (0x13)
     {
         0x4D, 0x54, 0x43, 0x4C, 0x02, One, 0x50, 0x88,
         One, 0x18, Zero, Zero, One, Zero, Zero, Zero,
         0x08, Zero, Zero
     })
     Return (_TCL) /* \_SB_.PCI0.GPP6.WLAN.MTCL._TCL */
 }

> 
> Which means the difference is somewhere in the firmware, and I can only see my
> side of it. Mine is an Intel 11th generation board on BIOS 3.17, dated October
> 2022. What are you on? Whether these tables came with a later release or only
> ever appeared on certain boards decides whether anyone else is about to walk
> into this.

Wouldn't the Intel 11th generation have come with the Intel AX201 or
AX210 originally? Mine is the Ryzen 5 7640U and is updated to the 3.20
BIOS dated June 23 2026.

> 
> While you are in there, does your geo table carry 0xff in the unused slots?
> Someone turned up on the list yesterday with an ASUS padded that way, which
> the driver takes as roughly -1 dBm and clamps every rate down to it. Whether
> that is one vendor's habit or common changes what the right fix looks like.

I don't think so (if this is the MTGS table above?), but I don't really
know how to parse the table contents.

If I run `iw reg get` (with the patch applied) it returns:

 country SE: DFS-ETSI
 	(2400 - 2483 @ 40), (N/A, 20), (N/A)
 	(5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
 	(5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
 	(5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
 	(5725 - 5875 @ 80), (N/A, 13), (N/A)
 	(5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
 	(57000 - 66000 @ 2160), (N/A, 40), (N/A)
 
 phy#0 (self-managed)
 country SE: DFS-ETSI
 	(2402 - 2482 @ 40), (6, 22), (N/A), AUTO-BW, NO-320MHZ, NO-EHT
 	(5170 - 5250 @ 80), (6, 22), (N/A), AUTO-BW, NO-320MHZ, NO-EHT
 	(5250 - 5330 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-320MHZ, NO-EHT, PASSIVE-SCAN
 	(5490 - 5710 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-320MHZ, NO-EHT, PASSIVE-SCAN
 	(5735 - 5835 @ 80), (6, 22), (N/A), AUTO-BW, NO-320MHZ, NO-EHT
 	(5945 - 6425 @ 160), (6, 22), (N/A), AUTO-BW, NO-320MHZ, NO-EHT, PASSIVE-SCAN

so the transmit power limits actually look like they are too high for
some bands, especially 5735-5835, but maybe it will limit to the AP
transmit power and be fine? However, according to `iw list` the channels
in 5735-5835 do not have the "no IR" flag, so in AP mode the card could
potentially transmit ~8 times the allowed power (I would rather not test
this)?

The 5710-5735 range is also not covered, which results in 5 GHz channel
144 being disabled (visible in `iw list`).

> 
> Devin

Regards,
Klara Modin

> 
> On 2026-08-25 11:27:15 +0000, Klara Modin wrote:
> > On 2026-08-25 11:17:12 -0700, Devin Wittmayer wrote:
> > > Some laptops carry a MediaTek power table in their firmware, and the
> > > driver reads it to set a transmit limit for each frequency range. It
> > > only fills in the ranges themselves when it registers the device.
> > >
> > > The startup step that does this existed already, but it never programmed
> > > anything. These two commits made it run a regulatory update instead,
> > > which sets the limits on the way through, long before registration. So on
> > > a machine that has the table the driver reads through an empty pointer
> > > and the interface never appears:
> > >
> > >   BUG: kernel NULL pointer dereference, address: 0000000000000004
> > >   RIP: 0010:mt792x_init_acpi_sar_power
> > >   Call Trace:
> > >    mt7921_set_tx_sar_pwr
> > >    mt7921_mcu_regd_update
> > >    mt7921_regd_update
> > >    mt7921_run_firmware
> > >    mt7921e_mcu_init
> > >    mt7921_init_work
> > >
> > > Skip it when the ranges are missing. They are applied again once the
> > > device is up, which is where they came from before.
> > >
> > > Reported-by: Klara Modin <klarasmodin@gmail.com>
> > > Closes: https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
> > > Fixes: 9b80bd9cab40 ("wifi: mt76: mt7921: add regulatory wiphy self manager support")
> > > Fixes: e9f3f1cc133f ("wifi: mt76: mt7925: add regulatory wiphy self manager support")
> > > Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> > > ---
> > >
> > > Reproduced on both chips before sending, an MT7922 and an MT7925, and the
> > > fix clears both. Neither machine here ships a vendor power table, so I
> > > supplied one through an ACPI override in the initrd. It also wants recent
> > > firmware. The June builds do not turn on self-managed regulatory and
> > > nothing happens; the builds now in linux-firmware do, and then it dies
> > > exactly as reported with no interface at all. Patched, both come up and
> > > scan normally, and the injected limits still show through in the power
> > > table afterwards, so the skip does not lose them.
> > >
> > > With that table still in place and the fix absent, backing out the mt7921
> > > commit on its own also boots clean, so the table is not what causes this.
> > >
> >
> > Thanks for the quick fix!
> >
> > Regards,
> > Tested-by: Klara Modin <klarasmodin@gmail.com>
> >
> > >  drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> > > index 946dd7956e4a..b468051fbe68 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> > > @@ -323,7 +323,8 @@ int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default)
> > >  	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
> > >  	int i;
> > >
> > > -	if (!phy->acpisar || !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
> > > +	if (!capa || !phy->acpisar ||
> > > +	    !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
> > >  		return 0;
> > >
> > >  	/* When ACPI SAR enabled in HW, we should apply rules for .frp
> > > --
> > > 2.55.0
> > >

