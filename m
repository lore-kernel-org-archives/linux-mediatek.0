Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF23BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 09:12:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7809660EBD
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 09:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7809660EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=systemli.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSbiCvY4TxsrsrgOWerwCrQlj1Zw9FY5ssncLbLHpDE=; b=v5H6cTAqL9ZRMV
	cMYhp28jtCjLONSCVPPAiia+WdPxikkFTC9uHzsLp0n190UaB7MLk+IoW/QfWTGI9AwyOLLgfGTrg
	m3rIuv8vBoZbBmFAO6CTxubZk9OTeykc0HzJ2ssJbKNrjHX2tQALsKre/toid31AImnn8LTR5trTN
	OrCTnJLDuZcZQ5QG7FlpodowlEQC2Gb9bcCwU8d35cxYQc/BfHvn7qr0y02Grh64VTGhEALakE7mG
	Fe2BPwpBV7ovXoSArsiaKslARjCC9ivXYcHcNPBhs2yI9ow0CIdz8/FEqAuH3kNYsmeIqdxxHDAvE
	5NFSA8jJN4PyVMkGD9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZrMR-008UOC-Av; Mon, 11 Oct 2021 09:12:43 +0000
Received: from mail1.systemli.org ([2a00:c38:11e:ffff::a032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZrMA-008UL2-LB; Mon, 11 Oct 2021 09:12:28 +0000
Message-ID: <3ac87582-2a7f-6885-4f5b-c8c91b0a02cb@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1633943540;
 bh=o/bmAh+lFIOgkU05licr7Un7614a5LZil6pEm849YPw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=8Y56/Gnb6eHy22GdeeNo71WIjXrnqs3efWarX4x9QiBqcLkP+soH8DKtXz1C7B+Ho
 1CqahENdPatUjVZUT2vEkhDUfa7iVm/c9BsFauST07I8+HAfpgP7oe4BfayHTNGKX2
 Z5Jz0qEAlUvMqb2GgAAjnbzRGGIo10Ob9UWnRMk6ErtnCEwQ0srU4T7jsr/GYmVyJP
 qBpHjVr0hDpWWf6aNLTBWopiWexQslzq8sfn6MMY47gW+it8fs51jP8+OA1uAyQtlA
 cfpMIHI3A4S5EshowSn/pWJhBeDVLce1k2KExuzxwfrKpXnpAm4TJVU9NAHHp9U1LV
 CDm/Nw+VzDhgA==
Date: Mon, 11 Oct 2021 11:12:16 +0200
MIME-Version: 1.0
Subject: Re: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, nbd@nbd.name,
 lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, sean.wang@mediatek.com,
 shayne.chen@mediatek.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>
References: <20211007225725.2615-1-vincent@systemli.org>
 <87czoe61kh.fsf@codeaurora.org>
 <274013cd-29e4-9202-423b-bd2b2222d6b8@systemli.org>
 <YWGXiExg1uBIFr2c@makrotopia.org>
From: Nick <vincent@systemli.org>
In-Reply-To: <YWGXiExg1uBIFr2c@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_021226_918265_C31D79BB 
X-CRM114-Status: GOOD (  11.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

My tests on todays OpenWrt Trunk with my and without my patch showed:
- MT7622: AP + AdHoc (only AP is working, in every case)
- BPI-MT7615: AP + AdHoc (with and without my patch still works).

I thought something would change if I apply my patch with the 
HW-Addresses. However everything stays the same:

With my patch:
AdHoc: Shenzhen_4e:4b:dd (38:83:9a:4e:4b:dd)
AP: address: 3a:83:9a:4e:4b:dd (3a:83:9a:4e:4b:dd)

Without my patch:
AdHoc: Shenzhen_4e:4b:dd (38:83:9a:4e:4b:dd)
AP: 3a:83:9a:4e:4b:dd (3a:83:9a:4e:4b:dd)

Bests
Nick

On 10/9/21 15:22, Daniel Golle wrote:
> On Sat, Oct 09, 2021 at 12:37:53PM +0200, Nick wrote:
>> On 10/9/21 10:32, Kalle Valo wrote:
>>
>>> Nick Hainke <vincent@systemli.org> writes:
>>>
>>>> Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces").
>>> The fixes tag should be in the end, before Signed-off-by tags. But I can
>>> fix that during commit.
>> Thanks for feedback. Already changed that locally but I did not want to spam
>> you with another RFC v3. :)
>> I was able to organize me a BPI-MT7615 PCIE Express Card. With and without
>> this patch beacons were sent on the mt7615 pcie, so the patch did not make
>> any difference. However, the mt7622 wifi will only work with my patch.
> Does Mesh+AP or Ad-Hoc+AP also work on MT7622 and does it still work on
> MT7615E card with your patch applied?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
