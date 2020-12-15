Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CEFC4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 13:43:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EAE0224B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 13:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EAE0224B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0bl8hxAbinEWEEBLhQauEXpT1bD9DotwIiH1t/UKlBI=; b=MlSzQKQku8OXDEdtOm1LZPKUW
	6lUnNUeXcVwjDl4M1WhCv8RSfthF1Lf0YZ6JxIeWqcFR3FBCAaTq0KH7ZbNmjgcCpr3eCE+tPNstK
	uvWyiW2iPMZwF+H5qP3awGIWP7IBgWV14lQa03vURaC/BrFvEhGq1bhEYnnUZSzCoJGVDD29zCfL2
	O2wLZhjM51VA5xac6JrjUqIKGskBF9clS2ZFa0TyS84ZB7S1zUpOW4N/6+23W1WzNAUovdQTBQi7y
	V//+rpoLE2+rpyidFWQ0Aj8Jc/jQufyAsDnRt1PghFlx0ShL2+59nDc053SbPOxf6jLZUe8SHT1X8
	zc4HZDr+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpAbS-0003Ws-VY; Tue, 15 Dec 2020 13:42:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpAbP-0003V8-Dx
 for linux-mediatek@lists.infradead.org; Tue, 15 Dec 2020 13:42:56 +0000
X-UUID: d1b1dc3ddc6047a58746a7c1d0cf492b-20201215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1RGDjURdmEyovAy+0B6E3CPqC1h1aiYeyMmL1c1Rmao=; 
 b=nNGEY2RWIXuOVAceSToKbYzNOp8JjkPupcoZ66fgqQ8x216NywDSHcBw6YPMZAcR7NO6srggoQBEJGyfT3Ap6bwlMg8fhMXV/X3b98Mqv58pDDx8B9Rq73vASnwwsLfl5JJgVASL091HG/mmmrHUs7vM0hrRTRDvuxsJwBGN95w=;
X-UUID: d1b1dc3ddc6047a58746a7c1d0cf492b-20201215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 406434630; Tue, 15 Dec 2020 05:42:48 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 05:32:44 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 21:32:37 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Dec 2020 21:32:38 +0800
From: <sean.wang@mediatek.com>
To: <drinkcat@chromium.org>
Subject: Re: [PATCH -next v2] mt76: mt7921: introduce mt7921e support
Date: Tue, 15 Dec 2020 21:32:35 +0800
Message-ID: <1608039155-29313-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CANMq1KAgYKBXGPMgpMpAF=6rWv3zVsHBBjwX1fOCRC2THCYM5Q@mail.gmail.com--annotate>
References: <CANMq1KAgYKBXGPMgpMpAF=6rWv3zVsHBBjwX1fOCRC2THCYM5Q@mail.gmail.com--annotate>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E16242EE3AAC3FA2620671A2FC26BB456ECD5CE05658212073630134F05869002000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_084255_693750_790E5F57 
X-CRM114-Status: GOOD (  14.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Soul.Huang@mediatek.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

On Mon, Dec 14, 2020 at 8:56 PM <sean.wang@mediatek.com> wrote:
>>
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Introduce support for mt7921e 802.11ax (Wi-Fi 6) 2x2:2SS chipset.
>>
>> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
>> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>> v2:
>>  - Mark the patch as -next
>> ---
>>  drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
>>  drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
>>  .../net/wireless/mediatek/mt76/mt7921/Kconfig |   10 +
>>  .../wireless/mediatek/mt76/mt7921/Makefile    |    6 +
>>  .../wireless/mediatek/mt76/mt7921/debugfs.c   |  180 ++
>>  .../net/wireless/mediatek/mt76/mt7921/dma.c   |  356 +++
>>  .../wireless/mediatek/mt76/mt7921/eeprom.c    |  247 ++
>>  .../wireless/mediatek/mt76/mt7921/eeprom.h    |  126 +
>>  .../net/wireless/mediatek/mt76/mt7921/init.c  |  482 +++
>>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 1387 +++++++++
>>  .../net/wireless/mediatek/mt76/mt7921/mac.h   |  367 +++
>>  .../net/wireless/mediatek/mt76/mt7921/main.c  |  854 ++++++
>>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 2588 +++++++++++++++++
>>  .../net/wireless/mediatek/mt76/mt7921/mcu.h   |  991 +++++++
>>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  379 +++
>>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  209 ++
>>  .../net/wireless/mediatek/mt76/mt7921/regs.h  |  455 +++
>>  17 files changed, 8639 insertions(+)
>
>I'm not likely to review this, but, this is a _huge_ patch, is there a way to split it in easier to digest parts?
>

we will split the series for areas (e.g: dma, mcu, ..) and make sure each patch compile properly.

>[snip]
>
>> +static void
>> +mt7921_mcu_debug_msg_event(struct mt7921_dev *dev, struct sk_buff
>> +*skb) {
>> +       struct mt7921_mcu_rxd *rxd = (struct mt7921_mcu_rxd *)skb->data;
>> +       struct debug_msg {
>> +               __le16 id;
>> +               u8 type;
>> +               u8 flag;
>> +               __le32 value;
>> +               __le16 len;
>> +               u8 content[512];
>> +       } __packed * debug_msg;
>> +       u16 cur_len;
>> +       int i;
>> +
>> +       skb_pull(skb, sizeof(*rxd));
>> +       debug_msg = (struct debug_msg *)skb->data;
>> +
>> +       cur_len = min_t(u16, le16_to_cpu(debug_msg->len), 512);
>> +
>> +       if (debug_msg->type == 0x3) {
>> +               for (i = 0 ; i < cur_len; i++)
>> +                       if (!debug_msg->content[i])
>> +                               debug_msg->content[i] = ' ';
>> +
>> +               trace_printk("%s", debug_msg->content);
>
>Please do not use trace_printk in production code [1,2], it is only meant for debug use. Consider using trace events, or dev_dbg.

ack, we will use dev_dbg instead.

>
>[1] https://elixir.bootlin.com/linux/v5.8/source/kernel/trace/trace.c#L3158
>[2] https://elixir.bootlin.com/linux/v5.8/source/include/linux/kernel.h#L766
>
>> +       }
>> +}
>> +
>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
