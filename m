Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65A2C54EBC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7R6k4XeSSfrouTet4Pl7FYt1MDO+biHA3LgQPUZKzOM=; b=gfrDOnPIP3AXc6slME0Mxs3z7O
	4v1qUzw7HM1dOHETu5Tcb02zJbguxkTnPnpS8fH7dkAdH9rYcmOTToOqX3FsGYNJWf+zuQLZ8fYSy
	gNHjQA9dkN1Zf1QOVx/vXT+Q0GZq4BTKe/8jpcAfuY594YVL56GeeMFER066za4NKrS2BxsFHzS8H
	5A1VCBz8YJRl5U0itXzBgbncd3Le+6kNdCykdVTCLt/nBsSiuKIGO4t1ooteq1peJi+8gJ/GNbppN
	Cyw3V6KY3gsJ19ZCh+SU7ZPfQNC7YgQpvwzvY0dxZF/nIA7LDvyRd3X2STkr9ar3Ng+DdwLlQX7Z/
	PxoZZb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFCdD-006c9b-LF; Tue, 10 Jan 2023 11:17:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFCcu-006by1-4I
	for linux-mediatek@lists.infradead.org; Tue, 10 Jan 2023 11:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673349421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7R6k4XeSSfrouTet4Pl7FYt1MDO+biHA3LgQPUZKzOM=;
	b=PkdKWIR7QPEzuFMnMppcCEVq3ibLSxh0HQLEwGs1nIqdUTWk5+l53vb65OugsT1Sj7BjQp
	d4U+y+bqLJNkcsTb62HK4m4JUVWZzP3q4lKGndNVtZ65nJdGgTdU23aJTAOxEYdzvouW2O
	1giirtF38N5mhTq5laph7clukkLRoiQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-Wljx3E9_NBeaPwr8nKwAZA-1; Tue, 10 Jan 2023 06:17:00 -0500
X-MC-Unique: Wljx3E9_NBeaPwr8nKwAZA-1
Received: by mail-qk1-f199.google.com with SMTP id l16-20020a05620a28d000b00704af700820so8442349qkp.5
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jan 2023 03:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7R6k4XeSSfrouTet4Pl7FYt1MDO+biHA3LgQPUZKzOM=;
        b=gfinRAAsTz4ZMt9FOJoRFLK9USTGOoEJ5E8j6aFDMBbZoEdxe/2X3gUi0DbD0U4ht5
         MGYiu4M02jECaosGHYx0/0BB8opJ9V/0JVLP4CyHR585fy0guhw8v49d4Wm+8d9pGeqQ
         wSBU9bzzyv90nmb/T9m4UvR05q2zHdfAl4YWNBX+NwXGShCMN2iH7c8fzYHai5dilz4y
         8mVSW5U+qzNmTzdOc7EUB2CcYOWK/ERdlUzsS25LgQRTmKvli8P4oS8d4ructPXvwMHb
         w62lUc4prvywgHXKx9UkjNfrEACAtwZPJWnfOZAo3oNc5g9UC60pzHpoq7X+D7jdfGTk
         LBYw==
X-Gm-Message-State: AFqh2krT3sR7syRyWsNd2RQ+zaPfpVlHLnDnHpKuYRsbAOPJhYOfg/zS
	6FOtKZvw4f4ShMspp8Okxi/bzyAaVrz4/9RZAPRcGpLzd9O34275L5oobs6FXCAP4nAZOahqAgz
	IXLB+ntJeDVZmZlI4H5sJiyY1gkmrkBsM
X-Received: by 2002:ac8:520c:0:b0:3a8:1079:b844 with SMTP id r12-20020ac8520c000000b003a81079b844mr89443427qtn.46.1673349419766;
        Tue, 10 Jan 2023 03:16:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7LAw0VjeSUK8wkVXMaLsnRFvPYmNquEuKr7XZHAByB6NkEWLdJSItXvzP6gLV6c7Tmr1r8Q==
X-Received: by 2002:ac8:520c:0:b0:3a8:1079:b844 with SMTP id r12-20020ac8520c000000b003a81079b844mr89443387qtn.46.1673349419493;
        Tue, 10 Jan 2023 03:16:59 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-120-128.dyn.eolo.it. [146.241.120.128])
        by smtp.gmail.com with ESMTPSA id k8-20020ac80748000000b0038b684a1642sm5839964qth.32.2023.01.10.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 03:16:58 -0800 (PST)
Message-ID: <5bd7ee34ead313785951defbf3069b64d4338a45.camel@redhat.com>
Subject: Re: [PATCH net-next v3 01/11] net: mdio: Add dedicated C45 API to
 MDIO bus drivers
From: Paolo Abeni <pabeni@redhat.com>
To: Michael Walle <michael@walle.cc>, Heiner Kallweit
 <hkallweit1@gmail.com>,  Russell King <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Jose Abreu <Jose.Abreu@synopsys.com>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
 <linux-imx@nxp.com>, Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Vladimir Oltean
 <vladimir.oltean@nxp.com>
Date: Tue, 10 Jan 2023 12:16:53 +0100
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v3-1-ade1deb438da@walle.cc>
References: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
	 <20221227-v6-2-rc1-c45-seperation-v3-1-ade1deb438da@walle.cc>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_031708_312099_2A8552F4 
X-CRM114-Status: GOOD (  11.44  )
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

On Mon, 2023-01-09 at 16:30 +0100, Michael Walle wrote:
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 6378c997ded5..65844f0a7fb3 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -364,6 +364,11 @@ struct mii_bus {
>  	int (*read)(struct mii_bus *bus, int addr, int regnum);
>  	/** @write: Perform a write transfer on the bus */
>  	int (*write)(struct mii_bus *bus, int addr, int regnum, u16 val);
> +	/** @read: Perform a C45 read transfer on the bus */

Minor nit: s/@read/@read_c45/ 

> +	int (*read_c45)(struct mii_bus *bus, int addr, int devnum, int regnum);
> +	/** @write: Perform a C45 write transfer on the bus */

Mutatis mutandis, same thing here.

Thanks!

Paolo


