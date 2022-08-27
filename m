Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFC0ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Aug 2022 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YczR2Egl4ZFRyscdYYWi5wk2fHwMzSOUnVWfHdBreM=; b=PS9XqcHRQlXLCp34KfV8CHWaZJ
	5r3XBTK0yFs+Fph2FANF+jSI4I3J6w7i6cUryX9lz64B+6nDhjdOF3ekTINWdQvEKs0b42BA2noHa
	LWF68ddJ22HEey0xhRikpEM1vWoQsORJZ7txzIVJJHBP6cv5N+x6ZlRptT4bslqnAs6oVwPVWW7Hz
	QRkm5WsNXvhL6CJor6XgKoGhToKxeJEFZWe2LWMZASoUiJYuA6e6IAQtlHe3LcSqBoL7Fm9B5iDps
	3WYdap06hCrXWMR26um8dnXzjf7x9vsaowrvMoMjk5DaDuVNZ0p4JNpfsoqS9qM00FBnhoE4xh+EZ
	bSTorjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRy6b-00Ckzg-40; Sat, 27 Aug 2022 15:52:17 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRy6Y-00Ckor-4X
	for linux-mediatek@lists.infradead.org; Sat, 27 Aug 2022 15:52:15 +0000
Received: by mail-ej1-x632.google.com with SMTP id u9so8125300ejy.5
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Aug 2022 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3YczR2Egl4ZFRyscdYYWi5wk2fHwMzSOUnVWfHdBreM=;
        b=XzCjQYL7pcKNpZS+XZ/jvaKcz044RvIp2Kqny5OT1idIVch+NIlfnHsadgKWYFDb0E
         LrNd0hKaoyAkJgnlUbgT753luKRo2WarLndU46VH401AIJex/4AHi+GjE2AERqIw4E67
         KcTGvWm0Cb47y9tZiiVeDXe5aGt3zgsJdX1yvhdGB9sF/Z6qTtvJ64moVxFbEZ3rr5yl
         pikp+Km8ABi40dgWtLH8Rsk1foqkvANAJBLYdZG/VUu8A9htUuS+ZXPGuaLcw/QxhNIa
         TflL902OKXy2G0jqaGBSpTTwIag6f4IKoc6DsHiVXpu3AccPpZkYXLscSaqqcDhfEPOK
         8xYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3YczR2Egl4ZFRyscdYYWi5wk2fHwMzSOUnVWfHdBreM=;
        b=x/j8JCg+KQq0Th83QDKO8XVXBTrYj9xe2nUYltD6hJUqyIiPF80CVMUKl1E+MZCcMy
         j9ypZC4lqq3U9SzEoFo/MnjQIPQQ2Bj9rKCuh4u441chkka99oGtt4PxIo2jOwnJlyYe
         7QCf9Vv28zvnB9lcea8ygTZUyANQvS73pX7V30+zvVjZlyKJMSuxEv2D6wCde0OsoROS
         aBErOHNKwOB9iuJ3uyOI6V+yljyIgIf1URRRww8l1lOg/y1taxJxmdTQT7fmmH9otlAi
         1D/Ek78h652JqmgVsfOAA9KngCSbEQOVZoea6X2D5DIvxNCGW49VM0N85YzNSuj2R9jp
         5Ufg==
X-Gm-Message-State: ACgBeo24Jkftox/Oo2/cjISLpi4UcSdjBAeIly46VkJUlP8seSb8aTnD
	p8nYYiOT3Ez344HEYg5SOewzTA==
X-Google-Smtp-Source: AA6agR4UGFSDEBI+Zywo6Rd/RBwcZqB0s8dtcq4AUgPmhKGokDX6cNXLGrVlY+XIvgUPkPzXaFkbVA==
X-Received: by 2002:a17:907:724e:b0:740:e3e5:c01d with SMTP id ds14-20020a170907724e00b00740e3e5c01dmr4496051ejc.38.1661615530225;
        Sat, 27 Aug 2022 08:52:10 -0700 (PDT)
Received: from [192.168.0.111] (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
        by smtp.gmail.com with ESMTPSA id z13-20020a05640235cd00b0044847e0e8ccsm257324edc.28.2022.08.27.08.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 08:52:09 -0700 (PDT)
Message-ID: <80c8a02f-95b9-8e96-b05c-016b43876c15@blackwall.org>
Date: Sat, 27 Aug 2022 18:52:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 net-next 2/6] net: switchdev: add support for
 offloading of fdb locked flag
Content-Language: en-US
To: Ido Schimmel <idosch@nvidia.com>,
 Hans Schultz <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
References: <20220826114538.705433-1-netdev@kapio-technology.com>
 <20220826114538.705433-3-netdev@kapio-technology.com>
 <Ywo8PONgDW/lUj+X@shredder>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <Ywo8PONgDW/lUj+X@shredder>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_085214_442369_34D50C15 
X-CRM114-Status: GOOD (  11.59  )
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

On 27/08/2022 18:46, Ido Schimmel wrote:
> On Fri, Aug 26, 2022 at 01:45:34PM +0200, Hans Schultz wrote:
>> diff --git a/include/net/switchdev.h b/include/net/switchdev.h
>> index 7dcdc97c0bc3..437945179373 100644
>> --- a/include/net/switchdev.h
>> +++ b/include/net/switchdev.h
>> @@ -247,7 +247,10 @@ struct switchdev_notifier_fdb_info {
>>  	const unsigned char *addr;
>>  	u16 vid;
>>  	u8 added_by_user:1,
>> +	   sticky:1,
> 
> If mv88e6xxx reports entries with 'is_local=1, locked=1, blackhole=1',
> then the 'sticky' bit can be removed for now (we will need it some day
> to support sticky entries notified from the bridge). This takes care of
> the discrepancy Nik mentioned here:
> 
> https://lore.kernel.org/netdev/d1de0337-ae16-7dca-b212-1a4e85129c31@blackwall.org/
> 

+1

>>  	   is_local:1,
>> +	   locked:1,
>> +	   blackhole:1,
>>  	   offloaded:1;
>>  };


