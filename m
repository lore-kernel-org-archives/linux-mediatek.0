Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94B4C77B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 20:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRzQaQYMyheL6/9XvWrDvecv1EQ6rZdy4z1HdYKesGo=; b=TbPRYSJqulSULf
	Wcnqz+pXrdGEmRmKKmWrfP81W66ZH/vNSZg6p6a8pfG++3P/jolq1q7u4uSGgFZKvGaRxu7NiUMeU
	kZ+vDKIEaOAiWFvC/kW98E+xf78KFtWhpLUzZVQu9YXDmC/iDLr2HJzdd9TL57wLR3M00D5HoH1uu
	X9lUpyPmJPXUxYNUbRPNCscR4/rbR+OCvV5t34KIicKpyTfhdxV/5rtZZjKpQM9bFHNl5tkLpK0PA
	tsQ3j8e98Ok71pdD0WJlUBGN2vxTpR5BWoVQaTunav5+27rtTW1I82hthFjFeGzPqQX8Lv53EzyEC
	DwZlxnmL/4XZLvpMmSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptwGq-002Wik-27;
	Tue, 02 May 2023 20:06:44 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptwGm-002WgQ-1I;
	Tue, 02 May 2023 20:06:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1683057967; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iT9g+M0S+e+kRek4sdOtHe0l/mzpHdAoLIaIEuCqJR6VKV8I3ajk8qHrspCs0wjpbn5pSvgHcRY67yOIN5xlAW17IDoGHE1e0b2CuR1sEEf9SZbQ33fy99Le56jVcI3jGOLlVhL5XHi4iaWuRGLQUlxkDo4Nb+6a9KwstviZIi0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683057967; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=jRzQaQYMyheL6/9XvWrDvecv1EQ6rZdy4z1HdYKesGo=; 
	b=e35bLITHWvU4k3TnGL4PYr+iHwWlVDWcJxjGPRuKsdwAnZ9ClpqsOmVUccrqCQ8Y4jgDlKjxQIomNwrXIKs/q8j7g7CxinYnNw7W8ol3a5mcd49jAwL+KCeOtk19M1hfIxS16kbVI0OWtG+YLvjVFZT9RAJP0Su5ze0UG1CUBfI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683057967;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jRzQaQYMyheL6/9XvWrDvecv1EQ6rZdy4z1HdYKesGo=;
	b=HwUlBdNPExWNS3ZRm5TUZIeayBebk5apv+VrpEbHIRrfU6SY3qArHdodzmiSDME8
	+7xbYgJ9gLd+Xtd22VzsnsHVarFvKcD9L4hJHrdYY7gKyZ1NP+5EddBcp4H7SQsoqEI
	oyflG8ls/YY7SHqW7gO//lvUUtDVX2orxAyUqFj0=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 168305796648833.62395961631171; Tue, 2 May 2023 13:06:06 -0700 (PDT)
Message-ID: <c9765637-4601-0a7d-7e5e-4c3e9d52d90f@arinc9.com>
Date: Tue, 2 May 2023 23:05:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: fix network connectivity with
 multiple CPU ports
To: Florian Fainelli <f.fainelli@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Daniel Golle <daniel@makrotopia.org>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
References: <20230501121538.57968-1-arinc.unal@arinc9.com>
 <20230501121538.57968-2-arinc.unal@arinc9.com>
 <5e00b4c7-8d3f-e1b2-4359-5ee8fdf92ea9@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <5e00b4c7-8d3f-e1b2-4359-5ee8fdf92ea9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_130640_511970_0F91EACE 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02/05/2023 21:30, Florian Fainelli wrote:
> 
> 
> On 5/1/2023 5:15 AM, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> On mt753x_cpu_port_enable() there's code that enables flooding for the 
>> CPU
>> port only. Since mt753x_cpu_port_enable() runs twice when both CPU ports
>> are enabled, port 6 becomes the only port to forward the frames to. But
>> port 5 is the active port, so no frames received from the user ports will
>> be forwarded to port 5 which breaks network connectivity.
>>
>> Every bit of the BC_FFP, UNM_FFP, and UNU_FFP bits represents a port. Fix
>> this issue by setting the bit that corresponds to the CPU port without
>> overwriting the other bits.
>>
>> Clear the bits beforehand only for the MT7531 switch. According to the
>> documents MT7621 Giga Switch Programming Guide v0.3 and MT7531 Reference
>> Manual for Development Board v1.0, after reset, the BC_FFP, UNM_FFP, and
>> UNU_FFP bits are set to 1 for MT7531, 0 for MT7530.
>>
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> This tag is implied by your Signed-off-by tag. No Fixes tag for this one?

I've put it with v2. Let me send v3 to remove the tested-by and add your 
reviewed-by to the other patch.

Arınç

