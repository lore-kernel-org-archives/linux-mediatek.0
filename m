Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC045C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 16:18:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97772611C4
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 16:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97772611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CKKxQSSbsAkW3UJj5ScjW6TpXKg15LuOvehz0JfhfZ0=; b=iFw0XH50Yq+najuQVkpDxI7RK2
	UtwRnw1jq4zF+3XzS1lp6/kRyKMzcZTpl9iz42MAEoQETOvMNmqg1gXsgwqXgDQqllCrJMiOVSC24
	WYRMj4WEYIkwl+WX5oJDFzX+i7+5riZ2aGWC1D0Q2L2hYTvobkaP3PxNEaAwV4NYlCPfa9OzAUOrz
	GmRlPK6n/1d+PlDMMo473+rzLsXUloDOj5I2LQnGfj9+ohI6DCkzz8Mo7EtjmwJSKH/H2bh3j/beV
	g2HWV2v8pz2LO2YiCOeeZmpyZk/+Pe68g+Zh2swohr6wTYH9qp8/J/Hi0+QRxwNV0FTV15r0rPyCU
	gAZSJg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj1vM-00BwEy-Og; Fri, 05 Nov 2021 16:18:40 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj1v6-00BwB0-Mi; Fri, 05 Nov 2021 16:18:26 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="229396981"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="229396981"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 09:16:09 -0700
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="502004186"
Received: from yanbiaoc-mobl.amr.corp.intel.com (HELO [10.209.173.63])
 ([10.209.173.63])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 09:16:08 -0700
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code from
 machine driver
To: Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
 <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
 <YYVQC7KLZx8oxdXT@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e404d241-0685-643b-4b9d-d85bb8783385@linux.intel.com>
Date: Fri, 5 Nov 2021 11:16:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYVQC7KLZx8oxdXT@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_091824_846079_5032C480 
X-CRM114-Status: GOOD (  20.52  )
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



On 11/5/21 10:38 AM, Mark Brown wrote:
> On Fri, Nov 05, 2021 at 12:11:55PM +0800, Trevor Wu wrote:
>> On Thu, 2021-11-04 at 15:39 +0000, Mark Brown wrote:
> 
>>> I don't follow why the DSP support requires a new driver?  Shouldn't
>>> all
>>> systems with the DSP present be using it?
> 
>> We need to keep the solution without DSP, so we can replace DSP
>> solution with non-DSP when it's required. But when we introduce SOF for
>> DSP control, there will be more routes in machine driver and device
>> tree usage is different from the original. So it's hard to share the
>> same driver for these two solutions.
> 
> We shouldn't be requiring people to load completely different drivers
> based on software configuration, what if a system wants to bypass the
> DSP in some but not all configurations?  Can we not just have controls
> allowing users to route round the DSP where appropriate?

It was my understanding the card relies on separate components

- a SOF-based component to provide support for DSP-managed interfaces
- a 'non-SOF' component for 'regular' interfaces not handled by the DSP.

this was the basis for the changes discussed in
https://github.com/thesofproject/linux/pull/3217 and
https://github.com/thesofproject/linux/pull/3236

But indeed if the same interface can be managed by the DSP or not,
depending on software choices it's a different problem altogether.

We've looked into this recently, if the choice to involve the DSP or not
is at the interface level, it might be better to have both components
expose different DAIs for the same interface, with some sort of run-time
mutual exclusion, so that all possible/allowed permutations are allowed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
