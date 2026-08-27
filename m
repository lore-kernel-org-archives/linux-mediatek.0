Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10507C61DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 19:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPfUyCW9w6jQVeOmCzLT55o0ICNEb7tCt+y8vp/qA7E=; b=FLOUYFZYkcdf2lULiexOyw+bLR
	IpLXFuhN02Ly25YBuswAgfPRx2afAMT7960lKX/T+Faaoy+nGrr/Wk90zUFOYwE+1DcowSkHt4pu0
	DqDbu1tHif5X+pu8217y3J4XtcwCg/801r73C7pHFicYBt7bw+SHc9/NJfvQ2y2Cg7kOjECIu8zj4
	LElvz6Vyruie44eXE2TGmgzbWkIFBX1+7Et1oOFGsuQJhR1YhBS2kCDBe/RnddYZnWplL8IZBguLp
	reh/8ml9oCt4QZ83LM0ck+9RbpG7TmhPBYGiDiDF0/7eUFcobCnQJVzu8QK9Q3OcVoFvRupiweQid
	2vG96QpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfpe-00000004iR5-0nGh;
	Thu, 27 Aug 2026 19:32:15 +0000
Received: from out-166.mta1.migadu.com ([2001:41d0:203:375::a6] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfpb-00000004iQU-1Elo
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 19:32:13 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Dxb0QZdyGHiqp2xjGNxhfkA9d4hWZawABxo1RHuBiVU=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787859129; v=1; x=1788463929;
 b=LYdondbgDFKqwFsiYN4Qg8w8+PEQ0YFq/pZAL2/XJoGiJnqIng/FHNvAA3SmMRyPtBUxmEKq
 0HEPtbtVWWAjmIWGXyCN5MTRg8A9i/o+mHu0jzf/ll9jm/gqUqsop5AL3mX1N1m6KYIGZXXiQKr
 MPBpHZ/PrqlKn861Le7WATFZlZceFFXCMCsqV3yNLvxsaEPW0HgRr70aEkogfHhuyKdZ2aqBOYe
 LPEbNB20/6WAkjxvuJ24XZ1z+U2ZrVISZjlnw7xjB0wWxckgNoVeQfy3APThvxsf5/mLG+7VHKU
 s6V4Ww0vtIIM0b5fVgUzIFb50sjRU8mBNzwBIEnc4r4/A==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4c9131677e2def36;
	Thu, 27 Aug 2026 19:32:09 +0000
X-Mizu-Trace-ID: 4c9131677e2def36
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	lorenzo@kernel.org
Subject: Re: [PATCH RFC] wifi: mt76: mt792x: treat ACPI MTGS 0xff as no geo limit
Date: Thu, 27 Aug 2026 12:32:02 -0700
Message-ID: <20260827193202.12033-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827134820.2607530-1-huynguyendinhquang@gmail.com>
References: <20260827134820.2607530-1-huynguyendinhquang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_123211_749401_C0F5A6CD 
X-CRM114-Status: GOOD (  20.78  )
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

Thanks for measuring both bands.

There is another one of these from July with the same symptom and a
different cause. ASUS ROG laptop, geo table in the v2 shape but the
version byte says v1, so it gets read a byte early and the 5 GHz slot
comes out 0x00 rather than 0xff. I sent a fix for that one on the 11th:

  https://lore.kernel.org/linux-wireless/20260811232839.515463-1-lucid_duck@justthetip.ca/

Both are probably real. Your MTGS and MTCL bytes would settle which one
you have, and MTCL is the one that decides it, since every table gets
read with whatever version that one declares. If yours look like the
ASUS tables then the 0xff is wreckage from the misparse and the patch
above already covers you. Building it would answer the same question.

Two things on yours. Skipping the offset when the power byte is filler
wants a sentence saying why. And I would test the raw field rather than
the value after it has been through the signed conversion.

Devin

On Thu, Aug 27, 2026 at 8:48 PM Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com> wrote:

> Some OEM ACPI MTGS tables fill unused geo power/offset slots with
> 0xff. Windows treats that as "no cap". Linux assigned the u8 value
> to s8 and min()'d it, clamping every rate to about -1 dBm
> (txpower_sku tmac = 3).
>
> Skip geo capping when pwr is 0xff, and do not apply offset when it
> is 0xff.
>
> Tested on ASUS Vivobook S 14 M5406WA (MT7922, mt7921e):
> - 5 GHz: tmac 3 -> 25, TX ~40 Mbps -> 200-350 Mbps (80 MHz)
> - 2.4 GHz: tmac 30 after the change (channel 6, 20 MHz)
>
> Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")
> Signed-off-by: Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> index 946dd79..fa539cd 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> @@ -280,7 +280,15 @@ mt792x_asar_get_geo_pwr(struct mt792x_phy *phy,
>  		return dyn_power;
>
>  	geo_power = (band_pwr + idx)->pwr;
> -	dyn_power += (band_pwr + idx)->offset;
> +	/*
> +	 * ASUS (and some other OEM) ACPI MTGS tables fill unused geo
> +	 * slots with 0xFF. Windows treats that as "no cap". Linux took
> +	 * it as s8 -1 dBm and min()'d every rate down to ~3 dBm tmac.
> +	 */
> +	if ((u8)geo_power == 0xff)
> +		return dyn_power;
> +	if ((band_pwr + idx)->offset != 0xff)
> +		dyn_power += (band_pwr + idx)->offset;
>
>  	return min(geo_power, dyn_power);
>  }
> --
> 2.55.0

