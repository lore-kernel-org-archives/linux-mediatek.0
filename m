Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B104ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlYMUlG2qSvFZB0N2mq5+Vuwq77kZgSrLYVLPhtOEnc=; b=xf4cTye9kGDCCPwQiLuYda2x13
	vT9ouVl+ZmYoyXIT0LHWleYKjkYiZgq3SGnuuwxNSYHvyo6i7FBww99zbOKP1/U5QkqiAOUKttPj+
	ab5JV4AD8/OUs7CUrOj6qZC6q27ArYXRs8Bac3hAHc7omH0KcgTfcInmvsEfTMOpJXYvaFcDfKPYX
	ByB7Ey68qDcD3yCgqjJ+zb8zVyK1VVM0qk/DewsIol1x20Tut37GYyWKP3E4EQg+q+tZLBvZpnAuk
	NDuXF1TCXqeT+lQ4z+q4krXU969uiTfpZvluH3UIsRqR5cN81Oc3rD6rbLtBZhHfz6Fre4ByQz/8k
	oPiyBWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbQj-006xn0-LA; Mon, 29 Aug 2022 09:51:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbQO-006xSt-4T
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 09:51:22 +0000
Received: by mail-ej1-x62d.google.com with SMTP id p16so11455735ejb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Aug 2022 02:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SlYMUlG2qSvFZB0N2mq5+Vuwq77kZgSrLYVLPhtOEnc=;
        b=VA8mRlDIJuRpUjAr2wap2tw76G9iqQ95P1eKHRbi0MXQ+y5IRx86u42xLbqDa3N5Uw
         WBpv8t9zipWs3CctFwvBsrOIu5XtbCOP1buoXyRAK4MLU31Yw5ngEBFKEMkK8zVonfRa
         j0ONoFy8E5axclexgQI8Deix+KM6vUXYS29+vk/m2cgOGWRgF4irThnGgYZYmbUaOgFL
         UAiaDDzB1hu/DAZMMj9RMnoiMeWabPFTFH2n9WQhu3VNwHXDNrCWsZF6emYbnh58OVDq
         r+pUZaGHVx50qLZUXUjESZfGWi8gRrSNSOgOjZjybuBNJVt27lkMLyDAdhTM/SlwI1T9
         rD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SlYMUlG2qSvFZB0N2mq5+Vuwq77kZgSrLYVLPhtOEnc=;
        b=wMCDvLV88LJWwr15U2LwPbuyrhsl3dCl4MqhVlrHur5wI8mBIteM0NB+RFTCGlJgMc
         mfXDp7gnp49BzjbL6WCk88JYmPFPXa1g/cZXxFzaUCdBRnC4beafg069IKrAa0bZ5UPV
         v908iy7WQjc0Xlpcixr9AVW2V7BcuJymOsBw5kTrIF4igWSAb0yNFL0ufrQgCiyIWSey
         F4VpRNr9ZO69cBo62+iJcsg8YERJRhwZvyljFSA68xm7FVt9rgxd2TNOH9ZqhHFhDp8+
         TKMnNtT3IL2EKV+OM9BHz8RQFE0OrThId7YkD/T9InOLFcFjLo6mVxLcZXQzvXzKjEUy
         Ek/Q==
X-Gm-Message-State: ACgBeo06gMJygXDYfF0GtZs1RoUj9DL/faMw5M34vETaIkWahcQ8EfyK
	t9HSlM/uBolpDuX+mmranzAEbg==
X-Google-Smtp-Source: AA6agR7M8nHmvMXeLrqK9slD36AnzRPtNtaEGwJrWTLaeYi3Ldj3MRdNNKrrHzv2HbakO0uElrxasg==
X-Received: by 2002:a17:907:2d23:b0:730:acf0:4907 with SMTP id gs35-20020a1709072d2300b00730acf04907mr13239673ejc.700.1661766676786;
        Mon, 29 Aug 2022 02:51:16 -0700 (PDT)
Received: from [192.168.0.111] (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
        by smtp.gmail.com with ESMTPSA id z2-20020a170906240200b0073c23616cb1sm4374177eja.12.2022.08.29.02.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 02:51:16 -0700 (PDT)
Message-ID: <4749d6b6-c20c-fd20-f904-accee3f1947a@blackwall.org>
Date: Mon, 29 Aug 2022 12:51:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 net-next 1/6] net: bridge: add locked entry fdb flag to
 extend locked port feature
Content-Language: en-US
To: Ido Schimmel <idosch@nvidia.com>, netdev@kapio-technology.com
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
 <20220826114538.705433-2-netdev@kapio-technology.com>
 <Ywo16vHMqxxszWzX@shredder>
 <dd9a4156fe421f6be3a49f5b928ef77e@kapio-technology.com>
 <YwxwPJOx/n5SHZM5@shredder>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <YwxwPJOx/n5SHZM5@shredder>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_025120_475662_B5A874A3 
X-CRM114-Status: GOOD (  15.44  )
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

On 29/08/2022 10:52, Ido Schimmel wrote:
> On Sun, Aug 28, 2022 at 12:23:30PM +0200, netdev@kapio-technology.com wrote:
>> On 2022-08-27 17:19, Ido Schimmel wrote:
>>> On Fri, Aug 26, 2022 at 01:45:33PM +0200, Hans Schultz wrote:
>>>>
>>>>  	nbp_switchdev_frame_mark(p, skb);
>>>> @@ -943,6 +946,10 @@ static int br_setport(struct net_bridge_port
>>>> *p, struct nlattr *tb[],
>>>>  	br_set_port_flag(p, tb, IFLA_BRPORT_NEIGH_SUPPRESS,
>>>> BR_NEIGH_SUPPRESS);
>>>>  	br_set_port_flag(p, tb, IFLA_BRPORT_ISOLATED, BR_ISOLATED);
>>>>  	br_set_port_flag(p, tb, IFLA_BRPORT_LOCKED, BR_PORT_LOCKED);
>>>> +	br_set_port_flag(p, tb, IFLA_BRPORT_MAB, BR_PORT_MAB);
>>>> +
>>>> +	if (!(p->flags & BR_PORT_LOCKED))
>>>> +		p->flags &= ~BR_PORT_MAB;
>>
>> The reason for this is that I wanted it to be so that if you have MAB
>> enabled (and locked of course) and unlock the port, it will automatically
>> clear both flags instead of having to first disable MAB and then unlock the
>> port.
> 
> User space can just do:
> 
> # bridge link set dev swp1 locked off mab off
> 
> I prefer not to push such logic into the kernel and instead fail
> explicitly. I won't argue if more people are in favor.

+1

I prefer to fail explicitly too, actually I also had a comment about this but
somehow have managed to delete it before sending my review. :)

