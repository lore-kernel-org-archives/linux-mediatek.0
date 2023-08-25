Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F6EC3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OImVvcdoYzYVt4VHT7YR1ltQNk0s5ukc4k3WADtrUk8=; b=tRQXPMShEygdI+D4Y06OKnLAcI
	4cwDupuM4fyWntcW2HDV68Lhzi/wBUphW/RNO5m883UOoroM6XUoJDP2eT2LbyxEg9OgdaGcUwkhj
	RbMRUrRPnyzMHzm2luN0DZaK5GFt8RSmWv7IFe0njulOYTI+akBAa24LPMJEqU2iQCJMqocq/WPaK
	wCqL6oEOwzklTLe7f1puwgpY7Z/NbdRbwUc3pS91vddFf0Ny84yKKK4+7ditI6cPEX0k7ceq8S0Lc
	tWvmoXUSjyUCzekTBkYcjHGG/lqKSnWyCs2uj0/k+NQMAgp5OPJfWGwMxufHOyYkt4jQwo8oO9Uxm
	ez9y43Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZaxI-005omE-0U;
	Fri, 25 Aug 2023 17:50:44 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZaxE-005okV-1l;
	Fri, 25 Aug 2023 17:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692985840; x=1724521840;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=MNxhxZVgxztKuNKuvsL0AzLilS4KbqaTek8IWrU+J20=;
  b=UoRrkXAlXZV8JJJljaTYWx59S4VDJ4gzC39s8KbH80K/RTcwu8bnyfqh
   PPkIRjP70AX17Nw3KNsoMPOGC15BoBBIYOiCV2PkdQgylwx4hn7r9enMc
   rkZn0+z3oG+4xlaNmwG30POH9ehhWYK9Qs+omKO8IMcREeBujLqpos1Qk
   y1hq3N3iUMJM6og2o+4W8h/oKEE1yCbj/lgCpj5edo+PHTluivkxOum/e
   xeI+6O1qSz2yElMAwHpaltjM/axieCCBZeWddmAFtFkWnvTlzNQC/tmHc
   j+GUfxfOqrgcg/3VeIGdZpQ8aBs4BT6pazZiLIrFQeEYu9VwMvRbGQkLD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="378547676"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="378547676"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 10:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="807617356"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="807617356"
Received: from semenova-mobl1.ccr.corp.intel.com (HELO localhost) ([10.252.46.222])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 10:50:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org, emma@anholt.net,
 linux-doc@vger.kernel.org, david.heidelberg@collabora.com,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
 sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com,
 linux-rockchip@lists.infradead.org, daniels@collabora.com,
 martin.blumenstingl@googlemail.com, robclark@freedesktop.org,
 anholt@google.com, linux-mediatek@lists.infradead.org, mripard@kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH 2/6] drm: ci: Force  db410c to host mode
In-Reply-To: <29c7-64e8b600-1-6afffd8@162524228>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <29c7-64e8b600-1-6afffd8@162524228>
Date: Fri, 25 Aug 2023 20:50:26 +0300
Message-ID: <87msyf2eql.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_105040_624480_B5618A57 
X-CRM114-Status: UNSURE (   6.18  )
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

On Fri, 25 Aug 2023, "Helen Mae Koike Fornazier" <helen.koike@collabora.com> wrote:
> I'm not sure I get what do you call out-of-tree builds.

Using 'make O=dir' (see make help) to separate source and and output
directories.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

