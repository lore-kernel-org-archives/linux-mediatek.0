Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BC6C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hd4WAsqllMr+HE/wOBUfBJwcZ1dEQURjDou2URdczPM=; b=LVdO1cI0FAfmIoTGJLpGpXCJ9v
	/KYZKIkeEDqVKQPHtA8ERwHuaLbnBzk1nmb4NKN9rUjOWH7MzQkSdC7s6pZbHiEvhfApJPYArI99b
	mdht0TL35VfSMhvA+4mGFlVvgEwvfWlobGdFb1+pDzl8+Yz7qFTojDXhvrI8+op5+qug3di6vFUDs
	IM3dH+2M+tVG6BsZ1aKujf1ZpmZK+BCg9qc3NPp6k/2t48RGnVNZlWZJpC0fv1EVsPc4cd/9j+YS/
	YOI+jWOtJq7YGJZ6W6o9I7eHkcdUbfCi2Esx7uNVGR70umKPC9jFGE7xdbNkaOf16DwHD1nJZAcJD
	IAviGRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ravy2-000000022xW-3iGn;
	Fri, 16 Feb 2024 11:01:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ravxz-000000022we-0LWJ;
	Fri, 16 Feb 2024 11:01:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7D111BF208;
	Fri, 16 Feb 2024 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1708081272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hd4WAsqllMr+HE/wOBUfBJwcZ1dEQURjDou2URdczPM=;
	b=Xyzro7Pg+vbO6KWBl3OOC29SiOE3vdsmgRyOpgay+YJbbT9IqA8OJ5VmXlDge8eOuIMPnS
	4N2Sk16ZOq1qoeoQPK5iFIstw8CurHvbqI8vlJ6+LzMLNkHhp4PefCCk+yqfK67LUHBP2h
	2s08xwocjTuiXmNxiqkkkOAvWghkGIOKAv7rN2v/DJ2K7czx16OkCNHx4xAQCmBHKSTCSl
	5Fdip0U1r06gozSnWpFNWA8P2PxJ1d68Hn58YviwWtvk+fyYaZ5j+nzdbuNShW5RxjQTbu
	meh7Cdu8f8x+M3FeUYP5V5AApSqaVIEFnyINyCdmdEEWi7nDvVE6evkj+rKfcQ==
Message-ID: <c90958ef-f581-4c1b-86c2-ea71e89fbb65@arinc9.com>
Date: Fri, 16 Feb 2024 14:01:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH netnext 0/8] MT7530 DSA Subdriver Improvements Act III
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
 <20240216013439.dq7s5hp74mjahy4d@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240216013439.dq7s5hp74mjahy4d@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_030115_275165_B80DD9C2 
X-CRM114-Status: GOOD (  11.89  )
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

On 16.02.2024 04:34, Vladimir Oltean wrote:
> On Thu, Feb 08, 2024 at 08:51:28AM +0300, Arınç ÜNAL via B4 Relay wrote:
>> Hello!
>>
>> This is the third patch series with the goal of simplifying the MT7530 DSA
>> subdriver and improving support for MT7530, MT7531, and the switch on the
>> MT7988 SoC.
> 
> There was an automation failure, you used the name "netnext" in the
> subject prefix and patchwork reacted with "Patch does not apply to net"...
> 
> Please resend to get some build testing. I gave a quick look over the
> patches and I didn't see anything obviously objectionable.

Ok then.

Arınç

