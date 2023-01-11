Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97274C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBqt3gWo4SUcJ9mt0H5dLVg09H+Re67oS5zbJVV/YBc=; b=YuQO8uP0sTRT9+oA5jVRB2RWdm
	rXPIncHbD1QLlVQVOwqk7ZQdom4gFEoyNBBjFxd8KN9pUTwKY4zgnUrJ32tzUarxheedefIqr93Si
	B1fGhHvk/yaYEUL5p93E/PojlStbuTqEAcuxOUJKCmTa5ETGOsC6sXLAK10iI33Ps7sG27FmtWXom
	4ulpjIB8tlDwBXlMN+D5vtiSW8th7YLuS1nLT/Ye5YkQZOcSQJSDXft+scFWAg156OKt854pKP2DU
	qZGQmflnRDj0qg1uSTwPL8cZ76mDICu2ih+VQZ2BarzYruUkFDF+J89EI+tNe8I/+4/u+o0JhKTRK
	NYHrKX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXRM-00AXx9-4v; Wed, 11 Jan 2023 09:30:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXRA-00AXtA-S1; Wed, 11 Jan 2023 09:30:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 319D9B81B3E;
	Wed, 11 Jan 2023 09:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0ABC433EF;
	Wed, 11 Jan 2023 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673429421;
	bh=pNfMIqO9t73o1w5Ym2sYx549qBwB7dkKL+u78E64yg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FsueOTAIOrGEA4Pg+SXHDGPjBZcoJL8km4y68X6NDgXyfStiYknAv7prSI0U7SSxH
	 T41K10gPZqOUT5aQhW8WugjDhW9FdCLYPWp62o5OPxywFlCij8WcUFU6Iz8T3YotGP
	 R17mf8Xxs+ftPHgXo3Nfirtb/VUa5ZMuDPnH6J4qTcPZxwbm9Pkv39rn8kSj6UciGD
	 Q8/V7Gbf8WPAMvb8an9EhdZdDTCg0lJn5Ta3GqsF//PWHp7Dsna+M7GvYc5QzjbxX/
	 HZyp1NqIs/ienbF+iUwPo8NypH22x24WNlPCskL95Bdt6/7CIPRGewawNZ8f3bipvM
	 GM7ydKRHCrEgA==
Message-ID: <dccfa004-1d40-acc0-6220-9232193b648f@kernel.org>
Date: Wed, 11 Jan 2023 10:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] dt-bindings: PCI: mediatek-gen3: Add support for
 controlling power and reset
Content-Language: en-US
To: Jian Yang <jian.yang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
 <kw@linux.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 chuanjia.liu@mediatek.com, jieyy.yang@mediatek.com,
 qizhong.cheng@mediatek.com, rex-bc.chen@mediatek.com,
 david-yh.chiu@mediatek.com
References: <20230111032830.20447-1-jian.yang@mediatek.com>
 <20230111032830.20447-3-jian.yang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230111032830.20447-3-jian.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_013025_212336_AACE5324 
X-CRM114-Status: GOOD (  19.19  )
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

On 11/01/2023 04:28, Jian Yang wrote:
> From: "jian.yang" <jian.yang@mediatek.com>
> 
> Add new properties to support control power supplies and reset pin of
> a downstream component.
> 
> Signed-off-by: jian.yang <jian.yang@mediatek.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 7e8c7a2a5f9b..46149cc63989 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -84,6 +84,29 @@ properties:
>      items:
>        enum: [ phy, mac ]
>  
> +  pcie1v8-supply:
> +    description:
> +      The regulator phandle that provides 1.8V power to downstream component.
> +
> +  pcie3v3-supply:
> +    description:
> +      The regulator phandle that provides 3.3V power to downstream component.
> +
> +  pcie12v-supply:
> +    description:
> +      The regulator phandle that provides 12V power to downstream component.
> +
> +  dsc-reset-gpios:
> +    description:
> +      The reset GPIO of a downstream component.

Why you cannot use standard reset-gpios property?

> +    maxItems: 1
> +
> +  dsc-reset-msleep:

Wrong property unit/suffix.

> +    description:
> +      The delay time between assertion and de-assertion of a downstream
> +      component's reset GPIO.

Why this should be a property of DT?

> +    maxItems: 1

maxItems of what?

> +
>    clocks:
>      minItems: 4
>      maxItems: 6

Best regards,
Krzysztof


