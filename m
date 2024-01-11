Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755F3C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 09:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pKz3Yu/YSA1o0yNgREr/FozQgVaAcHWi4yqSk6JGiI=; b=08h7wP7LSmUEttbCkvifFrjqtm
	qzyJQcSYnHViOx6UhndmaSIFEHkhwlaF1dIguHDLMSyxCM10ruGIBsD1+OoiiSCO++E+DVMXeKWFw
	ACkO7TvhcHWDVLYuYOAW9w3UyOkRSS0gZDZVRxK2G8yOmK9Mumb7DLpRJoCdDpGQR3Jj59teuQUP9
	nUL8oWH9nGC+CsyhivjjyYQ5gQ5OD7TOU3NgX0NBU1iAQoaIjdzzn8DtO3AM0xt4SStRF0gEgtDeE
	/8F/aBMAnOTyjupAfs3KqioWq+goS1Hfia2pflDM6ZQj1irgj+s70ux+xODCvNEZ7QXNnNhBxOMhm
	23GqWatQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrE3-00GjBO-0O;
	Thu, 11 Jan 2024 09:19:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrDz-00Gj81-1E;
	Thu, 11 Jan 2024 09:19:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3374eb61cbcso4590520f8f.0;
        Thu, 11 Jan 2024 01:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704964779; x=1705569579; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0pKz3Yu/YSA1o0yNgREr/FozQgVaAcHWi4yqSk6JGiI=;
        b=mtXAFfKlWbHgnX/6UxFyjYjuDI0ggxfu5NrsSTzZnmgf/MIDFNuaoUxmfkxzN0Us1A
         5HHkBF3O4lDHtZaA6N5GZLbhVoXj3i6mu7fRkB48rsaajmvWGbMGV5gPYjM418pZRCUO
         l4Si2Jsy8nSyfARd/b/lYGDAU2eWUADQsJDn84qLL3OjbU0vwjZNG7p9GVEzsZcclDKq
         FKullqYwzWG+Lhut6IROa9lvNV7hmUIoowbPhOTO0iRr3E70JyJpFYmaiR/ha8OVaoz1
         6/E1xffwEue9K8ZZMSUHEymX6/OovNzJRCQ7WRCMtYGJGKFCgyca9jb7AbQpPErTkr75
         lWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704964779; x=1705569579;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pKz3Yu/YSA1o0yNgREr/FozQgVaAcHWi4yqSk6JGiI=;
        b=MJsCGHyst96f6lkVrC2baZYhH1zz8k9HxDOGMPP/P4jdLhB3+T0pb944OlVSX15sXD
         yO+5IvAOKvTE/t9iCdLkG8WfOikLWqMXjTkdvDXawEMuB0KeN4Xz6tJi/U29uvwuaYHt
         ain8sc4yVrrow9dl4+mMaFmMA+oSRqYlc4rQSdgi6IWiMdOawuI4DyzZzCd+a4rp5E8b
         UpeyRhTMd9wneDSsM01IGKq8CcB5Nhsj7pg7NT+uZLuhW4wIqKpMQHE7zIpck0jMp7Xl
         7X2boB8RAakQK4GY8WogSAIOwvg9mnJWVORvMqF/ycCjSDk31LzXF//AkuSzG9YfwMfI
         +erA==
X-Gm-Message-State: AOJu0YxUt4YQGK7iSpwZDS2qCiUnjDuY32Ck5In1SdAXvpBJxs5uOa6b
	DT3EHo+C7neCmYLCRLht4Hc=
X-Google-Smtp-Source: AGHT+IHaL1yXwN7SnYCBfwLdpKbQICRvcgvZxb0jEt+hbIXtiaPUdMz70UaWXbbgf21g3tnTfyJ7Eg==
X-Received: by 2002:adf:edca:0:b0:336:c876:a407 with SMTP id v10-20020adfedca000000b00336c876a407mr488759wro.3.1704964779334;
        Thu, 11 Jan 2024 01:19:39 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id b7-20020adfe647000000b0033763a9ea2dsm692905wrn.63.2024.01.11.01.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 01:19:39 -0800 (PST)
Date: Thu, 11 Jan 2024 11:19:36 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <20240111091936.y3el2yp5tndcnkzn@skbuf>
References: <0542e150-5ff4-5f74-361a-1a531d19eb7d@arinc9.com>
 <7c224663-7588-988d-56cb-b9de5b43b504@arinc9.com>
 <20230610175553.hle2josd5s5jfhjo@skbuf>
 <22fba48c-054d-ff0a-ae2c-b38f192b26f7@arinc9.com>
 <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
 <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
 <20240110142721.vuthnnwhmuvghiw4@skbuf>
 <b47311f8-315d-46d9-bd5b-757141708a3f@arinc9.com>
 <20240110180525.wwxkkoqam37oqm2f@skbuf>
 <ZZ7ib5WWyH4TyirS@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZZ7ib5WWyH4TyirS@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_011943_427838_0E4F402A 
X-CRM114-Status: GOOD (  18.37  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 10, 2024 at 06:31:11PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 10, 2024 at 08:05:25PM +0200, Vladimir Oltean wrote:
> > On Wed, Jan 10, 2024 at 08:15:20PM +0300, Arınç ÜNAL wrote:
> > > __builtin_return_address(1) doesn't seem to work. I'm running this on arm64.
> > 
> > I can't tell you why either, I'm sorry. I can just point to the
> > documentation, which does specify that "On some machines it may be
> > impossible to determine the return address of any function other than
> > the current one". If somebody knows what this depends on, feel free to
> > interject.
> > https://gcc.gnu.org/onlinedocs/gcc/Return-Address.html
> > 
> > On my NXP LS1028A (also arm64) plus clang-16 compiler, __builtin_return_address()
> > does work with multiple nesting levels.
> 
> gcc will probably need to be using frame pointers so it can walk the
> stack, if gcc even implements non-zero values to
> __builtin_return_address(). Without frame pointers, it would need an
> unwinder.

Yeah, I guess it's a gcc limitation. I recompiled the kernel for the same
platform with gcc 11.2 from Arm, and I get the same result as Arınç now.

