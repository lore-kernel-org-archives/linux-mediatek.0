Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351A2C3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 13:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/H78dV2CQyOKZtgy53vprQZIn/cmX0k21n4Wz6mxpk=; b=A8GAy3zgA7bDUnG0Odj1YMcxVf
	F8V8Apk1pMqFv+OyQSQJSKzUIjyKzeD5eeAXbqTY9ETJ0BLmqfomINSfrXWR+k+J4MJKXs8HecYgD
	SY1qNS2XBtQ3XSGbl1UEEJQVHS9SqcYJfM66NNTZg2W5PNLkp5gFOZP6X7lcuza3Gg1k5Tj8WSQPL
	JlTnLI/pLqCgQMdQ/2Oi8VRHPCaDjbnOOzeC5w98uhq0fHNKhx0wFdqPd28L+vqpgqF5oYyIMDZlZ
	5+RzL1e5F0jBgCD7m7WlvBIPEHKovWp5AG/KkFjhomNgsxJV5dG86CNm9yShjQnLT+EnBE+7Mx6b9
	F+7HCtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQoeq-00000003xX3-2sik;
	Mon, 08 Jul 2024 13:43:56 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQoeU-00000003xBA-2KVC;
	Mon, 08 Jul 2024 13:43:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-367940c57ddso2551123f8f.3;
        Mon, 08 Jul 2024 06:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720446211; x=1721051011; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H/H78dV2CQyOKZtgy53vprQZIn/cmX0k21n4Wz6mxpk=;
        b=YeKNmMbeUuGjfGmFhB60tqRSuO8W5UnRZFEFB1APUBQJFru0xZDMPmP6guN1isHwuw
         bB2Mj5iW5jHrbd6LpVLZKnxpXrsB3XgPXdMIS0nPYBCLC9TDfMfzvlXrfBTeeRIymOfy
         D5niZm7CmLtB40zTPOv2cII2ISARZ2+/WhtusouTeF9TYque4glhqepltJmE+MCfmqMu
         extrdt+pznQ0Yjt6zqr/t23t+Ftjuha9HhMEoOYSQXGPc3Y8IyZxQ2KyY/RJFaHvYLFe
         xHZxrDNhUIM9OytegX0pH9fkpTPUCK8+DGRMF/rWOcl/qO4r1JXiVkgZei+Pc5t4m0t5
         JpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720446211; x=1721051011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/H78dV2CQyOKZtgy53vprQZIn/cmX0k21n4Wz6mxpk=;
        b=DHrvkMEGJHgyk24geLeNrUlJEoy8p8+tsKqP915o3998APTCHFt860/uEwxETqaouN
         wrojAjzNilzMIeeAn2VMXOKCvhSTEWBBwE1WSSYogiTixe2kP/abroTgQxDVZ0C3D4Rv
         Omi06MQIjyIyaomCzrsf8zvaAXkmWOgIrZZVSsj9OpNG6oXG4qHecHrkD5eFDhyTRTNV
         tGESo0yT9ZAxtH9gCBv6XqNvTY0LobMupGucmU2iOy+koempDCCN435U8T5eCBXI98yb
         CJavPkYxiOgz2tw97chzUfeoliKAe6p9pMCvljYy4bX0CqymyNIt4r9YRYZyEhlhcYST
         uRBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwGF7Zaulzv+S0c499XfI51IDZEtoMmrtCuh5OiO0jZa8wjen70Zth9WPNLX6GGAUOoyoSTwPL1l8jzUE2ltantuh+iyEQ40MmpRe+MUjXFfS12B5+GQOoRzwdmTvpty9Q3nnV2B3ZzR6D2Yte6H4qXC16vxfb6jI=
X-Gm-Message-State: AOJu0Yx+2WG1SJ0WKDSd18/DUsCSF56vWPv/FUs4hUEnuKdsObqwF90e
	VmiSu1jPIx5HF4QXRrAtBb8m2c4i3Y8ZSBrqTFe83ZPFNn78Y0M2
X-Google-Smtp-Source: AGHT+IGYrebj0t6Sz6CR6eFUr5wmQS1bM2olcs7f1zh32jh5ZLmrYMWuQY6AoOum12kv8PhheSWyNg==
X-Received: by 2002:adf:f8cd:0:b0:367:9224:9623 with SMTP id ffacd0b85a97d-3679dd0d323mr6925452f8f.7.1720446211105;
        Mon, 08 Jul 2024 06:43:31 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367963fa692sm13084965f8f.85.2024.07.08.06.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:43:30 -0700 (PDT)
Date: Mon, 8 Jul 2024 16:43:28 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <20240708134328.hgwthqwcif5pjaig@skbuf>
References: <f485d1d4f7b34cc2ebf3d60030d1c67b4016af3c.1720107535.git.daniel@makrotopia.org>
 <20240708133359.rylvvmpcwlsxtrs5@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708133359.rylvvmpcwlsxtrs5@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_064334_790496_CD0BFF16 
X-CRM114-Status: GOOD (  28.92  )
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

On Mon, Jul 08, 2024 at 04:33:59PM +0300, Vladimir Oltean wrote:
> On Fri, Jul 05, 2024 at 11:48:40AM +0100, Daniel Golle wrote:
> > The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> > using bootstrap pins. However, there are only 4 possible options for the
> > switch itself: 7, 15, 23 and 31. As in MediaTek's SDK the address of the
> > switch is wrongly stated in the device tree as 0 (while in reality it is
> > 31), warn the user about such broken device tree and make a good guess
> > what was actually intended.
> > 
> > This is necessary to not break compatibility with existing Device Trees
> > wrongly declaring the switch to be present at address 0 or 1, as with
> > commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of switch
> > from device tree") the address in device tree will be taken into
> > account, while before it was hard-coded in the driver to 0x1f
> > independently of the value in Device Tree.
> > 
> > Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > ---
> 
> Despite having commented on v3, I am not going to leave a review tag on
> this patch. Its contents has nothing to do with DSA, so I have no
> technical objections of my own, plus little authority for an ack.
> It basically boils down to whether the phylib maintainers are okay with
> this use of mdio_device_remove() API from mdio_device drivers
> themselves.
> 
> I did have a technical concern in v3 about a race between the finishing
> of probe() and the call to mdio_device_remove(), which Daniel did not
> respond to, but I suspect that __device_driver_lock() from
> drivers/base/dd.c will serialize those.

Having that said, I noticed that this particular patch revision is not
entirely under their attention, so this is a heads up for them.
https://lore.kernel.org/netdev/f485d1d4f7b34cc2ebf3d60030d1c67b4016af3c.1720107535.git.daniel@makrotopia.org/

