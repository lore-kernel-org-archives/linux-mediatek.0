Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE451C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WY3yN9WgNfUdqLLgZpbcv5qQY5jc6G9ySIJZSYYAyew=; b=yE3hKCam73weTaO2ptz0cPZxjX
	42/ny/2yK/rtn4MAsPazObW+Mo0avDv5DKad4Ge7PUhOLRDu3HYR0C632FTS3tF3yX37nCuYD9452
	7TWc1eFcE93L9C6X5AcY5edUIpZI430hGOg4fjKyByZMK9x1PRXLlOvsBIvJiv2zX1wJn6A5TL7FQ
	UrXV5yQyLk794sykMjRO4Wj0EDeTiek4bWIcM3jK2jf7Vla54BB8rW1iJ/dlFTxRsJiWKohyVrpMY
	LvmKVaNzOcSao4VlEKN2B2TJgbaHuJVi3R7bzLXsdDXCYZfjJ2bbQSXJhLutTf+6MIFIeo9RmweuH
	mwSsEZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rInrH-00GZMC-2J;
	Thu, 28 Dec 2023 10:43:23 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rInrE-00GZLe-0h;
	Thu, 28 Dec 2023 10:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703760200; x=1735296200;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=WY3yN9WgNfUdqLLgZpbcv5qQY5jc6G9ySIJZSYYAyew=;
  b=WE287QJEZotZ3q73+ju5SLQr2oLMpCkmneXRjvJajg6Ejv5aWrbLULtO
   fSrOOp6aEIubzZoMgKyLFxYELME09zJ9k94i8zsK+2qDF0V447xhxgPZJ
   LaQ53dQRYOfuiakV6RSQUTWgN/pU50PgiagX9K7noZk75002y8ecMPuSX
   3HxwmY6QDux5LXU0JRIUHRhH8lCRFC/sEriGiDv3TmZv/H1mDlTeicRUw
   BlZGDm7iO2ogI3fSSSLRGqzeAgXV/3jC4B/tCMcLMXK4G6DC3uPSuMhP5
   A2LpiLTrJLTzpQESB7QEZ//HeklA1CAFZyMVBGH+L9W5v40S8oNr74FFB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="400345440"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="400345440"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 02:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="897169005"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="897169005"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2023 02:42:50 -0800
Message-ID: <1718f25d-3274-3e4d-0cdf-72fda8788e39@linux.intel.com>
Date: Thu, 28 Dec 2023 12:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
References: <20231227060316.8539-1-chunfeng.yun@mediatek.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: mtk-xhci: add a property for
 Gen1 isoc-in transfer issue
In-Reply-To: <20231227060316.8539-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_024320_317550_22709D04 
X-CRM114-Status: GOOD (  11.89  )
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

Hi

On 27.12.2023 8.03, Chunfeng Yun wrote:
> For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
> still send out unexpected ACK after receiving a short packet in burst
> transfer, this will cause an exception on connected device, specially for
> a 4k camera.
> Add a quirk property "rx-fifo-depth" to work around this hardware issue,
> prefer to use 3k bytes;
> The side-effect is that may cause performance drop about 10%, including
> bulk transfer.

Is it be possible to detect those Mediatek xHC versions that need this
workaround in the xhci-mtk driver directly?

This way we could avoid passing a new "rx-fifo-depth" property to it.

Thanks
Mathias


