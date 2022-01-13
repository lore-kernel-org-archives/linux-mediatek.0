Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733BBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 18:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bBdnljTMN7nhploar2KCwtLaz+Fjs3l+73eBfWLq9Xg=; b=O4yx121n+F/B4C6wGE5bbjlO6J
	m6RjAhdAlITuQUTqbrdQcYJZzo26U1TCvRX3v6bdksazNzW+H/jPpSCTsdJvYtDFanEW9OM+aTSye
	4bGufcBxulKQvR5zq76UPZhorn3dFy5J8XkG4B3LXAmUfGic6rhrfJjISFzyW6qKnhiH7Y9AHXWk5
	CKBmWUXjJrlZV9bETOh9nqZiZmYBrInMCdpY6U728g5qO28gkG0KU37osIARhfWMzJ1W2oweUWPDJ
	pHhhQgRWfT42PoST5GeShxpxpd56GF64SzWckDxjBz9XkQrYJRbRm/egaUyn/BirSyzkYp7JohvrF
	zHDSZ+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n851d-006sTh-4N; Thu, 13 Jan 2022 18:40:41 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n851a-006sSe-9y; Thu, 13 Jan 2022 18:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642099238; x=1673635238;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qqcMZ1IZfmNOmWmFj956qQSZ+kRWR/NKW/CT4jJutuk=;
 b=GdSkDkuk4caq0+8ShWmQrK9/i1zbKChL9OlgGAjts9AsnCkGu4Fc8KW5
 VLb+gBFCnemO2nfIpO7ItxFXUbz34wQPWiDOFM3pTLJhqZwrXABIrsaHu
 b8rsMOevUv7s+qUpqOC8qHdJ/bNUj2lakCtfumbIuXKvYxYOovoJUAGJm
 A0xJldai6bvMU+1FzNDddhzKznb/6l632ztwenxmdj5BWqKAcQ4VbgHZu
 ReioVnzrNLU5SsAoG7JOgjDXqqhcl+pdxaTtzIShJvL1uLzAGOdhlYE+R
 VbS1PKSQ9dOVq/2cgnoSfxG4IDSmo7kYScA9Ut0yK5U1DGpNgurOPvWWK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="330435389"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="330435389"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:40:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="620700515"
Received: from ypchen-mobl.amr.corp.intel.com (HELO [10.212.66.70])
 ([10.212.66.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:40:34 -0800
Subject: Re: [PATCH v3 1/1] firmware: mediatek: add adsp ipc protocol interface
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20220113082234.29013-1-allen-kh.cheng@mediatek.com>
 <20220113082234.29013-2-allen-kh.cheng@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <32e116f5-7b71-2fe0-ad43-3fbc71a651a5@linux.intel.com>
Date: Thu, 13 Jan 2022 12:40:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113082234.29013-2-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_104038_395402_DB8FC9C1 
X-CRM114-Status: GOOD (  10.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 1/13/22 2:22 AM, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> Some of mediatek processors contain
> the Tensilica HiFix DSP for audio processing.
> 
> The communication between Host CPU and DSP firmware is
> taking place using a shared memory area for message passing.
> 
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> We use two mbox channels to implement a request-reply protocol.
> 
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
