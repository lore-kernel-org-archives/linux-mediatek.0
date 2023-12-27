Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60178C46CD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvdkzMcPB0BnhtpyqYBsUSBabcmCryFsG0lmm846Yoc=; b=NVSbAMnhfoqFcqwidyo5EyHgf6
	TQni5v3SNXptV/Niz7Gu2iAleGZ13eQnzesxCgh7FyUEZVD8ipnTgIp0E9a0AwcTzeVzV6E827r/3
	tMi2BFfXzaNNvi6Pb9v5LlITf7Qgx/fswygoBPGJKqIwg0n44P7ITvRA2X6Vgh/NE2yRTzSUME2Kg
	UCDO6Q7BfCiyjQ4JohHuF6JPY6UD1Ix1vG3/5Wh0aZaHD+9NSqI76nLjAcpqTDJ69UGKkZYmvFs8Y
	O3MlVicautAfKbBFPuwmCCeqBpnWxfvj7hGt9b0tsIhQbU/dQc13ZrkdtD51ujQPcNc908wYR60aK
	+8Xmak6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWLx-00F0YD-0V;
	Wed, 27 Dec 2023 16:01:53 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWLt-00F0X1-3C;
	Wed, 27 Dec 2023 16:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703692910; x=1735228910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qIi6/FGG1XhIsYOH+tdaJ+Cr8i/oTUD6GGfo2SnNl+w=;
  b=gbGIjuYK3Y2pP7Rm8uX3/bS4hqUid5SLYprrN16P7NxWbOtHpesY5a4b
   1gbNxO9fvFYPNlRQcrseNyPSq61XfLaZ4HISFeM5oKGcRHxTpiZDf5o6w
   BZqGXMwJaX5sng/8JXbDnMa7l/XB1LR03reih4ZEHz8w8Q0Kb7ayDk3Cl
   7mMTYmHcxevCOMrljYC2jL7yi1ZrJvq2bwNO6Bm+D8igwuUps0vzQ8jXo
   uCusMfrCr48Ea0cUyXLCZC8fPBTcBVgjw/Wvu4R4kV/hMhrY+49ANUd2t
   ZIG58SaELucQ8Wu02+bt6QeP3yfTTHIQend5Vmozf8RAIVLWO9y9EkXuS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3745325"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="3745325"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 08:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="951530427"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="951530427"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 08:01:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rIWLk-00000009SPM-3mSN;
	Wed, 27 Dec 2023 18:01:40 +0200
Date: Wed, 27 Dec 2023 18:01:40 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/22] Improve IRQ wake capability reporting and
 update the cros_ec driver to use it
Message-ID: <ZYxKZD4IMJH_QjQW@smile.fi.intel.com>
References: <20231220235459.2965548-1-markhas@chromium.org>
 <ZYRAuY1LGdD8_u5K@smile.fi.intel.com>
 <CANg-bXDw+bYNTu-HFaNAPb4e+_oKt2ExR6PehWR_==vpboKGaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANg-bXDw+bYNTu-HFaNAPb4e+_oKt2ExR6PehWR_==vpboKGaw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_080150_037751_A8D4A71F 
X-CRM114-Status: UNSURE (   9.88  )
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

On Fri, Dec 22, 2023 at 03:30:43PM -0700, Mark Hasemeyer wrote:
> > Just wondering if you used --histogram diff algo when preparing patches.
> 
> Not knowingly. I use patman which uses 'git format-patch' under the
> covers with some added options:
> https://github.com/siemens/u-boot/blob/master/tools/patman/gitutil.py#L308

Add a configuration into your ~/.gitconfig (or local for the project),
it really makes the difference.

-- 
With Best Regards,
Andy Shevchenko



