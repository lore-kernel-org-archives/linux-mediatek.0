Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250FDC369DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 May 2025 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLAShVW67EGOZXxd6g0OjLIXhZRJLHtvTzOQD8VdYx0=; b=WAidaIRe8mDt+MMuRqhWY1qB0v
	mcDG4ItkQ2FiN+KXlKW8gArGhdVJ2jiOJ/9AIbtRcrUmHZqKMMJotMc2WpcbkcKIpJsyi+Xyi5g5Y
	b2Leu4BuC07pykCeljWNjKC888LngBuYZ4W0D3GGC9flVDhc82sffcikkJPm7DMKPohXrpV4lcW6z
	sNsNylMfoPMRMic+krB7oo4Z470nkX89Y9PG8eomN2tLGhx3YJefwmw5WvOMXFMpRTiiI3DfXYHHb
	FSZA4eVNQUi1kwWvBBLJspSGJXjx52nQ6lxRXwyV87xF8fntN9Zz3Md60ntvjcMbkKwFkO8wcv5+H
	gFNlHTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARd1-0000000FEih-0YHW;
	Thu, 01 May 2025 10:58:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARcy-0000000FEiB-0oUO
	for linux-mediatek@lists.infradead.org;
	Thu, 01 May 2025 10:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FC145C546A;
	Thu,  1 May 2025 10:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EC4C4CEE3;
	Thu,  1 May 2025 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746097131;
	bh=fOPI1vRY7umuBn+S/P9hMul1fSPdaHJ81MJBCEDAOto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4kbdGbb5Ttos7413Y9NRKDgW9LAD6g3OLKHMJHzdqOkufj89zfhI1K/vK872+YWD
	 Ji3r3IcpHV1lO8l3J9Dc2Lf+aTaW2OFrSj1/KLtwkMY4LzriyrZpcF2k6aGfLgoeDo
	 LVKR5uO8px3oWIpV9WZBwq+SaROVF7vvilxAXMDG7W2Gs+nDl0G1WbDfhqGA2tB2Uw
	 dCJxhavYP92r0DTN9IAV3tAwyP9ii3arplTRgX02vriYnpVg5bSK2ABmigqie0RvVx
	 Mzs3AmGVr/3Ko65RKjUtQgV/p/aplBuDvIz5dx2O6O/4dOGN+LwylQ+71GFQV7tWz5
	 UKdNw5fBPxSNg==
Date: Thu, 1 May 2025 12:58:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de, 
	daniel.lezcano@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU
 Timer
Message-ID: <20250501-ludicrous-idealistic-camel-7bf8aa@kuoka>
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-2-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430133433.22222-2-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_035852_286526_4E8013D2 
X-CRM114-Status: GOOD (  13.18  )
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

On Wed, Apr 30, 2025 at 01:34:27PM GMT, Caleb James DeLisle wrote:
> Add device tree bindings for the so-called high-precision timer (HPT)
> in the EcoNet EN751221 SoC.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/timer/econet,en751221-timer.yaml | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> 

What changed? Nothing explains dropping the tag.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


