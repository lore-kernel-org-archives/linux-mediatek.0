Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E0BEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaiNhIX2zBmKdEw1RCdvmWnzX0EPJch5VYxoShDG7T0=; b=XEmz+pcFQCCPAeRq9vsHT5aon2
	BNg9UtTXMrZZk3tj/MoM8MWQuROyQTEhhWcpEEjLDk+afKJ3Cvjc0s025n3UoNL9IJmBYMG6qaKdX
	qUFKUahlmozX9JF19HdpyF7MPNzqwgDle604vKYvgjKdwmu1PEjYK14Hjf/l/mRGlZK40sVUyT6K7
	xiC7jt10f49qO2UWAL5fAf8o8r2/4R8MRivS9Xx5Pvt7J4ufRZ2a1cr715dmyt0i5xfwrDKBhxxZM
	67rV5snr/mn4o+jzfFUSv3BPAOoQonNCFCouFB2to2R9pdyvM7mzbHOwWB4TxdgvYRcIjO4w6R3pQ
	cTE4Gc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJW6N-00H2SB-1m;
	Wed, 12 Jul 2023 09:25:39 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJW6J-00H2R8-29
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 09:25:38 +0000
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 472E361E5FE03;
	Wed, 12 Jul 2023 11:25:21 +0200 (CEST)
Message-ID: <b8a27d63-c214-0af6-7ad0-b82402208e3b@molgen.mpg.de>
Date: Wed, 12 Jul 2023 11:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] Bluetooth: btmtk: Fix null pointer when processing
 coredump
To: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>
Cc: marcel@holtmann.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 johan.hedberg@gmail.com, =?UTF-8?B?U3RldmUgTGVlICjmnY7oppboqqAp?=
 <steve.lee@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
 =?UTF-8?B?QWFyb24gSG91ICjkvq/kv4rku7Ap?= <Aaron.Hou@mediatek.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20230712051857.13812-1-chris.lu@mediatek.com>
 <0cb29d27-a76f-47f2-86c3-f39ba25e8bc2@molgen.mpg.de>
 <d8f82d97496c73c01521dbbce5455ad23521036c.camel@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <d8f82d97496c73c01521dbbce5455ad23521036c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_022535_850897_9A451FB8 
X-CRM114-Status: GOOD (  21.76  )
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

Dear Chris,


Am 12.07.23 um 10:53 schrieb Chris Lu (陸稚泓):
> On Wed, 2023-07-12 at 08:11 +0200, Paul Menzel wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.

(It’d be nice if you removed such (automatically added) phrases from 
your reply.)

> Thanks for your review and feedback to Mediatek's Bluetooth driver
> code.

Thank you for your reply.

>> Am 12.07.23 um 07:18 schrieb Chris Lu:
>>> There may be a potential null pointer risk if offset value is
>>> less than 0 when doing memcmp in btmtk_process_coredump().
>>> Checking offset is valid before doing memcmp.
>>
>> Use imperative mood: Check offset …
>>
>>> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
>>> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
>>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>>> ---
>>> v2: fix typo
>>> v3: fix bot checking error
>>> ---
>>>    drivers/bluetooth/btmtk.c | 16 ++++++++--------
>>>    1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
>>> index 786f775196ae..0f290430ae0e 100644
>>> --- a/drivers/bluetooth/btmtk.c
>>> +++ b/drivers/bluetooth/btmtk.c
>>> @@ -370,7 +370,7 @@ EXPORT_SYMBOL_GPL(btmtk_register_coredump);
>>>    int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
>>>    {
>>>    struct btmediatek_data *data = hci_get_priv(hdev);
>>> -int err;
>>> +int err, offset;
>>>    
>>>    if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
>>>    return 0;
>>> @@ -392,15 +392,15 @@ int btmtk_process_coredump(struct hci_dev
>> *hdev, struct sk_buff *skb)
>>>    if (err < 0)
>>>    break;
>>>    data->cd_info.cnt++;
>>> +offset = skb->len - sizeof(MTK_COREDUMP_END);
>>
>> For `sizeof()` shouldn’t you use `size_t`? But that is unsigned of
>> course. Maybe ssize_t then?
>
> yes, it's better to use ssize_t or size_t, I'll change declaratins of
> offset from int to ssize_t.
> 
>>>    
>>>    /* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
>>> -if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
>>> -    skb->len > sizeof(MTK_COREDUMP_END) &&
>>> -    !memcmp((char *)&skb->data[skb->len - sizeof(MTK_COREDUMP_END)],
>>> -    MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - 1)) {
>>> -bt_dev_info(hdev, "Mediatek coredump end");
>>> -hci_devcd_complete(hdev);
>>> -}
>>> +if (data->cd_info.cnt > MTK_COREDUMP_NUM && offset > 0)
>>
>> Why not keep it like before, and just add the condition `skb->len <
>> sizeof(MTK_COREDUMP_END)`? The compiler is probably going to optimize
>> so the value is not calculated twice.

> The reason why I send this patch is when I backport devcoredump feature
> to specific project with older kernel version, the compiler might not
> so optimized that it would cause kernel panic when run into memcmp.
> As a result, make sure `skb->len > sizeof(MTK_COREDUMP_END) ` before
> doing memcmp part can avoid null pointer issue.
> Besides, only in condition 'data->cd_info.cnt > MTK_COREDUMP_NUM &&
> offset > 0' need to do memcmp to check the end of coredump. Driver do
> noting with condition `skb->len < sizeof(MTK_COREDUMP_END) ` that
> additional condiction is not really necessary.

Just to avoid misunderstandings, my point, to add the comparison and get 
rid of the variable `offset`.


Kind regards,

Paul


>>> +if (!memcmp((char *)&skb->data[offset], MTK_COREDUMP_END,
>>> +    sizeof(MTK_COREDUMP_END) - 1)) {
>>> +bt_dev_info(hdev, "Mediatek coredump end");
>>> +hci_devcd_complete(hdev);
>>> +}
>>>    
>>>    break;
>>>    }

