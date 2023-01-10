Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E55C63797
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtmIDGWw27oWIDOH8I1+LwSysyCQMzRcxJv1yEQeQLc=; b=ZcDnFkGYtWQsPIQTn4Lw5qduhf
	HPzmnm5zLVNHLEUKQzh4XPWyiyzwWZ41Tj1IqW6OFMO4FD7SWYbZA0+bJUuhBgGGu5HoG5zrJoD4B
	aArI77Dzfi3fnpr65tm1GrZEN/NAZ2m4BESyeVrI74ChJF2m3kcYLYuOa0/3MpC3jbpe33QFBcI1h
	sDYfHTO3kBcfH7d0RgDAJM79T0ohf1LcXiXP8654RvUn9c5nj9WPWI0eSbRSwPr4aKtz6l5QjcwPs
	YwZMAQREVeU3LO8xFJL//Nk4lnuUzhkAmWaeuZj3GZJC6Tw3JAOpCz3qG0ZZ8pSs35c1llfWRivhe
	Yp5qpRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFE4T-006wNW-UJ; Tue, 10 Jan 2023 12:49:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFE4P-006wLy-6Z
	for linux-mediatek@lists.infradead.org; Tue, 10 Jan 2023 12:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673354975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtmIDGWw27oWIDOH8I1+LwSysyCQMzRcxJv1yEQeQLc=;
	b=Xix274QjZK36iOCJQemgohC0WVIzXJjXYMZIsmMUaqTyqIJ+xR4Psg5ADlaa6m1ZjAp/pK
	YupNhpGFY5UmEmEMU/+gCcueLwrukEF9sgfttvdGvpcbGSAviiihEhQUa/wnZpQpQDBhFZ
	xJ0m0qDqfrEGsdNdToLyoAQOEceNXa4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-ff571bhgO52uqXFrpwLODw-1; Tue, 10 Jan 2023 07:49:34 -0500
X-MC-Unique: ff571bhgO52uqXFrpwLODw-1
Received: by mail-qk1-f200.google.com with SMTP id x12-20020a05620a258c00b007051ae500a2so8639606qko.15
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jan 2023 04:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtmIDGWw27oWIDOH8I1+LwSysyCQMzRcxJv1yEQeQLc=;
        b=79WronFswwhs6yVzKznccqMKThusnsSZD+28AGzWE68Hp8fFcwW0BzbXr2MBX43nA5
         foaUmz+m3bwXTg+WX1NKhv6tuUpuXvFnSTeCKHnAzXLuNk6VkSYO/cV8okeUwg8EcBmh
         yd+leEmjmLlsSH6EyS92/x4OyeZKY/XEfGK0+i9aKleSdy3dmwg/eghC2G3h83X1552N
         BScYe1o8yCvLE6ZBsre1OUnOJM/YQv0r+1udXWOoNw7H5xQRsvBla2g2dEr/4yNVtcLn
         Xbw1c+biSZpijM9yqolDSd3gONRWBSrSvr4HMe5RSqThyRhb9TY5nH4kasD6C2VFTbA7
         Wywg==
X-Gm-Message-State: AFqh2kp8Yup3IV8km3IX2Q1HIBwHYudwxfGKa+kXhI/GSjkyJIrFk8nD
	Sf7NO6J7jHcJrHV1HqGUanDGDGzzKjbbdDiT5JoYmeQboUkfUlyRHoP3YI+a+IMBXmFyt3uPGMM
	9glIfLcPSQXKxaWRu4RsRTjZudWmNJuiy
X-Received: by 2002:ac8:5ed4:0:b0:39c:efc8:b2a8 with SMTP id s20-20020ac85ed4000000b0039cefc8b2a8mr3571961qtx.27.1673354974185;
        Tue, 10 Jan 2023 04:49:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuapLeanbK2mF2tkISFRRR7kbnBi3E797VRZF+bY3EPqOw88qp4xilDlE2/BCG9bCjL8KEtBw==
X-Received: by 2002:ac8:5ed4:0:b0:39c:efc8:b2a8 with SMTP id s20-20020ac85ed4000000b0039cefc8b2a8mr3571931qtx.27.1673354973900;
        Tue, 10 Jan 2023 04:49:33 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-120-128.dyn.eolo.it. [146.241.120.128])
        by smtp.gmail.com with ESMTPSA id g19-20020a05620a40d300b006cec8001bf4sm7232697qko.26.2023.01.10.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 04:49:33 -0800 (PST)
Message-ID: <161fdffccb78fca2f16f1f5c78390420f60817b3.camel@redhat.com>
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
Date: Tue, 10 Jan 2023 13:49:28 +0100
In-Reply-To: <5bd7ee34ead313785951defbf3069b64d4338a45.camel@redhat.com>
References: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
	 <20221227-v6-2-rc1-c45-seperation-v3-1-ade1deb438da@walle.cc>
	 <5bd7ee34ead313785951defbf3069b64d4338a45.camel@redhat.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_044937_340731_00F82A9F 
X-CRM114-Status: GOOD (  14.28  )
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

On Tue, 2023-01-10 at 12:16 +0100, Paolo Abeni wrote:
> On Mon, 2023-01-09 at 16:30 +0100, Michael Walle wrote:
> > diff --git a/include/linux/phy.h b/include/linux/phy.h
> > index 6378c997ded5..65844f0a7fb3 100644
> > --- a/include/linux/phy.h
> > +++ b/include/linux/phy.h
> > @@ -364,6 +364,11 @@ struct mii_bus {
> >  	int (*read)(struct mii_bus *bus, int addr, int regnum);
> >  	/** @write: Perform a write transfer on the bus */
> >  	int (*write)(struct mii_bus *bus, int addr, int regnum, u16 val);
> > +	/** @read: Perform a C45 read transfer on the bus */
> 
> Minor nit: s/@read/@read_c45/ 
> 
> > +	int (*read_c45)(struct mii_bus *bus, int addr, int devnum, int regnum);
> > +	/** @write: Perform a C45 write transfer on the bus */
> 
> Mutatis mutandis, same thing here.

Otherwise the series LGTM. I think it would be preferable avoiding
reposting a largish series like this for such a minor change. I think
the series can be merged as-is and the above can be addressed with a
follow-up patch.

Cheers,

Paolo


