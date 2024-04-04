Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB8BCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUPDhE1q5hkt+SC375AMLgdntEYjuu8uCDanunsROIg=; b=jpmZNfyYOz/D5i+09RrrZwD5Bn
	2fZnb+GS6fUp937IaQDrE+0/vfgXPyi5KGO7sPlG/RAq3J10gdZ80UemtS636GdADs2f0E2WSkD/v
	GedPLFHpvr3pGxXSVaOKr308Q6b0Ak/R93FJMmtMsA7yOG/r1maG5v5Icfb0zITdVDHFcEnlJWclf
	9d3uzuWilj9zQ325a+BOnEf/Jr2qIQ8Roe4uvg7D3OqUP5C/UDLLXpzjmwS3Va/sTXeF/rLOsWfV5
	1KeTE+Km6PubkcgCwlrRSZ+eE7PxYtAmHcw6/VZWYwjjb8SlceBSmNqTOkQyWj/II+r3Gmt0f3YPB
	tbI17klA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsObL-000000038zD-2iuf;
	Thu, 04 Apr 2024 15:02:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsObI-000000038xZ-0N9V;
	Thu, 04 Apr 2024 15:02:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 290F7616F8;
	Thu,  4 Apr 2024 15:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D121C433C7;
	Thu,  4 Apr 2024 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712242918;
	bh=m37CGWgGDzDmqqe0wk4eeU3R+P2kwq9EU6P+HBudePA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qaVIpo7KcwdH/2KGDFx1mUZTuMagPUnp8++R3YOCdX87zDybHhWnCcJC3PyNi2bW9
	 BI7jfEPRj8JzPlIooc9+HkzESGwDGV6Y9ij240rM/UHWhO20Q+XTXJCTPeNzihyEbG
	 TYRbqil/VAwNNwbUzFisJ6vOTzjsdxiX39pCHfqNImY5YpMsM3zV3vGydohSsx0veC
	 Kik4rPAp1JZYjLXiu55enmnEQ6MnLLMfpUpbPN/UwffcReqM68sIBC+paK/A+EYTL6
	 AeJMDxRdfWiHbkDTbZANN2Rsvjl38dw5kKQ5XVqVo4cDL+4hxI+lFqFr95RcUZOJCs
	 dLhuGXRiUHz0g==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: aleksander.lobakin@intel.com,  kuba@kernel.org,  davem@davemloft.net,
  pabeni@redhat.com,  edumazet@google.com,  elder@kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  nbd@nbd.name,
  sean.wang@mediatek.com,  Mark-MC.Lee@mediatek.com,  lorenzo@kernel.org,
  taras.chornyi@plvision.eu,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  quic_jjohnson@quicinc.com,  leon@kernel.org,
  dennis.dalessandro@cornelisnetworks.com,  linux-kernel@vger.kernel.org,
  netdev@vger.kernel.org,  bpf@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/5] allocate dummy device dynamically
References: <20240404114854.2498663-1-leitao@debian.org>
	<87plv549ts.fsf@kernel.org> <Zg63iwvtTMlZSGcd@gmail.com>
Date: Thu, 04 Apr 2024 18:01:52 +0300
In-Reply-To: <Zg63iwvtTMlZSGcd@gmail.com> (Breno Leitao's message of "Thu, 4
	Apr 2024 07:22:03 -0700")
Message-ID: <87le5t41en.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_080200_197905_8D0DAA80 
X-CRM114-Status: GOOD (  20.12  )
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

Breno Leitao <leitao@debian.org> writes:

> Hello Kalle,
>
> On Thu, Apr 04, 2024 at 02:59:59PM +0300, Kalle Valo wrote:
>> Breno Leitao <leitao@debian.org> writes:
>> 
>> > struct net_device shouldn't be embedded into any structure, instead,
>> > the owner should use the private space to embed their state into
>> > net_device.
>> >
>> > But, in some cases the net_device is embedded inside the private
>> > structure, which blocks the usage of zero-length arrays inside
>> > net_device.
>> >
>> > Create a helper to allocate a dummy device at dynamically runtime, and
>> > move the Ethernet devices to use it, instead of embedding the dummy
>> > device inside the private structure.
>> >
>> > This fixes all the network cases except for wireless drivers.
>> >
>> > PS: Due to lack of hardware, unfortunately all these patches are
>> > compiled tested only.
>> 
>> BTW if it helps, and if you have an ath10k or ath11k patch already, I
>> can run a quick test on real hardware.
>
> That would be very much appreciated! Thanks!
>
> I don't have them ready yet, but, I will work on them soon and I will
> send it to you probably tomorrow.
>
> Should I send them as RFC, or as a regular patch, and we iterate over?
> What would you prefer?

A regular patch, like you did last time with ath11k, is fine for me. But
please do add a lore or patchwork link to the depency patchset so that
I'm testing with correct patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

