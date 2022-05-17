Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 15:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGRiqj38FFiBvtU1jUIhYWM71+u1mdN+2h852fRhekI=; b=eskZUrBTO2Twkw
	DYcLo2YSyOxprUf/HRqN2uyK8q5NBFsiwV/qdhBMLc1lWZCKttOn/3mgHJBV3byNGtkS3MWZbKewV
	wyMRs1MRcwYzTFBjXC1u/0lajqY9w8LQ2rQlr+TAPXT3kKgk7YxYAZGo+5fPuG/eGuXlYl72fU1Lw
	Pt+PkiEz4PlNRvwfPgxdHhHzi+JtXusNUupJSCIq08C1EVnIrmi35TYinDyrsgiq4tX/gRUiJb36u
	HY5MFOzK2GX0aAPtpOX6WiBsjsOqR1uWCgEkDDnnLhIWexFHAtvwOy8jklwk03HOXFJIOR2moh91o
	/SIkPIfAsXAM0ROhTjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyls-00EawM-46; Tue, 17 May 2022 15:06:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqylf-00Easf-UZ; Tue, 17 May 2022 15:05:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 7A1B81F44708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652799946;
 bh=lQaAioMCtJzYV+JsQokqOT8ZO6pFb3WCCN0aLVKRlF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mWyx87AAiAbMwcD6cd7G4OZnTdDs7hrlugoKAY086+/TluU3kCCXiGBkC/cYj2PaK
 PKAEnWgA9214eXGzRtuUtB9fD6PzrxZ9+I+kM1qjbFywDZmWFdSkLs266pqQl9nlJ+
 6kULyYfvupeQqGR0UiBuPe+mpsWUsRz02UqhOJrZjI2sxs3Xh+h0wcNi5S1KyfJM6V
 NMGwEO8hajIykt1it6HMY6lhGFTMWqUXY1SUh5QcOCkplM1dTCMUhcJmV4oKcjmWmd
 kmKLGefjqS+i9HOR3cF6bJupcVxIrByNZKBQyuo6pQTrkV1+NhUEAmhzKgmJsX/2P1
 I9GiuEjByRK6A==
Date: Tue, 17 May 2022 11:05:42 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] dt-bindings: arm: MediaTek: Fix clock bindings
Message-ID: <20220517150542.cvvescaeohlfurkw@notapiano>
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_080548_154854_66191F79 
X-CRM114-Status: GOOD (  11.44  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 17, 2022 at 12:15:08PM +0200, AngeloGioacchino Del Regno wrote:
> As per Rob Herring's review [1] on my mt6795 clocks bindings patches, for
> which I've used the already upstreamed ones as a base, it was found that
> these bindings have some issues.
> This series is addressing the issues that were found by Rob on my series,
> which are present on all of the already merged bindings.
> =

> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/2022051316=
5050.500831-5-angelogioacchino.delregno@collabora.com/#24859953
> =

> AngeloGioacchino Del Regno (6):
>   dt-bindings: arm: mt8186-clock: Remove unnecessary 'items' and fix
>     formatting
>   dt-bindings: arm: mt8186: Set #clock-cells as required property
>   dt-bindings: arm: mt8195-clock: Remove unnecessary 'items' and fix
>     formatting
>   dt-bindings: arm: mt8195: Set #clock-cells as required property
>   dt-bindings: arm: mt8192-clock: Remove unnecessary 'items'
>   dt-bindings: arm: mt8192: Set #clock-cells as required property

For the whole series,

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> =

>  .../arm/mediatek/mediatek,mt8186-clock.yaml   | 29 ++++-----
>  .../mediatek/mediatek,mt8186-sys-clock.yaml   |  1 +
>  .../arm/mediatek/mediatek,mt8192-clock.yaml   | 46 +++++++--------
>  .../mediatek/mediatek,mt8192-sys-clock.yaml   |  1 +
>  .../arm/mediatek/mediatek,mt8195-clock.yaml   | 59 ++++++++++---------
>  .../mediatek/mediatek,mt8195-sys-clock.yaml   |  1 +
>  6 files changed, 71 insertions(+), 66 deletions(-)
> =

> -- =

> 2.35.1
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
