Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF00C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 16:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4uFMXyLZR37FBZIAF8zieBTndKzZsT26UycPoX3bEIU=; b=L5CzOC0hx6g1qtY+4x1S0TrYxF
	dxr45BCmXOprdjKkpmkgmC3mmKukdXc0jl2JR45U/OEnZV1tqjAqwhkUEbLrf1AFSuDmowq5bJ0eN
	3u+4eY6pWoHh8ICIpAb2dlM6WV4+9cQy7t5rpNivLsBzqkcsIaou1YorqNOuanGN6fx1dkNxoNNbn
	wpz1G45WVYJx9Z/Oba5B3mgUPlYCvAhhdLR86w0TPPG3bMjQE+U621uuCgKjb+HmArYXCQYedz/Gt
	TZmbR29GLJb8ttc26hnzWBEWyZdPUZfvteIrz+9xwcsIyKE20gHx0tTYZuXp5XQIAmle5PXFtEhQU
	OdI4EkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms6Lz-006DzB-Fd; Tue, 30 Nov 2021 16:51:39 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms6Lw-006DcO-C4
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 16:51:37 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="299650829"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="299650829"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 08:49:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="601572330"
Received: from vschult-mobl1.amr.corp.intel.com (HELO [10.212.122.173])
 ([10.212.122.173])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 08:49:33 -0800
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Julian.Schroeder@amd.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Balakishore.pati@amd.com,
 yc.hung@mediatek.com, vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com,
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
 <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
Date: Tue, 30 Nov 2021 10:49:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_085136_482760_63D5DFA9 
X-CRM114-Status: GOOD (  12.06  )
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




>> --- a/sound/soc/amd/Kconfig
>> +++ b/sound/soc/amd/Kconfig
>> @@ -96,4 +96,10 @@ config SND_SOC_AMD_YC_MACH
>>           Say m if you have such a device.
>>           If unsure select "N".
>>
>> +config SND_AMD_ACP_CONFIG
>> +       tristate "AMD ACP configuration selection"
> 
> This definitely needs proper dependencies, to prevent asking the user
> about this when configuring a kernel without AMD Audio ACP support.
> 
> I would have sent a patch, but...

There's indeed a missing dependency that was fixed in
https://github.com/thesofproject/linux/pull/3284

Daniel, you may want to squash it in an update?

To Geert's point, there may be an additional need to add a

depends on SND_SOC_AMD_ACP

There are also a set of

SND_SOC_AMD_ACPyx options, not sure if any applies as a dependency here?



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
