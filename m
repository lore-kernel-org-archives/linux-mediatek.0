Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56883C25B5F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEY5sGkeFF8nC19i+3D38ASHFofu169JZpmfPolnKsQ=; b=Ryce/9r4hV1iufcTm8QTvHP5Kt
	K+vKRMFvDZWNbfRMPo63K34k8+3yZDPLDuYksZklfTD5jay+pvIvoiTjrSCACEWutIbnaZ7lo8ZQD
	cc/IF+tLCzqRqmd2doPqFjMTyJihXtT/G3E8iWUdohNqqi/LLmwgU/qkH1ixFaxUY7kowUJvMRgB5
	SaPUx7Hgqc6pX6gMzNDVzuP30O3eKCzGX5Q6QsqC12jl+KXNj0Nza+tzWKm+I0ILF9Ub2+z7dfrfq
	gch903EY1eMGjF6Rve3QT9sE8vAvXT/4WdI8VVDfqhispt8bemtWO3RYNge3rf1A4/MehusA3nTft
	eUDOCGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5PQj-00000005HHo-45hE;
	Fri, 10 May 2024 12:32:53 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5OPp-000000053GQ-2auT;
	Fri, 10 May 2024 11:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715340474; x=1746876474;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=aANSSUvUc/Jg9oLoo6P63WSiKIet7EGu6f4hUvfSXkc=;
  b=mrs814EKElhPNVLaRfbS4hH9496fAS5WhNaih9Le23a0dbsosxn6LERP
   M14sijvUeMbR2/T1c1VzW9BvH62057bPNHmwIZGnPguU4spWtrDlMQhcc
   kdoDzoe7fIXbmq/sIUQlxh9R129ter9glP65Qc4bs80QD2DXMZI1Vojyk
   5sAPpxZipTk9DeHARhzz0RTaxFmeoW6DmI8dxms5tbtWrqOe2R+mAnsZp
   h3oLHCYFyjwQOIUs1cccRXO7anSomgzjSvpC0PvYGnuWcWz20Jnc0j0WF
   qp/EPHMNCcpT+nwwHs93bwibHuh4t/3yW3EHPaKdCUHjjZSPgIrOrGYuA
   Q==;
X-CSE-ConnectionGUID: zhP2qGDYSHOGDcklTH1s+A==
X-CSE-MsgGUID: fDVNDcyVSxq+Itp+/OlNMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21988057"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="21988057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 04:27:50 -0700
X-CSE-ConnectionGUID: ocveNKGZTIqcD+m/mfZGtg==
X-CSE-MsgGUID: NlwU2s0wTVeIuf/ciOKKlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="29543350"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.180])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 04:27:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com, mac.shen@mediatek.com, liankun.yang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add PHY-dp bindings
In-Reply-To: <20240510110523.12524-1-liankun.yang@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240510110523.12524-1-liankun.yang@mediatek.com>
Date: Fri, 10 May 2024 14:27:38 +0300
Message-ID: <87frupj49h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_042755_483286_8152BD75 
X-CRM114-Status: UNSURE (   6.67  )
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

On Fri, 10 May 2024, Liankun Yang <liankun.yang@mediatek.com> wrote:
> Update write DP phyd register and add phy-dp bindings.
>
> Liankun Yang (2):
>   Add write DP phyd register from parse dts
>   Add dp PHY dt-bindings

Please use the proper subject prefix for the driver. git log suggests
"phy: phy-mtk-dp:".

Thanks,
Jani.


>
>  .../display/mediatek/mediatek.phy-dp.yaml     | 45 +++++++++++++++++++
>  drivers/phy/mediatek/phy-mtk-dp.c             | 37 +++++++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml

-- 
Jani Nikula, Intel

