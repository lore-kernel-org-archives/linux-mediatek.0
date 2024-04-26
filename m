Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5468CC04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKKtm36SBTWsbDXzRyPwPacxtTX+fdl2bBrbOBDwJoM=; b=o+gQWD7ChTO1t0O7XQDEqX2JFp
	cDAmwnDN+MAKjrkVuweVwS63mrrvWVNi4iQpnMgtsizwLe0Z8/fFOTftDnJ6DF4tpwk2aWqQmpZ7h
	untbvCbxpbSuYvG4uOFRTQPATWl4xZ5rQ/3I2oYNDLv5Aqx7Lc+qkrXtadEaArJymziB0InmagweI
	qd8OVncdOB01R7WKh+2Pd0qMRlFcXsRwCywOm+qFdtV0jajgu0PfxVLB5B/6o/fn7mBDyyjSkKE/S
	L1SqTy5FP2f1u2RMB/0ZEBJbMSj6oePrJoaU9aIomzN5pjSnEki88NHsfUPaZ/zbytE6yT3SCdERA
	DDxTcLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0KV7-0000000CRMF-2YAJ;
	Fri, 26 Apr 2024 12:16:25 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0KV3-0000000CRLD-0T65;
	Fri, 26 Apr 2024 12:16:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 677131BF203;
	Fri, 26 Apr 2024 12:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1714133776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iKKtm36SBTWsbDXzRyPwPacxtTX+fdl2bBrbOBDwJoM=;
	b=jUAcl225gOyeJ08AulAYmoy2CFU+zi+HTn0Njr2U5MjRjPgTzeGSPgV5kMX9NQ0q3ipbdN
	kwO2c/cq0yHvyWt1nVOx0r2P0NwSgn0Uz8mvnsiXzkOXcw20WTfEXQXDHL+pW8LPStfetd
	422bbzHf7xIhCyMDZjZa6jHgSPPH/hCQIf/CfK6HxxPiqtDlBu3DCPzpa8wBCmTUtFVH9k
	A4dSJotdzHs7Czt41crDAPrFDF1mTrRKmb2fgnybIopJJTw+EQ6JCFcp/pwNUEc9zTFL2V
	TydqSpE1FxZNkXf+OXkiS392iMHiKPid4fsK2JtzIva5tNivT+/9f50Jy1l/7Q==
Message-ID: <44e366ea-964a-4515-9027-2a2edfe12512@arinc9.com>
Date: Fri, 26 Apr 2024 15:15:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Set PHY address of MT7531 switch to 0x1f on MediaTek
 arm64 boards
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
 <ff196055-ecd8-4563-bc01-ff2533a07109@arinc9.com>
 <a60fc16d-4236-427c-b4a8-ec6fdf62d9f0@arinc9.com>
 <facb8204-c2b3-4084-a2e3-4fbf3a3fdc9d@arinc9.com>
Content-Language: en-US
In-Reply-To: <facb8204-c2b3-4084-a2e3-4fbf3a3fdc9d@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_051621_795826_47996D67 
X-CRM114-Status: GOOD (  10.72  )
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

On 23.04.2024 12:16, Arınç ÜNAL wrote:
> On 08/04/2024 10:22, Arınç ÜNAL wrote:
>> On 31.03.2024 12:28, arinc.unal@arinc9.com wrote:
>>> On 14.03.2024 15:20, Arınç ÜNAL via B4 Relay wrote:
>>>> Hello.
>>>>
>>>> This is a small patch series setting the PHY address of MT7531 to 0x1f on
>>>> all boards that have the switch.
>>>>
>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>> ---
>>>> Arınç ÜNAL (2):
>>>>        arm64: dts: mediatek: mt7622: set PHY address of MT7531 switch to 0x1f
>>>>        arm64: dts: mediatek: mt7986: set PHY address of MT7531 switch to 0x1f
>>>>
>>>>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>>>>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
>>>>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++--
>>>>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 4 ++--
>>>>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 4 ++--
>>>>   5 files changed, 10 insertions(+), 10 deletions(-)
>>>> ---
>>>> base-commit: ba90af39ba57b3fe3ecfdba0c87a80d20c7b788d
>>>> change-id: 20240314-for-mediatek-mt7531-phy-address-9d0b4cfeca21
>>>>
>>>> Best regards,
>>>
>>> Reminder that this patch series is waiting.
>>
>> Another reminder that this patch series is waiting to be applied.
> 
> Here's the third reminder for someone to apply this. From now on, I am
> going to reply to this thread once every day until this patch series is
> applied.

Fourth.

Arınç

