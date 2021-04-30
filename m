Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9692DC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 02:39:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D943C61409
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 02:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D943C61409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IMLreEKciHZuJIuWGWsdO4dhi67+slo/heGKeCvaxF8=; b=V7fMlxOylKzhYqmdD77Vz8CG5
	1IswNH4Igptkx5gGdO9PzcogSLU0WfUxzqptzM5qerLI9EhKXHjoGrYCRZH8GuJ3dkM4AoFmwQjuP
	YoHpHeyGBM8tm1XT0YLkW7BcJ4DYCjgkEMLslabqC3cE6IhpCb09xr3GahemXPcN5g3chYaYH/RPK
	yRQ5yAY13m/3LPZPJcl875EggUvdn2BeDHcOeNkEsw1hP9jsJzlHZmEi/xw5VYDm+dyE62sXQ/Ebu
	/hCHsv847x23y0oGJewHtsBOdpESPKIwViIorlezFTWDgjSmxaqftx0QqvbNHMzqrSHwyvGamLIUG
	eonAXejww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcJ3S-00715G-40; Fri, 30 Apr 2021 02:38:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcJ3O-00714x-Br
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 02:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=jaCub1Sk5luNFcSj2KyJUdoWo/o9f4mzXOf2bkFAbRc=; b=Wr3iIc6KNe8n17H4tvK6TvNDzE
 UCkITT7CR9diLDD7dUNUjHxCnMo6f8ufhJbyEImzh+gsu9t2Xcebr0hnrlMjcJ78ilktcMr2JPgNc
 hzzo3MphT93MKaEbhrADqf7ZVdUMyhAbAkLfj2X0/BA3vhQFZyXARK54WeLmzprvgJ4qJsmzxGbIG
 EKqIgfUsRUB3kxvWzRW4k423WtGtBkdXlynAEJOzWB09srNzwKVGeXAtaeM3+eLGh7lMIeMqpeFST
 wlHBXhvyRFquIBB/npyTvLQ/hll4USVahp02HIYDM7ns0tezm7jFrMDGB3YZahqsBYnKs7V3opBhj
 ENVgrz9w==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcJ3L-0014iw-LW
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 02:38:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id t21so4729808plo.2
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Apr 2021 19:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=jaCub1Sk5luNFcSj2KyJUdoWo/o9f4mzXOf2bkFAbRc=;
 b=gCndhTw3ouP0rMi0uKkO4yYmc7jRf0minwRX/Kisp3zUqWh+ygE+h+/Me3vzKPW66S
 nO3Noa7whRSWeksIenMTgmXEprywhUOgoI7ThvhzlAAp5eMieV9d8pBAEIUANrSYLOiN
 lLb9anH74xTH5vPl/wiZIEtVCCJBTHnSrAKAFtT8KaO4jhs5GhWSXOMXnpR34jHTJ0JQ
 kV8/2E1wanSSCO7GynRJ9qM612MP4GV5g6WkEw5jv8+4d9uqlzAX2HHHAuej2E7wZE+S
 +vx9UHNFM0+exkUHL0O9GBKUaYps8YtKhvBsS+DVaBSdTuH/pFyomWBmfCpBD4NdzoT2
 PzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=jaCub1Sk5luNFcSj2KyJUdoWo/o9f4mzXOf2bkFAbRc=;
 b=EfrewI4Tpw7UR7okuwtV4h7Jpzul/qwG3XeshF1cpGhnag8uwTGag4plcGe1qj07tB
 FdbWziaj4IgAexgazDLZkeEhQKQmY48GDy5mm7c4AQABBVTIepiYVNy0YBleU4hxBtX3
 TnYT/CQ1UVqw2K3jT2u24q08JxvZYoK/EpYzu/6H/HtqWzsDO4ucrJ/jsdBXrQCBgBGH
 6sdtH4JWr9MLKM+jhauv/LbBgCgjPukAlhm2/CuDz7NVvLC4RUgalEXolZF2o2U3cYlN
 NaQVQGpMS/JoceGmKHENPk/PHms8IctBJzH6+Pyevu313mo3+iSe+M8Pb55ezaWLJn92
 RmBg==
X-Gm-Message-State: AOAM532N1SAAKQbm9bwyrah8QGbb2HjkururSqgwd6t1YzEYEN3YLE8v
 NzE6gwtAgLh2Vr9tTrPuj3Y=
X-Google-Smtp-Source: ABdhPJxoY/Hw8IXQtiW/BgUbYJZMs3c7bERLbztAkvCoMex1EAzOXh7z4+LBt9CcfYAY9pz/zdslhg==
X-Received: by 2002:a17:90a:a389:: with SMTP id
 x9mr12546207pjp.232.1619750330653; 
 Thu, 29 Apr 2021 19:38:50 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id in1sm8765736pjb.23.2021.04.29.19.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 19:38:49 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: David Miller <davem@davemloft.net>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
 kuba@kernel.org, Landen.Chao@mediatek.com, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, sean.wang@mediatek.com, vivien.didelot@gmail.com,
 olteanv@gmail.com, robh+dt@kernel.org, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org, sergio.paracuellos@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, weijie.gao@mediatek.com, gch981213@gmail.com,
 opensource@vdorst.com, frank-w@public-files.de, tglx@linutronix.de,
 maz@kernel.org
Subject: Re: [PATCH net-next 0/4] MT7530 interrupt support
Date: Fri, 30 Apr 2021 10:38:39 +0800
Message-Id: <20210430023839.246447-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429.170815.956010543291313915.davem@davemloft.net>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_193851_738813_3C374E18 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 29, 2021 at 05:08:15PM -0700, David Miller wrote:
> 
> Please fix this:
> 
> error: the following would cause module name conflict:
>   drivers/net/phy/mediatek.ko
>   drivers/usb/musb/mediatek.ko

So I still have to rename the PHY driver..
Andrew, what is your suggestion? Is mediatek_phy.c okay?

> 
> 
> Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
