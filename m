Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB8C3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 21:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39ozkC0HqQZ+Edap3Ljm8Xvwn44jjjAD+L2Y5G1YxR4=; b=Uou2SyPxzeh/seCU/Y77WzrKYh
	29Ld6sje+imIAgLZBXUIvQu0RSAzffUgbdXLmB8BQCSFP7z6AEigNcwVy9zrRQxMIFAQV8h6LpJL7
	t1DmCw1LNNa+v0ehN8dRn64bHlbAEDK1wL3Ck/HE1qFH75A4/20nFJyn+BrlVCtgSQObqDtNo+I7M
	Uz8T3DDBT0eX3sjy4AS8SUrdzj9jV/40whR/3jGJd3ljMsqG8dXNrS5gJShPN0SO9heuryAYE9kV7
	aC8pmGEovrYSgfexdM//IZ6VGEfrtcx2lRb1fOrRbER7YRuBwu4sSmOhhOoa48oMjWGqx5hDBEcno
	HRyocmiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPUNj-00ADX5-2J;
	Mon, 15 Jan 2024 21:20:31 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPUNg-00ADWZ-1p;
	Mon, 15 Jan 2024 21:20:29 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-55980045ddbso189862a12.1;
        Mon, 15 Jan 2024 13:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705353623; x=1705958423; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=39ozkC0HqQZ+Edap3Ljm8Xvwn44jjjAD+L2Y5G1YxR4=;
        b=WKe744HwkpXr5KJqwe467DSMXO5uwGh9swVfZSGGwGaC3Vrd6ekd4kXh9p/E2ppuRE
         fEXScK680OR2iBBwRY9llFW+Sa3Ln+AISPpucrObkn2bZp9Y2Ke+67N6XsMTw6DIJxqf
         TIsID+aAj3uCCRG2jCncUaZAUWXXYYPu1TywGBNwb2ocM56bzrycT6rP7jk2QlIdjHTq
         PAYMwt5AdBIJjiOr3LVBY0y0bPVoAbtvrQc3rlUP5UXWnFUFqBYcb9Pb+N0cYhOGWXSq
         nQyNQe7hdUlydcghupLppsNvD3jt2KI6mpqG9ux//e+2JPwLOiENL3mXSfX4IvzPQMOb
         12qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705353623; x=1705958423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39ozkC0HqQZ+Edap3Ljm8Xvwn44jjjAD+L2Y5G1YxR4=;
        b=UN5MEAvpjNcI25MQ3d5XIGj43eQG/TBYZMxMWb3GVrqaFu+QZnhzAbxR49EpFfQzd8
         sWmoIil0FsKqmUkzYCCrcqHGsIPODlqCqQPGl0iMUjWhvVWM9EiMnS8qfS9VPfAFA6WE
         xJDWe1fihduu3XvPn7Rc/C/+I8HczLg5cCdypU79qeGl9c6AlXbrhO8SDWYPbYws8TMV
         8XhzkG3N45J9Y3VWcXuGa79+Nv2BZGKwZ8BpDpXOTZjVeCB59VQMGjRVnzCQKpBBFf/U
         x/HxCGTh0ovS6irUA5BfvdqyNWdHGYQId7Y/+z1e+MxEfYok9LmysXWdkt0OHkZuiCEM
         SlUA==
X-Gm-Message-State: AOJu0Yw4ZibWzojAhmwcUO22qLoH264lMH0l0KHoK3DT7S4MhL4mAGQV
	bT7Iw9GsNLa7F5YbUQMzdVc=
X-Google-Smtp-Source: AGHT+IHv3NyJLuT0FGCd+kbmIzXlKGmCwoOcQxRz6260TRiuR4kLFOFZNS/jjOerZLceilUQrzbFDw==
X-Received: by 2002:a05:6402:b12:b0:54c:b24d:a3b6 with SMTP id bm18-20020a0564020b1200b0054cb24da3b6mr2793991edb.20.1705353623234;
        Mon, 15 Jan 2024 13:20:23 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id c25-20020a50d659000000b00557c51910e4sm6104974edj.85.2024.01.15.13.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 13:20:22 -0800 (PST)
Date: Mon, 15 Jan 2024 23:20:20 +0200
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
Subject: Re: [RFC PATCH net-next 4/8] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Message-ID: <20240115212020.oaw3hx65feetplve@skbuf>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240113102529.80371-5-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_132028_628963_F46E2B69 
X-CRM114-Status: GOOD (  12.26  )
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

On Sat, Jan 13, 2024 at 01:25:25PM +0300, Arınç ÜNAL wrote:
> The crystal frequency concerns the switch core. The frequency should be
> checked when the switch is being set up so the driver can reject the
> unsupported hardware earlier and without requiring port 6 to be used.
> 
> Move it to mt7530_setup(). Drop the unnecessary function printing.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

