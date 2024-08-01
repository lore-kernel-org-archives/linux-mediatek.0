Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE398C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofGYhSczgfo+BPU+q0gwRUkihifeDx9KW5Dp+cnK83U=; b=VrDcJBoQ/S4O1Cb7L85VXdO7tM
	uz6dNxuEjc4MN7QpVb80jXXfsnyOdJIj6Q1ZUOb7pZBJRv4MSFA9RndEgdsUpLmvdptBONGCMZTof
	nj/KrqbVAFp2mtXLI0J7hhI2Osbbx6s7FNqtKoxyJAVRxzuOTGXpebe80a9+wFv8pKB+n8f4/ppU7
	KSYXB+XwYbTuGZJr5SbzxfMS6zzLHnoEq0twe7CwamfSty9qdQks1YlMqd15oI4dmqd+6M55pr684
	NYb9GLD9OdJoyEf2vkZLe/J4P0xD7r2o++LKnXVVrYDkKPfD/zXz1yh/iClrejJzScrDF2aoPJxbJ
	tv9Hs2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR55-00000004KNz-1K3d;
	Thu, 01 Aug 2024 08:22:39 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR4b-00000004KGs-19Sn;
	Thu, 01 Aug 2024 08:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500528;
	bh=Xko+NGsgt715KHl+KdqbOzHGFKdB6jEcV92XWqA000w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IIl8/0BXar3kAxacRVfXMmthv8nvZzqt775T/PhSRQ3v+zjFQkA3cY0Nxkh4TEppI
	 u01uvejUNjYfIbwYUoYejU0X4MMIUtsmO9WQ5fk63BiGd1bXh3R1EAFc5axarbc2Pf
	 VPTUnPyqGeebN48ZsXZ2Ei0NAJotvoCOjVHXhWol3tGuIS+OVVFY0UsAMBx+Rqi2Rn
	 ETgEHjx4SsdSmHt/UUP3qvrefd3PUxHioeKYeV9CbsIYW05hlYY+uGJCvkranQIIbZ
	 tO94n28WM6163CmMVb2JA4TNt1+whPT90lzO6SRMjjv0coivfdmUDf785dWqimMuaC
	 iodnKJVNLpFjA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A64B3780520;
	Thu,  1 Aug 2024 08:22:07 +0000 (UTC)
Message-ID: <8fd089d2-ac4b-4f6b-9870-4ccdfd320887@collabora.com>
Date: Thu, 1 Aug 2024 10:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: Use of_property_read_bool()
To: "Rob Herring (Arm)" <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240731191312.1710417-23-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240731191312.1710417-23-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_012209_473276_40F37A43 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

Il 31/07/24 21:13, Rob Herring (Arm) ha scritto:
> Use of_property_read_bool() to read boolean properties rather than
> of_find_property(). This is part of a larger effort to remove callers
> of of_find_property() and similar functions. of_find_property() leaks
> the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


