Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3F1C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 01:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kp3oh8Od8/OIIn93xFgRDN2L2JeMHRXp4fW9LAZdFuM=; b=iYRss8F5X9la6hTmJGlz81KnRt
	4jNch2CrrqLPDw7bVLQ7wXzOFSi4/YgfETEp75kT2ShFvgajVGRli7pmV8GyX1ha+TuXEsrb9+6aB
	NdZ3xV4Lj2ze/KIMxK2ICkbtqmkRuvaSW4kivHm1rTz+Cz7YeikLGHGaUSwTkYQ/A9i65Wl4Z8eQH
	DVr2lndshY1wlj6tLKpJ/+d/IUuvb8/YuCR+5iZfP0pzR7Qe1mwjnOq5/2O4DufpQBvN+AUzq2dC2
	LdCLyys3G6Ijys9CBu5Z0KTIdLO32W1IVtVTDUDP0eyiiiKawJQKzMxUfW0Z8YiR+psbVQLEG1Bhq
	p8XgQuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcFux-00BxFt-1X;
	Wed, 15 Mar 2023 01:27:03 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcFuu-00BxEM-2C
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 01:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1678843620; x=1710379620;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AOLVY8ScLhOLSLHr/VjLvAiC26pb7LJQs/YD3vXc8OI=;
  b=QCjGQQdq+rBv0Ty9QqEhAMmQQ/k19x8QdOeptBTCRBeEu7dqTX2MRy9Q
   C0RCuqoZ35nS1p/YRul+VVhvjK7sVhXM6go1anYBEu9nGJ2RXM4OLEtvX
   XI/fzDzbbeQNDkyaT3kxb3Phf6mPTXYG9Oc4Y1swBcYEbKUuCgq8PwmfJ
   Ym4kfrU0czLF7R4+iPgr5CWhoPxe+W3PleKZAbMJPKDLtY8MTkTUk1be4
   7Lj/0K3j1MnIxEEU7A8ViJgHhcMhJP4RloGtQzSXt5gi/ydr6eEhmxmoq
   1vpOU8DxKt6a1WmpzMVuI6HEXF/zTKx8R5MU9cPFqRuLyEPpssKcZGPCF
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,261,1673884800"; 
   d="scan'208";a="225646178"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2023 09:26:55 +0800
IronPort-SDR: ctufjsHnB+jMYyl9KdOCVkZmDrX2CvjwQIvDhU/7rQEu3X7aqRL/DrsrBA/d53TbmCX7BqDZHF
 nItUJiYmamZvvbF2RTEmq54Y8z58sqggXY/8F+mIcKsDGRMoumK9yppBLlPD2ISW4jU2sEqfIs
 2dfN5RE431b+juaAPRHlhkJw/HjoPb9BCSbURzsXcPrSOkdYTnotm89LBjChD4DBrbzrOGA0X8
 znAla2EeNAfnzjD01KTOC3mnnsTPAyg8pMJVF8AunE5SI3AInVpwGA005nwt9/6y1XzzgKCRHa
 FXE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Mar 2023 17:43:22 -0700
IronPort-SDR: VffWR4jXm6njCIWwr3OPVJeTTQ146OWpEz6IzpzIvLLW/zcGNycu86G7YuHxHn8zYsvsd1CNfn
 4zYA6JiQ/TWpo7QUzdFzYY+v7EIxJnKBaassLVx7qLq+vXCDasxeQQFAfo2AXhUsfT7vLNoV7Y
 qtGuqCCXcDCrGm0jZ5Imr2ONnVpWaButg+DPZtQFB2J9SUk4PLusVYwQNR9a8gMjHSm7G41cFU
 RY9an/2IyM9GHPEsH7J0rAfP/vuYR1VNtd2dEgnibWxsZL59VBJsepJrOtgnVuUbQ8knAb/2DB
 RDM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Mar 2023 18:26:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pbt6704TWz1RtVv
	for <linux-mediatek@lists.infradead.org>; Tue, 14 Mar 2023 18:26:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1678843614; x=1681435615; bh=AOLVY8ScLhOLSLHr/VjLvAiC26pb7LJQs/Y
	D3vXc8OI=; b=rdpJw30Y1fiXHSXoIUj1CirsSMNQQrW2blOBtl+hLqoJBbmTupm
	Wtek/7LLWelcd8SB7ocHF8J3jXrfrwvALOJknPPLmFOPrbSsyFEh2qlLe28POFpf
	2nBI38Zo2hesIBCR215un2dBZdCIEMWvzUYIa8ki94mPt7JEYoJx92RNmWitVb+4
	j3PfurWSanRiyp5WiIrctPloeS2ubGlu94WfXv7EY8XwfWueGQBOY1Ow6jefm79e
	uhX5sV/V/mylXbd5vLY91yiq0anHo+VBfX3gkXCgYBZlba+sgZswnvEpDGESVYef
	UO0pfd+rMXikQSf9X+6gGqP5fPPLLVHEkrQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aXwh2HCJNZuK for <linux-mediatek@lists.infradead.org>;
	Tue, 14 Mar 2023 18:26:54 -0700 (PDT)
Received: from [10.225.163.84] (unknown [10.225.163.84])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pbt644vprz1RtVm;
	Tue, 14 Mar 2023 18:26:52 -0700 (PDT)
Message-ID: <16cc37a4-0d97-9881-9a30-a3a3efa2c244@opensource.wdc.com>
Date: Wed, 15 Mar 2023 10:26:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ata: Use of_property_present() for testing DT property
 presence
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230310144700.1541414-1-robh@kernel.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230310144700.1541414-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_182700_792017_E97D49EC 
X-CRM114-Status: GOOD (  14.25  )
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

On 3/10/23 23:47, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to for-6.4. Thanks !


-- 
Damien Le Moal
Western Digital Research


