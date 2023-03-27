Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC19C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 18:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WV8Ob0uf4bBIKDlLtZZnzrbTAhR4hy3V64r28D4o5YY=; b=agbx3gGs5Oi89x8YMXiXGazTQ5
	7AkSi3LbWS0zrEj8qKpHSmQiiuyHOlKmjKXZTQBrB6DORy4I9N2znBNbPupiIKgEhg76B0COwKUj9
	kD0mHDx7sAQ2Y/S0cnPzSInDWUGbimraRP8AkAWNq6qr8UKoFPI+2ouy1WnvNYcjhEsyvpvQ8ufrw
	L8aVdiWvmyt4jG3U3+xRZt/SN5O3R/0oQQ2UAw6hboplaGBlNKtkERwSOHWqxyqvqLuZwmbxP0NJH
	B6spwAJiVYboutdh52kuULaNg7qE9xN7tOnci1Sv9P7dL3LUYZSkz2BXcW9gHJQt/81Yv7+M7+yWK
	Te17JZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgruk-00C79O-1u;
	Mon, 27 Mar 2023 18:49:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgrug-00C78G-00;
	Mon, 27 Mar 2023 18:49:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id er18so28966545edb.9;
        Mon, 27 Mar 2023 11:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679942988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WV8Ob0uf4bBIKDlLtZZnzrbTAhR4hy3V64r28D4o5YY=;
        b=Gqu/bFJ31hSb6EVqByUP2G55oy+x+jxUsnrUTS9y/idimRggaf3K4hUFSzP+hG9MRI
         sQfcvDM5RNFMd5ZDGyrznKLDx6NMzwD7SsllmCmntS4xXcKolnrK4SYXEncVSWCjcRRL
         ncut7EiyGFCMxso6b2qPxijfjp7cdtfRPUII5fzp4l31zRGZtGd+VwfkUzSowqA3Htq3
         wokXFQRRkH7XOQAtjUDnqjcxcfpQ4e2MyXfjc3NKEGCddkxy7hiCNDfUBbZlUa001tt9
         qJl1aqUEQ31uhApIu1qt02Lh8KzRABWxTuZGK6rcjgkuclGDQYi++LLK5FyNx5RdjYxN
         3YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679942988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WV8Ob0uf4bBIKDlLtZZnzrbTAhR4hy3V64r28D4o5YY=;
        b=HV+BuzhnPU/cqWnOD5tWExwuVeSMB4SSF1l/S4YWC3dt5cK4UYIs7mYVSaGBfLY/0A
         8hxKd0jjsNN2KCoTpYeEgNrsdJWQ/xAq1GlKOAFTLWgIpZkN7b0mp1DfsBYhty9gdssv
         jg2LE6R0v1H9qnzefYVvq3RhMnJPigynwjqhTYheoIsjAKqqUkUlpEzg/FBeUMYJ+nze
         4h5eEPA0mIAlM4k5FcO6Jr7D2BfKyQ5QrasGrlgeDtyIZdHVWybyliqr/9K+H5STeeG4
         rD+OLWk97Uf8jwCBV+8mNRxCdrXR8c7sG55pHjYYeraVYX9Vq+cwVNSDLu/Om/DBPmio
         VkIA==
X-Gm-Message-State: AAQBX9ehNwf8iRtk68oa1KeH57NII397me5E3sX3Mf5C36Inx4XJL9Wr
	PvqfFUy6SwdbbjPv9cttGrY=
X-Google-Smtp-Source: AKy350YOQCzEGffLYub7F2SVGrQDvP3iDvPNDUkaIZbZqUsO6bIeX5ddq3lF1+dztJqbY3lmGpgvpQ==
X-Received: by 2002:a17:907:8b88:b0:925:f788:d76d with SMTP id tb8-20020a1709078b8800b00925f788d76dmr13593874ejc.27.1679942987666;
        Mon, 27 Mar 2023 11:49:47 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id b26-20020a170906195a00b00930a4e5b46bsm14301659eje.211.2023.03.27.11.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 11:49:47 -0700 (PDT)
Date: Mon, 27 Mar 2023 21:49:44 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net 2/7] net: dsa: mt7530: fix phylink for port 5 and fix
 port 5 modes
Message-ID: <20230327184944.oahce2iizpauw4nm@skbuf>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230326140818.246575-3-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_114950_064002_605F26BF 
X-CRM114-Status: GOOD (  19.70  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 26, 2023 at 05:08:13PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There're two call paths for setting up port 5:
> 
> mt7530_setup()
> -> mt7530_setup_port5()
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
> 
> The first call path is supposed to run when phy muxing is being used. In
> this case, port 5 is somewhat of a hidden port. It won't be defined on the
> devicetree so phylink can't be used to manage the port.
> 
> The second call path used to call mt7530_setup_port5() directly under case
> 5 on mt7530_phylink_mac_config() before it was moved to mt7530_mac_config()
> with 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a
> new hardware"). mt7530_setup_port5() will never run through this call path
> because the current code on mt7530_setup() bypasses phylink for all cases
> of port 5.
> 
> Leave it to phylink if port 5 is used as a CPU port or a user port. For the
> cases of phy muxing or the port being disabled, call mt7530_setup_port5()
> directly from mt7530_setup_port5() without involving phylink.

You probably don't mean "call X() from X()" (that would make it recursive),
but maybe from mt7530_setup(). But it was already called from mt7530_setup(),
so I don't understand what is being transmitted here...

> 
> Move setting the interface and P5_DISABLED mode to a more specific
> location. They're supposed to be overwritten if phy muxing is detected.
> 
> Add comments which explain the process.
> 
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Sorry, I didn't understand... so what was the problem, and how does the
movement of the mt7530_setup_port5() call that isn't under phylink solve
that problem?

