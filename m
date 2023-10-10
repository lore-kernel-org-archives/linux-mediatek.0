Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0039DCD80D2
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhR7yR1k3z5XJbZ+8zBJf4ATfOLE4KOSKqbl5ld6Sn4=; b=d1oP3ObrxfsBqdx06L5zhyYv/d
	ps0vXGBOLEw6r3rcVB+U6NEoSiQ922xoS2QqQtpKXA4tnpZhr+g+xQ0Uvcx3ZfgOctmQLWD7LM8sI
	H1e2BtOpcEvLO/HoOv++mvySwVB38zFEBjZCGn9EoNuTCQr3O/bCO9Jjge8lYS5ux8xx0vO27VutA
	hxHHzy0/Qf5FvJrHNvgDfMpVBIdjqhMOtwNFiISYRWQBncnOJmHsZN3f0/Xz6v936ezNa5tMNovdG
	yghCrEP9GH4ANG0Z/mIRLhw5nnMD4obFzGq1Pld8XsvOaIew5Ug4zKmvesQPPWcai0Q3xjhiTsPxL
	HgpTAHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqCnl-00DRqQ-2r;
	Tue, 10 Oct 2023 13:29:33 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqCni-00DRpM-1A;
	Tue, 10 Oct 2023 13:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696944570; x=1728480570;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+B4WseGrt1pWwwKou20nfZGYU2s54qm8dWwPLmdD2Ts=;
  b=HgtDU6Ac6H2ZtclZB++3qxCWo4Nxd95gn3Qo+GIiKrrwBgUaJjwLVgxP
   /8ufNB+3VANamEmICO0KGSXRroTF8F+Q7Hopj0DQJnIDRdWcjb9TFFk+M
   O1Ir2fsWpuVIdxNkqfb2hva7vj68/1PqP1R+fIxmGjEPX4Yg0Rnz8PuxQ
   5dRTuIls2FJOeXDUGUPcgpxkn127T4Ut1FdOCcgxL1jPz2jsIXLBK+eSh
   XJKvNwRhRCVlcy7lwdM79zwyN29sh3Oit3Y90cAVTVnrHuDeFsTZoltTG
   w6lLYuH89a9HBOFmwcpTrNyLVuKOaE5tAsFPAB9QMMBtmx4588t2ZDyHb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="384247936"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="384247936"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747071579"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="747071579"
Received: from sssodhi-mobl.amr.corp.intel.com (HELO [10.212.38.18]) ([10.212.38.18])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:29:23 -0700
Message-ID: <2bac708f-40f9-4f02-a3ff-d5ab11e7ebe2@linux.intel.com>
Date: Tue, 10 Oct 2023 09:29:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Convert to platform remove callback returning
 void
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
 <CAEnQRZBzEfwC3kgaUWty769L4wD-LGng5yUJwQR2_C4T0oJjxA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAEnQRZBzEfwC3kgaUWty769L4wD-LGng5yUJwQR2_C4T0oJjxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_062930_410722_7E0CFDAB 
X-CRM114-Status: GOOD (  13.99  )
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



On 10/10/23 07:00, Daniel Baluta wrote:
> On Mon, Oct 9, 2023 at 7:03 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>>
>> The .remove() callback for a platform driver returns an int which makes
>> many driver authors wrongly assume it's possible to do error handling by
>> returning an error code. However the value returned is ignored (apart
>> from emitting a warning) and this typically results in resource leaks.
>>
>> To improve here there is a quest to make the remove callback return
>> void. In the first step of this quest all drivers are converted to
>> .remove_new(), which already returns void. Eventually after all drivers
>> are converted, .remove_new() will be renamed to .remove().
>>
>> The SOF platform drivers all use either sof_of_remove() or
>> sof_acpi_remove() which both return zero unconditionally. Change these
>> functions to return void and the drivers to use .remove_new(). There is
>> no semantical change.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> 
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

FWIW I have a follow-up patch to convert the SOF remove ops to return
void: https://github.com/thesofproject/linux/pull/4625

