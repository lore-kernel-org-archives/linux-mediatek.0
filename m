Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFC9E73146
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 08:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15pmCLyxEi0pLxzUNoUfwSKNMFIzmZCN92bXefFF3r4=; b=RmhD05XcIRbb5+zZivybN+t4lN
	2x4ajHAqYJQxDfLTKiwYb9gH24sOmrMHOpDcGesGAZ8Yzto3FUuO+a8qVxuP0zGUN9n+EmIJzcnqB
	K4c/SYoWR9xDDN1xiVJEgfPrvAqWXjJmjaVw9bYNq67nLFZLzO1hqS2wkSIGhQBSqhQ2WJOrLZxhv
	ujPMQxThb+O1GVU1MkmZS6yJZa/GyyR38JOTCVrty0GNndNmNw7VB26yWtJHtxS0duhP6mGGcWAGv
	zfhibquG3D8VADQ9j3zuqboSt9h0ukLknpR/K1XOLHm3wh7bLSpXDIIDmxzCXK0YaSkQt6XscfDav
	MrvcbPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmp5X-00000004dWV-0m6y;
	Mon, 02 Feb 2026 08:15:15 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmp5R-00000004dVV-185u
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 08:15:11 +0000
Received: by dvalin.narfation.org (Postfix) id AAEFA21014;
	Mon, 02 Feb 2026 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1770020102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15pmCLyxEi0pLxzUNoUfwSKNMFIzmZCN92bXefFF3r4=;
	b=UqSLyhXlC7rpew+IjjX3v2CCNIB6aOjPuWZE8HdQK+daRtseY2ptazOGsddGJqVH6fSWCo
	pPYh1Kb2NWZXBiAOiBr2HrUsuNwonsM+z4WeO+LlwpvcBUAEkQ3aXaUAK4qnMSyy6cLKch
	PeEV3nkMx5qHJErRhP4EyZjavTCKB7M=
From: Sven Eckelmann <sven@narfation.org>
To: Ryder Lee <ryder.lee@mediatek.com>, Rob Herring <robh@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Allen Ye <allen.ye@mediatek.com>,
 Saravana Kannan <saravanak@kernel.org>
Subject: Re: [PATCH v2] wifi: mt76: fix backoff fields and max_power calculation
Date: Mon, 02 Feb 2026 09:14:54 +0100
Message-ID: <7906220.EvYhyI6sBW@ripper>
In-Reply-To: <54627282cfb8e5a89fe753da66552c0a084f6387.1769557863.git.ryder.lee@mediatek.com>
References: <54627282cfb8e5a89fe753da66552c0a084f6387.1769557863.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3929001.kQq0lBPeGt";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_001509_842617_F970546C 
X-CRM114-Status: GOOD (  16.14  )
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

--nextPart3929001.kQq0lBPeGt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Ryder Lee <ryder.lee@mediatek.com>, Rob Herring <robh@kernel.org>
Date: Mon, 02 Feb 2026 09:14:54 +0100
Message-ID: <7906220.EvYhyI6sBW@ripper>
MIME-Version: 1.0

On Wednesday, 28 January 2026 00:55:57 CET Ryder Lee wrote:
> +               case MT76_SKU_BACKOFF:
> +                       backoff_chain_idx += 1;
> +                       fallthrough;
> +               case MT76_SKU_BACKOFF_BF_OFFSET:
> +                       delta = mt76_tx_power_path_delta(n_chains);
> +                       backoff_n_chains = mt76_backoff_n_chains(dev, backoff_chain_idx);
> +                       backoff_delta = mt76_tx_power_path_delta(backoff_n_chains);
> +                       break;
> +               default:

Please double check whether the "case"s for MT76_SKU_BACKOFF_BF_OFFSET and 
MT76_SKU_BACKOFF should actually be swapped. I think I've originally 
introduced this mistake when trying to demonstrate different ways to write the
switch block.


> +               /* For connac2 devices,
> +                * - paths-ru = RU26, RU52, RU106, BW20, BW40, BW80, BW160
> +                * - paths-ru-bf = RU26, RU52, RU106, BW20, BW40, BW80, BW160
> +                * Only the first three entries use 1T1ss and do not need index
> +                * adjustment; the remaining four require index offset.
> +                */


Hm, I doubt that anyone can understand this (same for the commit message).
You basically just showed a list of two equal "array"s.

Actually important here is that, RU26, RU52, RU106, ... stand here for 10
different values:

1T1ss, 2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss, 4T3ss, 4T4ss

For paths-ru-bf, also 10 values are stored in the DT for each of these
(RU26, ..., BW160) - but only the non-1T1ss are relevant for this
calculation for BW20, ..., BW160.

These 1T1ss beamforming values for BW20, ..., BW160 were (if I understand it 
correctly) removed for connac3. 

If you introduce some change in the DT interpretation, then you must also 
inform the DT maintainers (Rob Herring <robh@kernel.org>, 
Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org) while 
updatingDocumentation/devicetree/bindings/net/wireless/mediatek%2Cmt76.yaml. 
The latter is currently still expecting 1 ("rates multiplier") + 10 values
(limits). And DTs with only 1 + 9 values per rate would therefore fail to be
validated.

At the moment, your connac3 code is basically conflicting with the devicetree
documentation. I will leave it to the experts to figure out if the devicetree
should have two different interpretations for the same property or whether
the property should be the same and the code must handle the differences
before sending these values to the HW.

Regards,
	Sven
--nextPart3929001.kQq0lBPeGt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaYBc/gAKCRBND3cr0xT1
y+JGAP9yD0LmmMIApgiKeRxfcsdReDLdpC+y3ZypWbDdwGGNTQEA3kYIKROXU2j5
Z4tImDd7EhOVEzJnuElNQlQHr1nbuQQ=
=wNka
-----END PGP SIGNATURE-----

--nextPart3929001.kQq0lBPeGt--




