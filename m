Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F88C25B67
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 15:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKAdQ60PJKkS4B6WsMw9PIbSvYeRU7RwQlyhCjDkLLs=; b=EiagLLFPTR3d3OgFLxpNwOTrlu
	ZrlCwRJ+mliTIB+d/H8M2UafVTTyxk72YXnjGhT5zir0aLatHZSl1YSpRjYFkMYFJl6B9FIIdMtQm
	V7oczRsL4IXdu+byE8ouYGAxHOC7ynqtHPKtkDNaHlxz3cQs0Up8KBPcKA7V+vKuE/7mjD4hfNV8P
	boOBGZfg/FR22u4VcJzzX1SjfKZCQQLTc4WrzLSyrZ9ds2rskZWev7npeXKZVfxlmpD3FMARMXiJI
	xckGgkOj6HteEmb0ykkLrS04cChxLSGb7mp8P3Londk/BbBwZjCoFgiUslP+clqh9aoixRs3TYo8X
	SsC2Ykzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2NG-00EoWU-1h;
	Thu, 26 Oct 2023 15:34:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2ND-00EoUr-1i;
	Thu, 26 Oct 2023 15:34:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A4356352C;
	Thu, 26 Oct 2023 15:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77398C433C7;
	Thu, 26 Oct 2023 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698334450;
	bh=WlnOzBHEslW7auiw0OQwFlM3UIEQxiB3h6xa2FYhXD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XDLhyice58rh/uUv7OvhKCFL0YqZ96mVJJZ7ryrPkBzgCe8Ckc1dwVkcFt8MINDR2
	 a8fBohwsAijNXq25EoUNELjMZrV2J5pcuieu1UWPzLVCSoxLWmwYizVsyoWNjWikow
	 UgA+lVYBoRj0AcknN1FHOgwkZZUfMHKAhVPW6Rrjo7vZC921i51E6IlnSVqLzgiTVU
	 VG8ZuE9kJ5iEjm+HFcgv32oTcM4g3Gu37v7uGiz/ca0shJzGuRpbaQskQ12sT/xv7L
	 8fYF2FDSvPane+sX5uC0e3+YrQSiI0O/Py4r/GU8E5zhE9Wpoqgbex9RfodWfBTGV8
	 42xuzs5WEvfsg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Helen Koike <helen.koike@collabora.com>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, 
 neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, 
 p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org, heiko@sntech.de, 
 jani.nikula@linux.intel.com, intel-gfx@lists.freedesktop.org, 
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, 
 airlied@redhat.com, daniel@ffwll.ch, michel.daenzer@mailbox.org, 
 daniel@fooishbar.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230919182249.153499-1-helen.koike@collabora.com>
References: <20230919182249.153499-1-helen.koike@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: drm/ci: add entries for xfail files
Message-Id: <169833444817.1001410.15120310571741480170.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 17:34:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_083415_626315_4921A62E 
X-CRM114-Status: UNSURE (   6.17  )
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

On Tue, 19 Sep 2023 15:22:49 -0300, Helen Koike wrote:
> DRM CI keeps track of which tests are failing, flaking or being skipped
> by the ci in the expectations files. Add entries for those files to the
> corresponding driver maintainer, so they can be notified when they
> change.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime


