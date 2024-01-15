Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F094EC3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLysBvDenEQ28MTHoWPLscX8SqHGcwin+UvlB8fQgMk=; b=cshnySaMvYNGcYWDz5GN7TkJ9H
	bo1ZqUwsKpPAisykJo8s4SmPAduVhXTJbpJ15j8STt3NsWNwtDYKwyZbSfE2M+u+FB5XARV5OsWJT
	HwXTWtteO3bLtwT9CemKTtIpSPAiJPSLYlJp14ML7Wez7NPUdiMJAemXazjSbbCXxjqsozaqbKb7+
	y8ZIsnzSNL/IhUTaPvg+lbyBRrPtTKS5HXc/SEVLUJf68E+4UdxQq0t8oeaChwjk9ZsVSiRuCNvGb
	6YSBIY2HzizYtCOC8KfvlV7QJdU4Ppq2mGvilIhTfFU5YlEH6Q0MpIupzwHPPQiYvk361FL1+1DcL
	qLlhK59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPUn0-00AFTo-2h;
	Mon, 15 Jan 2024 21:46:38 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPUmx-00AFTC-03;
	Mon, 15 Jan 2024 21:46:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a28b0207c1dso743942066b.3;
        Mon, 15 Jan 2024 13:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705355193; x=1705959993; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLysBvDenEQ28MTHoWPLscX8SqHGcwin+UvlB8fQgMk=;
        b=RdpTWQhB87Usar7DviGo9GyhzLyFN4MN/sO5T/a0unKqQ2N0T5RGqd8QhsmHWHgmve
         cGR/ti5dnv78Qsv+YbbhNCfrkw87kJc4gYNdrjxV56FcYOMfeC75KUvry0pn/RYwigwo
         Tf7PhP63XuR7fNCkl8p9A1Ryggq8uQyIz48rWF/JFAZDd+e4Lh1ipzLi/0zehEeBky9f
         r8+qykZtpH5NbaLPApj5Zzq6+6tnMkSUUpWVBSiMa0SV0cOzCq06vOhThjd0CEYo4k9o
         sSLZ6/f3b1Ux16ni60YN0H/LUEm8C3CCEJJS6mEYbnUVXk9DYSqAXkXcHM54WXK8sJAI
         hZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705355193; x=1705959993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLysBvDenEQ28MTHoWPLscX8SqHGcwin+UvlB8fQgMk=;
        b=KkZBhzWQUkkMmwGxGg4Rpl/OjTdLmAegq08oUTYlKj2K4UK9UOa6e057hGc+M71TYZ
         6GqAQH6CXLIafQz9JTss/2xh5l9Rnlt3e1pgghymXdECAJam29YbZUXOan49X3dM9/BL
         fPr38lDAW4cVoaDDKrtw2sRuRBy6zsqgeCH8Pke4Qai+gLpTLQVVmu+LukwLEPfPc12T
         iCBKzEPpDXX6Q6+9lKubvPS1duB1PNv57X0MIv6xdDtLVW15tFuLP60XGcKy59u3ykiz
         ETd/obvre5a569HoFyDfYV/IgFwV+17STEnzigPveyz/Uus8cthJoSvOJoGe4Pi5rEg0
         PNvg==
X-Gm-Message-State: AOJu0Yyq8nJdr2Blf/cjKU3RFDfcW7dJ4IyM70wX+Im8hvLJGERn5qBJ
	1566L2nY7wNf533YGKkbVVs=
X-Google-Smtp-Source: AGHT+IEidDGhYUK34ndwyOKDjPlSGil8Zv56DjOYyVMr22Hkg7xq0uUI0WZPWjrIOhcsnJb4RGTMXg==
X-Received: by 2002:a17:907:a689:b0:a2c:e323:b71 with SMTP id vv9-20020a170907a68900b00a2ce3230b71mr2737988ejc.0.1705355192600;
        Mon, 15 Jan 2024 13:46:32 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id gw7-20020a170906f14700b00a27741ca951sm5678924ejb.108.2024.01.15.13.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 13:46:32 -0800 (PST)
Date: Mon, 15 Jan 2024 23:46:29 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH net-next 8/8] net: dsa: mt7530: do not clear
 config->supported_interfaces
Message-ID: <20240115214629.ncdzoaawmw4gi7rk@skbuf>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-9-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240113102529.80371-9-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_134635_075005_5236777B 
X-CRM114-Status: GOOD (  11.50  )
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

On Sat, Jan 13, 2024 at 01:25:29PM +0300, Arınç ÜNAL wrote:
> There's no need to clear the config->supported_interfaces bitmap before
> reporting the supported interfaces as all bits in the bitmap will already
> be initialized to zero when the phylink_config structure is allocated.
> There's no code that would change the bitmap beforehand. Remove it.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> ---

Yes, the "config" pointer points to &dp->phylink_config, and "dp" is
allocated by dsa_port_touch() with kzalloc(), so all its fields are
filled with zeroes.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

