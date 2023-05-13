Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8166C77B7A
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 May 2023 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8E7IXRM4jetpLJB6db5nUi+KL6dKg255kFH1dRS4ic=; b=XEoh0uyiF2qPk8I1gqsTcpjiSg
	mqAh3kPTfrNaBYBJkUcmNph/1ZzJlW3Q/PoH5drJ9uXPdZCG6SDshzxXz/tQ6xtqCxc/bmMbORr8g
	abTdMt60soc7TvHDYCAksvMIE9n6eYrCagL9yt+AeFW5smOhvjB1HyZSQywxXv8KNCDCEWOz0Bsmc
	31n0Y10PT6AZs8JB5Nt1Wv0MuHCIqnc8OnspUBt4/xjqmxUMwyjs1raSLoaJjwDqakIVE8hGKQmwf
	nSedBjWBPq5RjcSUJSuD8t+FefFQjM8OgXp7SfgovGOijLbJR6nF6oD8ij8pULcVTS7qdX44CfcFK
	jD6W66HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxsVo-00FR6G-3D;
	Sat, 13 May 2023 16:54:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxsVl-00FR5S-0s;
	Sat, 13 May 2023 16:54:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E413561047;
	Sat, 13 May 2023 16:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504D0C433D2;
	Sat, 13 May 2023 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683996863;
	bh=XsXSseIFYyxnn2uMBrBqHZmVWgWqi2+GNNRu8pP09UA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RSo+RU8PsEJKM71tc3Oep8z+ubv//MJdOkv8pOZW92tP/zFz9oDLkJRcLTfw1Mewj
	 CBKVf9gZf4gmGyQ+NBPoWLEbJsHfPAPRgVKzZhInRn5VgGRB+0FMG2VajXT3Se2YHv
	 diORcKrvXc1ishlpX2kjr0Z390bxE5az5k9M2Uv68/hczEY0EPrE5RNZFeltxiPqbz
	 pkgiNWRwc42xhblQkrnLKPQy/9bfKAsl0ivBj9NsdgzacHTySqzTMVDDhinKnsHB4u
	 jX/GYUZB5+191LZ+/M5ZmLLZRD7+h/EneQTIl3vADlCUHv82z2UH4a8BgU3DLJ/gqI
	 /MkPxXdk+tAeg==
Date: Sat, 13 May 2023 18:10:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno        
 <angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, "Hui.Liu" <hui.liu@mediatek.com>, Zhiyong
 Tao <zhiyong.tao@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Daniel
 Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v1 2/7] dt-bindings: iio: adc: Add support for MT7986
Message-ID: <20230513181022.63bfd56a@jic23-huawei>
In-Reply-To: <trinity-e35759d3-7de4-450c-b4a8-053c9617ac27-1683561181475@3c-app-gmx-bs01>
References: <20230421132047.42166-1-linux@fw-web.de>
	<20230421132047.42166-3-linux@fw-web.de>
	<20230423140252.7b018c46@jic23-huawei>
	<trinity-e35759d3-7de4-450c-b4a8-053c9617ac27-1683561181475@3c-app-gmx-bs01>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_095425_410573_00AA2A97 
X-CRM114-Status: GOOD (  26.69  )
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

On Mon, 8 May 2023 17:53:01 +0200
Frank Wunderlich <frank-w@public-files.de> wrote:

> regards Frank
> 
> 
> > Gesendet: Sonntag, 23. April 2023 um 15:02 Uhr
> > Von: "Jonathan Cameron" <jic23@kernel.org>
> > An: "Frank Wunderlich" <linux@fw-web.de>
> > Cc: linux-mediatek@lists.infradead.org, "Frank Wunderlich" <frank-w@public-files.de>, "Lars-Peter Clausen" <lars@metafoo.de>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>, "Hui.Liu" <hui.liu@mediatek.com>, "Zhiyong Tao" <zhiyong.tao@mediatek.com>, "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, "Lala Lin" <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Daniel Golle" <daniel@makrotopia.org>
> > Betreff: Re: [PATCH v1 2/7] dt-bindings: iio: adc: Add support for MT7986
> >
> > On Fri, 21 Apr 2023 15:20:42 +0200
> > Frank Wunderlich <linux@fw-web.de> wrote:
> >  
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >
> > > Add compatible string and specific clock property for mt7986.
> > >
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>  
> >
> > Given how trivial this is, I'll apply it without waiting for the DT maintainers
> > to get to it.
> >
> > Applied to the togreg branch of iio.git and pushed out as testing for 0-day
> > to take a look at it.  
> 
> Hi,
> 
> i cannot find it in next and here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/tree/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml?h=togreg
> 
> was it dropped?
> 
Not dropped, just delayed a little by timing issues.

Delay for a couple of reasons.
1) Pushed out as mentioned above as testing - specifically not to be included
   in next until I've gotten reports from the autobuilder tests.  Normally
   I would push that out as togreg to be picked up for next around a week later
   depending on when I next look at IIO patches. But...
2) This was very near the merge window, so I didn't want to put things in next
   that weren't going in during the merge window + I wanted to be able to rebase
   on v6.4-rc1 (the togreg public branch is not supposed to ever be rebased unless
   something has gone wrong). I've just done that rebase and once my local test
   builds are finished will push out.

So should be visible shortly.  These delays are common around merge window time.

Should now be resolved though.

Jonathan

> regards Frank
> 
> > Thanks,
> >
> > Jonathan
> >  
> > > ---
> > >  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> > > index 7f79a06e76f5..6168b44ea72c 100644
> > > --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> > > +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> > > @@ -26,6 +26,7 @@ properties:
> > >            - mediatek,mt2712-auxadc
> > >            - mediatek,mt6765-auxadc
> > >            - mediatek,mt7622-auxadc
> > > +          - mediatek,mt7986-auxadc
> > >            - mediatek,mt8173-auxadc
> > >        - items:
> > >            - enum:  
> >
> >  


