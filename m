Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA000C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1ojuZaAzaiPlZJBWNie4sJa5sp80jGKgJddNADgIK8=; b=GVIqxytTUCyCAW
	yycE7dZT1Pv1iF0Do2kjuPawcr01JmE+XBGrM5uwyriwfm9bwn9WmQv8ZIv0bQzJL99VqUstwl/aI
	nne+k9c4pG4o+JVyA6D0j4TYCTBZMUXr8XyBkObM+XRwyT0hRXYiVxn2mz5JEwbWuZVE2lJQWjN60
	ruCHWEfiZUrcCWbV4/3eYDiQJ33sKRW+6pkxenmtnldr5GT+GHc37TXa14GEoFgDYmdwoRYMCR8tH
	RdlItS3IbHY3EyYkwgzFo3juW4U+rmROIf3uC/YlMzQi0BYSj9O9YRDjhB34PLWyblRMZ70jDNS9w
	B5WcpiuuasvTD87q+6bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q15jy-006gze-11;
	Mon, 22 May 2023 13:38:22 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q15ju-006gyF-2o;
	Mon, 22 May 2023 13:38:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1684762661; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f8yckhKnjvX29o/6OVAPDAvPWP9bBU7oRRrwnUMiuXPPoPBhZTsZ5OG/x+n34rnpjDOc2OI1trj+3ucKaIKWWeq+sizFTOCyZLMeWIEjb5zVmLfSc9LFUsY4U5quxwfupmO2SITKmEHhAOnGfiN+IDj1Ar3WTc43I3sagy9qwlk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684762661; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=W1ojuZaAzaiPlZJBWNie4sJa5sp80jGKgJddNADgIK8=; 
	b=EH/G8W+fJ7MlKtbDemFzMxuAOSya4I7Vq9n0xiqsZ6ATjdqhai/Xq3OW6xPEm0FPiVYkKZoVTqoYLYNdCbyzrbkWwWRbNwAPaTAcSs7xy04vawSsNtig3dTWLTRKPOkFcGZcKmOdxgnXCqv3rNZYKhOK25q1ttEYp+V4gQo7tYM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684762661;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=W1ojuZaAzaiPlZJBWNie4sJa5sp80jGKgJddNADgIK8=;
	b=OUrZBb8z+jJ6s62X6sb+CWDt63qTp31HJ76A2+NCUBTfMjkl4WUEwa08xvQWXrQk
	qynMF5vnKIQhj7q3GEZ/NPJWAfH5v4jBqjXodeynMlaKPTU+xJ85lGKFOaIN8A5A0o2
	Tp9Gi5aZFzw/aQ7DD6p23qZOdNBqBjHsBVKMm4fU=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1684762659016377.77661140896896; Mon, 22 May 2023 06:37:39 -0700 (PDT)
Message-ID: <0346d5dd-bcb8-1bd9-6943-2c9d83587364@arinc9.com>
Date: Mon, 22 May 2023 16:37:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 00/30] net: dsa: mt7530: improve, trap BPDU &
 LLDP, and prefer CPU port
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <5feba864-b792-4fe4-a58a-e1b22bb7842b@lunn.ch>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <5feba864-b792-4fe4-a58a-e1b22bb7842b@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_063818_986454_1AF26593 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22.05.2023 15:25, Andrew Lunn wrote:
> On Mon, May 22, 2023 at 03:15:02PM +0300, arinc9.unal@gmail.com wrote:
>> Hello!
>>
>> This patch series simplifies the code, improves the logic of the switch
>> hardware support, traps LLDP frames and BPDUs for MT7530, MT7531, and
>> MT7988 SoC switches, and introduces the preferring local CPU port
>> operation.
> 
> Hi Arınç
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> 
> says:
> 
>    Avoid sending series longer than 15 patches. Larger series takes
>    longer to review as reviewers will defer looking at it until they
>    find a large chunk of time. A small series can be reviewed in a
>    short time, so Maintainers just do it. As a result, a sequence of
>    smaller series gets merged quicker and with better review coverage.
> 
> Given you description above, it sounds like this could easily be split
> into smaller patch series.

Later patches require the prior ones to apply properly. I can submit the
first 15 patches, then the remaining once the first submission is applied.
Would that suit you?

Arınç

