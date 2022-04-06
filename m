Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11168C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PoEa+uGyavN5SSiX+vZn4WS3b3f7xXPtlCgsGU7ixU=; b=WS7NvUcX/ms9qK
	VSqftpsvCjgg69udtQx07HRkJFjtt9ZWfYrr+mvjm5c7MMaEFq36yjyG0gighwiVFKPF0c8AqrJF9
	BV2k7QEbwedXiGUMS82/2zk21pOhRxFrU34bWzM4b9N0uPcQxTjNTEysimk1i9fRDd8tE1XvDtupp
	tuUQMVJ7fA8bLKV5l5HuC3velmPgGerCjRu3o8NXLsAYT+ZhAjiu8oNmlyHF4NZKkp2hzWGPoU7pH
	pv8CkhPVAMYQmHoCwnw6gOGof6VqcHnM+KjNVfUVn+jqtq4nMLG35x2OmBxGlxlD5pjSNMV1VnF3D
	fArYIJgzXCE2FqhI7wHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc12u-004iPm-S4; Wed, 06 Apr 2022 08:29:44 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc12p-004iMV-NN; Wed, 06 Apr 2022 08:29:42 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M1YtP-1na4yJ46Kx-0036H3; Wed, 06 Apr 2022 10:29:37 +0200
Received: by mail-wr1-f52.google.com with SMTP id k23so2028721wrd.8;
 Wed, 06 Apr 2022 01:29:34 -0700 (PDT)
X-Gm-Message-State: AOAM5336wzNQTtfDvGIkr7ECZIbgU8AvHLH7DiBVaKhy+XOSMY0lRLE0
 bpTwQiV2xCM80agVUnmEY5FDLOvxacfwizAuhRs=
X-Google-Smtp-Source: ABdhPJzqKjimJ4xZnU9IPYt6fad20KHtM3TIsGz7LIfUNSAEh1Re0WD0ken3T+oCqWElZNVdr0ug0qBt3+5Wlumu5QE=
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr5517385wrg.219.1649233774585; Wed, 06
 Apr 2022 01:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-5-nbd@nbd.name>
 <d0bffa9a-0ea6-0f59-06b2-7eef3c746de1@linaro.org>
 <e3ea7381-87e3-99e1-2277-80835ec42f15@nbd.name>
In-Reply-To: <e3ea7381-87e3-99e1-2277-80835ec42f15@nbd.name>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Apr 2022 10:29:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1A6QYajv_HTw79HjiJ8CN6YPeKXc_X3ZFD83pdOqVTkQ@mail.gmail.com>
Message-ID: <CAK8P3a1A6QYajv_HTw79HjiJ8CN6YPeKXc_X3ZFD83pdOqVTkQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] dt-bindings: arm: mediatek: document WED binding
 for MT7622
To: Felix Fietkau <nbd@nbd.name>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Networking <netdev@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:FlwOKvCZan0L+Tnx+0ZkT5CbDL2b1IAvJDZk/84GozvthvRWv0r
 OcpSb9DAkKUIGhYbaVq5tY+tycGHkpPdHtezSaXN20eFFyYNXWH8kDR5fCyVJrE963NkgY8
 ejt1w+lx6yT9MwhzsGD7pHjs4mKKkNcTL7jrNMhzdqgNep63a8fn3V6GFBBTd4/Q/PTstfB
 RNQtVDw9PbjuZKj4nLYNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T6F09VKm8xc=:DYAS0Lh1Y5sJmDQEGEN6R4
 q2grdc+Ubap54fjkR1i/EfAWAhiwMrbuZvwS0N3Gya14YFh1xoBqNRHtHLAKjw7++Nso7J0yr
 P8vwKylDyWXpzMKVQ/uohAqimswXiP7+ke9JgiX2M2wUOc5OPVG5dAnT/YXSV6vu9k4P3vaKC
 Mv1Vj8vaaiWP/+FBeaN47NerD7jGubmc5mZpTN5fRUfDQe9alKpoSfXlMYNVnzn4q+aCbx/DO
 QZY0Iir31BFEVGTrgxkLaEfvCwiwDPaeMKKgvrW3r6G4oZODjoTzc+blFyvtbohegFct9xf1D
 nCPF0+OXKmj/+WX+yhXz7ZnB0tQw2eJAHAgDzoG2uImlo0Rdb8efaGC2IZ5p7v17OKp1klVFK
 le4lL2/66PgDMxF2jZYzP2qJabXtlr+BWzstkd1qO2MEZ2omkZf3QhaF1KXeaEbDDBk2frHUr
 gC2eCg0ndjVikGK68whD8hygrmgYooEu7WwifvKL4tATlFG4XXyXK0sb/47T02o+NtJCNB99B
 0FAMW9BOQu+6Z+xMtIeZ1ziP/lnLAYoBsbyt1GgsLjPLYVN3W/LNuLgAyMuGoaAVKWTTEkTIm
 Q4c3kYt9UNcAaCpKvlDmKWlYBJbFXyUxenasdM6s2mNTFbScXLtQjRzQNvbDxUt0siT9yDj8V
 LFKRaO7eZkynL0mmDzp0JmUsQCXA0M9i8B5cV5HAplbCegOKcb/zKIqtLE1oe1iJZrWwifHYW
 mJcjFrHSW52d+AGShzoI4BgrQaWu/aBeAFbIa4NMv+P7ggKXw0gLRp/2Qn3PnXZHYhPahUd06
 rpafeSitnaqAMV72TFWKTasXFA21dQIWdlMeODcCQnz+e0aPdg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_012940_093714_F506A25B 
X-CRM114-Status: GOOD (  23.01  )
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

On Wed, Apr 6, 2022 at 10:18 AM Felix Fietkau <nbd@nbd.name> wrote:
> On 06.04.22 10:09, Krzysztof Kozlowski wrote:
> > On 05/04/2022 21:57, Felix Fietkau wrote:
> >> From: Lorenzo Bianconi <lorenzo@kernel.org>
> >>
> >> Document the binding for the Wireless Ethernet Dispatch core on the MT7622
> >> SoC, which is used for Ethernet->WLAN offloading
> >> Add related info in mediatek-net bindings.
> >>
> >> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> >> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> >
> > Thank you for your patch. There is something to discuss/improve.
> >
> >> ---
> >>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 50 +++++++++++++++++++
> >>  .../devicetree/bindings/net/mediatek-net.txt  |  2 +
> >>  2 files changed, 52 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> >
> > Don't store drivers in arm directory. See:
> > https://lore.kernel.org/linux-devicetree/YkJa1oLSEP8R4U6y@robh.at.kernel.org/
> >
> > Isn't this a network offload engine? If yes, then probably it should be
> > in "net/".
> It's not a network offload engine by itself. It's a SoC component that
> connects to the offload engine and controls a MTK PCIe WLAN device,
> intercepting interrupts and DMA rings in order to be able to inject
> packets coming in from the offload engine.
> Do you think it still belongs in net, or maybe in soc instead?

I think it belongs into drivers/net/. Presumably this has some kind of
user interface to configure which packets are forwarded? I would not
want to maintain that in a SoC driver as this clearly needs to communicate
with both of the normal network devices in some form.

         Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
