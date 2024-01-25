Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B762C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REcRr9U0F+uAhsIG75MoYjc4CaoIuwNexNXpisfICY0=; b=vGWc41K+Ks2BKP1BwXrbN9FLDz
	MwUfmycEahNXMkHFcL10JpsOcsQzDLTTCU+2wYi/cI2RLL5MCpci38qi507pfxBAJ2sSZ70jAV/1+
	9Zk3LA6opiCqxmBhkPGRUtpIIV0dzBjnEjPFFIsXUWCQ6+GGe08/Gavm0MWV2fcW2NV74cFBD1Btp
	cfFgdGuU/3RXkKvF82mQpBjJ851rnBhRShCwnLAWocVvzk00EAqQrUMq992DiV+5eAsU00kYAqicJ
	Ka6/A1ryCbps4LZxDFBEdOrkDCPntDwpaz0L9qfbAm1gGOy9wsxvQTwMnzmLAELUMnQq1gpyLH8/M
	ZnPBvfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSveN-007Rum-1P;
	Thu, 25 Jan 2024 09:03:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSveF-007RsF-0X;
	Thu, 25 Jan 2024 09:03:48 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-55cdaa96f34so949917a12.1;
        Thu, 25 Jan 2024 01:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706173424; x=1706778224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=REcRr9U0F+uAhsIG75MoYjc4CaoIuwNexNXpisfICY0=;
        b=JvFEiUBrUxQvyR7F/4oNc9FcyGGG7cVJlJaKtn7JQt7zpglpTudW8kycGAypjSIjjl
         MclHMmnvdCwhP6YHBQqQt4B/re58CmzZtFhP/5o9Wse5RFa//QSzQ1JIikWMU1uj0UpB
         Q4JeKxEr+Pvq3h0+S1Xkq2XO2Oz/+JKXxEd6ng3/uekS7MyqARUH49EJ4K7SNhp2dw6b
         eEuBLetp4kdUX7+1Cy0hLJV7EnwTzfBixyKyflZcbMLkwMDxRFH43qQWiDRKjOeiy/9I
         y+KtDjeHx+LUzl2iuAsBzlBA1Ui4W7Fh3OP9jbdkTEgvjk2pcYZuHU3qTw1Ijwf9X3JF
         OksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706173424; x=1706778224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REcRr9U0F+uAhsIG75MoYjc4CaoIuwNexNXpisfICY0=;
        b=HU9PFRON3NvB4DrybK4YEmIvULeWJXAFad0h8XjZS25tndW3garoLmfwVuiQG5qvNa
         w2/Rq3obKcE0eaWVhXZWeR++ex8zjHYfO/oT2ANDn5suHZAXWJAJT4i4E+cSvIOrV9CV
         6MblttyrAuSOURPzdf1KPCCFY5OpnY5I5tFcHqp3H8LUEa+kLRUsZQA0OLuN6g7aJ3P3
         JJ9B5J6YC4YJXdu8HvLcE8aztG6kUfVbshSpE5kKGTeZdXFCvPGUIW76IL/GrEr8AnoW
         z5a/+cAe/37po2kfB9RrgRSlZ0iLLppHyN9qFfa9ecITb4lzRwzJEyDyt5O8HR5UhUXi
         uKrA==
X-Gm-Message-State: AOJu0YyV3DDz5H8/AgsmAqj0iTaE530fNpNPsJgeuY1iOxxm3ljYQeRb
	FdxqwKUsrZRP2ax+vOYhenCv5Eri6C0/lTEGYjxB+d1DNLQjwpqm
X-Google-Smtp-Source: AGHT+IEvLD0YPmKsAENgPb4yCsXotokzbjkbwCO0DMdsJYZJ84GO6F8LKt67QIb0MyH/EPrjVVqW1A==
X-Received: by 2002:a17:907:bb8f:b0:a28:b34d:8694 with SMTP id xo15-20020a170907bb8f00b00a28b34d8694mr631558ejc.62.1706173424308;
        Thu, 25 Jan 2024 01:03:44 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id wh22-20020a170906fd1600b00a30fc529f25sm797099ejb.199.2024.01.25.01.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:03:44 -0800 (PST)
Date: Thu, 25 Jan 2024 11:03:41 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>
Subject: Re: [PATCH net] net: dsa: mt7530: fix 10M/100M speed on MT7988 switch
Message-ID: <20240125090341.jl2qadhrd2y5yqiv@skbuf>
References: <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
 <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
 <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_010347_221772_46C07484 
X-CRM114-Status: GOOD (  10.14  )
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

On Wed, Jan 24, 2024 at 05:17:25AM +0000, Daniel Golle wrote:
> Setup PMCR port register for actual speed and duplex on internally
> connected PHYs of the MT7988 built-in switch. This fixes links with
> speeds other than 1000M.
> 
> Fixes: ("110c18bfed414 net: dsa: mt7530: introduce driver for MT7988 built-in switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

