Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE8C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 10:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vi5TPBBd99tv8Xmgnv/pBsNDXNH3b9oonqkMaft58mA=; b=Q83nXnC5gWtIqe
	FZ9nidKVlig0fCGN3pAppsnpqzmF+cqcZpgPw1AewQfrnEN85PbTSpFgwxxLISMYwDnl+c/ddivQj
	ZscGPwm/Ic7VtdNuyqebttAjEqBDX918r3G4OOagJxNbN54EtKThv6ElT1Aryq6Ve1Vm4yFTYf+fI
	XMp+/uXlBe/j+pkj9ybE4vyD9UEoO7Ylt3p2CjHdVVE6WxJyMRsgZRzID3k01xHrAw4YUQVjas8wt
	OZZwIMVJrEE+be+UAHixoI4o4l1RnUuicrj9s7mW4BX8Gfo90EbGoEERu+7QlTaSPiI2gCXc65S3f
	65MfwXkfTyT6io+fRoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5w2-00000005vX9-21Ig;
	Thu, 23 May 2024 10:44:34 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5vy-00000005vUI-0BDf;
	Thu, 23 May 2024 10:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=vi5TPBBd99tv8Xmgnv/pBsNDXNH3b9oonqkMaft58mA=;
	t=1716461070; x=1716893070; b=q2Uak+S9UakDVR2Wib5XtHrubXjwkIe2ZWKqJtPyvK96EFe
	qEBOjfqJixvOZ61GY6Up/VnPd0KgcsRtCwEmpaw2jCByS9cUa95Acn78v0bRSN3eUfD2RaB57fu1o
	t5gU+ZRTxyuqdVNa6dj7X8Pgr6uhWfSc8KQeiAET3v+lXbaPt664VFguKWKIm/4qaC9qvdR/RewiJ
	JisHZPfofF9NWUyiUpEPRew7PJTN+kgMKR9wIeW2YzK/MhTjRUC122Z8b+hOOtjf1WT0syhPuYl4K
	Hld7hosPW7hcShAcX0SBE1Wjpdr5+rZrlB+OeB8i4YAAsUYFlLjvy7YJSqiotNiQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sA5vo-0006Ps-SY; Thu, 23 May 2024 12:44:20 +0200
Message-ID: <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
Date: Thu, 23 May 2024 12:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: frank-w@public-files.de, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20240516204847.171029-1-linux@fw-web.de>
 <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
 <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716461070;72e12db0;
X-HE-SMSGID: 1sA5vo-0006Ps-SY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_034430_281167_35CE343A 
X-CRM114-Status: GOOD (  17.33  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 17.05.24 08:27, Frank Wunderlich wrote:
> Am 17. Mai 2024 04:17:47 MESZ schrieb "Arınç ÜNAL" <arinc.unal@arinc9.com>:
>> On 16/05/2024 23:48, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> After commit 868ff5f4944a
>>> ("net: dsa: mt7530-mdio: read PHY address of switch from device tree")
>>> the mt7531 switch on Bananapi-R64 was not detected.
>>>
>>> mt7530-mdio mdio-bus:00: reset timeout
>>> mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -110
>>>
>>> Fix this by adding phy address in devicetree.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> I don't like the mention of the Linux kernel driver on the patch log. What
>> you're fixing is the incorrect description of the switch's PHY address on
>> the DTS file. Whether or not any driver from any project is actually
>> reading it from the DTS file is irrelevant to this patch. That said, I
>> already have a patch series I've been meaning to send the next version of
>> that already addresses this. Please wait for that.

Did you sent this? Because from what I see with my limited experience in
this subsystem...

> From my PoV it is a regression in next/6.10

...I have to agree with Frank here. So it would be good to get this
fixed before -rc1 is out to prevent more people from running into this.

> because the driver change was merged (without "broadcast" fallback) and the dts patch [1] is not.
> 
> I agree that my patch can be dropped because there was already one.
> 
> regards Frank
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20240314-for-mediatek-mt7531-phy-address-v1-1-52f58db01acd@arinc9.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.


