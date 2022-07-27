Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B8AC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 22:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KulfU3qDbvzcs/NpGiiPGnxBjN9EcMNe7GHzjnyKn1Y=; b=Ika7edxxH9EtjxYN+vC4YWMPSG
	qr03innTDPHXeKCfryNzgy64yW3QQUQDN0WFYiY17LRYITPKSd9zKgAqpMLigpYrOLixAOUmoj+nU
	iYITVOPkXODiGn2xniozpbx64gXaNg/WW/GbUx7L4d3RpUNw5aHJoDgY1zfAMG9TeHdY84OioRvaY
	wLwGMpm4x83U/MIIOp5kybTMx1KMIo6z+4/NliuaexX2b6yMRKIIHmzMNBDEB9z7o1h9hPLFNoYbE
	ca8Q3mntx840lUpHq38T2OXi191ZPeon/RFuaIyzB3Ffnwow+IdKZ1upHt0+u0qVb+o/j9DTrwyaO
	0SKEyVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGp9Z-000onY-Lf; Wed, 27 Jul 2022 22:05:17 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGp9D-000oXT-6O; Wed, 27 Jul 2022 22:04:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1658959465; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XYz5/7b34v/qGC1P86nS7wd8YdpQ+TTXaWaAx+qOw93D5LjLlad4sNVkB6zpR1hoTGUkjNs+s7eLj2yvoJkAB5rWVauZdLhI+E8cP3dGEvUcLq+kRagyhhqUuguZz+mwcW8ddGZhNS6PCkILbhSsvH8FEMa5aNPG1lr3WaGSJFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658959465; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=KulfU3qDbvzcs/NpGiiPGnxBjN9EcMNe7GHzjnyKn1Y=; 
	b=ewGX6dPcfZFIqAAy08Ki6QwaQ9hl4Hub76XjsYIUfQ3HlvPpZzwAOMz2NJRcc/yOjbIdT2TS0VsYc7yfaQ1YbA3oXlvSGQJhd9GYJsx8/MBGikSlVqqC+FQvSPtF0b/bp8OzWtgDt2gRuJBKG8dX+qtZV3ENo2vsgZrt5BQNagk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658959465;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KulfU3qDbvzcs/NpGiiPGnxBjN9EcMNe7GHzjnyKn1Y=;
	b=Lv/ydmnJa0iF7zD9n9fFkXJl+kxAD7cabcm7J6y8vQLwMhG75UNMPF6NU10+R48K
	elj5/gcFsiV75xzs91Bv5iZWW1ASbCEXKCzl0mUsDyDPQZ4osuec4WQxTkF8B91bdvh
	3FDinO3g+Xp0zU6sgS9r3LVXXPZWfvtPEOBrCDMY=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1658959461763271.8212578498445; Wed, 27 Jul 2022 15:04:21 -0700 (PDT)
Message-ID: <709af825-7fde-d2c6-2237-3490163afa0e@arinc9.com>
Date: Thu, 28 Jul 2022 01:04:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Aw: [RFC PATCH net-next] dt-bindings: net: dsa: mediatek,mt7530:
 completely rework binding
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: frank-w@public-files.de
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220726122406.31043-1-arinc.unal@arinc9.com>
 <trinity-96b64414-7b29-4886-b309-48fc9f108959-1658953872981@3c-app-gmx-bs42>
 <f8ccb632-4bca-486b-a8a4-65b6b90de751@arinc9.com>
 <0426AFB2-55B6-48E6-998F-8DA09D0BDC29@public-files.de>
 <28a1620c-9771-f4dd-c432-4940d3b8f430@arinc9.com>
In-Reply-To: <28a1620c-9771-f4dd-c432-4940d3b8f430@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_150455_364455_458B3DCE 
X-CRM114-Status: GOOD (  13.01  )
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

On 28.07.2022 00:46, Arınç ÜNAL wrote:
> On 28.07.2022 00:26, Frank Wunderlich wrote:
>> Am 27. Juli 2022 22:59:16 MESZ schrieb "Arınç ÜNAL" 
>> <arinc.unal@arinc9.com>:
>>> On 27.07.2022 23:31, Frank Wunderlich wrote:
>>>>
>>
>>> I've seen this under mt7530_setup():
>>> The bit for MHWTRAP_P6_DIS is cleared to enable port 6 with the 
>>> comment "Enable Port 6 only; P5 as GMAC5 which currently is not 
>>> supported".
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/mt7530.c#n2189 
>>>
>>
>> Later in same function it looks comment is obsolete.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/mt7530.c#n2234 

By the way, port 6 seems to be enabled even though port 5 is used as the 
cpu port. Shouldn’t that be behind a check?

>>
>>
>>   I know that rene added p5 support while phylink conversion,but not 
>> sure it was complete.
> 
> Thanks for pointing it out. I suppose it works fine since you tested it. 
> I will update my patch to allow setting port 5 as cpu port along with 
> splitting the patch.
> 
> Arınç

