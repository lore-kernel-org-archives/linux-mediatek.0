Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49469C48292
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2vwy1xdN4YRuSNz0Zmeo13DlHz09nwHWjHo8V3zYIM=; b=xC/8FNQ+OZFjyhiSSnlLJmGqHK
	whRALXC0tkM6CDYrbmDJlUl3UKBl5+E/8pO1GCUG1vwk+RuV7haCjf5TTtXWRHi9/jl1fMu8VFAe9
	g0D1HHDnmK/z0i6uSazXfpG20JSGMO1VhEoOUKzytas1Dj7cjSr7UJWRARN5IO4uYVVyi5wQl37Iu
	2TGF0WkrF/vxtLAmEiz3OaupJ/kT0p0sCJTfniDSqh9PQE3XXT8LE2goByyeuCRcuvUbgoTo4u8B6
	rFp2744apz5qoTTNRjlINVbJ3mDcScL63p+wb+DRl5ZI/OjC0sHQY7vVB2xS+CYOpWNIjJoQezCfQ
	61ab44Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX5b5-000000052F6-3uIi;
	Mon, 05 Feb 2024 20:29:43 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX5b2-000000052Cp-2QgS;
	Mon, 05 Feb 2024 20:29:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso4603399a12.0;
        Mon, 05 Feb 2024 12:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707164978; x=1707769778; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V2vwy1xdN4YRuSNz0Zmeo13DlHz09nwHWjHo8V3zYIM=;
        b=KcKbDHDTrfXAtHgQs6Y2ipWAF0ht1XVEblZUL+Zucs38O/FFn/HlIog0Rao8u7/+hi
         mRUwKgTgKcwhbhVRwD2XxldmewkSzEDErGf8fre+KCUngfdTAEKnpgIylrJAJ9681rYj
         knsKXuSyeLh65+1k2QJzVhjRXf3CJ3+/2IgfpaPMeqYoQTlacNiPmjHUYHBvGBmJtxwH
         4QIX80NCJysc/KT+OoeIJaHfApjQT4GzL3pAXwjQ3woIwBLlXDF7CcE978W9G8xid7b0
         ImmIFeo/ciMUuUhQn9Q8HEGfquk0Rsgw8Os1+DuHEYqyydTZcdPz/QTQStV7YH1VRGOS
         LbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707164978; x=1707769778;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2vwy1xdN4YRuSNz0Zmeo13DlHz09nwHWjHo8V3zYIM=;
        b=eJj1j9yEvqwF20OGqK91G7EWXSMkgxlVLAcYyxTlFhJl0JtMheRa/OZWqhdJoo3baD
         6oxyFB8Xc3KYTWlYN6gI9lFV3Z4AfDHc4/Kk7lzYjDQGC+ABHdouo0/rnUc/I0UjMAI1
         lUg/Eof2LLgmAeClUIiq24rVRrcAGfif3kEEF12+4Vy56B1DEeFmMtthKZxKAHFgA1l9
         W2zVhRfXo+wZ3O/tKSIRUWJBxrLRkfyFonfD2OOmb101UZmdbgdpdVC+kZuv+nX6L60n
         O76NcFvdVKW30fjFwz8PiHlxMRp2W3WDcq9OwepJX4BSMpb03IFMWqcK7TZRegCXwa2f
         gtEA==
X-Gm-Message-State: AOJu0YxMpWbebu1BZt6CpDjdPF8ALA3j4e0sMmOGVEbIG5Rt+vtE76qp
	QDrBeAV+RLumVSPEq4x+ZwuCxVRZ4OKbGns/mmWSOb8b0AQDDgRl
X-Google-Smtp-Source: AGHT+IGLRUsRndFzILv8fnlMxBbqMi2GUbAGsIlK83rBGDc2eO+rtdn+PbtPCGEGLtUd6LttiUMHAQ==
X-Received: by 2002:aa7:c991:0:b0:560:535:864c with SMTP id c17-20020aa7c991000000b005600535864cmr300965edt.12.1707164978034;
        Mon, 05 Feb 2024 12:29:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUKrZurXEx9W3ZB7XvtgoqXBVoDOIiHWDUK0OxcbnUi1TvQBb6CqHTrO9FkFWqz66OVwTWge1zAbOwH8Xay+GG1fnqHREU/Plac7osLVVNe6J3OcVcKFONw8vGiWGnoC5EX8eSLZO+l2x3/AUHgM0scbA/Y+kTy8Klw3oNqwsVrgYrgn1YMLoOToLYIMryx3gKzPaNhCAlqVe81we1X2/Dm0eh4DDolBncvdnRRzfO1KIDJnrkUiX3IcIhUWgYp0goyUqEdfCDrnYlGZPcmxmRcqfOPEYpQzz6voNLSFvkv2KcpQiSeDrYRGhBcf27Wb5GMh2OU+RSh49vfiSFw8OrsZJUZTF3VqZXtlMJZAcgnUD8JF8D/OKM/I8AseGdelA3Br/w05YzQYPg/xovo1JoT4oa/2NNvIFk2hQjLqHhq8ayZZ8BlCWY6aJxUHkUaw9YD0wD54PQROFgp2W1PK8yNWLiUA1tEWvLa35hwKk6RSWUTK5aEs3H1aJSQ7Bu1Tz1zivVLr240evdu2sOw16xquFGF42BbW73B4/0fMc10tOhz6VfU+CEBvYWYQpxYL18BkHQrZL3RSXCf16RtjFPiUPEVn440SQj0Xn9B9nVOjh/9FmCwW2+GRXYTFwQK3hrAvnZDnKPFAY6K+Hq1YqbJg8ClLLLw
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7da4d000000b00560422bd11asm256428eds.30.2024.02.05.12.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 12:29:37 -0800 (PST)
Date: Mon, 5 Feb 2024 22:29:35 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 1/7] net: dsa: mt7530: empty default case on
 mt7530_setup_port5()
Message-ID: <20240205202935.tolbbwbtrig32jlj@skbuf>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-1-63d5adae99ca@arinc9.com>
 <ZbzUotyQm/FyKK7G@shell.armlinux.org.uk>
 <e3b4add6-425c-46ca-9da5-8713055fc422@arinc9.com>
 <Zb0u8NY0q6ay17j5@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zb0u8NY0q6ay17j5@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_122940_642444_0B692C9D 
X-CRM114-Status: GOOD (  21.86  )
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

On Fri, Feb 02, 2024 at 06:05:36PM +0000, Russell King (Oracle) wrote:
> > > Given everything I've said above, the only way to configure RGMII
> > > delays is via the rx-internal-delay-ps and tx-internal-delay-ps
> > > properties. So, DSA drivers should _not_ be configuring their ports
> > > with RGMII delays based on the RGMII phy interface mode.
> > > 
> > > The above is my purely logically reasoned point of view on this
> > > subject. Others may have other (to me completely illogical)
> > > interpretations that can only lead to interoperability issues.
> > 
> > I will address this with the next patch series. Thank you for explaining it
> > in detail.
> 
> This is a good time to point out not to rush with the next patch
> series, as my email will _likely_ provoke some additional discussion
> from Andrew and/or Vladimir. So please give it a few days (maybe
> around the middle of next week) to give them time to consider my
> email and respond.

I agree with everything you've said. The only problem is that
Documentation/devicetree/bindings/net/ethernet-controller.yaml is
ambiguous on this topic (to put it mildly).

@Arınç, there are ways to handle the "tx-internal-delay-ps" in
mt7530_setup_port5() in a way that is backwards compatible. I don't know
about RX delays - the function doesn't handle them, and I don't have the
time to open datasheets now. You can take inspiration from
ksz_parse_rgmii_delay() and sja1105_parse_rgmii_delays() on how to only
fall back to the current logic to set the tx_delay if the more specific
OF properties are not present.

