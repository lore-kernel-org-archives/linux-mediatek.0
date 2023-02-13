Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDF5C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOBN8xnuT1AnfxM87/e/1aWjYthJ4OwrCaIgE2nYdOU=; b=gtRrVTOR4lfMdIxsumd2QOhhIr
	ehg2FEVnNYxJkNUgRldJeXMIKVbO/tnquwRIBd4zWW3IOTGPYhzY9WVywFrTp4WUMeR4PPJpBMvlx
	KyfKD9U616LZLwg7ZtK4l2Aw6BwvUiVAl6R0OOlJq5pMxGLWkz2oi3aM2bsFaGos91/WaOWFcgsPr
	U4gDPDlpruNzbcJC+KS0AjGd7chmGlr2hDUU8254oqTYqdSO3/NwPNsUQ2DFv2JbeycLW3nzDD48f
	GRisKzVw0b3mLJYQb9IvOnIU9pyO+xigYFoj5DLFpyoBYiehlxYnLUNYBovPdjlw8pV7j8WL6SatX
	49LvqfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZ0Z-00Ep8L-UN; Mon, 13 Feb 2023 13:36:39 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZ0P-00Ep5w-6x; Mon, 13 Feb 2023 13:36:30 +0000
Received: by mail-ed1-x52f.google.com with SMTP id eq11so12902094edb.6;
        Mon, 13 Feb 2023 05:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lOBN8xnuT1AnfxM87/e/1aWjYthJ4OwrCaIgE2nYdOU=;
        b=enbDSUdsbfsTMczEiBSO8KkBQ8WHdGOypPuEI7n7IsUKuNR+SzBxd5PG8AROJo6mzd
         6bDt/FOPasEAEie1aF36Ip+EJA6dQrOaYGxN0MNtNn8xlTcetCA3B4oN+RuvwW5H45Hb
         MN+AltYAXz3XvYlOgTCURny67ofeHIo4gHAxSy1bAKVrzhhzBJaVi0yWONp7bA42LmOy
         EG1D7dj/o6YfOPkb/+Lehmd6Uv0t4go1+Fmvs7gJLNDZ+7c+x5vkmzh/dSeQSo9tOiDQ
         IzokZFfiT8QWzQUt62VNs5qaO5X+iOae2X7g6WYZsc/TuZtndPhpIUldZBb+trpx6nvp
         69uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lOBN8xnuT1AnfxM87/e/1aWjYthJ4OwrCaIgE2nYdOU=;
        b=TelCuUIKoEmZys+xjq8XHiVWa7ANfYS/2xpgtJXdoaMHHq1+2crVevMfXqVsNrc74s
         hEr8GZeAjle7VvsgcgcILDoJPpG9qyPC9q/kwADW8Twq1a3QkOi7OvDj8X0vAlPv0vJ1
         elXeRkWA5KO+yMLXFyzlxVphxoy9cgE0hSeoE9C1YDZ3Ne/XXAD/8q1PcTOTTSU8ZyWK
         oVVotSGgXYDObBKI94GZMnkzfQwfduiw3lc3eEB4z75VEhQL4gKcOYRKzy1iLvMyEzOc
         dcR9BynJmpmUFQi1Owf+sZN0dLgggWbUfKK/g+Li6IpbfO5305xTeh3eFhw3VmqLFH2t
         RWVQ==
X-Gm-Message-State: AO0yUKUK6NZyE/ZfVC45LdjzKYMMPBWSppa1I8rlsIEeBVak33AkOy6+
	E5z3brgPIlU54QOH4aj/AIE=
X-Google-Smtp-Source: AK7set8ghHNngipoRKxZpN7gS6ZMD0CJeIIKXoSi43DWI43fFNSz7nnmaJ53r0BVTlmjc+amKxMS5w==
X-Received: by 2002:a50:cd02:0:b0:4ac:d2cd:81c7 with SMTP id z2-20020a50cd02000000b004acd2cd81c7mr865272edi.5.1676295385608;
        Mon, 13 Feb 2023 05:36:25 -0800 (PST)
Received: from skbuf ([188.26.185.183])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906079a00b008966488a5f1sm6852366ejc.144.2023.02.13.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:36:25 -0800 (PST)
Date: Mon, 13 Feb 2023 15:36:22 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Richard van Schagen <richard@routerhints.com>
Cc: "arinc9.unal@gmail.com" <arinc9.unal@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"erkin.bozoglu@xeront.com" <erkin.bozoglu@xeront.com>
Subject: Re: [PATCH net] net: dsa: mt7530: fix CPU flooding and do not set
 CPU association
Message-ID: <20230213133622.vatoblghocxlq4lo@skbuf>
References: <20230210172822.12960-1-richard@routerhints.com>
 <20230210172822.12960-1-richard@routerhints.com>
 <20230210184409.e6ueolfdsmhqfph5@skbuf>
 <829A471E-D1FB-4DC0-95FF-481A73E6E8E7@routerhints.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <829A471E-D1FB-4DC0-95FF-481A73E6E8E7@routerhints.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_053629_294521_4C6117D4 
X-CRM114-Status: GOOD (  26.33  )
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

On Sat, Feb 11, 2023 at 08:52:20PM +0000, Richard van Schagen wrote:
> > FWIW, the problem can also be solved similar to 8d5f7954b7c8 ("net: dsa:
> > felix: break at first CPU port during init and teardown"), and both CPU
> > ports could be added to the flooding mask only as part of the "multiple
> > CPU ports" feature. When a multiple CPU ports device tree is used with a
> > kernel capable of a single CPU port, your patch enables flooding towards
> > the second CPU port, which will never be used (or up). Not sure if you
> > want that.
> 
> So basically that means the wrong DTS with a kernel? Isn’t that similar to the wrong DTS 
> for a device?

"that" meaning what? A device tree specifying that there are two CPU
ports, used with a kernel that only sets up the first CPU port?
Why would that be the same as a wrong DTS? What's wrong about it?

FYI, there exists an Arm certification program called SystemReady IR,
where the goal is for one firmware image (U-Boot with bootefi) to boot a
number of different embedded Linux or BSD distributions, having different
kernel versions. With this boot flow, currently there is no concept to
get a device tree from the OS, so using EFI_FDT_USE_INTERNAL, U-Boot
will provide its own runtime device tree to the booted OS.

In U-Boot there are efforts for several SoCs to periodically sync up
their device trees with the latest Linux device trees, in order for the
most complete hardware description to be available to all booted
distributions. U-Boot drivers are also expected to work with the same
device trees that Linux uses.

The work of these people is made unnecessarily harder by mentalities
like this, that there's such a thing as a "wrong DTS with a kernel".
Generally, the default expectation is that at least for a time window,
kernels do something sensible when given device trees newer than them
(forward compatibility). This has always been a guideline for device
tree usage, and with SystemReady IR, it makes it possible for one
firmware image to support distros having different kernel versions.

The current DSA device tree binding implementation (in the framework)
has always been careful to ignore other CPU ports present in the device
tree and just use the first one, until it gained support for changing
the default assignment.

Drivers which have forward or backward compatibility bugs can reasonably
have those bugs fixed, those fixes included into the stable LTS kernels,
and from there, integrated into distributions.

Now, if you are certain that Mediatek SoCs are not used in this
particular way, and there is some strong reason to not make an effort to
preserve forward compatibility, that is entirely a separate discussion.

> Port 5 / GMAC1 can be used as <ethphy0>, <ethphy4>, external phy on port 5.
> e.g. SPF port on port 5, or used as second CPU port.

And one would expect this information to be accurately described in the
device tree. Is there any reason to not trust the correctness of the
device tree?

> Not sure how we could prevent that?

Prevent what? Flooding to an unused CPU port?

