Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF677D216A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Dec 2025 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iasODFwnrpej5ihKsaAUgxOzvlJy+tRXrHwJOSqIP0Q=; b=uR58tZNlHczh73hO7VHZRbLuXe
	u+NCDTGyXEhPdHKtsppt8bCbzk+ClIdKHY78zaZIu3oGVk8gCRBZpODR5JztpJDnQkVS1ReXw9Y/o
	1aMHJuNXY15pFxp3Mh0OJtth0wuCmq/Osdt4nANr0GDazgE4S3M+9WcI+Ma3YZUdjyUXeVawQbSta
	2d8wr7c0KUfBzpSvillalqPyIBdbPoxCKQ7xdPaMci+5Ex/ByQCOruw76q+sKjO+/6uffOliwiX50
	oCNy/MjGY9eYdAPSxfkrWUlWb2ZDl5bkOJgaslqL/eZaLSrcw+PbrUIZIJ6keZUJ7Gn9p1aPfkfCp
	WVmcv6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBOc-00000008DY0-2yBK;
	Thu, 04 Dec 2025 15:37:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBOZ-00000008DXB-2kTV
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Dec 2025 15:37:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779ebfa91aso906975e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Dec 2025 07:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764862646; x=1765467446; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iasODFwnrpej5ihKsaAUgxOzvlJy+tRXrHwJOSqIP0Q=;
        b=OVvXp8OnnMFuW/GLaOjOvdEqkRsydEwFR4tg0cg3utGd0w0jJnRkGfxv7Y9nbLMNUO
         xYeHNx3sbrzzRkiZhIzmc70gHoKUxpSIQa7X19Wsl5gQ1+aCTcow8xQrCzdaYwP3LUqb
         Omk3Fkqa5R79xYoPGKPzK3jMvFHaMRnzKWjS0tHeEZKBrMaNKldJs5kJAMbSIAmRG1fi
         m0TYbm/azJwxd+4Z7zPdNgfagAcMzBCBGoVLAQDT9puCGexbH+lhBCW5Io4kaB+hsZh3
         NNdLonkbA23kbFmIRZ0m3YB/+Q6zwFeUnkmJ2iT4OXI3kMFKsY3DZfgj+LtshWcok74U
         IaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764862646; x=1765467446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iasODFwnrpej5ihKsaAUgxOzvlJy+tRXrHwJOSqIP0Q=;
        b=gOX7UvubbWMuJGkOXrfHKfqo0BR7mRuWtBfHFQBEyZi+Apj/3YlGhqIL8pO0FInYgG
         fTo94GXl9Z8xJf9Yfk+Hq5c2meOkxw0+HKtlPHc/4lVCu6Kv2v17+xAxCzJha/asOrlU
         9ICJRt+Y8F7ReqATQ4BecineOo6kmpryVhjYqEsVPccydkUQrhhPIZ39+t9/j4jhsHRo
         cHkP1dhpLcLnVPVPRQTEJC5SqSr0YDZGDcgFuhLhvx9xLOZGe3qfIatiDpRXtbZWjzAK
         UseFlH/LUmRGJypBkefg2fEg9la+mRWndsCm6mry1fBG/C43M5sVoIG+LURjUil3FMJm
         fePA==
X-Forwarded-Encrypted: i=1; AJvYcCXUJz9nBoy81K0q/vHSZ7FbrqfjlLR93wDCKpzY40Kj0JobaqnmgEujhTaP9qE+SN9EwAProyVffBmUqCExNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YznPCprJqNzHZd6u8ZquyMuakn0OBifAdAQpRPQtHzsv7wcvQP9
	WHEUA6CCGqGEnKJ/KWSaKxJ50cuuKMQc2+gqgRITDemt53O5oQZNFpb6
X-Gm-Gg: ASbGncu/JoBD3iYVOs4CY5hvkXE27UNE1KeO2Gv9UFP9TVqfNwTA+GpugOB+5xuTc7L
	iwi5FXTfyqkTD889VtLeEiPK+klLbL+rDgvEoagjocpXmE4dnZBwBaMLKnRuAmju6Qw0vqKEoWa
	IUsc3EGkN3Xvlq0KG2O98J+xskSi5633OIm97SYW9WksijLgsKJ5P3JGViBxYEll71MAH0e2okA
	22tT5qWhKJcDbRapS1F+Kr+OHH0Cj690J/Oxay8Aa/eJWO32LGqs9SCFEqE0iwVN0YzbAH3PtYi
	/5jtpMB2GcMbtZhMcTw0+zEnMIiflZ5OlsOShrizNiz7agfZRrDSmxgWoK+pLnsdpX4Wr3wkaSi
	/yR/YnCppypBb9j47CVoMKeoAxGDhaIR1rclL0oqLRm94pD2pZxc7cFOEIuFKJsiD63vEpn5lvk
	G+zEM=
X-Google-Smtp-Source: AGHT+IG0YF6qmFx9hfyT69cJ/NJuiahXcMZFrcwdfYs4/eTXFVZRKEz/Y6SPeFs3HRVMeBHdDKXaRQ==
X-Received: by 2002:a05:6000:186c:b0:42b:4219:268 with SMTP id ffacd0b85a97d-42f7568973cmr3423808f8f.4.1764862645565;
        Thu, 04 Dec 2025 07:37:25 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f75sm3948069f8f.42.2025.12.04.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 07:37:24 -0800 (PST)
Date: Thu, 4 Dec 2025 17:37:21 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frankwu@gmx.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204153721.ubmxifrev4cre6ab@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <7aacc2c2-50d0-4a08-9800-dc4a572dffcb@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aacc2c2-50d0-4a08-9800-dc4a572dffcb@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_073727_710930_AC9DE3A0 
X-CRM114-Status: GOOD (  18.91  )
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

On Thu, Dec 04, 2025 at 04:22:10PM +0100, Andrew Lunn wrote:
> > If this is blocking progress for new device trees, can we just construct,
> > using of_machine_is_compatible(), a list of all boards where the device
> > tree defines incorrect reset polarity that shouldn't be trusted by the
> > driver when driving the reset GPIO? If we do this, we can also leave
> > those existing device trees alone.
> 
> I've still not seen a good answer to my question, why not just leave
> it 'broken', and document the fact.
> 
> Does the fact it is inverted in both DT and the driver prevent us from
> making some board work?
> 
> Why do we need to fix this?
> 
> Sometimes it is better to just leave it alone, if it is not hurting
> anybody.
> 
> 	Andrew

Frank said that the fact the driver expecting a wrong device tree is
forcing him to keep introducing even more wrong device trees for new
boards.

