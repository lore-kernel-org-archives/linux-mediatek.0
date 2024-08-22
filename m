Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A20C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98MjT45RGnk7wL8RMLPlZV+udaeRGydcWK2C9RPCuAs=; b=DWIGlNECBscKg2PGxIJgpT++qV
	Ph6z4WBE1VBlmxq14ipM6g55DAktO4HrVqbyIfw5QGLEzvY97PAbAb+1O2gGg2XUz6tdfvyzCnrov
	ViiI8XGuEj+N117Z+sncMWL+8gmZbKQDjbPGUM15kuTP6AeRYI1RazeaGLhQXzsEERNbJ828pB91Q
	ok5jj3HU62n8pzyd1rLf0i4pOm2woaQLkKpGES6TnJrw+dseq9gZ0zMarR2LfX6OL9sh/mvWxBxCh
	sGMK16z2dsN9UGMod3W3mPMhWov680O2MJfihJtBgGK6V3d1z7LkFsISK7DwHI0vZ43x4EiScDMJD
	OYkyVHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shA8i-0000000DRGL-1mob;
	Thu, 22 Aug 2024 15:54:20 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh9h8-0000000DKOn-1huS;
	Thu, 22 Aug 2024 15:25:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724340346; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZVIKW3D0jI3pXHiDjuzF/3Qsfrel7O10ClTVWiviaT+b5ntpoipxlCU5mPIuGoEVV3miX18qoHEtmCm2rdUtvHQ3c9NdgrmqpRJ0CyAl+6HAUxdv1e1dkPiC7p4SRgyo6Ab5qP0IcDv6isu4bqiuczNdr+mKk988amSpZo0UFY4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724340346; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tblG4DXojNvd/Q9ZZ/KwVJ2+BRO+sDaWRSrrd7xNqI8=; 
	b=XUF4RV9FP4IRDS5Z+tmMg0rjTbsXiXjcr+bIuvJDGKzZl1bLNUUGGffCB5EBA3V6960sP0WDQInxdud4ag87ryD845+s/WjJLoaHwvL3Xha2qZv10ISdI8AIxylalSZZTLCWs7CZN7K7R836P+LkN7mmhR8iI2lAiciL9wp1diY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724340346;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=tblG4DXojNvd/Q9ZZ/KwVJ2+BRO+sDaWRSrrd7xNqI8=;
	b=g51d7RqD0veQjp5+KVKELwE+jm750mEPW6lk9pQPkDI/tNQWRXDwApIv3YMtlNT0
	atmq+fEVY6o9uDAjHtvmS9QpmHBG/utJlrJJbdz7kYqeoEI1u4tjR53AoAqYTRC9Lyn
	EGaKf/GVoT3MvcRwnNCAsWvZLPMUesJ2w/BHPU8Q=
Received: by mx.zohomail.com with SMTPS id 1724340344652491.77049766479;
	Thu, 22 Aug 2024 08:25:44 -0700 (PDT)
Date: Thu, 22 Aug 2024 11:25:42 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Stephen Boyd <swboyd@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Disable DPI
 display interface
Message-ID: <00aaa8ff-1344-48dd-b0cb-5e8f4518ff6b@notapiano>
References: <20240821042836.2631815-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240821042836.2631815-1-wenst@chromium.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_082550_516962_F8417339 
X-CRM114-Status: GOOD (  13.65  )
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

On Wed, Aug 21, 2024 at 12:28:34PM +0800, Chen-Yu Tsai wrote:
> The DPI display interface feeds the external display pipeline. However
> the pipeline representation is currently incomplete. Efforts are still
> under way to come up with a way to represent the "creative" repurposing
> of the DP bridge chip's internal output mux, which is meant to support
> USB type-C orientation changes, to output to one of two type-C ports.
> 
> Until that is finalized, the external display can't be fully described,
> and thus won't work. Even worse, the half complete graph potentially
> confuses the OS, breaking the internal display as well.
> 
> Disable the external display interface across the whole Corsola family
> until the DP / USB Type-C muxing graph binding is ready.
> 
> Reported-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> Closes: https://lore.kernel.org/linux-mediatek/38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com/
> Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Would be good to have Alper verify that with this change the internal display
works again in their specific setup, although this change seems reasonable to me
either way.

Thanks,
Nícolas

