Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA018C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 13:44:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76165221EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 13:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76165221EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H88o4G/J++R/CFL9gJAh5SY+9jl3fKgtOMnos6/xXTQ=; b=pss8T+I5UEu3+x3vSNq78V7PV
	P6+tPHWikXDQHhWemahOdXQRh+L0GZEgyxIgMiT2ufoGRYTaSFCOxzKpIW99JeEHe8QBLo5DxhS5N
	rFAGZi27nYF4vB/Q4/urUbEztpNdTnAVi45Eqhe6+AfIXecPe7zHfvX8aeM6XGnOPq56cc2UfVth2
	5iQQtFZRhZCXGWgRptXqNILcxgnEx5Wm/nrI1wMo++NFdoVjc7zhF2j/p1fRVKdTrxBZZIsEPRoVr
	/YMariMzI0BV2kFB5yBncfwqgXwFNrHpZ7yuvTvMpayQEspLzFQRtKw5SApz6Y0sUJb3I5knnMfz9
	64brTyOHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyxUJ-0001BT-7V; Mon, 11 Jan 2021 13:44:03 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyxUB-00016F-PZ; Mon, 11 Jan 2021 13:43:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id n26so24785030eju.6;
 Mon, 11 Jan 2021 05:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TqQMMmVG//s097FZcK6S1d+MUdnJBT3N8IWJdlGCSdY=;
 b=vQ7xg/NMs8B/jW9COLAiIpNiEJ+21BdjvoLnazkLt9/lR13If2ikF5RZJksFN0Dkoo
 C0zqtI4JCm9GWfi/CnjsDhI23DQE22A6bgR9PF4vRW7MkpPcJj/AfIk/3yfLeBcsdnrl
 Yxa9K6+wwF493HZ7SArizr69FpCLfQl6lpgliMFGI+kKl21Gl8bYrR6g9FSUpBY5PsE3
 tGUj1wkuFyjj1ZdM3ORq7/uzV+J+9E46Sk41CqgvwrUGYV7JHTTfAzR2DYg1oKwxXg5l
 95cO6WK6GrEoNp+J3zEoxppuEPX80yVLWxK08AgEQL/vFBuUgkRl+BMTYNyireUNYVig
 F/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TqQMMmVG//s097FZcK6S1d+MUdnJBT3N8IWJdlGCSdY=;
 b=FTvl0CdEYWlOL9jg/YWIdlc5BtabPqdpxIy/hgwMBQgvUI2HR06kNtO9jInQOh/BnS
 RgpQab27jQO/ivCH842p1D7LnJQ+yKWggZp0FnI1c+TU47Mah8Uy14B5nq0wjUt2Q3fu
 DaHQhKCDhu6i1ZFqPIDuSWx2LeK49hiNVud4jeTrrz9xavmonuAqNDpB9WUtr1499oah
 2dmg4uCeGidFTh7Nbhu8PSCzAiAnOv24to0ISIsFQ9GQ6CmJVo9lILp/0L1mmWvTOONQ
 IrdUldKdRnM7woOTlWwVXywec3YEFCF+B++4LGrxrIpWNXc5SOYxMw70OU4vWUM09nmP
 gr3g==
X-Gm-Message-State: AOAM532i+PBiLDqf+5vdNJViiip4LkSvyFD6yT+1IQRnERSB/U8puGWh
 O6ZO/xg6tUKB6BJNn64LZx8=
X-Google-Smtp-Source: ABdhPJxqhexf4kPL914wqbd3XhrF0WLk2Dmhk3wPJ0oFcVMccX9vwvzyZgV6p+0xwhhjVShAmlSr8g==
X-Received: by 2002:a17:906:7689:: with SMTP id
 o9mr5102315ejm.324.1610372632156; 
 Mon, 11 Jan 2021 05:43:52 -0800 (PST)
Received: from skbuf (5-12-227-87.residential.rdsnet.ro. [5.12.227.87])
 by smtp.gmail.com with ESMTPSA id t26sm7120228eji.22.2021.01.11.05.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 05:43:51 -0800 (PST)
Date: Mon, 11 Jan 2021 15:43:49 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-gpio@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] dsa: add MT7530 GPIO support
Message-ID: <20210111134349.vdhyebdllbaakukk@skbuf>
References: <20210111054428.3273-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111054428.3273-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_084355_911325_54DC7260 
X-CRM114-Status: GOOD (  13.42  )
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
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 01:44:26PM +0800, DENG Qingfang wrote:
> MT7530's LED controller can be used as GPIO controller. Add support for
> it.
> 
> DENG Qingfang (2):
>   dt-bindings: net: dsa: add MT7530 GPIO controller binding
>   drivers: net: dsa: mt7530: MT7530 optional GPIO support
> 
>  .../devicetree/bindings/net/dsa/mt7530.txt    |  6 ++
>  drivers/net/dsa/mt7530.c                      | 96 +++++++++++++++++++
>  drivers/net/dsa/mt7530.h                      | 20 ++++
>  3 files changed, 122 insertions(+)
> 
> -- 
> 2.25.1

Adding GPIO and LED maintainers to also have a look.
https://patchwork.kernel.org/project/netdevbpf/cover/20210111054428.3273-1-dqfext@gmail.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
