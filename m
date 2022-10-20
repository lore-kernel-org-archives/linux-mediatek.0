Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B351C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 13:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+gkU/NqbzBkggz5iJ5jkNMymmdjI88HmNgirY0p7mo=; b=MH6AK6ITKMjbSLo/iDqgwUL59w
	y6GTVtU4+cfRDjF6CDAhMqPjNYLnfjArHyESVZbHHcp9mVVRIqKLr3C1ijJZOCGDRxDTDac6tZMdi
	j53FHV/z2FjISQGDUXbd2C0QywjE5W7J7V3mdUga9vSYc2qTLMdQUbWyoQ52Mxj9wJSGCBCHkJr3I
	JHq/tKAGVqift54Ag7TDhiYh1v75QfvP2BBd0vsNO4fW0zQPVR4jFNIsfsSp3yYREP6I8WMrnzFmg
	a3+HgiZUkOSIuKHBynGQ3h24CI4XPvn/gT4rbe4Cd9ExqGA5k12StcCwj6zzGp61Zv2WE6r67mLby
	5N/fc2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVXY-00FQWT-Mj; Thu, 20 Oct 2022 13:24:52 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVKG-00FIKy-5i; Thu, 20 Oct 2022 13:11:09 +0000
Received: by mail-ej1-x62d.google.com with SMTP id d26so47241778eje.10;
        Thu, 20 Oct 2022 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X+gkU/NqbzBkggz5iJ5jkNMymmdjI88HmNgirY0p7mo=;
        b=TPiipjpDMk6wGWOJP+Agw+/0B6vH+/ztEW3I5tVyt2LoCYXke1TXQmFBwagKR/ECpK
         gEOm4H8c5qA8hZGz4VSJZPpkqt/IbvYZ19Te5+K8V6qcAjLW+yd00jruzQfGjWyTw1cr
         D5eAElpBXfz6xrI/19Get5d4/+bXbVvXDLrr4XJpc6KgZGXdlyBIfs1ftcluwlcs3TzI
         FPdNNA1X3wp1dFiIVzbhTRBNAtVDAHuEP77BPZNag0f6UGW/O85leK27nNsrOFr5A8gj
         BturwMnkyEbZpgiYOgFFYhxOalzV668fNDGJNiEqvHrmEQZIJTIN3mr4jmBQMU8LwU4k
         tOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+gkU/NqbzBkggz5iJ5jkNMymmdjI88HmNgirY0p7mo=;
        b=0AS315VzaDpx/8cnSkdzQIGqkN80RTFRWfm1Ix46GDC4ip9WHvV9T9hKBj1BZJBVvo
         zEKM1JZYNT2eICxXbCmyKSRB3eKgdyjmfkiQkJPf1V1XF3GMBOBw+XgUVWfe92XlAUFG
         LGJwsoSyepDiaTatOYZ68h3HbrQucVllG+9t7owerlWLB5ID2C1TwfWyDDk73bePvipL
         QrX7bJCYjtq6OFlQpLuGJvHfrf37BcvnoEKAM4bWxX4K83T4wQClJF2B+QnMntFxYoKh
         kjMHU/Q89sbn7XYj8awM2QLH2+QMEsZrGX0SuVMul2Hy2i0kbPwi8w+JxRdn+RAyGULe
         inMA==
X-Gm-Message-State: ACrzQf0YMWD/Iaw9xXpt92heR9UvGSijKTfdpfiKxCNOkVcTL7xeAllt
	OYoouVkOz3ryG63bIFyStB4=
X-Google-Smtp-Source: AMsMyM5DbMLGWM6/Y2wrW1N6novb2sRwX3cXwGgYvEbzR4IRYbS95ez4JesKLlaXMHBQzh6YJHjLTg==
X-Received: by 2002:a17:906:db0d:b0:77b:a7cd:8396 with SMTP id xj13-20020a170906db0d00b0077ba7cd8396mr11433584ejb.264.1666271466154;
        Thu, 20 Oct 2022 06:11:06 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id w11-20020a170906d20b00b0078258a26667sm10359958ejz.52.2022.10.20.06.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 06:11:04 -0700 (PDT)
Date: Thu, 20 Oct 2022 16:11:01 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Hans J. Schultz" <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yuwei Wang <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 11/12] net: dsa: mv88e6xxx: add blackhole ATU
 entries
Message-ID: <20221020131101.zotvyglhlayqdvu7@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-12-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018165619.134535-12-netdev@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_061108_259791_A5394BFA 
X-CRM114-Status: GOOD (  16.54  )
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

On Tue, Oct 18, 2022 at 06:56:18PM +0200, Hans J. Schultz wrote:
> Blackhole FDB entries can now be added, deleted or replaced in the
> driver ATU.

Why is this necessary, why is it useful?

> 
> Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
> ---
>  static int mv88e6xxx_port_fdb_add(struct dsa_switch *ds, int port,
>  				  const unsigned char *addr, u16 vid,
>  				  u16 fdb_flags, struct dsa_db db)
> @@ -2742,9 +2794,10 @@ static int mv88e6xxx_port_fdb_add(struct dsa_switch *ds, int port,
>  	struct mv88e6xxx_chip *chip = ds->priv;
>  	int err;
>  
> -	/* Ignore entries with flags set */
> -	if (fdb_flags)
> +	if (fdb_flags & DSA_FDB_FLAG_LOCKED)
>  		return 0;

I don't understand this. If no driver looks at DSA_FDB_FLAG_LOCKED
(not even mv88e6xxx, up until the end of the series), then why was it
propagated all the way in the first place?

> +	if (fdb_flags & DSA_FDB_FLAG_BLACKHOLE)
> +		return mv88e6xxx_blackhole_fdb_add(ds, addr, vid);
>  
>  	if (mv88e6xxx_port_is_locked(chip, port))
>  		mv88e6xxx_atu_locked_entry_find_purge(ds, port, addr, vid);
> @@ -2765,9 +2818,10 @@ static int mv88e6xxx_port_fdb_del(struct dsa_switch *ds, int port,
>  	bool locked_found = false;
>  	int err = 0;
>  
> -	/* Ignore entries with flags set */
> -	if (fdb_flags)
> +	if (fdb_flags & DSA_FDB_FLAG_LOCKED)
>  		return 0;
> +	if (fdb_flags & DSA_FDB_FLAG_BLACKHOLE)
> +		return mv88e6xxx_blackhole_fdb_del(ds, addr, vid);
>  
>  	if (mv88e6xxx_port_is_locked(chip, port))
>  		locked_found = mv88e6xxx_atu_locked_entry_find_purge(ds, port, addr, vid);
> -- 
> 2.34.1
> 

