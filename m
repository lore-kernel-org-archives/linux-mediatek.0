Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F7BCCFA05
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymss7jGcko1KAVoxKGtQDY4PfcRmi930HGfOqXka1ag=; b=2irRAuIoJ1v1pSmj+krxtUnb2U
	svqeyO6N5z2DopX7EMBV8AwAURVw4axDyuqQ4SooFtAdR0gdyJ3ANL79V+w3CkwaoDryGWxitwK31
	DLnzw1jLGRfKWoy+zjHZWVyXPzFwXvJg7XqrSiVNeZkipJPIbO0fxXYZC6vnuKNGIzLjBuWSejBY9
	9eIpYrTdF8Y+4S0iC/gZkyoFpgolaFZlnOHlasbwXLP9LThh1tJxQna2B3cPP4SjigeDaycgf7LWk
	ZmnEeYlL5Izvkv8IaspnNtocjaEeeEGrTtb+Od23d5NajaJz0Sq4CnYtngTNhJjrPitGRk56txw6Z
	AMsWqJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbkH-0000000DY10-4ASo;
	Wed, 05 Nov 2025 11:32:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbkF-0000000DY05-3rCc
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 11:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762342325;
	bh=qo7Q5+N4DDgqiZo8JDVIJ2IijBxpBe/S1c2lwaOZkJ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XPy5obg5QNFSpQkeUn4jpYq0MZfgWvlHwvYbUuDpQu7gGnm8a6RfJqrqhAHNSZvsy
	 Iyw9cjdtDntX58SK4J+P+S0PYTC7tdKEw13MtE5I48vTa+B7Iqx3POlBjv8Wx7v7GP
	 UEQX3oKAFdPkpFqdyuIyKrP6vDEfPjJdj+TwnnEHC969Msqx0lkJsXHTBvuG+ZsAlU
	 lLcLCHvBujZB3tfuh3ztWwFknm1vgjesigUI5qxnVaXkwS3yhZ83gGssirZo6WN9dy
	 gYWT5dlE7iuapua5SgF2IQ7lPMnBs+pRcC4+wJurjfYbPebdvpx4BSU6WZ0d5fIyc9
	 HJEWiaTaoP0bw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0389217E12AA;
	Wed,  5 Nov 2025 12:32:04 +0100 (CET)
Message-ID: <3e1ffe72-b6a4-45cc-a053-190077818f19@collabora.com>
Date: Wed, 5 Nov 2025 12:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: mediatek-gen3: Ignore link up timeout
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251105062815.966716-1-wenst@chromium.org>
 <7250ae04-866f-489c-b1b6-b8a3d8200529@collabora.com>
 <CAGXv+5EwiL_-ozRARH2UBm5znHi1egBoCjmELN=17hvFF_oeoQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5EwiL_-ozRARH2UBm5znHi1egBoCjmELN=17hvFF_oeoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_033208_111512_484F631B 
X-CRM114-Status: GOOD (  31.05  )
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

Il 05/11/25 10:21, Chen-Yu Tsai ha scritto:
> On Wed, Nov 5, 2025 at 4:45 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 05/11/25 07:28, Chen-Yu Tsai ha scritto:
>>> As mentioned in commit 886a9c134755 ("PCI: dwc: Move link handling into
>>> common code") come up later" in the code, it is possible for link up to
>>> occur later:
>>>
>>>     Let's standardize this to succeed as there are usecases where devices
>>>     (and the link) appear later even without hotplug. For example, a
>>>     reconfigured FPGA device.
>>>
>>> Another case for this is the new PCIe power control stuff. The power
>>> control mechanism only gets triggered in the PCI core after the driver
>>> calls into pci_host_probe(). The power control framework then triggers
>>> a bus rescan. In most driver implementations, this sequence happens
>>> after link training. If the driver errors out when link training times
>>> out, it will never get to the point where the device gets turned on.
>>>
>>> Ignore the link up timeout, and lower the error message down to a
>>> warning.
>>>
>>> This makes PCIe devices that have not-always-on power rails work.
>>> However there may be some reversal of PCIe power sequencing, since now
>>> the PERST# and clocks are enabled in the driver, while the power is
>>> applied afterwards.
>>>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> Ok, that's sensible.
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>>> ---
>>> The change works to get my PCIe WiFi device working, but I wonder if
>>> the driver should expose more fine grained controls for the link clock
>>> and PERST# (when it is owned by the controller and not just a GPIO) to
>>> the power control framework. This applies not just to this driver.
>>>
>>> The PCI standard says that PERST# should hold the device in reset until
>>> the power rails are valid or stable, i.e. at their designated voltages.
>>
>> I completely agree with all of the above - and I can imagine multiple PCI-Express
>> controller drivers doing the same as what's being done in MTK Gen3.
>>
>> This means that the boot process may get slowed down by the port startup sequence
>> on multiple PCI-Express controllers (again not just MediaTek) and it's something
>> that must be resolved in some way... with the fastest course of action imo being
>> giving controller drivers knowledge of whether there's any device that is expected
>> to be powered off at that time (in order to at least avoid all those waits that
>> are expected to fail).
> 
> That also requires some refactoring, since all the drivers _wait_ for link
> up before going into the PCI core, which does the actual child node parsing.
> 
> I would like some input from Bartosz, who introduced the PCI power control
> framework, and Manivannan, who added slot power control.
> 
>> P.S.: Chen-Yu, did you check if the same applies to the MTK previous gen driver?
>>         Could you please check and eventually send a commit to do the same there?
> 
> My quick survey last week indicated that all the drivers except for the
> dwc family error out if link up timed out.
> 
> I don't have any hardware for the older generation though. And it looks
> like for the previous gen, the driver performs even worse, since it can
> support multiple slots, and each slot is brought up sequentially. A slot
> is discarded if link up times out. And the whole driver errors out if no
> slots are working.
> 

Hey, that's bold.

If only one driver (DWC) is working okay, there's something wrong that must be
fixed before that behavior change goes upstream (which it already did, ugh).

This needs attention from both Bartosz and Mani really-right-now.

I'm not sure about possible good solutions, and unfortunately I don't really have
any time to explore, so I'm not spitting any words on that - leaving this to both
Bartosz and Mani as that's also the right thing to do anyway.

Angelo

> 
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> ---
>>>    drivers/pci/controller/pcie-mediatek-gen3.c | 13 +++++++++----
>>>    1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
>>> index 75ddb8bee168..5bdb312c9f9b 100644
>>> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
>>> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
>>> @@ -504,10 +504,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>>>                ltssm_index = PCIE_LTSSM_STATE(val);
>>>                ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
>>>                              "Unknown state" : ltssm_str[ltssm_index];
>>> -             dev_err(pcie->dev,
>>> -                     "PCIe link down, current LTSSM state: %s (%#x)\n",
>>> -                     ltssm_state, val);
>>> -             return err;
>>> +             dev_warn(pcie->dev,
>>> +                      "PCIe link down, current LTSSM state: %s (%#x)\n",
>>> +                      ltssm_state, val);
>>> +
>>> +             /*
>>> +              * Ignore the timeout, as the link may come up later,
>>> +              * such as when the PCI power control enables power to the
>>> +              * device, at which point it triggers a rescan.
>>> +              */
>>>        }
>>>
>>>        mtk_pcie_enable_msi(pcie);
>>
>>


