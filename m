Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21610CFC276
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MUmG4E6Ao2cq8gDE1Y3FGj1aD6rjzZ7g8nJkKmT450=; b=0AoOFMqWA/M6rML+o0LxGd5dEh
	XKf9ori8cw9QaGccEX73oHvSHzaNz3LPbQYJczrGnz8XLQT0tNlGQ5MNSFMzE9vTRSgrz+qQsxiRo
	VgVQNWnrTbBkH/TMX3PHGIkrLmlrKd+EHWixUzGMu+axrohWiEvo7id9K+qXWkVtyL5l92AtGh7dw
	C6sM+vuJQDHOe3kFFcTixqaKftcKXMLlKGIefEDsnjvN8wYAyXh4JLmlpAHgmIdPeywPHSrmgwagD
	R59EN7/5zick7G210DhO4G7ru/nyZC4dANsct8oROc9TGVX4vobQnQZ0YhH9uF/B/bYz7X0KcBfno
	sqRGfV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dBt-00000007Yr6-47P8;
	Tue, 15 Oct 2024 08:46:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dBr-00000007YqZ-1sAB
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 08:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728981961;
	bh=7vHIM87eNaX3ejUjqfIM2HsQR797Aj6VtuCHdl+ICYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eS1gMytK/UkljJJVHSCeaQIbsyRBquDiJfBUWJ/am1MjvKN4hx42JaWncX4mjQcV8
	 Xr1JOmxl/FerSNfczs1nQXoAsV3I+2/mWYw2fqffgyTNrVtTnVG0xye0jtlv7FS9u7
	 x5DT7MEtXOoJVM0kFOCppXXGVrMqf4MJYNUR6OjzF8scFdcQRLRM18KoUgdz7sCLJn
	 +HLj727BEmeg6sYkH/1mkQvRwD0GJUATssOcooQ9MJ2JF13h4OfQ8kgYAA6maan0Ln
	 IA2ZZMjkZsIgv9AcB9AMOjAjd8Zz/LE/GghuiGItvNPZcu0Cipc0ErANr7hzwxBNUI
	 1RHvRfgyPMoHA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2AB9417E1167;
	Tue, 15 Oct 2024 10:46:01 +0200 (CEST)
Message-ID: <f0b77d1a-b2b6-46a3-a6a1-44dc601e8584@collabora.com>
Date: Tue, 15 Oct 2024 10:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] Bluetooth: btmtksdio: Lookup device node only as
 fallback
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@kernel.org>,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241008082721.4004100-1-wenst@chromium.org>
 <CABBYNZ+UGx8TtW+aXZer_j=L79NYEP28+FcSeRqT3BKN7L+CGw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CABBYNZ+UGx8TtW+aXZer_j=L79NYEP28+FcSeRqT3BKN7L+CGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_014603_818938_CDA87FF8 
X-CRM114-Status: GOOD (  19.32  )
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

Il 08/10/24 15:39, Luiz Augusto von Dentz ha scritto:
> Hi,
> 
> On Tue, Oct 8, 2024 at 4:27 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> If the device tree is properly written, the SDIO function device node
>> should be correctly defined, and the mmc core in Linux should correctly
>> tie it to the device being probed.
>>
>> Only fall back to searching for the device node by compatible if the
>> original device node tied to the device is incorrect, as seen in older
>> device trees.
>>
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> I was hoping to see some Reviewed-by/Tested-by here, were the mediatek
> made aware of these changes?
> 

Sorry I didn't see this patch in my .. rather big .. stack of patches :-D

I can confirm

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # 
MT8186 Corsola

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

>> ---
>> Resending after three and a half months.
>>
>> This follows up on the MT7921S bluetooth binding and DT fixup patches [1].
>> This should not be backported.
>>
>> [1] https://lore.kernel.org/linux-bluetooth/20240412073046.1192744-1-wenst@chromium.org/
>>
>>   drivers/bluetooth/btmtksdio.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
>> index cc097aedc1e1..a1dfcfe43d3a 100644
>> --- a/drivers/bluetooth/btmtksdio.c
>> +++ b/drivers/bluetooth/btmtksdio.c
>> @@ -1328,6 +1328,8 @@ static int btmtksdio_probe(struct sdio_func *func,
>>   {
>>          struct btmtksdio_dev *bdev;
>>          struct hci_dev *hdev;
>> +       struct device_node *old_node;
>> +       bool restore_node;
>>          int err;
>>
>>          bdev = devm_kzalloc(&func->dev, sizeof(*bdev), GFP_KERNEL);
>> @@ -1411,13 +1413,24 @@ static int btmtksdio_probe(struct sdio_func *func,
>>          if (err)
>>                  bt_dev_err(hdev, "failed to initialize device wakeup");
>>
>> -       bdev->dev->of_node = of_find_compatible_node(NULL, NULL,
>> -                                                    "mediatek,mt7921s-bluetooth");
>> +       restore_node = false;
>> +       if (!of_device_is_compatible(bdev->dev->of_node, "mediatek,mt7921s-bluetooth")) {
>> +               restore_node = true;
>> +               old_node = bdev->dev->of_node;
>> +               bdev->dev->of_node = of_find_compatible_node(NULL, NULL,
>> +                                                            "mediatek,mt7921s-bluetooth");
>> +       }
>> +
>>          bdev->reset = devm_gpiod_get_optional(bdev->dev, "reset",
>>                                                GPIOD_OUT_LOW);
>>          if (IS_ERR(bdev->reset))
>>                  err = PTR_ERR(bdev->reset);
>>
>> +       if (restore_node) {
>> +               of_node_put(bdev->dev->of_node);
>> +               bdev->dev->of_node = old_node;
>> +       }
>> +
>>          return err;
>>   }
>>
>> --
>> 2.47.0.rc0.187.ge670bccf7e-goog
>>
> 
> 


