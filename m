Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238D0C761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/8td5sRl3oLpjvJWr+SauyjMW5J+/af8DNO0aQQsj4=; b=SJWbAtWKAf/339w3BQSQzGm6Px
	jiX/6ljE8wo1b5hDqdI7j6zY4mt/T5dPqDtnKS2MaGvSCzTqA6kvBHIdXmLRV1tce+c9NnhX2/hDn
	patMiIFHjAPDA+c903rD+Z9P4RGUr8tYlp32SU55THVe/TlDd0dQao/EkOOAQqIvY+8P+12QpZYAj
	7l4VY9KFnc+670lzyvQKy9KMuvqXsHMBmdmlyjdhegYKb6fNqxa5udimsyiEg0qmk5sOJHbeIfRs6
	Ma1sWuv//m5Kd1oE+OEuA6v5HKX4E24U63EEUY8C2FLClh30q5a+nlPvUAxj3w9twzw+DxE5Wraut
	LeQxH/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phrcv-003lLg-2G;
	Thu, 30 Mar 2023 12:43:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phrcr-003lJJ-2x;
	Thu, 30 Mar 2023 12:43:35 +0000
Received: by mail-ed1-x534.google.com with SMTP id i5so76121573eda.0;
        Thu, 30 Mar 2023 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680180209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/8td5sRl3oLpjvJWr+SauyjMW5J+/af8DNO0aQQsj4=;
        b=R6I/30BG5UPA5FkYjKVUOSk8ON+L56EIBLONKVcUcG66As/OewLwhMJOEZ7pH/CLIF
         lw5Ldo93TyCnbouWW7sn6r3X1q4G9eBsDkqM7EGHS++EvGHXZ1BPDKRnhCkRnHpH3k7W
         toyOaQ8AdiCXYmHXxTqfMSFBKgw1bzxE4IuGtB3xQgGZ5fyVGYpbDHx/jTc/43Plix+k
         TfXLtwH042/qHJ2RMlQ5OwK2exvA5LqhC/2Bcjao6WLpg3vfRYD38I+FcWic3HWgUBY4
         0OuxkiVp/bNVDNwReIudGNhx0j7PVxoWzHj4bgO+e68KZRf4WBgjXUwtpjuoIHRN3Bwa
         nxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680180209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/8td5sRl3oLpjvJWr+SauyjMW5J+/af8DNO0aQQsj4=;
        b=LqwE86SoB7mqU83m1aEa0DaJr8D2Gy1ne9SsyXI8svLihr7y33r3ZE5kUSH/+jLVU1
         eBn2u6BU1l/Uu+tvxnPRf7LPRdS4QysmWU4pfcmFQg0KlZKzMy0ZczPKXUjPjN0kzr3/
         cbPUpNTOyRCI+63p87dOsthlPvXvxGXgockK7ae4aNrgm4JY5aWB9hrx88L35kJZAcKT
         j6IqxugF9DecvdtdoV6a8aj20iOX9wzzF4BeFgUr/p82/ip7BdfmJx3etV03bbmx9nqm
         S4P3iDNEuK2zqC8K4OTaEbY+vxlAbdIuPUGhp1vsJcGWFOaP26y8k1WCeRAcGJMWCWXP
         WARA==
X-Gm-Message-State: AAQBX9eyPSViFgLsMFYz36bTUzt0DPjldcj/MetVwdYy9m7iMDOwmX1p
	wIMSKv/vshIMzp0R56E9X7I=
X-Google-Smtp-Source: AKy350YI2msvuHetohhT7eQ5t1xlC1RudA+4E9BCOndXuD6L8J5sWGjktS0WAdrtvGBAhM/oS9ONAg==
X-Received: by 2002:aa7:cf19:0:b0:501:dc02:1956 with SMTP id a25-20020aa7cf19000000b00501dc021956mr24516457edy.29.1680180209442;
        Thu, 30 Mar 2023 05:43:29 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id q30-20020a50aa9e000000b004fadc041e13sm18202433edc.42.2023.03.30.05.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 05:43:29 -0700 (PDT)
Date: Thu, 30 Mar 2023 15:43:26 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 2/6] net: dsa: propagate flags down towards
 drivers
Message-ID: <20230330124326.v5mqg7do25tz6izk@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-3-netdev@kapio-technology.com>
 <20230327115206.jk5q5l753aoelwus@skbuf>
 <87355qb48h.fsf@kapio-technology.com>
 <20230327160009.bdswnalizdv2u77z@skbuf>
 <87pm8tooe1.fsf@kapio-technology.com>
 <20230327225933.plm5raegywbe7g2a@skbuf>
 <87ileljfwo.fsf@kapio-technology.com>
 <20230328114943.4mibmn2icutcio4m@skbuf>
 <87cz4slkx5.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cz4slkx5.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_054333_980482_69556265 
X-CRM114-Status: UNSURE (   9.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 28, 2023 at 09:45:26PM +0200, Hans Schultz wrote:
> So the solution would be to not let the DSA layer send the
> SWITCHDEV_FDB_OFFLOADED event in the case when the new dynamic flag is
> set?

I have never said that.

