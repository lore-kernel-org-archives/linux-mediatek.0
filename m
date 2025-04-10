Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1919C3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smWIbtcF5kjz7/1uYejyV++T3AJ8X5fqBmfLIQDrXWM=; b=R3VOtA2Q0Cp5RqeSIJrzM3B9+j
	lVuE887Rh00lBn6eG8elaMW8iSLOd21xeoVRHKpUupBVDrzq4c41prdslGW2hxDBb/oqv5iivGfoC
	k1889C5ddPn9pOQYYqFyUapUrcJoM3f79x5MhY5G7sHmsLXXpC0zfJu0riq7RdMy9ibMy/EejIZIu
	vLpoc1IIKo1j/zEDUo+DOn9i8ad6QV61/0jwEPq3n07fJ+9Vjimb7CyKqHNHR/ui8OlriakB865xd
	6PpLHRjy7N3NAHhEbat/2eePlGTVNLnX9SZC+918B+GcYAbW2WZmf5Vt+1qXhg21gIXS57TmABEFr
	2MQC47ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2m4Q-00000009UFy-2RbJ;
	Thu, 10 Apr 2025 07:11:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2laR-00000009OxL-2pVo;
	Thu, 10 Apr 2025 06:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B774A498E9;
	Thu, 10 Apr 2025 06:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F84BC4CEDD;
	Thu, 10 Apr 2025 06:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267230;
	bh=hIrIzISFokOzyuHO5ayNIza6AlGr5DkwM1e92dAAE2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ej1Zai1YttQ06yOc6v3zdnUZYvEFWXJrVClrHT1ZQummIb2GUBXGA1wB9ELRMN6Lz
	 mGRfCbth9VDTacPbP4RDiTG1wZQGu/gSVxdxS8mIgWLrGW08OF5yz3LHdUZcPzx+BE
	 6ye/x9HxOplyiqeQLEOY7Vml2MSxYqiJGJmCcDBrCHqaOo25kVuH7vrZAdobNwAQIl
	 oemdhfF5sN8erOUFTxwOvzMtPLz8GWy6/IwmclwIwftQUQieFj9P51c3crthoRV3nj
	 2nUwxZ5pFrhWA50A/bGumIiQ6Cg2DO75nC5agKObJGIOUAw0Su3poPac9pY12BHSgY
	 Gi4HfPwL/DsUA==
Date: Thu, 10 Apr 2025 08:40:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 02/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgenc compatible
Message-ID: <20250410-new-zippy-elephant-54bbcb@shite>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
 <20250410063006.5313-3-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410063006.5313-3-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_234031_807751_43549210 
X-CRM114-Status: UNSURE (   7.85  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 10, 2025 at 02:29:55PM GMT, kyrie.wu wrote:
> Add mediatek,mt8196-jpgenc compatible to binding document.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>

Same comments.

Also: missing media prefix in subject.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


