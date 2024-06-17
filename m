Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C02C27C6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 08:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgwoDle0VCjUgkksnE/DxlmcEtuf5f9KQBQjSoWR2uI=; b=jogiAU0p/ZoS0DHkKk7Mgkg0q6
	cOmfMaWrbaakVSm2SWvuzZHvT4tGBoZGpDQaw8kD5oMSC0fSnrGA2Ugpj8z79vBdUohmfZLL5OEey
	PzjHnjX1IyFO2VC1q44dqbecrYmrLFgQB30nohq9B2dSsdDkSl3uvGYwyDuqKRyx40wKKeX5LUxP5
	AxfhGwaDfHmzP+0p/DuCvwnxlN4gTy3iVky8vjFPlH4eHxiN/cjc7fEN4HLz0SxolRa0oWJPTd2Xq
	+WicmVjE5XXjieNVZhhN/gS/FI7Tg5L/Wm4KGZ9MXyxDjVyoR3bLGl8tfnYIXRg8a9bNrCKjW+G2K
	ZL/e8KSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7oS-00000009sNc-0ePW;
	Mon, 17 Jun 2024 08:34:04 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7oO-00000009sJq-0yYd;
	Mon, 17 Jun 2024 08:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=rgwoDle0VCjUgkksnE/DxlmcEtuf5f9KQBQjSoWR2uI=;
	t=1718613240; x=1719045240; b=d5QgKx1EoNK5ipcX+tHwdVB7/E3W2WNyaagD33PetnunGAS
	CBaErBnb2pM8ATJCRS0zn3yErx0TJ8WIPo5hryKKKdbwmSmtPEWpoXLEG/2qybVJa95+UHNiGyn4p
	GNPseX9IR8YqIOTyXShuwzmvqcqusIO5k6ddyT4lekQvBTDF+LvCg3kBT2oKz+S0pjIaiAf1hld7j
	bi1kIclN46yaUbCfnnMHzuEB5pD49RkJAG2BEgN3KFftxjwUXn5BQe5TI42blZ2kfkuq5S19NyaZU
	FHB4g2HnMrHmooeWs3+Vk8Tw1Gvifn/5riyZvR3ltrVUvBRs+J9pOqyku7TclUEA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sJ7oF-0004hN-11; Mon, 17 Jun 2024 10:33:51 +0200
Message-ID: <bd6b6929-d34d-4bd5-9cb0-bc8fe850ee46@leemhuis.info>
Date: Mon, 17 Jun 2024 10:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20240516204847.171029-1-linux@fw-web.de>
 <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
 <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
 <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
 <698cf562-1ca9-4aa3-be7e-a1474b612c5b@leemhuis.info>
 <0cba095c-3d55-416a-a7ad-b359129731cf@arinc9.com>
 <714da201-654b-4183-8e5e-8ff0b64fe621@leemhuis.info>
 <2cac4cf68304e81abffbd9ff0387ee100323c2b7.camel@redhat.com>
 <b49c801c-6628-40a6-8294-0876d8871ba7@leemhuis.info>
 <e92c3ca0-c9be-44ac-a4fc-57ca5ebedbc5@leemhuis.info>
 <1807a142-1534-4fa4-ad4b-d1c03af014c2@arinc9.com>
 <58d8ddea-71cc-427a-94cc-a95f6bce61d2@collabora.com>
 <16e9c06e-9908-455d-a387-614fefe5bcf8@arinc9.com>
 <5e87d31c-b059-4f9a-93f7-dc87465ed14a@collabora.com>
 <4416ef22-78cc-4ce5-b61d-69ff0903811e@arinc9.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <4416ef22-78cc-4ce5-b61d-69ff0903811e@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718613240;3cc50223;
X-HE-SMSGID: 1sJ7oF-0004hN-11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_013400_471332_9D93AE2B 
X-CRM114-Status: GOOD (  25.33  )
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
Cc: devicetree@vger.kernel.org, Linux regressions mailing list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This thread/fixing the regressions looks stalled again, let me jump in
here with a further comment below.

On 11.06.24 20:15, Arınç ÜNAL wrote:
> On 11/06/2024 16:03, AngeloGioacchino Del Regno wrote:
>> Il 11/06/24 14:56, Arınç ÜNAL ha scritto:
>>> On 11/06/2024 15:28, AngeloGioacchino Del Regno wrote:
>>>> Il 11/06/24 13:38, Arınç ÜNAL ha scritto:
>>>>> On 11/06/2024 14:30, Thorsten Leemhuis wrote:
>>>>>> On 07.06.24 16:15, Thorsten Leemhuis wrote:
>>>>>>> On 07.06.24 16:03, Paolo Abeni wrote:
>>>>>>>> On Thu, 2024-06-06 at 10:26 +0200, Thorsten Leemhuis wrote:
>>>>>>>>> On 31.05.24 08:10, Arınç ÜNAL wrote:
>>>>>>>>>> On 31/05/2024 08.40, Thorsten Leemhuis wrote:
>>>>>>>>>>> [adding Paolo, who committed the culprit]
>>>>>>>>>
>>>>>>>>> /me slowly wonders if the culprit should be reverted for now
>>>>>>>>> (see below)
>>>>>>>>> and should be reapplied later together with the matching
>>>>>>>>> changes from
>>>>>>>>> Arınç ÜNAL.
>>>>>>>>
>>>>>>>> FWIS I think a revert should be avoided, given that a fix is
>>>>>>>> available
>>>>>>>> and nicely small.
>>>>>>>
>>>>>>> Yeah, on one hand I agree; but on the other it seems that the
>>>>>>> maintainers that would have to take care of the dt changes to fix
>>>>>>> this
>>>>>>> until now remained silent in this thread, apart from Rob who sent
>>>>>>> the
>>>>>>> mail regarding the warnings.
>>>>>>>
>>>>>>> I put those maintainers in the To: field of this mail, maybe that
>>>>>>> might
>>>>>>> lead to some reaction.
>>>>>>
>>>>>> Still no reply from the DRS folks or any other progress I noticed.
>>>>>> Guess
>>>>>> that means I will soon have no other choice than to get Linus
>>>>>> involved,
>>>>>> as this looks stuck. :-( #sigh
>>>>>
>>>>> Does it have to be Linus that needs to apply "[PATCH 0/2] Set PHY
>>>>> address
>>>>> of MT7531 switch to 0x1f on MediaTek arm64 boards"? Aren't there
>>>>> any other
>>>>> ARM maintainers that can apply the fix to their tree?
>>>>>
>>>>> Arınç
>>>>
>>>> You have feedback from two people on the series that you mentioned,
>>>> and noone
>>>> is going to apply something that needs to be fixed.
>>>>
>>>> I'm giving you the possibility of addressing the comments in your
>>>> patch, but
>>>> I don't want to see any mention of the driver previously ignoring
>>>> this or that
>>>> as this is irrelevant for a hardware description. Devicetree only
>>>> describes HW.
>>>>
>>>> Adding up, in commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY
>>>> address of switch from device tree"),
>>>> you have created a regression.
>>>>
>>>> Regressions should be fixed - as in - if the driver did work before
>>>> with the old
>>>> devicetrees, it shall still work. You can't break ABI. Any changes
>>>> that you do
>>>> to your driver must not break functionality with old devicetrees.
>>>>
>>>> So...
>>>>
>>>> ------> Fix the driver that you broke <------
>>>
>>> The device tree ABI before the change on the driver:
>>>
>>> The reg value represents the PHY address of the switch.
>>>
>>> The device tree ABI after the change on the driver:
>>>
>>> The reg value represents the PHY address of the switch.
>>>
>>> I see no device tree ABI breakage. What I see instead is the driver
>>> starting enforcing the device tree ABI. No change had been made on the
>>> device tree ABI so any non-Linux driver that controls this switch
>>> continues
>>> to work.
>>>
>>> These old device tree source files in question did not abide by the
>>> device
>>> tree ABI in the first place, which is why they don't work anymore as the
>>> Linux driver now enforces the ABI. Device tree source files not
>>> conforming
>>> to the ABI is not something to maintain but to fix. The patch series
>>> that
>>> fixes them are already submitted.
>>
>> As I said, the devicetree MUST describe the hardware correctly, and on
>> that I do
>> agree, and I, again, said that I want to take the devicetree fix.
>>
>> However, the driver regressed, and this broke functionality with old
>> device trees.
>> Old device trees might have been wrong (and they are, yes), but
>> functionality was
>> there and the switch was working.
>>
>> I repeat, driver changes MUST be retro-compatible with older device
>> trees, and your
>> driver changes ARE NOT; otherwise, this wouldn't be called *regression*.
> 
> I'm going to argue that what caused the regression is the broken device
> tree. The recent change on the driver only worked towards exposing the
> broken device tree.

Well, for the kernel that does not matter much: due to our "no
regressions" rule and how Linus handles it the author of that "recent
change" (e.g. you) is responsible to fix regressions a change exposed --
or that change is reverted (I might be wrong, but I think there are
quotes from Linus in
https://docs.kernel.org/process/handling-regressions.html to back this
up). So in the end a revert in a week or two is likely the outcome,
unless you or someone else fixes it in a way that pleases
AngeloGioacchino et. at.

Ciao, Thorsten

