Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B767C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ph1dIO4cwj22wpIxrJFBcvT3j+2Yf11B9FPaEwiEhDc=; b=Qr/cFfgRVw8Cv7rwDksS0Wp4T1
	FbQmlqBZKWVcvMoqyj7jMpzQd4WsHj9Va5k54hpZ9t3u2BA3zl5VmcKSI3ITbe2EUlcIDN7+KdFMu
	d0Ams4NvTohnBNXM0vPDvXRKCD8XhFlJaCkVZWcdF/CwY+yjiMA7IyYMAN/DSjCKp28xQogpTcDe/
	4XWcNxfyyTxL4GCntYUDfXe/vcgkBxpGBAJdZejVOriFO00yznMTsh2S3kNAa8gSm1yNnYG3Rzq7Z
	/7SEB3zyGDHcMUlzfYai8bPVkJQgs5xZ8wlU6nukWGl20f+RQGUzZSajN8dUFE6TjB7keeJpibvqp
	OXRluNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYmp-002uOH-2k;
	Wed, 12 Apr 2023 11:37:15 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYmm-002uLH-0g;
	Wed, 12 Apr 2023 11:37:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681299399; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bBb4ZTlMVpRQpivX9ADQHKCw2VmucU7xmleAnUUP8updopzcDhO2VFlK0fVTmHPiiFoDNElWVctPLmonqjzdv7Z2J5j2PqExUX7QY31SdDay+vwcXjE384Wo0EByXHJfpG2cMya6IdCE6+tMEduDDok5i7vXLH9LL9fDKPwsUJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681299399; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Ph1dIO4cwj22wpIxrJFBcvT3j+2Yf11B9FPaEwiEhDc=; 
	b=AXiM6KtRA6GZRB+qVE/02K3qs1QokGpchV3576Q6MONvTa4qCFjGjOsbc7tJZSSgC9m3d/G9H+oGfHtpqT2a40wdEBqc4rkd+JOQKNVq/sgYzmsWITWzsA8RquqJRnI0l9JFGlewmNfqNkytfPYCfxbnmx1TFnT+80tSkLiOnxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681299399;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ph1dIO4cwj22wpIxrJFBcvT3j+2Yf11B9FPaEwiEhDc=;
	b=AshnBTcW5kSl0cdnvBPvzUQpW83opXR8d/MIyGhI+VWkQnDa6KLEIhPPNUW1n9Qp
	NylHrzQM0SFennaIuMI2Fh0VTzh11z49Hd4HSdZTEaGFeDPP4OZiK+mEjfPqHeKudpK
	4vWHyVgG5Jw09snW/xElmtgeHSOJBM9+1ZdxX8CM=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681299397239505.78934446856533; Wed, 12 Apr 2023 04:36:37 -0700 (PDT)
Message-ID: <5068c00b-4bf8-0b05-9c26-eb96fb08b401@arinc9.com>
Date: Wed, 12 Apr 2023 14:36:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/7] dt-bindings: net: dsa: mediatek,mt7530: correct
 brand name
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
 <20230411235749.xbghzt7w77swvhnz@skbuf>
 <80d4a841-db7c-fa2b-e50d-84317ee54a40@arinc9.com>
 <20230412111752.bl2ekd7pirbyvnue@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230412111752.bl2ekd7pirbyvnue@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_043712_301241_71782C3C 
X-CRM114-Status: GOOD (  14.30  )
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

On 12.04.2023 14:17, Vladimir Oltean wrote:
> On Wed, Apr 12, 2023 at 09:36:32AM +0300, Arınç ÜNAL wrote:
>> On 12.04.2023 02:57, Vladimir Oltean wrote:
>>> Hi Arınç,
>>>
>>> On Fri, Apr 07, 2023 at 03:50:03PM +0300, arinc9.unal@gmail.com wrote:
>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>
>>>> The brand name is MediaTek, change it to that.
>>>>
>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>> Acked-by: Daniel Golle <daniel@makrotopia.org>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>
>>> It is good practice for series larger than 2 patches to create a cover
>>> letter, which gives the overview for the changes. Its contents gets used
>>> as the merge commit description when the series is accepted.
>>
>> Ok, will do on the next version. I'll also split the schema while at it.
> 
> Ok. I wasn't sure if you and Krzysztof were in agreement about that, so
> this is why I didn't mention it. FWIW, it's also pretty unreviewable to
> me too.

I already agreed but was planning to do that later. I prefer to divide 
things into smaller parts so I improve progressively without being 
overwhelmed. My RFC series for this driver along with this series are 
growing which has become a bit overwhelming but I'll manage.

Arınç

