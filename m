Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709A0C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 19:11:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A56B23B40
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 19:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A56B23B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=20505eV59CV1iSS4zVZiVcU9dNOYjr0SSWrS7QZZCKk=; b=y+dKbFYs1tkSQSB/q+k3q1Og2
	RuZgdKKyXA84K5a4KbhWUGDxawDpy8NkEasD7IT52/2nNjRBfExALlWsv1KmTXU+pEAH7sDNl4+r9
	GG8GvGggXIoZgAZY6Dchyx/ojNv2bQgGw7+Ok4i9NO0SGYV5r6huadrovIsKhS8H3zD8pwfEbob2s
	lQ47zkMsADOhIFIB0x36SDNYu+6pNAvd22+5aLjQTnOkBRKFHWbWBFVZdpi4T4O7i1wrY3533lHON
	5GNLURdeB1fHvxl6bOv4TPSlVj6dj6VjHHf21Sld8mT7wvzAZuPYeggEzSJi81yKyDsGkx7UsMeNk
	INUGXRnRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l081U-0007vU-2j; Thu, 14 Jan 2021 19:11:08 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l081Q-0007u9-5e; Thu, 14 Jan 2021 19:11:04 +0000
Received: by mail-oi1-f171.google.com with SMTP id s2so7052317oij.2;
 Thu, 14 Jan 2021 11:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OuweyPlkRjUfbMjqqh2CV+mLsPdrJqy3G1dkbVS1eZU=;
 b=O2QEBWdS6ktam1EJ9Y4vVGEThuP+JkLgxn9kh7czTfX7UCGL6us2BxkxG3JrZ28ntl
 XZh2A3UzmucbiCD/+UPJKAKBa927YaOjRAdPWK5et5oYVpgZT7aOHpTDG0aGVU+GnxJP
 A+i2f0nRKrXb+2PmsdMBH+TwM+mPVpZCi4Moor9KH7xA++VXB1EZiHx1eJbcCzip3hsA
 4OpFPTl8BHg4LIA4zW/Mt+XAS7YMB+XQWLP6wo0ci8iYk5QCklkrFP0vz/7MjnW9KGKo
 S7KqZp74IVHKCgfRBGvlvU7qusWxBOt9/MuszXIZcZYn3WVvTVEftPfehshKn9uC2Hso
 3hCg==
X-Gm-Message-State: AOAM531CDJU3c+7tqCvAR5lRfnNIJ3TjL1wwkPe5zMjd+1B8tV2/pZmE
 NFT8mJluM3QXx3LaoIYkYQ==
X-Google-Smtp-Source: ABdhPJyCyN8iVoD3FUbCeTJenZbnGOUNr+ssedz+pYr3XOjuc6dn6KR63VcCPPxZ0XOw3w/v9MuUzw==
X-Received: by 2002:aca:c582:: with SMTP id v124mr3444409oif.115.1610651463114; 
 Thu, 14 Jan 2021 11:11:03 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o135sm1234449ooo.38.2021.01.14.11.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 11:11:02 -0800 (PST)
Received: (nullmailer pid 3393424 invoked by uid 1000);
 Thu, 14 Jan 2021 19:11:00 -0000
Date: Thu, 14 Jan 2021 13:11:00 -0600
From: Rob Herring <robh@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dsa: add MT7530 GPIO
 controller binding
Message-ID: <20210114191100.GA3393390@robh.at.kernel.org>
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111054428.3273-2-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111054428.3273-2-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_141104_229248_B450DE80 
X-CRM114-Status: GOOD (  10.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 11 Jan 2021 13:44:27 +0800, DENG Qingfang wrote:
> Add device tree binding to support MT7530 GPIO controller.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
