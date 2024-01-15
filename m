Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F882C4707C
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 21:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4BibwaX8MWABZKTTuvrQf1jMOqo1GohyvM0tbsIEuY=; b=Nqxh0fhZao91n0LHI2MFACE2cM
	+338yhtjWpxJVb8PXuI+1q51w+fVBvYyxLfu0U5UlPCroa272lgkYU7apGKXENgIny1AhQLJCuVWj
	ZbxjwrFRKNG6n/ZSfIJ8cjNuD3VLOVbS9BAIE8XQGPMOMwJb6shZLLhNlaqlWssaEflSrS9/scqks
	CY5BaiV7HFsSt9pjbJdd2c2w4RnNsjYDyCFXP0NLN7J2zI78i9B1qo4+/m7GTozYIeyvwIl3pmdGt
	vne3UOaygwdDOK/1pL05e8lg2nHeV3Eq0xiu4eTXoan6vGYJUsP3X0CSaAPS1T8Z+NiYcJnQglHqR
	nf5iCidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPURX-00ADwq-0q;
	Mon, 15 Jan 2024 21:24:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPURU-00ADvs-0G;
	Mon, 15 Jan 2024 21:24:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso20881405e9.3;
        Mon, 15 Jan 2024 13:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705353860; x=1705958660; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g4BibwaX8MWABZKTTuvrQf1jMOqo1GohyvM0tbsIEuY=;
        b=ffbXjOBFo0Q2X+KTtC0YmQ4QzS4lRrQgTX6GdcdqifphTY2dOkvOwXvo/KOiIyE+ED
         wjUIQabdl+CfYTrOpXdlg8s6lyEIB1+8ThxnNBOV/RXulQSBGTZryZrXZBqZTYhROfwV
         m1ohi8veK9eddFYqAFxGZJ1gFYavFszFyKxSswYEGv6tUnIiFIj2s1b9tWnXlrv3mLzW
         jeCz+iCd3ifOwAKN0kjKGl9FFzByY+3C7rr8alXem5jHQzYfkQ6W503hr1EjLNUrMCpe
         UW9M1n0/k0ensOvdLLt4a7aoyAIOC2Pqm20mDdoWvqzcl4YGmBKXWTAvKKEx2Uz7NlfX
         Hh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705353860; x=1705958660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4BibwaX8MWABZKTTuvrQf1jMOqo1GohyvM0tbsIEuY=;
        b=vTL46fPMMbfxhKAUumMfLKLU4Ls8fSQuvK8M5Bn+Ze3ljP2EJsYBecLUDlQy5fz15u
         OSk1hAG2wi02/z41Yu1nSX38ee+8Hwtw9zL7VV6bGVG7f8UukFuNIM0laX8TRWTzJwDn
         HTmU9JyZuZZRg+HUf4c/1+c6+1E+YSTyGX6+3ZHWEYkKBpbmgK+WxO9i7EvRBPmOiEu2
         /O1CYo7xJ+vVN7MDnxIByvQUMe+9D/KpYcjKScJU/wkhwLDxUhp/UdQm30uX4G3iPyFv
         LtEVUmq6MgSqFMtZRhCDJuMafWnn06QPxOMivN+YrXoq505MoSrZnZs5lykB8wODASnK
         yTCw==
X-Gm-Message-State: AOJu0YzWCqKcazrCAsV1Py/vwAzwr62QinXbtBjDfygTKZDHrcnx2y+e
	BPyuoUvBUk2yUC5HsZ28Yys=
X-Google-Smtp-Source: AGHT+IGS2DleYsPDxFubSZWuGUfOFBEeJSJbvbS8UfWv276dj6fVdSeHn96g53WwPCorL+XvGdQWyw==
X-Received: by 2002:a05:600c:3c8f:b0:40e:6ddb:2970 with SMTP id bg15-20020a05600c3c8f00b0040e6ddb2970mr1548393wmb.274.1705353860266;
        Mon, 15 Jan 2024 13:24:20 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id v21-20020a50a455000000b005527c02c1d6sm6108008edb.50.2024.01.15.13.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 13:24:20 -0800 (PST)
Date: Mon, 15 Jan 2024 23:24:17 +0200
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
Subject: Re: [RFC PATCH net-next 5/8] net: dsa: mt7530: move enabling port 6
 to mt7530_setup_port6()
Message-ID: <20240115212417.egqyslsbrqw6jp3q@skbuf>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-6-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240113102529.80371-6-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_132424_120490_B2F19792 
X-CRM114-Status: GOOD (  10.51  )
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

On Sat, Jan 13, 2024 at 01:25:26PM +0300, Arınç ÜNAL wrote:
> Enable port 6 only when port 6 is being used. Update the comment on
> mt7530_setup() with a better explanation. Do not set MHWTRAP_MANUAL on
> mt7530_setup_port5() as it's already done on mt7530_setup() beforehand.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

