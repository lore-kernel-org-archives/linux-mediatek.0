Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1301AC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 11:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmVWIlwRmNxuaizd2/fi8LlfK4eMptLh62YddG3vMPo=; b=AYLgpO/wDlvIsRYdNXdXouIC0E
	t6Wt+m0QkoUJlQAuwe6FiTILdv95o0G7k/kwRpkGK2g4dYUfKsRysEgLDfGQPsMA3UKS5Esv0KDLl
	3o6cRdXtwIMIY2DnrUlS1Xqn1Lazbg+SU84uIwC3QbpWatZHahyaLwn5p3o3w+50v4qU63GiTNh/b
	U4OmEJ32NFht6M6GJDsBxWKER3rneWbRYKH8amsZkZTjG4ncwgxePp3ygtbWgJ+Kpu6Hu9WG7Qmyq
	NrU24EeGkIeOShaQpqXxeYo8Gd9HzzAtTgvByle8Wqd5aT5MTXZ/hR5juXaNF5j20Owm6uyaUK7fG
	eR/oVKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saw2B-0000000Fhfd-1x4Z;
	Mon, 05 Aug 2024 11:37:51 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saw1k-0000000FhXU-1UTr;
	Mon, 05 Aug 2024 11:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722857838; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WZefQ+4lDQo2FqeXKS9qj5blYXTg+SQXR1T5nD8FlYemqaNAFxfHufeqYSrLhXclBNb2XvHUC8abw6hRswwq/ONjNNhS1DZbUDpX2LVM+nq0Z2XMSJ6qy7rX6yro412ufCRCdPevKl/0h/OkbbiSYuoUDup6hMub78EUKUAepHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722857838; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tmVWIlwRmNxuaizd2/fi8LlfK4eMptLh62YddG3vMPo=; 
	b=hAv96z3JmlMCBQAhx7oziIqznmEgU4CfcgXcwTazInx665hg2qX9X3RoLoNE4vJRHhTRSmTEVdDUdqdjGYSgHphRS6gNgof8sZSBfIm4DjJ4VeilmJ752UP4wG2aaw80DVHluBPF+dQSENTtQ+VZ68O0dj3fpL/5w9Mng4TbqF0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722857838;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tmVWIlwRmNxuaizd2/fi8LlfK4eMptLh62YddG3vMPo=;
	b=O1T+E9tEHIMNCplb1yGkuI/KVDHv+UmD3pnppYMvwzNorWR6RlpVOJU3lyffMyyz
	65/MkWZdeCEMfOp+L3AeBmRW47EhgOvJoJk8m2K8k4n+s9ASQ19WJNrXMeRzrZAccpQ
	zEK8qptiFF4awczhMET/k/KCWCUlesDmj8fqMus0=
Received: by mx.zohomail.com with SMTPS id 1722857835757930.0553896433859;
	Mon, 5 Aug 2024 04:37:15 -0700 (PDT)
Message-ID: <d7391797-5c23-4ef9-b448-980ebe5a1d67@collabora.com>
Date: Mon, 5 Aug 2024 13:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvmem: mtk-efuse: Only register socinfo device if
 needed cells are there
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: William-tw Lin <william-tw.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20240708-mtk-socinfo-no-data-probe-err-v2-1-7ae252acbcc2@collabora.com>
 <a1914f2b-93f2-4de4-9c4b-2e1f6b39cf3a@collabora.com>
 <05dd24ec-d084-4708-a241-b4714391118a@notapiano>
 <e1e1b618-b505-482a-b556-99c6d42fd581@collabora.com>
 <f52d33ec-a003-48f8-b74d-080b9b29eb67@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f52d33ec-a003-48f8-b74d-080b9b29eb67@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_043724_466779_7EE8296C 
X-CRM114-Status: GOOD (  21.91  )
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

Il 03/08/24 16:34, Nícolas F. R. A. Prado ha scritto:
> On Fri, Jul 19, 2024 at 11:29:03AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 19/07/24 00:07, Nícolas F. R. A. Prado ha scritto:
>>> On Wed, Jul 10, 2024 at 11:31:11AM +0200, AngeloGioacchino Del Regno wrote:
>>>> Il 08/07/24 21:43, Nícolas F. R. A. Prado ha scritto:
>>>>> Not every efuse region has cells storing SoC information. Only register
>>>>> an socinfo device if the required cells are present.
>>>>>
>>>>> This prevents the pointless process of creating an socinfo device,
>>>>> probing it with the socinfo driver only to ultimately error out like so
>>>>>
>>>>>      mtk-socinfo mtk-socinfo.0.auto: error -ENOENT: Failed to get socinfo data
>>>>>      mtk-socinfo mtk-socinfo.0.auto: probe with driver mtk-socinfo failed with error -2
>>>>>
>>>>> This issue is observed on the mt8183-kukui-jacuzzi-juniper-sku16
>>>>> platform, which has two efuse regions, but only one of them contains the
>>>>> SoC data.
>>>>>
>>>>
>>>> I think that we should rather remove or disable the first eFuse region, as
>>>> even though that is enabled:
>>>>
>>>>    - This is the only SoC having two regions
>>>>      - I'm not even sure that the region at 0x8000000 is really efuse
>>>>      - Not even referenced in datasheets....
>>>>    - It's unused, as in, it's not exposing any information and no declared cells
>>>>
>>>> Don't misunderstand me, this is not an invalid change, but I rather prefer
>>>> to resolve this by disabling that (effectively unused!) node, avoiding to
>>>> add more lines to this driver that would be useless after fixing that small
>>>> single thing.
>>>
>>> I'm not confident that we can say that that efuse is not exposing any
>>> information. Indeed there are no cells so it's not used by any other driver, but
>>> the efuse contents are still exposed to userspace if CONFIG_NVMEM_SYSFS is
>>> enabled.
>>>
>>> I dumped it on one of the mt8183-kukui-jacuzzi-juniper-sku16 units:
>>>
>>>     $ ls -l /sys/bus/nvmem/devices/
>>>     total 0
>>>     lrwxrwxrwx    1 root     root             0 Jul 18 21:43 mmtd0 -> ../../../devices/platform/soc/11010000.spi/spi_master/spi1/spi1.0/mtd/mtd0/mtd0
>>>     lrwxrwxrwx    1 root     root             0 Jul 18 21:43 nvmem0 -> ../../../devices/platform/soc/8000000.efuse/nvmem0
>>>     lrwxrwxrwx    1 root     root             0 Jul 18 21:43 nvmem1 -> ../../../devices/platform/soc/11f10000.efuse/nvmem1
>>>     $ hexdump -C /sys/bus/nvmem/devices/nvmem0/nvmem
>>>     00000000  88 07 00 00 00 8a 00 00  00 ca 00 00 00 00 00 00  |................|
>>>     00000010
>>>
>>> I power cycled the unit and ran this again and it still showed the same
>>> contents. I also ran the same on a different unit of the same model and it
>>> showed the same contents. Of course this doesn't prove anything, but given that
>>> the contents seem to be constant across reboots and even different units, it
>>> does look like it could be an efuse to me. :)
>>>
>>> As to whether the contents are useful at all, or if there are
>>> userspace applications making use of it I have no clue. But if in doubt,
>>> shouldn't we keep it around?
>>
>> (Added William-tw Lin from MediaTek to the loop)
>>
>> I'll say yes only if MediaTek (please!) says that this region has useful
>> information, and only if MediaTek actually tells us what those fuses are.
>>
>> The reason is that sometimes when SoCs have multiple efuse regions, one contains
>> uncalibrated data for factory calibration (etc etc), one contains data that derives
>> from the uncalibrated regions and that is supposed to be used by the OS.
>>
>> If we got the uncalibrated data that is *not* for OS usage in the MT8183 DT, then
>> we can as well just remove it.
>>
>> Besides, I have no concern about any userspace application using that.
> 
> No reply, so I've sent v3.
> 

Resolved with devicetree change. Please ignore this patch.

Cheers,
Angelo


