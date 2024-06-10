Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B921C27C5E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Opl2kB+M6xT0lh7iwJU+m7OFdUSnTcwoeJRD53//Fm8=; b=CwbHlB2VCQHT8NNp6nLlM8+ztS
	nHkHxoHsNO8nGxNI+wtHeClfktdXO4AMqqsjP52USBQsZ5a8sMw5qkAwy9Y7xoBuC5dKqHimVRF0m
	UUfgzVWxQr9AHBPH9gfpb/1HimSJ4tqKMPdsSrQ9J91cMOSRa4zROejbx/0UArFPHA9N+0+ZUv2dN
	xjeA3pbhcEp/pq3NvGkimfin+u6AEox2FZa/Ah+0/hb31WhVb/sQTz5rEtwitVribvpajmQ2TF2Eu
	DeTNBIY+5jzXaf7C7WvURV5vd+Ls+MwqLO0aIg0MgMJuDRNM9HytHuPJwZohraESqzB1v7teIvQGT
	sOK3ZoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGanm-00000004JhQ-42pW;
	Mon, 10 Jun 2024 08:54:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGani-00000004JfO-0K5z;
	Mon, 10 Jun 2024 08:54:51 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10ED8397;
	Mon, 10 Jun 2024 10:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718009673;
	bh=1uMH5ebVeQ4Wu83z83imey9mwf02x2hoI5G0NYSkvZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/bfl5HBaA7nFpgLad02WGpvLjlGXYbbAV4ty6j4/RpX5kv1Q2wgz41Q5KSoelibo
	 uTiq449X1R9B0IMnEs5FaInqPD27kZ4XeNltKl+Z5NZefD0QIzaAGAR78RuLM/Cnz3
	 oR6T/B3sHY4GLIurI9PqMVRO6xjC6nQvUanY/CkY=
Date: Mon, 10 Jun 2024 11:54:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240610085424.GH26663@pendragon.ideasonboard.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
 <20240607144154.GD18479@pendragon.ideasonboard.com>
 <cf49fbb3-9de6-4e57-bc38-d720f76118a7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf49fbb3-9de6-4e57-bc38-d720f76118a7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015450_332386_6AE4E78E 
X-CRM114-Status: GOOD (  20.46  )
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

Hi Krzysztof,

On Mon, Jun 10, 2024 at 09:54:03AM +0200, Krzysztof Kozlowski wrote:
> On 07/06/2024 16:41, Laurent Pinchart wrote:
> > On Fri, Jun 07, 2024 at 10:52:33AM +0200, Julien Stephan wrote:
> >> Le ven. 12 janv. 2024 à 08:32, Krzysztof Kozlowski a écrit :
> >>> On 10/01/2024 15:14, Julien Stephan wrote:
> 
> Eeeh? January?
> 
> ...
> 
> >>>
> >>>> +
> >>>> +          seninf: seninf@15040000 {
> >>>
> >>> Node names should be generic. See also an explanation and list of
> >>> examples (not exhaustive) in DT specification:
> >>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> > 
> > The seninf is (mostly) a set of MIPI CSI-2 receivers. Would you prefer
> > 'csi', 'mipi-csi', 'csi-2' or any other name ?
> 
> csi@ works for me
> 
> > There's also the camsv IP in the same series that needs a generic name.
> > I really don't know what to propose for it. Could you recommend
> > something that would make you happy ?
> 
> Sorry,that's almost half year old thread. Not present in my inbox.

I remember someone presenting a talk titled "Beginner Linux kernel
maintainer's toolbox" in Prague last year. The talk mentioned a tool
call b4. I highly recommend it ;-)

> > On a side note, that document lacks appropriate generic names for lots
> > of building blocks found in recent SoCs, it would be nice to get it
> > updated. You will eventually get better quality DT patches then :-)
> 
> The list grew recently, so just add something there. But it is okay if
> some name is not really generic, it's just recommendation.

OK, then I think we can go for 'csi' for seninf, and keep 'camsv'.

-- 
Regards,

Laurent Pinchart

