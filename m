Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C704C30658
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 02:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llQBEaDKlS4Yplly4tLNw/aJZHGo4sOmj4af9lFA4jU=; b=It3ogOPnCK9i3RuAE0zffcUXwJ
	WM3fYbNI8CYxMuv9USIiAjPrsPWYQhVCk6q3tBjf5ATKpa4UvrD/3VGgjNBLc7xMaY/xjLcdh8Qvj
	f/yyyACIlik7L32cVSlyiBQ62Nnz/X4a6vOgNeeM4sbg8+XgEQ+4PXOq7YHMYOaXEEQBprgU2IgHd
	hCmoD/5n0A571ON90qf8MlemHVuHmH46Hfd3uWIonPTZAFx8VgO309h1YqaIlqKyJxY/edpqCZVcg
	7i+i18+5th9AC14tDUgsK0vO43gb+hqxDzpgQx6TShJoWCrlzL9rhg3mMKxhGTT0Xw4csbVLgjanZ
	QCaO33yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpYx-00000008ZHv-1psH;
	Wed, 03 Jul 2024 02:17:39 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpYk-00000008ZEr-0zE1;
	Wed, 03 Jul 2024 02:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719973046; x=1751509046;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DsYS9rsRUUX+3T3zxbkJ8qv0voG/0vvAsvMk7w+ElTk=;
  b=dG10j/lazBKDNgBrxF0Cb1FQigsHsRTYbsH6+9aYMMfeDcME3BOvIUvq
   N2pnOrnyzTMyqTcZB7WIWzNAlm7zNFFBixNO5GmxMFfv9GqCUtbOYmshK
   XCAq5xbWM8P2vQ9RAOs/bovDSxs5GkMLuiODHfi09LULL673uM4hQ+DZy
   fqlsPXxBzUlyvs2H6Ge7VpoyTesv1k76ZQ/SLxk2bsb7OWOWqN4Gcjf8b
   thSlsGnAvz5occcMqlQ7y4IGxjJ65nuEpoxxtz/QyuKez7gCMegbvB0Eo
   k0J+v8IdJe1raX52AIBWtsg3G0PyPaEr8q6r8OfylelvtgxJjelA87kD8
   g==;
X-CSE-ConnectionGUID: 9YhH0t1oS8qdJMz9xtXVGA==
X-CSE-MsgGUID: 6VPjnd3rR0mK0BtSPMflgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20082697"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="20082697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 19:17:25 -0700
X-CSE-ConnectionGUID: lkWuV3N8QVqSwH2dwsXMDA==
X-CSE-MsgGUID: K2wl844PT8G+8SL32hyrcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="76834532"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2024 19:17:23 -0700
Message-ID: <aa64ab1c-70fa-4ab9-afc1-bf76a3d28123@linux.intel.com>
Date: Wed, 3 Jul 2024 10:14:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, yj.chiang@mediatek.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] docs: iommu: Remove outdated
 Documentation/userspace-api/iommu.rst
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Jonathan Corbet
 <corbet@lwn.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240702120617.26882-1-mark-pk.tsai@mediatek.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240702120617.26882-1-mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_191726_320002_4E5EA92A 
X-CRM114-Status: GOOD (  10.16  )
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

On 7/2/24 8:05 PM, Mark-PK Tsai wrote:
> The Documentation/userspace-api/iommu.rst file has become outdated due
> to the removal of associated structures and APIs.
> 
> Specifically, struct such as iommu_cache_invalidate_info and guest
> pasid related uapi were removed in commit 0c9f17877891 ("iommu:
> Remove guest pasid related interfaces and definitions").
> And the corresponding uapi/linux/iommu.h file was removed in
> commit 00a9bc607043 ("iommu: Move iommu fault data to
> linux/iommu.h").
> 
> Signed-off-by: Mark-PK Tsai<mark-pk.tsai@mediatek.com>
> ---
>   Documentation/userspace-api/iommu.rst | 209 --------------------------
>   MAINTAINERS                           |   1 -
>   2 files changed, 210 deletions(-)
>   delete mode 100644 Documentation/userspace-api/iommu.rst

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks,
baolu

