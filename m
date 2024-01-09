Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2C9C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8zorFy37cTsPEwkpmk1vmBCDGkHkthlVR0ZqxNtPSY=; b=kMR2kxZkR1uktQ1/kzjg+VZMnf
	9k7ODXKaRNXcZOG85TrVdkI/wTnVpWuh1/scxnmwipBlYZzvdbccBwBXUEm3jw1XppGC1johqnFm0
	FO/j5XE3U5nDV3HUMZmsJcLuw2Qjc+xhmeRZ4QE5KxgYj3yHdA51PL2pr0q68x8udgHW48quWwsUh
	cPtsd00dlyYjdHGF6hBnjUtoCGoD2avpvBevOeiuHBeYLRVnWP/vGJxJAbYVX/pBrEcZCIaxOYdyA
	iVckzUInTEAj0XaeyoNvERomQDciKiPqeS2anaLuRpG88B6Z4gm0doma0xrAHmgkPxXZxsqQPnXHz
	l5srvC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNAdg-0086pf-0Q;
	Tue, 09 Jan 2024 11:51:24 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNAdd-0086mL-0y;
	Tue, 09 Jan 2024 11:51:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40d4f5d902dso30215165e9.2;
        Tue, 09 Jan 2024 03:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704801078; x=1705405878; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e8zorFy37cTsPEwkpmk1vmBCDGkHkthlVR0ZqxNtPSY=;
        b=ctU0CrteNHuxQ9RxVdhAjNCPS2CCSuIu9oMncXYZgWtvXuCF8Wr6x7s2MjpcQ8aK5r
         jPhvLNJ7lXU9zA74E4AeKgLz1aK3xQPus43Kknx9um+uJ2jtB0ybNFQ2X4A+xQEm5CzR
         PWXasf3QkzX/T0MJrvMsSqFQU60p++F4WcoQhBMigIqcHb23530dAbVbc86IxgrBxXFg
         m+cWHKTcHJ6CvNBNToz4b1S/Csf6zkv45ydUz3rcO8F5RCdeJuAll96cKEgA1zIiZJcw
         LoUOjRB2/XsOAwO53OnzIJU4e63eeDhGRGBQuL3mOQaoiKok5LkEIcBGnaUuUz30qI64
         J7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704801078; x=1705405878;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8zorFy37cTsPEwkpmk1vmBCDGkHkthlVR0ZqxNtPSY=;
        b=LJoWQU3t3bIe4uZC6JCXg3sPSsK9z6jmI64CZ0jgjuKA7E3L9rGON0Cil/3QxT5y97
         hfQ1n3Gylw+VwKyIKJZMt3Z8k/m7TumIwCgbYQyOa/03m+GAiU2d60xN4HOkmNRXWjBS
         InJl0kIS2Kb5DEKFKljGyer9UURg5gGdbix1m/VpKokEgAaPWLwJ5MWqJbUgOBIrz7QK
         WWtls6wMUdae+YNKP2v3DFf7CnW8z+4++0FdqfeqaD67NzH6maMFG5/X2QIkZfG1l2vf
         sRtlC+TTeyEfnCrWM38xbbO+6IC5MOaxX3CkzJPSw94Ja0nZNw4aoCjROJ17QV0ka12M
         G2cA==
X-Gm-Message-State: AOJu0YxGIeXHCJbHkfJs7lCyt+OtALizSiSqoPQ5F7LNkqwNWWNicN/e
	6wQ7shPLHMQmfBI8f0szPjs=
X-Google-Smtp-Source: AGHT+IF4Oxt1eK3J4/ceekyRc0+o+bLIr0gfQJAzosybtEeRD2xFsf3yE9MiR9sIWEdXxbypk1p2Hw==
X-Received: by 2002:a05:600c:4d21:b0:40d:94f5:b8f5 with SMTP id u33-20020a05600c4d2100b0040d94f5b8f5mr2578892wmp.139.1704801078190;
        Tue, 09 Jan 2024 03:51:18 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c3b1500b0040d5c58c41dsm3342978wms.24.2024.01.09.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:51:17 -0800 (PST)
Date: Tue, 9 Jan 2024 13:51:15 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next v2 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Message-ID: <20240109115115.yuct3yw4oy6ipd3i@skbuf>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-7-arinc.unal@arinc9.com>
 <20240104154241.rxjins4mi5zkbhia@skbuf>
 <f9ad000a-2e42-4ddf-89a4-9a3ff452dc4b@arinc9.com>
 <2793938a-91e1-419d-a011-850756177e31@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2793938a-91e1-419d-a011-850756177e31@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_035121_339718_AA7D1B1A 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 09, 2024 at 02:42:45PM +0300, Arınç ÜNAL wrote:
> Running mt7530_setup_port5() from mt753x_phylink_mac_config() multiple
> times is being prevented which shouldn't be done. That's because of a
> different reason involving MT7531. I will deal with this with a later
> patch.
> 
> I intend to put this on the patch log.

Still not clear why it shouldn't be done. Ideally you could come up with
a plausible hypothesis as to why it's there in the first place, and why
it's not needed.

