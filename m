Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE8BC4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jSXWgtpmhpETjjysfnVHOSJCMJXwm4sCsG1+qSfWrk=; b=p6RIlfgC+oIxbpGyfMNHhngcGV
	TfGSEqXeUwS/jvujvs4wy+qkkdmngB+5VhYbQxfUWIoCta40KPz5wqtOrz5QYXPu/wm3w/cKSwkrG
	4NFQI/u5lNDLoEFWoBplIghW+KD7ZOo4j7CL9jNB3rwGf2oR3oY8IQ6gWe9OIgCG+lYaVxVg8bIUn
	cOvEGnrOszbrfkIF8L/TQkFc1QG8rkWPHjJe659X2frnvColn9V8qGViRzzkugXlI9JYPY93kMI6A
	EcdNlDYZLyjpXe5vqScOwK1eQaTB023i740tVWYMZ+D9FrzMdqjWanEMPxCQP2m4kMp4H2z+pJx4N
	B6shOMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0ww-00000003npj-3d2I;
	Mon, 05 Feb 2024 15:31:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0wt-00000003noR-2wYp;
	Mon, 05 Feb 2024 15:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707147113;
	bh=8snPz5SG3U7m1WhMLbVGZPjJdXl3YDQbMd0wdwiDQUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MLa/SRbB6D+KCjcUqvcFgqX3P6BgkTBZbWRnH0sYReMq04vsIR7XrADyPkdgWN1BV
	 fVxwZ7qnvAZcsnJntJhIB4Eut7W4zWVh8C6kXd50V1yYaj55xqIDInFJ1BuLfWmfDJ
	 6pxeHDxi2HxBhY+eHjxp1EpT1UpOjL9XSl7/YY1llLl5EqEpK1aSQd3gTo1nu+hFX6
	 TmYdHMJpTFlYj7wflYj/WieA9HoHRQYuMgkjDGOChW7wduNE3ZpEGjSq027pvkAmNr
	 FgBTFIxgFG6/IbWXGYZ11UvX90dFGmIGUvTMEgFbHdFjHOt3Z7kemIt6atJqRiS1dH
	 LTqV00pOy2ptA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 35B2B37813E4;
	Mon,  5 Feb 2024 15:31:52 +0000 (UTC)
Message-ID: <1b2538a1-d85d-4a62-8c9a-24ce93613080@collabora.com>
Date: Mon, 5 Feb 2024 16:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Introduce the MT8395 Radxa
 NIO 12L board
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, wenst@chromium.org, hsinyi@chromium.org,
 nfraprado@collabora.com, macpaul.lin@mediatek.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 stephen@radxa.com, tom@radxa.com
References: <20240202114821.79227-3-angelogioacchino.delregno@collabora.com>
 <202402041754.SHJCpnEP-lkp@intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <202402041754.SHJCpnEP-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_073155_911842_788AE162 
X-CRM114-Status: GOOD (  12.92  )
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

Il 04/02/24 10:31, kernel test robot ha scritto:
> Hi AngeloGioacchino,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linus/master v6.8-rc2 next-20240202]

Whoever is reading this... yes that's all expected; this series depends on a commit
that was already picked in the mediatek trees.

https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/commit/?h=v6.8-next/dts64&id=d464e09e60f024aea0de7adb680a8e8582ab8df8

Regards,
Angelo

> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-arm64-mediatek-Add-MT8395-Radxa-NIO-12L-board-compatible/20240202-195207
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20240202114821.79227-3-angelogioacchino.delregno%40collabora.com
> patch subject: [PATCH v2 2/2] arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240204/202402041754.SHJCpnEP-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041754.SHJCpnEP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402041754.SHJCpnEP-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts:791.1-8 Label or path ssusb0 not found
>>> Error: arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts:804.1-8 Label or path ssusb2 not found
>     FATAL ERROR: Syntax error parsing input tree
> 



