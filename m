Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D558FC00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5Ge8uyMAXwH1kNbVoLVJMz5md/YXC3qDG0uqYv7JLg=; b=EEuISX78olNms7UZufNr5SlIuh
	YJHtPj4Gb4ssP6tfYaTwg7vebD/OxIg59Ltan2cDthlN6nl1OZgAthhJuLTK3DGzTozQjDncPIePa
	hhDxSTwAvahHbJ6Ibt2ToXAewvNW+strn23CI06kp2Zr1yPP4jsu0BsEnuxgBvnhU/qBnkCNIEeJC
	LS8hBAxGjpd4ceTMHiL5pR5XxptiSejQG0L2BWc94o0xb6yIXJoBtATZzD9EMTwzmhO4m70kkzcY+
	VMx/fyDjcJJPPiBZ7yaHrwHqUXw0FlNnBhmVoZSDnvpeVliqSsEz3Tu/furgAWkf42gHbx7fSlFsN
	4KuqSvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIRJI-004GXC-NJ; Thu, 19 Jan 2023 09:34:16 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIRJ8-004GUD-4Y; Thu, 19 Jan 2023 09:34:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id v13so2078802eda.11;
        Thu, 19 Jan 2023 01:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s5Ge8uyMAXwH1kNbVoLVJMz5md/YXC3qDG0uqYv7JLg=;
        b=pY+ceUT5z37uTU7Y1gqA8WAVoJkOmuKK/1C6ouoZ6getUO4DtNM6wxQRLx5HwaCGMt
         acn3C1Co/vL2ciJLZY5ai84WZ4tmqecAFLJ1NBFpeDPE7MKbG129/AA+YIwvFAJAyDhU
         RdCAKmEb1uZvhlsDXlDbaDESg9tc0nTWVNi+ab5tYEITZrWBpqXAK6aP58qNNuWDYD+t
         OXeZalhSPmSHmVQSiRt2lLOoIRyvnlKMyGHl3NE0wF8O0EEPsMCp4vipxaHaFMxW78fz
         fdsOQ/t9jZ5sjLj881ECBUdsuF3BuGoU71VZOvxst6tRH0wSRVCbbukt9r/PGqLna/KP
         xXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5Ge8uyMAXwH1kNbVoLVJMz5md/YXC3qDG0uqYv7JLg=;
        b=Jo7SMqenJONZ4LZ3KCzbTSg4jmKmqM/jGRsEKtyzXZ5PYwNwJMlipOuYzXHamYy1HE
         LBa3pj3DJhhREfqK0MEGSiAMq70kn/wonRJtTxtFrHqlq8d9GFpMV8t9qrwAV8i2hBBU
         Bt0ctRAQu2B8nwYemR9TQHE8wj+07BPeEPd7G08k2i39bfLnjuJRdStdMVqWA5ZzgfXK
         ndfmu/wOh/jvVHgEjcLZzGsr7K22DJ7ckQaZbZl4+TmSdGcW/ErPNOWubmnqupFlA1aD
         i8qaPCXcHpcz8limQ7Hh4O9N+l/vE0EUe9bvwZv5ZfCVrnCCK3G5Ojk9kP/aMm+/JvYP
         L5lQ==
X-Gm-Message-State: AFqh2krgRYVUuV9XNmP3I5i3CoBOFAIyn7QoBRBNlF8JtJmOD6ePo8m5
	0JP9ISdP4M6jOfa4+ul5UUM=
X-Google-Smtp-Source: AMrXdXv/p9J+0LyxznivegZqBjv5p2sBwAfu5EYNt9IzkrSAyvVgO9ZtOW6iKd8IcEA7ooqkwi9I1w==
X-Received: by 2002:a50:fa8f:0:b0:49e:31d5:6769 with SMTP id w15-20020a50fa8f000000b0049e31d56769mr9558722edr.41.1674120841563;
        Thu, 19 Jan 2023 01:34:01 -0800 (PST)
Received: from skbuf ([188.27.185.85])
        by smtp.gmail.com with ESMTPSA id fd7-20020a056402388700b00483dd234ac6sm15055718edb.96.2023.01.19.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 01:34:01 -0800 (PST)
Date: Thu, 19 Jan 2023 11:33:58 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [RFC PATCH net-next 1/5] net: bridge: add dynamic flag to
 switchdev notifier
Message-ID: <20230119093358.gbyka2x4qbxxr43b@skbuf>
References: <20230117185714.3058453-1-netdev@kapio-technology.com>
 <20230117185714.3058453-2-netdev@kapio-technology.com>
 <20230117230806.ipwcbnq4jcc4qs7z@skbuf>
 <a3bba3eb856a00b5e5e0c1e2ffe8749a@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3bba3eb856a00b5e5e0c1e2ffe8749a@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_013406_195322_DB0E9EC6 
X-CRM114-Status: GOOD (  14.47  )
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

On Wed, Jan 18, 2023 at 11:14:00PM +0100, netdev@kapio-technology.com wrote:
> > > +	item->is_dyn = !test_bit(BR_FDB_STATIC, &fdb->flags);
> > 
> > Why reverse logic? Why not just name this "is_static" and leave any
> > further interpretations up to the consumer?
> 
> My reasoning for this is that the common case is to have static entries,
> thus is_dyn=false, so whenever someone uses a switchdev_notifier_fdb_info
> struct the common case does not need to be entered.
> Otherwise it might also break something when someone uses this struct and if
> it was 'is_static' and they forget to code is_static=true they will get
> dynamic entries without wanting it and it can be hard to find such an error.

I'll leave it up to bridge maintainers if this is preferable to patching
all callers of SWITCHDEV_FDB_ADD_TO_BRIDGE such that they set is_static=true.

