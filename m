Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F042AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+3mAMM6qwmEvL9yH4MHkQw7v5GEmaUwwdPQRsekELE=; b=CNQ65km8bDYzek
	7YlKT+6tUiqAUgH+nFGBWNalDRIhc6ioeL8RClF4Bh83WlaglmsSURAgvfcKRLqJDwyVtXAo7DxVD
	aCYu1DdNKOUwY8DQmoWEDQXbturR+B6Zj0nnhroYWZheWPv8Hszyd1HHvB5+xX5Ri2E1YPljou5zt
	rKDophrEa0UZB6AEQ6et9DkdwJNKKQq2rQ4/cvsxZEeMc2XzXlLW4JgIOmgKez0g3Tuz0MMEZuvS7
	71xLAHeAkp+ik2HmbQZJnNU7C+dnAOxq/yTy+QCnDEmOz6XBgT48qXa3axQM8xc3EnAksZUHVy8rs
	6BpNBIYvjXOL47j8Cllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIcS-00BuV3-Oc; Wed, 04 May 2022 17:16:56 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIcP-00BuUJ-PA; Wed, 04 May 2022 17:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hy+OhVR/LV0xEzAsGTGdgKCKGoSd8NJQpERGht9sL1o=; b=Ex1fLswhxbmvMM6ln5WhknBLM/
 PmSusBqYOAcPwmB8INTvkq+eguCyPDijsDz8PAtNIfwqfyCvYK2KU8Jlv28tNo5jveGmStK04hweD
 C5mjIZ/bvhvb0WqBv6UmR1pHy1qBwnblP8khg8eEY94TpR3ROiwJeqqqiZC1ZAsUlcS0=;
Received: from p200300daa70ef200891a2ae4514fd280.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:891a:2ae4:514f:d280] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nmIcD-00043Z-CU; Wed, 04 May 2022 19:16:41 +0200
Message-ID: <c54c5692-56bd-c17c-24f5-741ec2a1a839@nbd.name>
Date: Wed, 4 May 2022 19:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] PCI: mediatek-gen3: change driver name to mtk-pcie-gen3
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220504170658.GA453994@bhelgaas>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220504170658.GA453994@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101654_110663_2A10047C 
X-CRM114-Status: GOOD (  15.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 04.05.22 19:06, Bjorn Helgaas wrote:
> On Wed, May 04, 2022 at 12:05:55PM +0200, Felix Fietkau wrote:
>> This allows it to coexist with the other mtk pcie driver in the same kernel
> 
> I assume this is a v3 of [1].  Please:
Thanks, I wasn't aware of that patch.

>    - Follow the subject line capitalization convention, i.e.,
>      "PCI: mediatek-gen3: Change ..."
> 
>    - Expand the commit log to say why this is important.  From a C
>      language level, using the same "mtk-pcie" string in both drivers
>      is no problem.  So please mention where it *is* a problem, e.g.,
>      if it's a problem with modprobe or similar, say that.  Or if it's
>      to make log messages in dmesg have different driver names, say
>      that.The reason is the fact that driver_register will refuse to register a 
driver if one with the same name has already been registered.

>    - s/pcie/PCIe/ in commit log and other English text.
> 
>    - Add a period at the end of the commit log sentence.
> 
> [1] https://lore.kernel.org/r/20220422070908.14043-1-jianjun.wang@mediatek.com
Will take care of this and send an updated version as v3.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
