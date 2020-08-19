Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DD6C433E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 08:51:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E72E20885
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 08:51:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2rKqMG3l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ff3F/qoQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E72E20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l8HLkd8Sbx+q4OIe+pMYkL2pCAwISXxAuVoayslovZM=; b=2rKqMG3lSln4g4176+2ivF8f8
	VYNCtaUi0Su6JuRmw8x74e8xn+P+vQ20rHAydnHzIdMqGzv/zPbtStJkJzuK2+Y0RqkeS6HRfCFWy
	ajkJaH1VSFSlH5ExBNaM89yuSr79Z3J8f8n3HtLDaGQXjfihPoyFq8y9l7e3br5tvTe+KpAB9Wcru
	/sGV1lh1yq9F5XR7Hdb4VXVReBbFwj4PwgSuidIFZzcaepawgrRHAmf/QE2JbBF4/q4sCGO9AAyzz
	jW9UAQknTW8lNJigWkZyEPSfOZvB8HRWsJ4XDPvEDnmrNnXwzREKVeJyRp4ZEZKPv0IOqJuSfx+7p
	NsBfBfm9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Jof-0006DJ-M7; Wed, 19 Aug 2020 08:51:29 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Joc-0006CV-Qu
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 08:51:27 +0000
Received: by mail-ej1-x641.google.com with SMTP id qc22so25359969ejb.4
 for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2020 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bD/V3oHfC4mdtWiSnBHrHT7AWlw0/W7HDJQKVaZ6gTQ=;
 b=Ff3F/qoQER5XqG2ymWUd9ZJ7yj+Zot/32PJuaO2OyxWsWxHuNTebKo7DrvpNvVGrPf
 W32vBZUXYuusDfszlWGS1H4YXohfvIPZTNIZJPo8DrM3drsyJbjOEymISGUhEuIAjBU+
 hr3SCeaZoE2zn8M+J7bLanCAO6TVJ2KbYsj8qEzT7+bzF/Syn9PyahzY8VeiDONWiNYs
 rQr+x7oF9ECjT3NcrNdj5jgiDY9sgOOd6W8SOGe7nGVsPv3caAp0++7luCjL/vXcXO0G
 ySp3ZCW7CPUc+E/LPpgchLRQXgZ09C2d+yoDIk9/9j1uuTm2xu6hlTp7Smzxybpyd0sa
 7SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bD/V3oHfC4mdtWiSnBHrHT7AWlw0/W7HDJQKVaZ6gTQ=;
 b=EX7ttm+WrTO5DnFK4M0VMNVuej/3vBY1+8DDO9kEzL897tjPsulBYNHauYQ/HNHVMf
 ZK/ESWlPGC6Cxs2677n2nbeKBl8a41byrGhk0ii09Ns5QS+eNfx52565yqqhk12KC0XV
 I2SmjS86YDaCd+AA1uLWzO1eU19CNgp5/6rmXHGMHlgr6xqGrOGrNVhnAOucVZAJbdP+
 j3023yzu7heW1mMZuWHDuELUsnfVLD4meZBPJfnUqBjKGmExLIsY9b5Mm6KL8r7+qcqZ
 9ATNBHEeLwaEH3coAcIeozbkdjE5NZ27SsTVNQlj9lkTWqFKs323XC9zAb4ZMfKW2JVT
 oRKA==
X-Gm-Message-State: AOAM530liSuzB7yCNdnN3d0VaGosw7bnhqQlCcIfonnaJfbm3pLTzvnJ
 tnwcZK9pZRTusVa/gfVzWB8=
X-Google-Smtp-Source: ABdhPJwrCnrpCpI8Yx0K36plyOiwgjN7xbPdj34hvXofbPZKcbYpCn7GyAv9vKT6M42mUOsPcIvEQw==
X-Received: by 2002:a17:907:40bf:: with SMTP id
 nu23mr23780441ejb.243.1597827085771; 
 Wed, 19 Aug 2020 01:51:25 -0700 (PDT)
Received: from skbuf ([86.126.22.216])
 by smtp.gmail.com with ESMTPSA id cm22sm17791480edb.44.2020.08.19.01.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 01:51:25 -0700 (PDT)
Date: Wed, 19 Aug 2020 11:51:22 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v2 7/7] arm64: dts: mt7622: add mt7531 dsa to
 bananapi-bpi-r64 board
Message-ID: <20200819085122.wiuq3fi23rebja6d@skbuf>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <2a986604b49f7bfbee3898c8870bb0cf8182e879.1597729692.git.landen.chao@mediatek.com>
 <20200818162433.elqh3dxmk6vilq6u@skbuf>
 <1597824901.31846.42.camel@mtksdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597824901.31846.42.camel@mtksdccf07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_045126_920156_6956F47C 
X-CRM114-Status: GOOD (  23.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "dqfext@gmail.com" <dqfext@gmail.com>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource@vdorst.com" <opensource@vdorst.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 04:15:01PM +0800, Landen Chao wrote:
> On Wed, 2020-08-19 at 00:24 +0800, Vladimir Oltean wrote:
> > On Tue, Aug 18, 2020 at 03:14:12PM +0800, Landen Chao wrote:
> > > Add mt7531 dsa to bananapi-bpi-r64 board for 5 giga Ethernet ports support.
> > > 
> > > Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> > > ---
> > >  .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 44 +++++++++++++++++++
> > >  1 file changed, 44 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> > > index d174ad214857..c57b2571165f 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> > > +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> > > @@ -143,6 +143,50 @@
> > >  	mdio: mdio-bus {
> > >  		#address-cells = <1>;
> > >  		#size-cells = <0>;
> > > +
> > > +		switch@0 {
> > > +			compatible = "mediatek,mt7531";
> > > +
> [snip]
> > > +				port@6 {
> > > +					reg = <6>;
> > > +					label = "cpu";
> > > +					ethernet = <&gmac0>;
> > > +					phy-mode = "2500base-x";
> > > +				};
> > 
> > Is there any reason why you're not specifying a fixed-link node here?
> I got the below feedback in v1, so I follow the DSA common design in v2.
> v2 can work with fixed-link node or without fixed-link node in CPU port
> node.
> 
>   "This fixed-link should not be needed. The DSA driver is supposed to
>    configure the CPU port to its fastest speed by default. 2500 is
>    the fastest speed a 2500Base-X link can do..."

See this discussion and the replies to it:

https://www.spinics.net/lists/netdev/msg630102.html

I think if mt7530 is using phylink for non-netdev ports (and it is), it
would be good to have standard bindings that phylink can parse. For
example, in lack of a "pause" specifier, will the CPU port use flow
control or won't it? Why? I think there's simply no good reason why
you'd omit 3 more lines now.

> > > +			};
> > > +		};
> > > +
> > >  	};
> > >  };
> > >  
> > > -- 
> > > 2.17.1
> > 
> > Thanks,
> > -Vladimir
> 

-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
