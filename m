Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C440C5472D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTk1HuoGMIJL60ESCOP0G9YxxFbYuk2FLbGh2/mxvbI=; b=elVIEkAvKyQHFpWr0k2/BCsIds
	yG6bkBXv4wZyAD0UDQV94Qwdg6bEBlSr98sj5KKQu/aDUJYYw1YPrXZ7ES2q52/L4e+gOl+9Bv/bx
	LY7SKu0K1YLzonIozOTyUF+lUx2o4w0swDWQcwHinnZo4iMh07W2a7Wl8bf5M0VuRqTFtN2IAa9Rd
	hKV6cmL19AemOVFboVTWJepbs/vtGhnhejZmHWxjlc4HgTF6Lg8HqKFy+whH7suEw44ARUCDRplfQ
	2KvovjHnprxlwSSGvoMpmHIaYoNddw+KpWFR9VmvWGsfOjFmINJlyxiDUTbnM6Azc/VJG6+593zYM
	SER/al8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDWL-0000000EPTH-3gOX;
	Wed, 28 Aug 2024 07:55:13 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDSc-0000000ENzN-2tWL;
	Wed, 28 Aug 2024 07:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724831482; x=1756367482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g6S7cgkwyHTYMqfsr52CVhpQrrl8Vy5/S/YFliyHNKE=;
  b=TEGld0ZrtBHs4WRW0gJqK+MgU3l59FRUQ9xQUl9JuNkUeQr3k1wqEeiC
   sCo4VcFAPC2ijqsqnaq1zMEQ2xwYExwvctYpgEYExcQ1ZHrFGeOgMFNi8
   NAWhEcmQzTLhtRMqeDoKOGjQHpokRWpXYUrb43hNWLeqeHraLNPoeiU9P
   yKsfAzOSBpf785eB5kMupns4DDGeCZIlmAOEpJqvhYZ42EPseNCYMaQyo
   stwDDPY2MK3MsU6jonqVYQiUFhJIfZjmRPJhnjInS5+T01NlOVRTe8b6H
   mGE7/OFqwlSw2NmhY35g7oK2yenfw8TL1RYW4hplO/7GYtG8Z2aBHWX9U
   A==;
X-CSE-ConnectionGUID: fIcnTmwuQ7enC0mscYT+Cw==
X-CSE-MsgGUID: 4slCQU7nTUKckvPL0znHpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40849864"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="40849864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 00:51:21 -0700
X-CSE-ConnectionGUID: mV4/iQEoSU2UdekrGE/mQg==
X-CSE-MsgGUID: xtm+W/8oToWtEBp4ANQBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="63133947"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 00:51:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1D86911F95D;
	Wed, 28 Aug 2024 10:51:16 +0300 (EEST)
Date: Wed, 28 Aug 2024 07:51:16 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, teddy.chen@mediatek.com,
	yunkec@chromium.org, 10572168@qq.com
Subject: Re: [PATCH] media: i2c: improve suspend/resume switch performance
 for GT9769 VCM driver
Message-ID: <Zs7W9PDY2ny5JI8w@kekkonen.localdomain>
References: <20240817073452.21627-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817073452.21627-1-zhi.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_005122_765194_4DF3E6E7 
X-CRM114-Status: GOOD (  16.00  )
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

Hi Zhi,

Thanks for the patch.

On Sat, Aug 17, 2024 at 03:34:02PM +0800, Zhi Mao wrote:
> GT9769 VCM power-on default setting is PD=0,
> so it is not necessary to set again in dw9768_init function,
> and it also has no requirement of setting PD=1
> before power-off in dw9768_release function.
> For GT9769 VCM, PD mode control will add extra time
> when switching between suspend and resume.
> e.g. chrome camera AP can switch between video and photo mode,
> the behavior corresponding to VCM is suspend and resume,
> it will cause camera preview is not smooth.

If this is the problem, wouldn't either of these two be a better option:

- keep the file handle open in the user space, to avoid powering off the
  VCM or

- add autosuspend support to the driver.

I also wouldn't differentiate driver behaviour between the chips. If the
hardware default really is different (is it, this is rare for
register-compatible parts), then the driver needs to reprogram it (at least
on the one with a different default).

-- 
Kind regards,

Sakari Ailus

