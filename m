Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89719C4828E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtiYOXFMPoLKKMTHGF2JB2BrNN/qXiq/VP/qdA5HoGY=; b=v5Rr1Q+QYCLlNJBuk+Y0tb4Ysb
	l200hpCu/j3J5u1kAAbdkrdTAErdqeAF4Ax0lAbiEpe4vGfwhkA6hLJ/udYOXYNJy2ZDXI1oFp5Ng
	3Ayy7pWus0TYWHwIviAjBScUj4by2zLVTAen42bka6baA+wyF5xEto8Tsf5LYscfbtDxobdIHdf2v
	ABGUbEf9cS+t0c2AaryRpUPQ2cls6rpyWA/lr2vmYImfZD1jN297MeMm65sclWAM6iUdV0/yHR88m
	MS8Tukh3JTGm7dIbAm5NVFMo87ZOtxbo4zMYv+h5MoVluLQpF59fA/gLlGgmu16H5dv6ZhNZG3mpc
	RrWuJDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVz2R-0000000D9ET-252s;
	Fri, 02 Feb 2024 19:17:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVy5I-0000000CozW-1TRW;
	Fri, 02 Feb 2024 18:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wtiYOXFMPoLKKMTHGF2JB2BrNN/qXiq/VP/qdA5HoGY=; b=htXrUnf/2S8wwyD06Ut0Z357a7
	Z9OaPnM10C2MHO0CwDajYWrDz2uCu8mSxQKauzeBdr+gfiQwwjvwq2In6YDYYk0TbVstks1dCnBT8
	FYFFE5aL3BsLXi6lA/VA6v01DdM+4w6X1o1uhDEbiI7jsebPzr+GOmvua+eNC5ArHNhxDFBHPAL0U
	e/Fyysc39AYRxWCmQiqfk/GQ7/6FTDuhhk8mEsY0XM205bnz6oCPbXFLocaKPLQCAvpNJSknli009
	Nd5DyWbb4icfNxo8m6qDADdsyv9DKwgu//Lf/fIkP8v87ZkuEXDdNaV91IV+SUfQTSpK+VR0YVQT1
	cuIIGS3A==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVy5E-0000000A8bi-1ZJG;
	Fri, 02 Feb 2024 18:16:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A90240006;
	Fri,  2 Feb 2024 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1706897769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wtiYOXFMPoLKKMTHGF2JB2BrNN/qXiq/VP/qdA5HoGY=;
	b=KSYCbLwLFuzIuoUaJtpjQGUzO1il4uWXGQ0IExPOpAKFe7gDSiBo3Zdbi+kNccBwAl2Yec
	RB4VAVK7NrOrl2YBoFuidSJZRkL57a+WmQ7lxqCmdkMTKSimnimlSsAPH7WhtbnHjbmMcf
	Brarti0Ozcpa7hCbnOYI4yB13yrzhLSjSpAK46Pa9PfMOyQvZ6mFY4LCTUz7gg2v+t58AH
	FQ/pnWSOQKp8/Tk0nqzBxPiQrbKbulmAa9H0zHfhFbRZcJpiGj9EBCWqfWD83X5GtIW303
	dVMZ7x0vg+AKUWJCm1WjaDAps1zeUQIli0oh+MpNDLKQ9OWItA/vUi6aa1Nujw==
Message-ID: <5b744f7f-2f63-4219-a0e9-8f08267b1fdd@arinc9.com>
Date: Fri, 2 Feb 2024 21:16:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/7] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-4-63d5adae99ca@arinc9.com>
 <ZbzWpmZrukknMsYf@shell.armlinux.org.uk>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZbzWpmZrukknMsYf@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_181612_537281_AADA0747 
X-CRM114-Status: GOOD (  15.83  )
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

On 2.02.2024 14:48, Russell King (Oracle) wrote:
> On Fri, Feb 02, 2024 at 12:19:10PM +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> The crystal frequency concerns the switch core. The frequency should be
>> checked when the switch is being set up so the driver can reject the
>> unsupported hardware earlier and without requiring port 6 to be used.
>>
>> Move it to mt7530_setup(). Drop the unnecessary function printing.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> 
> I would prefer this to be earlier in the series, before patch 2 which
> moves mt7530_setup_port6() to be called from mac_config(). mac_config()
> is supposed to be configuration error-free - in other words, all state
> should have been checked before hand.

I agree but mt7530_mac_config() is not a void function yet. The
mac_port_config member of the mt753x_info structure points to this
function. My next patch series gets rid of all useless error returns on the
phylink path and change mac_port_config to void. So I don't think working
on this patch series further will worth the effort. I'd rather have this
version applied as is.

Arınç

