Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B72C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w//caJhgxpsU0D7Z3jRD+/+BPazq6oBeJagzyDLCJ0=; b=p3PTunpY6YXvyO52gVmT1Edew0
	vSk5ANiJfB4SkTXhg6qkZr0+TpL3MBhEEzHZd/hJJ8VUDOiI8QeyLFdWyDfGWqbt300FrHk0S6Yvm
	67TVZRkDojGH/VrWBNuymo7b88icJWJzn83HDc+cWSjXlz5Gj8naP6LHfA4mz7h7m6yGt9N4JeGil
	9t17xzh9neHLlj78hOv++e5kjP/lYgrRUoUdl6bMc67SDvvtp2NNJFGmyE2lkk4/wUnwK9Py08F3j
	R/zPBdhzgpYL3++EzcvlG5/QEp/QXVBji4sd+9D5A5na53bPFdrekzqB816EJhPPi+PPm8dZDZJTc
	VGp6UWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XNs-002clg-0U;
	Fri, 26 May 2023 13:21:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XNo-002cjj-16;
	Fri, 26 May 2023 13:21:29 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-510b6a249a8so1332122a12.0;
        Fri, 26 May 2023 06:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685107283; x=1687699283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8w//caJhgxpsU0D7Z3jRD+/+BPazq6oBeJagzyDLCJ0=;
        b=DFghpjm9bcpkgNyiJHFT2QAahYRZ25MWjLxtIPJ89MIhIBRZY9+kVhg+TjGBoTj1qf
         rjeb0Zc0V24pJDVSEfodtSrqOd0W8O6xz6TxNW+oKZMG6DC0XLj/XsqJCM2BtSrxaK9x
         ntArZQGmwI28pxiAbyJWMJ4TRkm2i46I+jc2nZ9sGwKcal4jxLpxHiL6mAxuXKfX9nA8
         d3asrq8zmnvNmO++WByMq1+Z0n2/IkD4ZoY7zU5gLWTkjPTxv3CqSTvYE9Cm0zpTeG4d
         8I+wI2yusBV9OebtoLfPE3pDP5Yot7ubwi41PfQDUk9yxLywSiDwB1BUfnipweoDNulx
         bViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685107283; x=1687699283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8w//caJhgxpsU0D7Z3jRD+/+BPazq6oBeJagzyDLCJ0=;
        b=Rvj8DVE/z0vlfVcOjltDm8DVd1WaW6OS8aKEIyvTT8gy8/JseetcEjcE2oWxo3RmO0
         1hL0NI6I/AwubTYwQhuHxTW99h2Rnm8tqaQmE1V/Jh8JsR5a2+HgIfxMom5mKru+KU6z
         b100xUIAN/TgeNku4QdxfkfS/+lufG11asbHB7JThikQygc/IPiiO9NIW0YSpg3ZyZiE
         EAXrdcmp5ZMzuBbgOcwTMmWJiUAsFmgr298ukhHrXu69wTXg0tybztXtRzefcP+7eZNE
         DcsoaPtZoXNenajEjPWUY0S8bjUNPpMr5wqSB1j2qpTVW3q0XN4BLhBHzres2XGd6GYM
         8ogQ==
X-Gm-Message-State: AC+VfDyaWuv5rS39KmEsNaSBG4fYwMhdAUn0rwbdNGF4XVkAbGmWesoe
	StpZrVrPSBv2MyQzWzI/6kM=
X-Google-Smtp-Source: ACHHUZ4ztO0mCvPoV4w/YciLRZtDBOM/hRuhrghOrpsOPWOBd+L4oXwtd77pHKEzaCKdiqCuhd/VhA==
X-Received: by 2002:a17:907:6e8a:b0:969:e7da:fcb1 with SMTP id sh10-20020a1709076e8a00b00969e7dafcb1mr2531562ejc.13.1685107282595;
        Fri, 26 May 2023 06:21:22 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id c19-20020a170906341300b00965f98eefc1sm2175760ejb.116.2023.05.26.06.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:21:22 -0700 (PDT)
Date: Fri, 26 May 2023 16:21:19 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 18/30] net: dsa: mt7530: remove .mac_port_config
 for MT7988 and make it optional
Message-ID: <20230526132119.mwth6nu3ifgsd24w@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-19-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-19-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_062128_379532_0D726145 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:20PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> For the switch on the MT7988 SoC, the code in mac_port_config for MT7988 is
> not needed as the interface of the CPU port is already handled on
> mt7988_mac_port_get_caps().
> 
> Make .mac_port_config optional. Before calling
> priv->info->mac_port_config(), if there's no mac_port_config member in the
> priv->info table, exit mt753x_mac_config() successfully.
> 
> Remove mac_port_config from the sanity check as the sanity check requires a
> pointer to a mac_port_config function to be non-NULL. This will fail for
> MT7988 as mac_port_config won't be a member of its info table.
> 
> Co-developed-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

